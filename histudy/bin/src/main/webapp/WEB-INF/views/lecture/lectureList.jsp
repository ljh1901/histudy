<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/root.css" type="text/css">
<link rel="stylesheet" href="css/header.css" type="text/css">
<link rel="stylesheet" href="css/footer.css" type="text/css">
</head>
<body>
<%@include file="/header.jsp"%>
<main>
	<form name="lectureFm">
	<fieldset>
	<p>강의 할인중~</p>
	</fieldset>
	<table>
	<thead>
		<c:if test="${empty lists }">
		<tr>
			<td colspan="2">
			등록된 영상이 없습니다.
			</td>
		</tr>
		</c:if>
		<c:forEach var="dto" items='${lists }'>
			<tr>
				<td><a href="lectureContent.do">
				<video width="340" height="260" controls="controls">	
				<source src="/histudy/video/${dto.lecture_file }mp4" type="video/mp4">
				</video></a></td>
				<td>${dto.lecture_name }</td>
				<td>${dto.lecture_lecturer }</td>
			</tr>
		</c:forEach>
	</thead>
	</table>
	</form>
</main>
<%@include file="/footer.jsp"%>
</body>
</html>