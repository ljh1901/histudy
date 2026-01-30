<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
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
    <h2>로그인 페이지</h2>
    <form action="userSignin.do" method="post">
        아이디: <input type="text" name="user_id"><br>
        비밀번호: <input type="password" name="user_pw"><br>
        <button type="submit">로그인</button>
    </form>
    <a href="userSignup.do">아직 회원이 아니신가요? (회원가입)</a>
<%@include file="/footer.jsp" %>
</body>
</html>