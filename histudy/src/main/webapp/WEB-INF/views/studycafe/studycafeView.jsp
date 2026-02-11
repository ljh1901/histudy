<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하이스터디</title>
<link rel="stylesheet" href="css/root.css" type="text/css">
<link rel="stylesheet" href="css/header.css" type="text/css">
<link rel="stylesheet" href="css/footer.css" type="text/css">
<style>
:root {
	-white-brown: #CDA56D;
	-door-color: #99CCFF;
}

form {
	margin: 0px auto;
	text-align: center;
}

#map {
	margin: 0px auto;
	border: solid 2px;
}

#studycafeList a {
	color: black;
}

section {
	width: 90%;
	max-width: 1100px;
	margin: 40px auto;
	padding: 30px;
	background: white;
	border-radius: 20px;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
	border: none;
}

section>h1>a {
	color: black;
}

section>h1>a:hover {
	color: blue;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 350px;
}

.title {
	font-weight: bold;
	display: block;
}

#map, svg {
	border-radius: 16px;
	box-shadow: 0 6px 18px rgba(0, 0, 0, 0.1);
}

.hAddr {
	position: absolute;
	left: 10px;
	top: 10px;
	border-radius: 2px;
	background: #fff;
	background: rgba(255, 255, 255, 0.8);
	z-index: 1;
	padding: 5px;
}

#centerAddr {
	display: block;
	margin-top: 2px;
	font-weight: normal;
}

.bAddr {
	padding: 5px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.seat-a:hover, .seat-a>rect:hover {
	fill: gray;
	cursor: pointer;
	user-select: none;
}

.seat-a:hover {
	cursor: pointer;
	user-select: none;
}

.payseat {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	z-index: 1000;
}

.modal-overlay {
	position: absolute;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
}

.modal-box {
	position: relative;
	background: #fff;
	border-radius: 16px;
	width: 400px;
	max-width: 90%;
	padding: 20px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
	z-index: 10;
	animation: fadeIn 0.3s ease-out;
}

.modal-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	border-bottom: 1px solid #eee;
	padding-bottom: 10px;
}

.modal-header h2 {
	margin: 0;
	font-size: 18px;
}

.modal-close {
	background: transparent;
	border: none;
	font-size: 22px;
	cursor: pointer;
}

.modal-content {
	margin-top: 15px;
	text-align: center;
}

#payBtn {
	background-color: gray; /* 보라색 버튼 */
	color: #fff;
	border: none;
	padding: 10px 20px;
	border-radius: 10px;
	cursor: pointer;
	font-weight: bold;
	transition: background 0.2s;
}

#payBtn:hover {
	background-color: #4338ca;
}
</style>
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
					<a href="#" id="studycafeInfo">스터디 카페 정보</a> <a href="#"
						id="studycafeCurrent">스터디 카페 좌석 현황</a>
				</h1>
				<div class="studycafeInfo">
					<h1>스터디 카페 목록</h1>
					<ul id="studycafeList">
						<c:forEach var="studycafe" items="${dto}">
							<li><a href="#" class="studycafe-item">${studycafe.studycafe_name}</a></li>
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
					<svg viewBox="0 0 1100 650" width="100%" height="100%">

<!-- ===== 벽 ===== -->
<rect x="0" y="0" width="1100" height="10" fill="#CDA56D" />
<rect x="0" y="640" width="1100" height="10" fill="#CDA56D" />
<rect x="0" y="0" width="10" height="650" fill="#CDA56D" />
<rect x="1090" y="0" width="10" height="650" fill="#CDA56D" />

<!-- ===== 입구 문 ===== -->
<rect x="480" y="0" width="120" height="10" fill="#99CCFF" />
<text x="540" y="30" text-anchor="middle" font-size="12">입구</text>

<!-- ===== 중앙 통로 ===== -->
<rect x="460" y="0" width="180" height="650" fill="#F1F5F9" />

<text x="550" y="320" text-anchor="middle" font-size="20" fill="#94A3B8"
							font-weight="700">
