<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
	<header class="header">
		<div class="header__left">
			<img src="/histudy/main-img/logo1.png" class="header__logo">
			<h1 class="mainTitle">
				<a href="index.do">Hi, Study</a>
			</h1>
		</div>
		<nav class="header__nav">
			<ul class="header__nav__menu">
				<li class="header__nav__menu__item"><a href="index.do">Home</a></li>
				<li class="header__nav__menu__item"><a href="studyList.do">Study</a></li>
				<li class="header__nav__menu__item"><a href="mentorList.do">Mentoring</a></li>
				<li class="header__nav__menu__item"><a href="studycafe.do">Study Cafe</a></li>
				<li class="header__nav__menu__item"><a href="#">LMS</a></li>
				<li class="header__nav__menu__item"><a href="lecture.do">Lecture</a></li>
			</ul>
		</nav>
		<div class="header__right">
    <c:if test="${empty sessionScope.loginUser}">
        <input type="button" value="Login" class="header__login" onclick="openSignInModal()">
    </c:if>

    <c:if test="${not empty sessionScope.loginUser}">
    <div class="user-info-area" style="display: flex; flex-direction: column; align-items: flex-end; gap: 10px;">
        <p style="margin: 0; font-size: 0.9rem; color: #374151;">
            <strong>${sessionScope.loginUser.user_name}</strong>님 환영합니다
        </p>
        <input type="button" value="Logout" class="header__login" 
               onclick="if(confirm('로그아웃 하시겠습니까?')) location.href='${pageContext.request.contextPath}/userLogout.do'">
    </div>
</c:if>
</div>
	</header>
</body>
</html>
