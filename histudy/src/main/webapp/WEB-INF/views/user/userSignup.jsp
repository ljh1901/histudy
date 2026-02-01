<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="css/root.css" type="text/css"> 
<link rel="stylesheet" href="css/header.css" type="text/css"> 
<link rel="stylesheet" href="css/footer.css" type="text/css"> 
<style>
    .signup-form { width: 300px; margin: 50px auto; }
    .signup-form input { width: 100%; margin-bottom: 10; padding: 8px; }
    .signup-form button { width: 100%; padding: 10px; background-color: #007bff; color: white; border: none; }
</style>
</head>
<%@include file="/header.jsp" %>
<body>

<div class="signup-form">
    <h2>회원가입</h2>
    <form action="userSignup.do" method="post">
        
        <label>아이디</label>
        <input type="text" name="user_id" placeholder="아이디를 입력하세요" required>
        
        <label>비밀번호</label>
        <input type="password" name="user_pw" placeholder="비밀번호를 입력하세요" required>
        
        <label>이름</label>
        <input type="text" name="user_name" placeholder="이름을 입력하세요" required>
        
        <label>생년월일</label>
        <input type="date" name="user_birthdate">
        
        <label>전화번호</label>
        <input type="text" name="user_tel" placeholder="010-0000-0000">
        
        <button type="submit">가입하기</button>
    </form>
</div>
<%@include file="/footer.jsp" %>
</body>
</html>