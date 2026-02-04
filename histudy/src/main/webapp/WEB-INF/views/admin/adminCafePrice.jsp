<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/admin_layout.css" type="text/css">

</head>
<body>
	<fieldset>
		<legend><strong>관리 중인 카페 : ${param.studycafe_name}</strong></legend>
		<div class="adminCafe">
			<ul class="adminCafe__menu">
        <li class="adminCafe__menu__item"><a href="adminCafeSales.do?studycafe_idx=${param.studycafe_idx}&studycafe_name=${param.studycafe_name}">총 매출확인</a></li>
        <li class="adminCafe__menu__item"><a href="adminCafeSeat.do?studycafe_idx=${param.studycafe_idx}&studycafe_name=${param.studycafe_name}">스터디카페 현황 보기</a></li>
        <li class="adminCafe__menu__item"><a href="adminCafeInquiryList.do?studycafe_idx=${param.studycafe_idx}&studycafe_name=${param.studycafe_name}">스터디카페 문의</a></li>
        <li class="adminCafe__menu__item"><a href="studycafeEditor.do?studycafe_idx=${param.studycafe_idx}&studycafe_name=${param.studycafe_name}">좌석등록</a></li>
        <li class="adminCafe__menu__item"><a href="adminCafePrice.do?studycafe_idx=${param.studycafe_idx}&studycafe_name=${param.studycafe_name}">요금제 등록</a></li>
			</ul>
		</div>
	</fieldset>
	<h3>요금제 등록하기</h3>
</body>
</html>