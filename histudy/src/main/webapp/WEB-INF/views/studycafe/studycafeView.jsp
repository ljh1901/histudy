<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하이스터디</title>
<link rel="stylesheet" href="css/root.css" type="text/css">
<link rel="stylesheet" href="css/header.css" type="text/css">
<link rel="stylesheet" href="css/footer.css" type="text/css">
<link rel="stylesheet" href="css/studycafe/studycafe.css" type="text/css">
<script src="https://cdn.portone.io/v2/browser-sdk.js"></script>
<script>
window.onload=function(){
	document.querySelector('.studycafeCurrent').style.display="none";
}
</script>
</head>
<body>
	<%@include file="../header.jsp"%>
	<form name="studycafe">
		<main>
			<section>
				<h1>
					<a href="#" id="studycafeInfo">스터디 카페 정보</a> 
					<a href="#" id="studycafeCurrent">스터디 카페 좌석 현황</a>
				</h1>
				<div class="studycafeInfo">
					<h1>스터디 카페 목록</h1>
					<ul id="studycafeList">
						<c:forEach var="studycafe" items="${dto}">
							<li><a href="#" class="studycafe-item" onclick="seatInfo(${studycafe.studycafe_idx})">${studycafe.studycafe_name}</a></li>
						</c:forEach>
					</ul>
					<div id="map" style="width: 50%; height: 350px;"></div>
					<div id="clickLatlng"></div>
				</div>
			</section>

			<section>
				<div class="studycafeCurrent" style="display: none">
					<!-- (모달1) 안내사항 모달 -->
					<div class="payseat" style="display: none;">
						<div class="modal-overlay" onclick="close1()"></div>
						<div class="modal-box">
							<div class="modal-header">
								<h2 id="seat">좌석 현황</h2>
								<button type="button" class="modal-close" onclick="close1()">&times;</button>
							</div>
							<div class="modal-content">
							</div>
						</div>
					</div>
<svg id="studycafeSeat" viewBox="0 0 1200 800" width="100%" height="100%">
<!-- 벽 -->
<rect x="0" y="0" width="1200" height="10" fill="#CDA56D" />
<rect x="0" y="790" width="1200" height="10" fill="#CDA56D" />
<rect x="0" y="0" width="10" height="800" fill="#CDA56D" />
<rect x="1190" y="0" width="10" height="800" fill="#CDA56D" />

<!-- 입구 문 -->
<rect x="480" y="0" width="120" height="10" fill="#99CCFF" />
<rect x="700" y="560" width="12" height="70" fill="#99CCFF" />
<text x="706" y="600" font-size="10" transform="rotate(90 706,600)">문</text>
<rect x="700" y="400" width="12" height="80" fill="#99CCFF" />
<text x="720" y="425" font-size="10" transform="rotate(90 706,420)">문</text>

<!-- 중앙 통로 -->
<rect x="460" y="10" width="180" height="800" fill="#F1F5F9" />
<text x="550" y="320" text-anchor="middle" font-size="20" fill="#94A3B8" font-weight="700"> MAIN HALL </text>
<text x="220" y="40" text-anchor="middle" font-size="20" font-weight="700">노트북 존</text>

<!-- 책상 배경 -->
<rect  id="desk" x="40" y="60" width="360" height="220" rx="20" fill="#F8FAFC" stroke="#E2E8F0" stroke-width="2" />
<text x="220" y="340" text-anchor="middle" font-size="20" font-weight="700">일반존 A</text>
<rect x="40" y="360" width="360" height="220" rx="20" fill="#FFFFFF" stroke="#E5E7EB" stroke-width="2" />
<rect x="70" y="600" width="300" height="150" rx="18" fill="#EEF2FF" stroke="#C7D2FE" stroke-width="2" />

<!-- 좌석 -->
<text x="820" y="40" text-anchor="middle" font-size="20" font-weight="700">일반존 B</text>

<!-- 방 -->
<rect x="720" y="670" width="300" height="80" rx="18" fill="#EEF2FF" stroke="#C7D2FE" stroke-width="2" />
<text x="870" y="710" text-anchor="middle" font-weight="700">스터디룸 B</text>
<rect x="700" y="60" width="350" height="250" rx="20" fill="#FFFFFF" stroke="#E5E7EB" stroke-width="2" />
<text x="865" y="350" text-anchor="middle" font-size="18" font-weight="700">1인 독방</text>
<g id="seat__area">
<c:forEach var="seat" items="${seatList}">
<rect class="seat-a" x="${seat.seat_x}" y="${seat.seat_y}" width="${seat.seat_w}" height="${seat.seat_h}" value="${seat.seat_num}" data-seat-idx="${seat.seat_idx}" data-seat-type="${seat.seat_type}" data-seat-status="${seat.seat_status}"></rect>
<text x="${seat.seat_x+seat.seat_w/2}" y="${seat.seat_y + seat.seat_h / 2}" fill="black" text-anchor="middle" font-size="14">${seat.seat_num}</text>
</c:forEach>
</g>
</svg>
				</div>
			</section>
		</main>
	</form>
	<%@include file="../footer.jsp"%>
