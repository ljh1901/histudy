package com.histudy.studycafe.controller;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.time.OffsetDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.histudy.studycafe.model.PayDTO;
import com.histudy.studycafe.model.SeatDTO;
import com.histudy.studycafe.model.StudycafeDTO;
import com.histudy.studycafe.model.StudycafeJoinReservationDTO;
import com.histudy.studycafe.model.StudycafeReservationDTO;
import com.histudy.studycafe.service.StudycafeSerivce;
import com.histudy.studycafe.service.StudycafeServiceImple;
import com.histudy.user.model.UserDTO;
import com.histudy.user.service.UserService;

@Controller
public class StudyCafeViewController {
	@Autowired
	private StudycafeSerivce studycafeService;
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/studycafe.do")
	public String studycafeView(Model model, HttpSession session) {
		List<StudycafeDTO> studycafeDTO = studycafeService.studycafeList();
		List<SeatDTO> seatList = studycafeService.seatInfo(1);
		if(session.getAttribute("user_id")!=null) {
		UserDTO udto = userService.userInfo((String)session.getAttribute("user_id"));
		model.addAttribute("udto", udto);
		}
		model.addAttribute("dto",studycafeDTO);
		model.addAttribute("seatList", seatList);
		return "studycafe/studycafeView";
	}
	
	@GetMapping("/seatInfo.do")
	@ResponseBody
	public ResponseEntity<List<SeatDTO>> seatInfo(@RequestParam(value="studycafe_idx", required = true, defaultValue = "1") int studycafe_idx){
		System.out.println(studycafe_idx);
		List<SeatDTO> seatList = studycafeService.seatInfo(studycafe_idx);
		ResponseEntity<List<SeatDTO>> seatDTO = new ResponseEntity<List<SeatDTO>>(seatList, HttpStatus.OK);
		
		return seatDTO;
	}

	@GetMapping("/receipt.do")
	public ModelAndView receiptView(@RequestParam String paymentId, @RequestParam(required=false, value="message") String message,HttpSession session, @RequestParam(required=false, value="totalAmount")int viewTotalAmount) {
		ModelAndView mav = new ModelAndView();
		if(message !=null) {
			mav.addObject("msg", message);
			mav.setViewName("studycafe/receipt");
			System.out.println(message);
			return mav;
		}else {
		try {
		HttpRequest request = HttpRequest
				.newBuilder()
				.uri(URI.create("https://api.portone.io/payments/"+paymentId+"?storeId=store-83eacdb9-6d28-4c80-b53b-26d96da03490"))
				.header("Authorization","PortOne pRHF7tzUF0KgA2pG1KQWOo53nVunQCNYHLkfcagOTGtuPrwb8sShS2MbU2REjgqRjysw5KTuVMmpzyS3")
				.header("Content-Type", "application/json")
				.method("GET",HttpRequest.BodyPublishers.ofString("{}"))
				.build(); 
		HttpResponse<String> response = HttpClient
				.newHttpClient()
				.send(request, HttpResponse
						.BodyHandlers
						.ofString()); 
		 ObjectMapper mapper = new ObjectMapper();
		 JsonNode root = mapper.readTree(response.body());
		 Integer totalAmount = root.get("amount").get("total").asInt();
		 if(viewTotalAmount != totalAmount) {
				mav.addObject("msg", "금액 변조 및 금액 검증 실패");
				mav.setViewName("studycafe/receipt");
		 }
		 System.out.println(viewTotalAmount == totalAmount);
		 String storeId = root.get("storeId").asText();
		 String orderName = root.get("orderName").asText();
		 String pay_status= root.get("status").asText();
		 String pay_method=root.get("method").get("provider").asText();
		 String statusChangedAt = root.get("statusChangedAt").asText();
		 String paidAt= root.get("paidAt").asText();
		 String pgProvider = root.get("channel").get("pgProvider").asText();
		 ObjectMapper node = new ObjectMapper();
		 JsonNode customData = node.readTree(root.get("customData").asText());
		 int seat_idx=customData.get("seat_idx").asInt();
		 int ticket_idx=customData.get("ticket_idx").asInt();
		 Integer paid = root.get("amount").get("paid").asInt();
		 Integer vat = root.get("amount").get("vat").asInt();//부가세
		 Integer supply = root.get("amount").get("supply").asInt();// 과세 매출
		 PayDTO paydto = new PayDTO(paymentId, storeId, orderName, paid, (Integer)session.getAttribute("user_idx"), pay_method, pay_status, 
				 statusChangedAt, paidAt, totalAmount,"channel-key-da563d5f-f117-444f-aba5-ad9b66277c1b", pgProvider, vat, supply);
		 int result = studycafeService.paySeat(paydto);

		 if(result > 0) {
			int reservation = studycafeService.registerReservation((Integer) session.getAttribute("user_idx"),
					seat_idx,paidAt,
					orderName.substring(orderName.indexOf("/")+1),
					"RESERVED",
					ticket_idx,paymentId);
		 }
		}catch(Exception e) {
			e.printStackTrace();
		}
		PayDTO receipt = studycafeService.receipt(paymentId);
		
		mav.setViewName("studycafe/receipt");
		mav.addObject("receipt", receipt);
		}
		return mav;
	}
}
