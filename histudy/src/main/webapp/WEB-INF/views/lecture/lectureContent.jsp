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
<style type="text/css">

</style>
</head>
<body>
<%@include file="../header.jsp"%>
<main>
<form name="lectureContent" action="lectureMemoOk">
<!-- 유효성 검사 -->
   <h1>프리미엄 회원만 볼 수 있습니다.</h1>
   <h2><a href="membership.do">멤버십 가입하러가기</a></h2>
   <video width="1280" height="720" controls="controls">   
   <source src="${pageContext.request.contextPath}/video/${lectureContent.lecture_file}" type="video/mp4">   
   </video>

	<table>
   		<tr>
		   <td><h2>강의 메모</h2></td>
		</tr>
		<tr>
		   <td><input type="text" name="note_title" value="제목을 입력해주세요"></td>
		</tr>
		<!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!user idx도 불러오기 -->
		<tr>
		   <input type="hidden" name="lecture_idx" value=${lectureContent.lecture_idx }>
		</tr>
		<tr>
		   <td><textarea rows="20" cols="50" name="note_content"></textarea></td>
		</tr>
		<tr>
		   <td><input type="submit" value="저장하기"></td>
   		</tr>
	</table>
   
   <table>
   	<tr>
   		<td><h2>${lectureContent.lecture_name}</h2></td> 
   	</tr>
   	<tr>
 		<td><h2>${lectureContent.lecture_lecturer}</h2></td>   
   	</tr>
   	<tr>
   		<td colspan="2">
		   ${lectureContent.lecture_like}   
		   ${lectureContent.lecture_hate}   
		</td>
   	</tr>  
   	<tr>
	   <td>${lectureContent.lecture_content}</td>   
   	</tr>
   </table>
   
</form>
<form namee="reviewFm">
   <input type="button" name="review" value="리뷰 남기기">
</form>
</main>
<%@include file="../footer.jsp"%>
</body>
</html>
