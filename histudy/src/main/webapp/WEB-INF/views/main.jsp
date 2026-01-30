<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<<<<<<< HEAD
<title>하이스터디</title>
<style>
/* == root 기본 세팅 == */
html {
	scroll-behavior: smooth;
}

body {
	margin: 0;
}

* {
	box-sizing: border-box;
}

h1, h2, h3, p, ul {
	margin: 0;
}

ul {
	list-style: none;
	padding: 0;
}

a {
	text-decoration: none;
	color: #ffffff;
}
/* == Commons ==*/
.section {
	padding: 4rem;
	text-align: center;
	height: 100vh;
}

.title {
	font-size: 2.5rem;
	margin: 1rem 0;
}

.description {
	font-size: 1.5rem;
	margin: 0.5rem 0;
}

.max-container {
	max-width: 1200px;
	margin: auto;
}
/* == Header == */
.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 1rem;
	width: 100%;
	z-index: 1;
	background-color: #193546;
	color: #ffffff;
}

.mainTitle {
	font-size: 1.8rem;
}

.header__nav__menu {
	display: flex;
	gap: 4px;
}

.header__nav__menu__item {
	font-size: 1rem;
	font-weight: bold;
	padding: 8px 16px;
	display: block;
	border-bottom: 1px solid transparent;
}

.header__nav__menu__item:hover {
	border-bottom: 1px solid #ffffff;
}
/*== Main ==*/
/*== Home ==*/
.home {
	position: relative;
	height: 100vh;
	overflow: hidden;
	display: flex;
	align-items: center;
}

.home__bg {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-image: url('/histudy/images/mainImg.png');
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	z-index: 1;
}

.home__content {
	position: relative;
	z-index: 2;
	color: #000;
	max-width: 600px;
	margin-left: 10%;
	margin-top: -50px;
	text-align: left;
}

.home__text {
	font-size: 2.8rem;
	font-weight: bold;
	line-height: 1.3;
}

.home__text__sub {
	margin-top: 1rem;
	font-size: 1.2rem;
	color: #000;
	line-height: 1.6;
}
/* == Study Section ==*/
#studySection {
	background-color: #243148;
	color: white;
}

.studySection__cards {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.studySection__card {
	padding: 1rem;
	border: 1px solid #ccc;
	border-radius: 8px;
	max-width: 300px;
	width: 100%;
}
/* == mentoringSection == */
#mentoringSection {
	
}
/* == studyCafeSection == */
#studyCafeSection {
	background-color: black;
	color: white;
}

/* == LectureSection == */
#LectureSection {
	background-color: #ccc;
}

/* == Footer == */
.footer {
	background-color: #193546;
	color: #ffffff;
	padding: 2rem;
}

.footer__center {
	display: flex;
}

.footer__middle {
	display: flex;
	margin-top: 30px;
	margin-left: 300px;
}

.footer__bottom {
	display: flex;
}

.footer__bottom p {
	padding: 0.3rem;
}

.footer__center__box {
	max-width: 300px;
	margin: 0 3rem;
}

.footer__center__box h2 {
	border-bottom: 1px solid white;
}

#footer__left {
	margin-top: 50px;
}

.footer__title {
	font-size: 2.5rem;
}

#admin {
	border: 1px solid #ffffff;
	border-radius: 8px;
	background-color: #ffffff;
	margin-left: 5px;
}

#admin a {
	color: black;
	font-weight: bold;
}

