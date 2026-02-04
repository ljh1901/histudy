package com.histudy.studycafe.controller;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.*;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.util.JSONPObject;

@RestController
@RequestMapping("/studycafe/payment/complete")
public class StudyCafePayController {
	@PostMapping("/studycafe.do")
	public ResponseEntity<Map<String, String>> payComplete(@RequestBody String paymentId){
		System.out.println(paymentId);
		// Service 호출 후
		try {
		HttpRequest request = HttpRequest
				.newBuilder()
				.uri(URI.create("https://api.portone.io/payments/payment-202621223949?storeId=store-83eacdb9-6d28-4c80-b53b-26d96da03490"))
				.header("Authorization","PortOne pRHF7tzUF0KgA2pG1KQWOo53nVunQCNYHLkfcagOTGtuPrwb8sShS2MbU2REjgqRjysw5KTuVMmpzyS3")
				.header("Content-Type", "application/json")
				.method("GET",HttpRequest.BodyPublishers.ofString("{}"))
				.build(); 
		HttpResponse<String> response = HttpClient
				.newHttpClient()
				.send(request, HttpResponse
						.BodyHandlers
						.ofString()); 
		 System.out.println(response.body());
		 
		 ObjectMapper mapper = new ObjectMapper(); 
		 JsonNode root = mapper.readTree(response.body());
		 String customDataStr = root.get("customData").asText();
		 JsonNode customData = mapper.readTree(customDataStr);
		 System.out.println(customData.get("storeName").asText());

		 //status, id, method.provider, 
		 // statusChangedAt(상태값 바뀐 시각), orderName(주문내역), 
		 //amount.total(총 금액), paid(지불금액), name, email, phoneNumder, customData, paidAt
		}catch(Exception e) {
			e.printStackTrace();
		}
		Map<String,String> receiptlist = new HashMap<String, String>();
		ResponseEntity<Map<String,String>> receipt = new ResponseEntity<Map<String,String>>(receiptlist, HttpStatus.OK);
		return receipt;
	}
}
