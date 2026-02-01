<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="/header.jsp" %>
<hr>
<form>
	<main>
		<section class="admin">
		<h1>관리자 메인화면 페이지 임둥</h1>
		<ul class="admin__menu">
		<li>대시보드!!</li>
		<li class="admin__menu__item"><a href="adminCafeList.do">스터디카페 관리</a></li>	
		<li class="admin__menu__item">스터디모임 관리</li>
		<li class="admin__menu__item">회원 관리</li>
		<li class="admin__menu__item">공지사항</li>
		<li class="admin__menu__item">문의사항 관리</li>
		<li class="admin__menu__item">신고 관리</li>
		</ul>
		</section>
	</main>
</form>
<%@include file="/footer.jsp" %>
</body>
</html>