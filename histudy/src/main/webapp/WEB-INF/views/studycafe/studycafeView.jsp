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
section {
	translate: translateY(20px);
}
</style>
<script src="https://cdn.portone.io/v2/browser-sdk.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cc8dabaa3a75dab670d03c068fae3a5d" type="text/javascript"></script>
</head>
<body>
	<%@include file="/header.jsp"%>
	<form>
		<main>
			<h1>스터디 카페</h1>
			<section>
				<div id="map" style="width: 50%; height: 350px;"></div>
				<p>
					<em>지도를 클릭해주세요!</em>
				</p>
				<div id="clickLatlng"></div>
			</section>
			<section>
				<button id="payBtn">결제하기</button>

			</section>
		</main>

	</form>
	<%@include file="/footer.jsp"%>
</body>
<script>
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
		body: response
	});
});

</script>
<script src="js/studycafe/map.js" type="text/javascript"></script>
</html>