<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.adminCafeList__menu {
    list-image: none;
    list-style: none;
    padding: 0;
    margin: 0;
    overflow: hidden; 
    background-color: #f4f4f4;
}

.adminCafeList__menu__item {
    float: left;
}

.adminCafeList__menu__item a {
    display: block;
    padding: 10px 20px;
    text-decoration: none;
    color: #333;
}

.adminCafeList__menu__item a:hover {
    background-color: #ddd;
}
</style>
</head>
<body>
	<div>스터디 카페 관리</div>
	<fieldset class="adminCafe">
		<div class="adminCafeList">입점 카페 목록</div>
		<ul class="adminCafeList__menu">
			<li class="adminCafeList__menu__item"><a href="adminCafe1.do">1호점</a></li>
			<li class="adminCafeList__menu__item">2호점</li>
			<li class="adminCafeList__menu__item">3호점</li>
		</ul>
	</fieldset>
</body>
</html>