MAIN HALL
</text>

<text x="220" y="40" text-anchor="middle" font-size="20"
							font-weight="700">
노트북 존
</text>

<g>

<!-- 책상 느낌 배경 -->
<rect x="40" y="60" width="360" height="220" rx="20" fill="#F8FAFC"
							stroke="#E2E8F0" stroke-width="2" />

<!-- 좌석 -->
<!-- 반복 구조 -->
<!-- 1열 -->
<rect class="seat-a" x="70" y="90" width="40" height="40" fill="#CBD5E1" />
<rect class="seat-a" x="150" y="90" width="40" height="40"
							fill="#CBD5E1" />
<rect class="seat-a" x="230" y="90" width="40" height="40"
							fill="#CBD5E1" />
<rect class="seat-a" x="310" y="90" width="40" height="40"
							fill="#CBD5E1" />

<!-- 2열 -->
<rect class="seat-a" x="70" y="170" width="40" height="40"
							fill="#CBD5E1" />
<rect class="seat-a" x="150" y="170" width="40" height="40"
							fill="#CBD5E1" />
<rect class="seat-a" x="230" y="170" width="40" height="40"
							fill="#CBD5E1" />
<rect class="seat-a" x="310" y="170" width="40" height="40"
							fill="#CBD5E1" />

</g>

<text x="220" y="340" text-anchor="middle" font-size="20"
							font-weight="700">
일반존 A
</text>

<rect x="40" y="360" width="360" height="220" rx="20" fill="#FFFFFF"
							stroke="#E5E7EB" stroke-width="2" />

<!-- 좌석 -->
<g>

<rect class="seat-a" x="70" y="390" width="45" height="45"
							fill="#D1FAE5" />
<rect class="seat-a" x="150" y="390" width="45" height="45"
							fill="#D1FAE5" />
<rect class="seat-a" x="230" y="390" width="45" height="45"
							fill="#D1FAE5" />
<rect class="seat-a" x="310" y="390" width="45" height="45"
							fill="#D1FAE5" />

<rect class="seat-a" x="70" y="470" width="45" height="45"
							fill="#D1FAE5" />
<rect class="seat-a" x="150" y="470" width="45" height="45"
							fill="#D1FAE5" />
<rect class="seat-a" x="230" y="470" width="45" height="45"
							fill="#D1FAE5" />
<rect class="seat-a" x="310" y="470" width="45" height="45"
							fill="#D1FAE5" />

</g>


<text x="820" y="40" text-anchor="middle" font-size="20"
							font-weight="700">
일반존 B
</text>

<!-- 문 -->
<rect x="700" y="560" width="12" height="70" fill="#99CCFF" />
<text x="706" y="600" font-size="10" transform="rotate(90 706,600)">문</text>

<!-- 방 -->
<rect x="720" y="560" width="300" height="80" rx="18" fill="#EEF2FF"
							stroke="#C7D2FE" stroke-width="2" />

<text x="870" y="605" text-anchor="middle" font-weight="700">
스터디룸 B
</text>

<rect x="700" y="60" width="330" height="250" rx="20" fill="#FFFFFF"
							stroke="#E5E7EB" stroke-width="2" />

<g>
<rect class="seat-a" x="730" y="100" width="45" height="45"
							fill="#FFE4E6" />
<rect class="seat-a" x="810" y="100" width="45" height="45"
							fill="#FFE4E6" />
<rect class="seat-a" x="890" y="100" width="45" height="45"
							fill="#FFE4E6" />

<rect class="seat-a" x="730" y="180" width="45" height="45"
							fill="#FFE4E6" />
<rect class="seat-a" x="810" y="180" width="45" height="45"
							fill="#FFE4E6" />
<rect class="seat-a" x="890" y="180" width="45" height="45"
							fill="#FFE4E6" />
</g>
<text x="865" y="330" text-anchor="middle" font-size="18"
							font-weight="700">
1인 독방
</text>

