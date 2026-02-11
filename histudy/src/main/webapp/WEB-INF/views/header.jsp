<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/mypage.css">
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
			<li class="header__nav__menu__item"><a href="lms.do">LMS</a></li>
			<li class="header__nav__menu__item"><a href="lecture.do">Lecture</a></li>
		</ul>
	</nav>

	<div class="header__right">
    <c:if test="${empty sessionScope.user_id}">
        <input type="button" value="Login" class="header__login"
            onclick="openSignInModal()">
    </c:if>

    <c:if test="${not empty sessionScope.user_id}">
        <div class="user-dropdown">

            <div class="user-greeting">
                ${sessionScope.user_name}님
            </div>

            <button type="button" class="header__login"
                onclick="toggleUserMenu(event)">
                My Page <span style="font-size: 10px; margin-left: 5px;"></span>
            </button>

            <ul class="user-menu" id="userMenu">
                <li><a href="${pageContext.request.contextPath}/myPage.do">프로필 관리</a></li>
                <li><a href="#">알림함</a></li>
                <li><a href="#">활동 내역</a></li>
                <li><a href="#">관심 스터디</a></li>
                <li class="logout-item">
                    <a href="javascript:void(0);"
                       onclick="if(confirm('로그아웃 하시겠습니까?')) location.href='${pageContext.request.contextPath}/userLogout.do'"
                       class="logout-link">
                        Logout
                    </a>
                </li>
            </ul>
        </div>
    </c:if>
</div>
</header>