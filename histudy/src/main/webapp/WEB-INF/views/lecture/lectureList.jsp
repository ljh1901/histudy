<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/histudy/css/mainLayout.css">
<link rel="stylesheet" type="text/css" href="/histudy/css/header.css">
<link rel="stylesheet" type="text/css" href="/histudy/css/footer.css">
<link rel="stylesheet" type="text/css" href="/histudy/css/root.css">
</head>
<body>
<%@include file="../header.jsp"%>
<main>
   <form name="lectureFm">
   <fieldset>
   <p>Hi, Study 프리미엄 멤버십 29,000원 / 50,000원</p>
   <p>분야별 전문 강사의 강의 제공 !! 스터디 카페 이용권 할인 혜택 !!</p>
   </fieldset>
   <c:set var="count" value="0" />
   <table>
       <tr>
       <c:if test="${empty lectureLists }">
       <td>등록된 강의가 없습니다.</td>
       </c:if>
       <c:forEach var="dto" items="${lectureLists}">
           <td>
               <a href="lectureContent.do?idx=${dto.lecture_idx}">
                   <video width="480" height="320" controls="controls">  
                       <source src="/histudy/video/${dto.lecture_file}" type="video/mp4">
                   </video>
               </a>
               <p>${dto.lecture_name}</p>
               <p>${dto.lecture_lecturer}</p>
           </td>
           
           <c:set var="count" value="${count + 1}" />
           
           <c:if test="${count % 3 == 0}">
               </tr><tr>
           </c:if>
       </c:forEach>
       </tr>
   </table>
   </form>
</main>
<%@include file="../footer.jsp"%>
</body>
</html>
