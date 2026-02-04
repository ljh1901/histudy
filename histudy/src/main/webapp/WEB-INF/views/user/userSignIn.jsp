<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/userSignIn.css">
</head>
<body>
    <div id="signInFragment">
        <h2 class="login-title">Hi, Study</h2>
        
        <form id="ajaxLoginForm">
            <div class="input-group">
                <input type="text" name="user_id" class="icon-id" id="login_id" placeholder="아이디">
            </div>
            <div class="input-group">
                <input type="password" name="user_pw" id="login_pw" class="icon-pw" placeholder="비밀번호">
            </div>

            <div class="login-options">
                <input type="checkbox" id="rememberId" name="rememberId"> 
                <label for="rememberId">아이디 기억하기</label>
            </div>

            <button type="button" class="login-submit-btn" onclick="submitLogin()">로그인</button>
            
            <div class="login-footer-links">
                <a href="findPw.do">비밀번호 찾기</a>
                <a href="userSignUp.do">회원가입</a>
                <a href="findId.do">아이디 찾기</a>
            </div>
        </form>
    </div>
</body>
</html>