.line {
	border: 1px solid #ffffff;
	height: 30px;
	margin-top: 10px;
	margin: 0 10px;
}
</style>
</head>
<body>
<%@include file="/header.jsp" %>
	<form>
		<main>
			<!-- Home -->
			<section class="home">
				<div class="home__bg"></div>
				<div class="home__content">
					<h2 class="home__text">
						혼자가 아닌,<br>함께 성장하는 학습 공간
					</h2>
					<p class="home__text__sub">목표에 맞는 스터디 그룹과 멘토링으로 학습을 이어가세요.</p>
				</div>
			</section>
			<!-- Study -->
			<section id="studySection" class="section">
				<div class="max-container">
					<h2 class="title">Hi, Study와 함께하는 스터디</h2>
					<div class="studySection__cards">
						<div class="studySection__card">
							<h2>다양한 카테고리</h2>
							<p>
								독서 코딩 자격증 <br> 취업 학업 언어
							</p>
						</div>
						<div class="studySection__card">
							<h2>스터디 개설 & 참여</h2>
							<p>누구나 스터디를 개설하고 참여할 수 있습니다.</p>
						</div>
						<div class="studySection__card">
							<h2>스터디 관리</h2>
							<p>Hi, Study는 LMS 시스템으로 학습 흐름을 관리합니다 !</p>
						</div>
					</div>
				</div>
			</section>
			<!-- Mentoring -->
			<section id="mentoringSection" class="section">
				<div class="max-container">
					<h2 class="title">경험을 나누는 Hi, Study 멘토링</h2>
				</div>
			</section>
			<!-- Study Cafe -->
			<section id="studyCafeSection" class="section">
				<div class="max-container">
					<h2 class="title">공부에 집중할 공간까지. Hi, Study</h2>
					<p>스터디 카페를 선택하고, 좌석 현황을 실시간으로 확인하세요.</p>
				</div>
			</section>
			<!-- Lecture -->
			<section id="LectureSection" class="section">
				<div class="max-container">
					<h2 class="title">프리미엄 회원 전용 학습 혜택</h2>
				</div>
			</section>
		</main>
	</form>
<%@include file="/footer.jsp" %>
<title>Insert title here</title>
<style>
	/* == root 기본 세팅 == */
	html {
	  scroll-behavior: smooth;
	}
	body{
		margin:0;
	}
	*{
		box-sizing: border-box;
	}
	h1,h2,h3,p,ul{
		margin:0;
	}
	ul{
		list-style:none;
		padding: 0;
	}
	a{
		text-decoration: none;
		color: #ffffff;
	}
	/* == Commons ==*/
	.section {
	  padding: 4rem;
	  text-align: center;
	  height:100vh;
	}
	.title {
	  font-size: 2.5rem;
	  margin: 1rem 0;
	}
	
	.description {
	  font-size: 1.5rem;
	  margin: 0.5rem 0;
	}
	.max-container {
	  max-width: 1200px;
	  margin: auto;
	}
	/* == Header == */
	.header{
		display: flex;
		justify-content: space-between;
		align-items: center;
		padding: 1rem;
		width:100%;
		z-index: 1;
		background-color: #193546;
		color: #ffffff;
	}
	.mainTitle{
		font-size: 1.8rem;
	}
	.header__nav__menu{
		display: flex;
  		gap: 4px;
	}
	.header__nav__menu__item{
		font-size:1rem;
		font-weight: bold;
		padding: 8px 16px;
		display: block;
		border-bottom: 1px solid transparent;
	}
	.header__nav__menu__item:hover{
		border-bottom: 1px solid #ffffff;
	}
	/*== Main ==*/
	/*== Home ==*/
	.home{
		position: relative;
		height: 100vh;
		overflow: hidden;
		display: flex;
		align-items: center;
	}
	.home__bg{
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
	
		background-image: url('/histudy/images/mainImg.png');
		background-size: cover;
		background-position: center;
		background-repeat: no-repeat;
	
		z-index: 1;
	}
	.home__content{
		position: relative;
		z-index: 2;
		color: #000;
	
		max-width: 600px;
	
		margin-left: 10%;
		margin-top: -50px;
		text-align: left;
	}
	.home__text{
		font-size: 2.8rem;
		font-weight: bold;
		line-height: 1.3;
	}
	
	.home__text__sub{
		margin-top: 1rem;
		font-size: 1.2rem;
		color: #000;
		line-height: 1.6;
	}
	/* == Study Section ==*/
	#studySection{
		background-color: #243148;
		color:white;
	}
	.studySection__cards{
		display: flex;
		align-items: center;
		justify-content: space-between;
	}
	.studySection__card{
		padding:1rem;
		border: 1px solid #ccc;
		border-radius:8px;
		max-width:300px;
		width:100%;
	}
	/* == mentoringSection == */
	#mentoringSection{
		
	}
	/* == studyCafeSection == */
	#studyCafeSection{
		background-color: black;
		color: white;
	}
	
	/* == LectureSection == */
	#LectureSection{
		background-color: #ccc;
	}
	
	/* == Footer == */
	.footer{
		background-color: #193546;
		color: #ffffff;
		padding: 2rem;
	}
	.footer__center{
		display: flex;
	}
	.footer__middle{
		display: flex;
		margin-top:30px;
		margin-left:300px;
	}
	.footer__bottom{
		display: flex;
	}
	.footer__bottom p{
		padding: 0.3rem;
	}
	.footer__center__box{
		max-width:300px;
		margin: 0 3rem;
	}
	.footer__center__box h2{
		border-bottom: 1px solid white;
	}
	#footer__left{
		margin-top:50px;
	}
	.footer__title{
		font-size:2.5rem;
	}
	#admin{
		border: 1px solid #ffffff;
		border-radius:8px;
		background-color: #ffffff;
		margin-left:5px;
	}
	#admin a{
		color: black;
		font-weight: bold;
	}
	.line{
		border: 1px solid #ffffff;
		height: 30px;
		margin-top:10px;
		margin: 0 10px;
	}