<g>
<!-- 방들 -->
<rect x="740" y="370" width="70" height="70" rx="10" fill="#FFFBEB" />
<rect x="830" y="370" width="70" height="70" rx="10" fill="#FFFBEB" />
<rect x="920" y="370" width="70" height="70" rx="10" fill="#FFFBEB" />

<rect x="740" y="450" width="70" height="70" rx="10" fill="#FFFBEB" />
<rect x="830" y="450" width="70" height="70" rx="10" fill="#FFFBEB" />
<rect x="920" y="450" width="70" height="70" rx="10" fill="#FFFBEB" />
</g>

<rect x="700" y="330" width="12" height="80" fill="#99CCFF" />
<text x="706" y="420" font-size="10" transform="rotate(90 706,420)">문</text>
<text x="870" y="360" text-anchor="middle" font-weight="700" font-size="18"></text>
</svg>
				</div>
			</section>
		</main>
	</form>
	<%@include file="../footer.jsp"%>
</body>
<script>
/* if(!document.getElementById('payBtn').disabled){
	document.getElementById('payBtn').disabled=false;
	document.getElementById('payBtn').style.background="#4f46e5";
}else{
	document.getElementById('payBtn').style.background="gray";
} */
// 1. 위도, 경도
var lat =0;
var lng =0;
if(document.querySelector('.studycafe-item').text == 'histudy 1호점'){
	lat = ${dto[0].studycafe_lat};
	lng = ${dto[0].studycafe_lng};
}
var queryNum=-1;
seatInfo();
// 2. 좌석 정보
function seatInfo(){
for(let i = 0; i<document.querySelectorAll(".seat-a").length; i++){
	document.querySelectorAll(".seat-a")[i].setAttribute("value", "a"+i);
	document.querySelectorAll(".seat-a")[i].addEventListener('click', function(e){
	queryNum=i;
	document.querySelector('#seat').innerHTML = document.querySelectorAll(".seat-a")[i].getAttribute("value")+ '의 좌석현황';
	document.querySelector('.modal-content').innerHTML='<button id="reserveBtn">이용 하기</button>';
	// 4. 예약하기
	document.getElementById('reserveBtn').addEventListener('click',function(){
		var ticketBtn= '<button id="timeTicket" value="1">시간권</button><button id="dayTicket" value="2">종일권</button>';
		document.querySelector('.modal-content').innerHTML = ticketBtn;
		document.getElementById('timeTicket').addEventListener('click', function(){
			alert(this.value)
			seatTicketInfo(this.value);
			document.querySelector('.modal-content').innerHTML = '<h1 id="timeTicket">시간권</h1>';
		})
		document.getElementById('dayTicket').addEventListener('click', function(){
			
		})
	})
	alert(document.querySelectorAll(".seat-a")[i].getAttribute("value"));
	document.querySelector('.payseat').style.display="";
	//portOnePay(queryNum);
		})
	}
}
// 비동기 티켓 정보 가져오기
function seatTicketInfo(ticket_category_idx){
	return fetch("seatInfo.do?ticket_category_idx="+ticket_category_idx,{method: "GET"})
	.then(function(res){
		if(res.ok){
			return res.json();
		}
	})
	.then(function(res){
		res.forEach(function(data){
			alert(data.ticket_amount);
		})
	})
	.catch(error => console.log(error.message))
}
// 3. 비동기 좌석 현황 
function seatCurrent(){
	return fetch("seatInfo.do", {
		method: "POST",
		headers:{
			"Content-Type":"application/json"
		},
		body:JSON.stringify({
			seat_idx: (i+1)
		})
	})
	.then(function(res){
		if(res.ok){
			return res.json();
		}
	})
	.then(function(data){
		alert(data)
			data.forEach(function(responseData){
				alert(responseData);
			})
	})
	.catch(error => console.log(error.message))
}



var now = new Date();
function close1(){
	document.querySelector('.payseat').style.display = "none";
	alert('모달창을 닫습니다!');
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
<script src="js/studycafe/pay.js" type="text/javascript"></script>
</html>
