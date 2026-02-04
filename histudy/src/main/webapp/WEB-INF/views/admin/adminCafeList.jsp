<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디 카페 관리자</title>
<link rel="stylesheet" href="css/admin_layout.css" type="text/css">
<style>

</style>
</head>
<body>
<h1>입점 카페 목록</h1>	
<fieldset class="adminCafe">
    <c:forEach var="cafe" items="${cafeList}">
    <ul class="adminCafeList__menu">
        <li class="adminCafeList__menu__item">
            <a href="adminCafeDetail.do?studycafe_idx=${cafe.studycafe_idx}&studycafe_name=${cafe.studycafe_name}">
                ${cafe.studycafe_name}
            </a>
        </li>
    </ul>
</c:forEach>
    <c:if test="${empty cafeList}">
        <ul class="adminCafeList__menu">
            <li class="adminCafeList__menu__item">입점된 카페가 없습니다.</li>
        </ul>
    </c:if>
</fieldset>
</body>
</html>