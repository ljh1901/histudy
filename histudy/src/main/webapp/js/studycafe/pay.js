function portOnePay(i){
document.getElementById('payBtn').addEventListener('click', async function(e){
	e.preventDefault();
	var str = ''+now.getFullYear()+(now.getMonth()+1)+now.getDate()+now.getHours()+now.getMinutes()+now.getSeconds();
	const response = await PortOne.requestPayment({
		//Store ID 설정
		storeId: "store-83eacdb9-6d28-4c80-b53b-26d96da03490",
		channelKey: "channel-key-da563d5f-f117-444f-aba5-ad9b66277c1b",
		paymentId: "payment-"+str,
		customer:{
		email: "test@histudy.com",
	    fullName: "홍길동",
	  	phoneNumber: "010-1234-5678",
		},
		orderName: document.querySelectorAll('.seat-a')[i].getAttribute('value')+"-좌석/시간권 2시간",
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
}