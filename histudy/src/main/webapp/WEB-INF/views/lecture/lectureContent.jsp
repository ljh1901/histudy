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
<link rel="stylesheet" href="css/lectureDesign/lectureContent.css" type="text/css">
<script>
function show(){
	var reviewDiv=document.getElementById('reviewWrite');
	if (reviewDiv.style.display=='none' || reviewDiv.style.display=='') {
        reviewDiv.style.display='block';
    } else {
        reviewDiv.style.display='none';
    }
}
function reviewWrite(){
	var reviewDiv=document.getElementById('reviewWrite');
	if (reviewDiv.style.display=='none' || reviewDiv.style.display=='') {
        reviewDiv.style.display='block';
    } else {
        reviewDiv.style.display='none';
    }
	
}
</script>
</head>
<body id="lectureContentPage">
<%@include file="../header.jsp"%>
<main>
<section class="LectureContentContainer">
<!-- 유효성 검사 -->
<c:choose>
	<c:when test="${empty sessionScope.user_idx}">
	   <h1>프리미엄 회원만 볼 수 있는 컨텐츠입니다.</h1>
	   <h1>프리미엄 회원만 볼 수 있는 컨텐츠입니다.</h1>
		<h2><a href="membership.do">멤버십 가입하러가기</a></h2>
	</c:when>
	<c:otherwise>
		<form name="lectureContent" action="lectureMemoOk">
	   <video width="1280" height="720" controls="controls">   
	   <source src="${pageContext.request.contextPath}/video/${lectureContent.lecture_file}" type="video/mp4">   
	   </video>
		<input type="hidden" name="lecture_idx" value="${lectureContent.lecture_idx }">
		<input type="hidden" name="user_idx" value="${empty sessionScope.user_idx?0:sessionScope.user_idx}">
		<table>
	   		<tr>
			   <td><h2>강의 메모</h2></td>
			</tr>
			<tr>
			   <td><input type="text" name="note_title" value="제목을 입력해주세요"></td>
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
	   		<a href="lectureLike.do?lecture_idx=${lectureContent.lecture_idx }&user_idx=${sessionScope.user_idx}">
	   		<img src="/histudy/lecture-img/like.png" width="30"></a>
			   ${lectureContent.lecture_like}   
	   		<a href="lectureHate.do"><img src="/histudy/lecture-img/thumb-down.png" width="30"></a>
			   ${lectureContent.lecture_hate}   
			</td>
	   	</tr>  
	   	<tr>
		   <td>${lectureContent.lecture_content}</td>   
	   	</tr>
	   	<tfoot>
	   		<c:if test="${empty reviewList }">
	   		<tr>
	   			<td>등록된 리뷰가 없습니다. 리뷰를 작성해 보세요!</td>
	       </tr>
	       </c:if>
	       <c:forEach var="dto" items="${reviewList}">
	       <tr>
			    <td>
			    	${dto.review_title }
			    </td>
			    <td>
			    	${dto.review_content }
			    </td>
			</tr>	    
			</c:forEach>
	   	</tfoot>
	   </table>
	   
	   <input type="button" value="리뷰 남기기" onclick="show()">
	   <div id="reviewWrite" style="display:none">
		<form name="writeFm" action="reviewWrite.do" method="post">
	   <table>
	   	<tr>
	   		<td>평점:<select name="review_score">
	   			<option value="5">★★★★★</option>
	   			<option value="4">★★★★</option>
	   			<option value="3">★★★</option>
	   			<option value="2">★★</option>
	   			<option value="1">★</option>
	   		</select></td>
	   	</tr>
	   	<tr>
	   		<td>제목:<input type="text" name="review_title"></td>
	   	</tr>
	   	<tr>
	   		<td><textarea rows="10" cols="90" name="r_comment"></textarea>
	   	</tr>
	</form>	
	   	<tr>
	   		<td><input type="submit" name="reviewbt" value="리뷰 작성" onclick="reviewWrite()"></td>
		</form>
	   	</tr>
	   </table>
	   </div>
	</c:otherwise>
</c:choose>
</section>
</main>
<%@include file="../footer.jsp"%>
</body>
</html>