</body>
<script>
// 위도, 경도
var lat =0;
var lng =0;
var xhr = null;
const seat__area=document.getElementById('seat__area');
if(document.querySelector('.studycafe-item').text == 'histudy 1호점'){
	lat = ${dto[0].studycafe_lat};
	lng = ${dto[0].studycafe_lng};
}
function seatInfo(studycafe_idx){
	xhr = new XMLHttpRequest();
	xhr.open("GET", "seatInfo.do?studycafe_idx="+studycafe_idx, true);
	xhr.onreadystatechange=showResult;
	xhr.send();
}

function showResult(){
	if(xhr.readyState==4){
		if(xhr.status==200){
			var data = JSON.parse(xhr.responseText);
			seat__area.innerHTML = '';
			data.forEach(seat => {
			
			var rect = document.createElementNS("http://www.w3.org/2000/svg", "rect");
			rect.setAttribute('class', 'seat-a');
			rect.setAttribute('data-seat-idx', seat.seat_idx);
			rect.setAttribute('data-seat-type', seat.seat_type);
			rect.setAttribute('data-seat-status', seat.seat_status);
			rect.setAttribute('x',seat.seat_x);
			rect.setAttribute('y',seat.seat_y);
			rect.setAttribute('width',seat.seat_w);
			rect.setAttribute('height',seat.seat_h);
			rect.setAttribute('value',seat.seat_num);
			rect.setAttribute('fill','#FFE4E6' );
			rect.setAttribute('stroke','#FFE4E6' );
			
			var text = document.createElementNS("http://www.w3.org/2000/svg","text");
				text.setAttribute('x', Number(seat.seat_x) + seat.seat_w / 2);
				text.setAttribute('y', Number(seat.seat_y) + seat.seat_h / 2);
				text.setAttribute('text-anchor', 'middle'); 
				text.setAttribute('font-size', '14');
				text.setAttribute('fill', 'black');
				text.textContent=seat.seat_num;
			seat__area.appendChild(rect);
			seat__area.appendChild(text);
			
			});
			seatReservation();
		}
	}
}
seatReservation();
// 좌석 정보
var queryNum=-1;
var seat_idx = null;
var ticket_idx = null;
var ticketBtn = null;
var seat_type=null;
function seatReservation(){
for(let i = 0; i<document.querySelectorAll(".seat-a").length; i++){
	document.querySelectorAll(".seat-a")[i].addEventListener('click', function(){
		seat_idx=document.querySelectorAll(".seat-a")[i].dataset.seatIdx;
		seat_type=document.querySelectorAll(".seat-a")[i].dataset.seatType;
		seat_status=document.querySelectorAll(".seat-a")[i].dataset.seatStatus;
		seatCurrent(seat_idx);
		queryNum=i;
		document.querySelector('#seat').innerHTML = document.querySelectorAll(".seat-a")[i].getAttribute("value")+ '의 좌석현황';
		document.querySelector('.modal-content').innerHTML='<button id="reserveBtn">이용 하기</button>';
		// 이용하기
		document.getElementById('reserveBtn').addEventListener('click',function(e){
			alert(seat_idx);
			if(${empty sessionScope.user_id}){
				alert('로그인 후 스터디 카페를 이용하실 수 있습니다');
				e.preventDefault();
				return;
			}
			if(seat_status==='RESERVED'){
				alert('이미 에약된 좌석입니다.')
				return;
			}
			document.querySelector('.modal-content').addEventListener('click',function(e){
				var ticket = e.target.closest('.ticket');
				if(seat_type == 'SINGLE_ROOM'||seat_type =='ROOM'){
					ticketBtn= '<button class="ticket" value="1">시간권</button><button class="ticket" value="2">종일권</button><button class="ticket" value="3">정기권</button>';
				}else{
					ticketBtn= '<button class="ticket" value="1">시간권</button><button class="ticket" value="2">종일권</button>';
				}
				document.querySelector('.modal-content').innerHTML = ticketBtn;
				if(ticket != null){
					seatTicketInfo(ticket.value, seat_idx);
				}
			});
		});
			document.querySelector('.payseat').style.display="";
		});
}
}
// 티켓 정보 가져오기
function seatTicketInfo(ticket_category_idx, seat_idx){
	return fetch("seatTicket.do?ticket_category_idx="+ticket_category_idx+"&seat_idx="+seat_idx,{method: "GET"})
	.then(function(res){
		if(res.ok){
			return res.json();
		}
	})
	.then(function(res){
		document.querySelector('.modal-content').innerHTML += '<div class="ticketGrid"></div>';
			document.querySelector('.ticketGrid').innerHTML='';
		res.forEach(function(data){
			var ticketStr = '<button type="button" class="payBtn" value='+data.ticket_idx+'><div><h3 class="ticketName" value='+data.ticket_name+'>'+data.ticket_name+'</h3><span class="ticketAmount" value='+data.ticket_amount+'>'+data.ticket_amount+'원</span></div></button>';
			document.querySelector('.ticketGrid').innerHTML += ticketStr;
		})
		portOnePay(queryNum);
	})
	.catch(error => console.log(error.message))
}

