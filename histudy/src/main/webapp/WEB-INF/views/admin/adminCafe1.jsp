<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

.adminCafe__menu {
    list-image: none;
    list-style: none;
    padding: 0;
    margin: 0;
    overflow: hidden; 
    background-color: #f4f4f4;
}

.adminCafe__menu__item {
    float: left;
}

.adminCafe__menu__item a {
    display: block;
    padding: 10px 20px;
    text-decoration: none;
    color: #333;
}

.adminCafe__menu__item a:hover {
    background-color: #ddd;
}
</style>
<body>
<div class="adminCafe">
	<ul class="adminCafe__menu">
	<li class="adminCafe__menu__item"><a href="adminCafeSales.do">총 매출확인</a></li>
	<li class="adminCafe__menu__item"><a href="adminCafeSeat.do">스터디카페 현황 보기</a></li>
	<li class="adminCafe__menu__item"><a href="adminCafeInquiryList.do">스터디카페 문의</a></li>
	<li class="adminCafe__menu__item"><a href="adminCafePrice.do">요금제 등록</a></li>
	</ul>
	<fieldset>
		<label>하이스터디 1호점</label>
	</fieldset>
</div>

</body>
</html>