</style>
</head>
<body>
<header class="header">
	<div class="header__left">
		<h1 class="mainTitle">Hi, Study</h1>
	</div>
	<nav class="header__nav">
		<ul class="header__nav__menu">
			<li class="header__nav__menu__item"><a href="#">Home</a></li>
			<li class="header__nav__menu__item"><a href="#">강의</a></li>
			<li class="header__nav__menu__item"><a href="#">멘토링</a></li>
			<li class="header__nav__menu__item"><a href="#">스터디</a></li>
			<li class="header__nav__menu__item"><a href="#">스카</a></li>
			<li class="header__nav__menu__item"><a href="#">LMS</a></li>
		</ul>
	</nav>
	<div class="header__right">
		<a href="#">로그인</a> | <a href="#">회원가입</a>
	</div>
</header>
<main>
	<!-- Home -->
	<section class="home">
		<div class="home__bg"></div>
		<div class="home__content">
			<h2 class="home__text">
				혼자가 아닌,<br>함께 성장하는 학습 공간
			</h2>
			<p class="home__text__sub">
				목표에 맞는 스터디 그룹과 멘토링으로 학습을 이어가세요.
			</p>
		</div>
	</section>
	<!-- Study -->
	<section id="studySection" class="section">
		<div class="max-container">
			<h2 class="title">Hi, Study와 함께하는 스터디</h2>
			<div class="studySection__cards">
				<div class="studySection__card">
					<h2>다양한 카테고리</h2>
					<p>독서 코딩 자격증 <br> 취업 학업 언어</p>
				</div>
				<div class="studySection__card">
					<h2>스터디 개설 & 참여</h2>
					<p>누구나 스터디를 개설하고 참여할 수 있습니다.</p>
				</div>
				<div class="studySection__card">
					<h2>스터디 관리</h2>
					<p>Hi, Study는 LMS 시스템으로 학습 흐름을 관리합니다 !</p>
				</div>
			</div>
		</div>
	</section>
	<!-- Mentoring -->
	<section id="mentoringSection" class="section">
		<div class="max-container">
			<h2 class="title">경험을 나누는 Hi, Study 멘토링</h2>
		</div>
	</section>
	<!-- Study Cafe -->
	<section id="studyCafeSection" class="section">
		<div class="max-container">
			<h2 class="title">공부에 집중할 공간까지. Hi, Study</h2>
			<p>스터디 카페를 선택하고, 좌석 현황을 실시간으로 확인하세요.</p>
		</div>
	</section>
	<!-- Lecture -->
	<section id="LectureSection" class="section">
		<div class="max-container">
			<h2 class="title">프리미엄 회원 전용 학습 혜택</h2>
		</div>
	</section>
</main>
<footer class="footer">
	<div class="footer__center">
		<div class="footer__center__box" id="footer__left">
			<h1 class="footer__title">Hi, Study</h1>
			<p>스터디 그룹, 멘토링 기반 학습 플랫폼</p>
		</div>
		<div class="footer__middle">
			<div class="footer__center__box">
				<h2>Hi, Study</h2>
				<h4>Hi, Study 소개</h4>
				<h4>수강평 모아보기</h4>
				<h4>Q&A 게시판</h4>
			</div>
			<div class="footer__center__box">
				<h2>고객센터</h2>
				<h4>공지사항</h4>
				<h4>자주 묻는 질문</h4>
				<h4>신고센터</h4>
			</div>
			<div class="footer__center__box">
				<h2>참여하기</h2>
				<h4>스터디 그룹</h4>
				<h4>멘토링</h4>
			</div>
		</div>
	</div>
	<div class="footer__bottom">
		<p>개인정보처리방침</p>
		<div class="line"></div>
		<p>이용약관</p>
		<div class="line"></div>
		<p>FAQ</p>
		<div class="line"></div>
		<p id="admin"><a href="#">관리자</a></p>
	</div>
</footer>
</body>
</html>