// 1. 결제 요청
function portOnePay(queryNum){
	for(let i=0; i<document.querySelectorAll('.payBtn').length; i++){
	document.querySelectorAll('.payBtn')[i].addEventListener('click', async function(){
		var now = new Date();
		var str = ''+now.getFullYear()+(now.getMonth()+1)+now.getDate()+now.getHours()+now.getMinutes()+now.getSeconds();
			ticket_idx = document.querySelectorAll('.payBtn')[i].value;
		return fetch("studycafe/payment/payNotComplete.do?ticket_idx="+document.querySelectorAll('.payBtn')[i].value, {
			method:"POST",
			headers:{"Content-Type":"application/json"},
			body:JSON.stringify({
				storeId: "store-83eacdb9-6d28-4c80-b53b-26d96da03490",
				channelKey: "channel-key-da563d5f-f117-444f-aba5-ad9b66277c1b",
				paymentId: "payment-"+str,
				customer:{
				email: "${udto.user_email}",
			    fullName: "${udto.user_name}",
			  	phoneNumber: "${udto.user_tel}"
				},
				orderName: document.querySelectorAll('.seat-a')[queryNum].getAttribute('value')+"-좌석/"+document.querySelectorAll('.ticketName')[i].getAttribute("value"),
				totalAmount: document.querySelectorAll('.ticketAmount')[i].getAttribute("value"),
				currency: "CURRENCY_KRW",
				payMethod: "CARD"
			})
			})
			.then(res => res.json())
			.then(async function(res){
				resp = await PortOne.requestPayment({
				//Store ID 설정
				storeId: res.storeId,
				channelKey: res.channelKey,
				paymentId: res.paymentId,
				customer:{
				email: "${udto.user_email}",
			    fullName: "${udto.user_name}",
			  	phoneNumber: "${udto.user_tel}"
				},
				customData:{
					seat_idx: seat_idx,
					ticket_idx: ticket_idx
				},
				orderName: res.orderName,
				totalAmount: res.totalAmount,
				currency: "CURRENCY_KRW",
				payMethod: "CARD",
				redirectUrl: "http://localhost:9090/histudy/receipt.do?totalAmount="+res.totalAmount,
				forceRedirect: true
			})
			});
		
	});
	}
}


// 좌석 현황
function seatCurrent(seat_idx){
	return fetch("seatReservation.do", {
		method: "POST",
		headers:{
			"Content-Type":"application/json"
		},
		body:JSON.stringify({
			seat_idx: seat_idx
		})
	})
	.then(function(res){
		if(res.ok){
			return res.json();
		}else{
			var divTag=document.createElement('div');
			divTag.innerHTML = '<p>이용 가능한 좌석 입니다</p>';
		}
	})
	.then(function(res){
		var divTag=document.createElement('div');
		document.getElementById('seat').appendChild(divTag);
		var reservation_starttime=new Date(res.reservation_starttime);
		var reservation_endtime = new Date(res.reservation_endtime);
		reservation_starttime = reservation_starttime.getFullYear()+"년"
		+(reservation_starttime.getMonth()+1)
		+"월"+reservation_starttime.getDate()
		+"일&nbsp;"+reservation_starttime.getHours()
		+"시&nbsp;"+reservation_starttime.getMinutes()
		+"분";
		reservation_endtime=reservation_endtime.getFullYear()+"년"
		+(reservation_endtime.getMonth()+1)
		+"월"+reservation_endtime.getDate()
		+"일&nbsp;"+reservation_endtime.getHours()
		+"시&nbsp;"+reservation_endtime.getMinutes()
		+"분";
		var str="시작시간: "+reservation_starttime+"<div>종료시간: "+reservation_endtime;
		divTag.innerHTML = str;
	})
	.catch(error => console.log(error.message))
}

// 모달 창 닫기
function close1(){
	document.querySelector('.payseat').style.display = "none";
} 
// 카페 정보
document.getElementById('studycafeCurrent').addEventListener('click',function(){
	document.querySelector('.studycafeInfo').style.display="none";
	document.querySelector('.studycafeCurrent').style.display="";
});

// 카페 현황
document.getElementById('studycafeInfo').addEventListener('click',function(){
	document.querySelector('.studycafeInfo').style.display="";
	document.querySelector('.studycafeCurrent').style.display="none";
});
</script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cc8dabaa3a75dab670d03c068fae3a5d&libraries=services&libraries=services"type="text/javascript"></script>
<script src="js/studycafe/map.js" type="text/javascript"></script>
</html>
