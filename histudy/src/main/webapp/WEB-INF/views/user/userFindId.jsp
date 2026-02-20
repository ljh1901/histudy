<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/userSignIn.css">
<script src="${pageContext.request.contextPath}/js/user/user.js"></script>
</head>
<body>
	<div id="signInFragment">
		<h2 class="login-title">아이디 찾기</h2>
		<p
			style="text-align: center; font-size: 0.9em; color: #666; margin-bottom: 20px;">
			가입 시 등록한 이름과 전화번호를 입력해주세요.</p>

		<form id="findIdForm">
			<div class="input-group">
				<input type="text" id="find_name" class="icon-name" placeholder="성명"
					required>
			</div>
			<div class="input-group">
				<input type="tel" id="find_tel" class="icon-tel" placeholder="전화번호"
					required>
			</div>

			<button type="button" class="login-btn" onclick="findUserId()">아이디
				찾기</button>

			<div class="login-options"
				style="justify-content: center; margin-top: 15px;">
				<a href="userSignIn.do"
					style="text-decoration: none; color: #007bff;">로그인으로 돌아가기</a>
			</div>
		</form>
	</div>
</body>
</html>