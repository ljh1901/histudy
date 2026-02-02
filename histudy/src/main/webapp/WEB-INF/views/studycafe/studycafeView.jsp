<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하이스터디</title>
<link rel="stylesheet" href="css/root.css" type="text/css">
<link rel="stylesheet" href="css/header.css" type="text/css">
<link rel="stylesheet" href="css/footer.css" type="text/css">
<style>
:root{
	--white-brown: #CDA56D
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
	translate: translateY(20px);
	border: 1px solid gray;
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
</style>
<script src="https://cdn.portone.io/v2/browser-sdk.js"></script>
</head>
<body>
	<%@include file="/header.jsp"%>
	<form>
		<main>
			<section>
				<h1>
					<a href="#" id="studycafeInfo">스터디 카페 정보</a><a href="#"
						id="studycafeCurrent">스터디 카페 좌석 현황</a>
				</h1>
				<div class="studycafeInfo">
					<h1 id="studycafeList">
						<a href="#">스터디 카페 목록</a>
					</h1>
					<div id="map" style="width: 100%; height: 350px;"></div>
					<p>
						<em>지도를 클릭해주세요!</em>
					</p>
					<div id="clickLatlng"></div>
				</div>
			</section>
			<section>
				<div class="studycafeCurrent" >
					<div class="studycafeReservation">
						<svg viewBox="0, 0, 1000, 1000">
						    <rect x="0" y="0" fill="var(--white-brown)" width="450" height="10"></rect>
							<rect x="0" y="0" fill="var(--white-brown)" width="10" height="60%"></rect>
							<rect x="0" y="100%" fill="var(--white-brown)" width="250" height="10"></rect>
							<rect x="10" y="10" fill="gray" stroke="black" stroke-width="1" width="30" height="30"></rect>
							<rect x="60" y="0" fill="var(--white-brown)" width="10" height="45"></rect>
							<rect x="70" y="10" fill="gray" stroke="black" stroke-width="1" width="30" height="30"></rect>
							<rect x="120" y="0" fill="var(--white-brown)" width="10" height="45"></rect>
							<rect x="130" y="10" fill="gray" stroke="black" stroke-width="1" width="30" height="30"></rect>
							<rect x="180" y="0" fill="var(--white-brown)" width="10" height="45"></rect>
							<rect x="190" y="10" fill="gray" stroke="black" stroke-width="1" width="30" height="30"></rect>
							<rect x="240" y="0" fill="var(--white-brown)" width="10" height="45"></rect>
							<rect x="250" y="10" fill="gray" stroke="black" stroke-width="1" width="30" height="30"></rect>
							<rect x="300" y="0" fill="var(--white-brown)" width="10" height="45"></rect>
							<rect x="310" y="10" fill="gray" stroke="black" stroke-width="1" width="30" height="30"></rect>
							<text x="500" y="105" fill="black" stroke="gray" width="100" height="100" stroke-width="1">통로</text>
							<rect x="10" y="125" fill="gray" stroke="black" stroke-width="1" width="30" height="30"></rect>
							<rect x="10" y="175" fill="gray" stroke="black" stroke-width="1" width="30" height="30"></rect>
							<rect x="10" y="225" fill="gray" stroke="black" stroke-width="1" width="30" height="30"></rect>
							<rect x="10" y="125" fill="gray" stroke="black" stroke-width="1" width="30" height="30"></rect>
						</svg>
					</div>
				</div>
			</section>
			<section>
				<button id="payBtn">결제하기</button>
			</section>
		</main>
	</form>
	<%@include file="/footer.jsp"%>
</body>
<script>
window.onload=function(){
	document.querySelector('.studycafeCurrent').style.display="none";
}
//channel-key-da563d5f-f117-444f-aba5-ad9b66277c1b
//store-83eacdb9-6d28-4c80-b53b-26d96da03490
var now = new Date();
//console.log(now.getDay()); // 요일
/* console.log(now.getFullYear());
console.log(now.getDate()); // 일
console.log(now.getMonth()+1);
console.log(now.getHours()); // 시간
console.log(now.getMinutes()); // 분
console.log(now.getSeconds()); // 초 */
document.getElementById('payBtn').addEventListener('click',async function (e){
	e.preventDefault();
var str = ''+now.getFullYear()+(now.getMonth()+1)+now.getDate()+now.getHours()+now.getMinutes()+now.getSeconds();
	const response = await PortOne.requestPayment({
		//Store ID 설정
		storeId: "${requestScope.storeId}",
		channelKey: "${requestScope.channelKey}",
		paymentId: "payment-"+str,
		customer:{
		email: "test@histudy.com",
	    fullName: "홍길동",
	  	phoneNumber: "010-1234-5678",
		},
		customData:{
			storeName: "histudy"
		},
		orderName: "하이 스터디2호점 시간권 2시간",
		totalAmount: 1000,
		currency: "CURRENCY_KRW",
		payMethod: "CARD"
	});
	if(response.code !== undefined) {
		return alert(response.message);
	}
	var paymentId = response.paymentId;
	alert(paymentId);
	const notified = await fetch('studycafe/payment/complete/studycafe.do',{
		method: 'POST',
		headers: {"Content-Type":"application/json"},
		body: paymentId
	});
});
document.getElementById('studycafeCurrent').addEventListener('click',function(){
	document.querySelector('.studycafeInfo').style.display="none";
	document.querySelector('.studycafeCurrent').style.display="";
})
document.getElementById('studycafeInfo').addEventListener('click',function(){
	document.querySelector('.studycafeInfo').style.display="";
	document.querySelector('.studycafeCurrent').style.display="none";
})
</script>
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cc8dabaa3a75dab670d03c068fae3a5d&libraries=services"
	type="text/javascript"></script>
<script src="js/studycafe/map.js" type="text/javascript"></script>
</html>