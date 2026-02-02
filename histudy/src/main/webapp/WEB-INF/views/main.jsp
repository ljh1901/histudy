<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>
/* == root 글로벌 변수 == */
:root {
	/* 헤더/푸터 기본 색상 */ 
	--color-primary: var(--color-white);
	--color-text-variant: var(--color-navy);
	
	--color-navy: #1E293B;
}

html {
	scroll-behavior: smooth;
	font-family: 'Inter', sans-serif;
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
	color: var(--color-text);
}
/* == Commons ==*/
.section {
	padding: 4rem;
	text-align: center;
	min-height: 100vh;
}

.title {
	font-size: 2.5rem;
	margin: 1rem 0;
}

.description {
  font-size: 1.3rem;
  line-height: 1.6;
  color: #1E293B;
  opacity: 0.75;
}

.max-container { /* 이거 css마다 쓰지말고 그냥 클래스 옆에 붙힌거임 */
	max-width: 1200px;
}

/* == Header == */
.header {
	position: fixed;
    width: 100%;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 1rem;
	z-index: 1;
	background: transparent;
	transition: background-color 0.3s ease, box-shadow 0.3s ease;
}
.header__left{
	display: flex;
	align-items: center;
	padding-left: 6%;
}
.header__logo {
	width: 40px;
	height: 40px;
	margin-right:10px;
}
.mainTitle {
	font-size: 1.8rem;
}
.header__nav__menu {
	display: flex;
	gap: 4px;
}
.header__nav__menu__item {
	font-size: 0.8rem;
	padding: 8px 16px;
	display: block;
	border-bottom: 1px solid transparent;
	color: var(--color-text-variant);
}
.header__nav__menu__item:hover {
	border-bottom: 1px solid var(--color-accent);
}
.header__right{
	padding-right:6%;
}
.header__login{
	border: none;
	border-radius: 20px;
	width:100px;
	padding: 0.8rem;
	font-size:0.8rem;
	background-color: black;
	color: white;
}
.header--white{
	background-color: white;
	box-shadow: 0 2px 8px rgba(0,0,0,0.06);
}
/*== Main ==*/
/*== Home ==*/
.home {
	height: 100vh;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	background: linear-gradient(
	  135deg,
	  #FFF6F8 0%,
	  #FFF7F5 40%,
	  #FFF9F7 70%,
	  #FFFDFB 100%
	);
}
.home__text{
	display: flex;
	justify-content: center;
	flex-direction: column;
	align-items: center;
	margin-bottom: 30px;
}
.home__title {
	font-family: 'Playfair Display', serif;
	font-size: 5.5rem;
	font-weight: 900;
	letter-spacing: -0.02em;
	line-height: 1.05;
 	margin: 0.8rem 2rem 2rem;
}
.home__btns{
	margin-top:50px;
}
.home__btn{
	border: none;
	border-radius:25px;
	width:160px;
	padding:1rem;
	background-color: black;
	color: white;
	margin:10px;
	font-size:1rem;
}
#applyMentoringBtn{
	background: transparent;
	color: black;
	border: 2px solid black;
}
#applyMentoringBtn:hover{
	background-color: black;
	color: white;
}
/* ===== Service ===== */
.serviceController {
	margin: auto;
	display: flex;
	flex-direction: column;
}

.service__text {
	text-align: left;
}

.service__text p {
	font-size: 0.9rem;
	color: var(--color-gray);
	margin-bottom: 0.5rem;
}

.service__text h2 {
	font-size: 3rem;
	color: var(--color-navy);
	line-height: 1.3;
}

.service__text h2 i{
	font-size: 3rem;
	color: var(--color-navy);
	line-height: 1.3;
	font-weight: normal;
}

.service__grid {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 3rem;
	margin-top: 4rem;
}

.service__grid__items {
	display: flex;
	flex-direction: column;
	align-items: center;
	text-align: center;
	transition: transform 0.4s cubic-bezier(0.4, 0, 0.2, 1);
}

.service__grid__items:hover{
	transform: translateY(-10px);
}

.service__grid__imgBox {
	width: 100%;
	height: 300px;
	margin-bottom: 0.5rem;
}

.service__grid__imgBox img {
	width: 100%;
	height: 100%;
	object-fit: contain;
}

.service__grid__textBox h3 {
	font-size: 1.1rem;
	margin-bottom: 0.3rem;
	color: var(--color-navy);
}

.service__grid__textBox p {
	font-size: 0.9rem;
	color: var(--color-gray);
}
/*== Membership ==*/
#MembershipSection {
	min-height: auto;        /* section 기본값 : 100vh 이건데 멤버십 섹션은 덮어쓰기 */
	padding: 6rem 4rem;
	background-color: #F6F3FE;
}

.membershipContainer {
	margin: auto;
}

.membershipBG {
	position: relative;
	height: 380px; 
	border-radius: 24px;

	background-image: url('/histudy/main-img/primiam.png');
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;

	display: flex;
	align-items: center;
	justify-content: center;
	overflow: hidden;
}

.membershipTEXT {
	color: white;
	text-align: center;
	max-width: 520px;
	z-index: 2;
}

.membership-sub {
	font-size: 0.9rem;
	letter-spacing: 0.08em;
	opacity: 0.85;
	margin-bottom: 0.6rem;
}

.membership-title {
	font-size: 2.8rem;
	font-weight: 700;
	line-height: 1.2;
	margin-bottom: 0.4rem;
}

.membership-desc {
	font-size: 1.4rem;
	opacity: 0.9;
	margin-bottom: 2.2rem;
}

.membership-btn {
	border: none;
	border-radius: 30px;
	padding: 0.9rem 2.2rem;
	font-size: 0.9rem;
	font-weight: 500;
	cursor: pointer;

	background-color: white;
	color: #1E293B;

	transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.membership-btn:hover {
	transform: translateY(-3px);
	box-shadow: 0 10px 24px rgba(0,0,0,0.18);
}

/*== Review ==*/
#ReviewSection {
  padding: 100px 0;
  background-color: #f9fafb;
}

.reviewContainer {
  margin: 0 auto;
}

.reviewText {
  text-align: left;
  margin-bottom: 60px;
}

.reviewText p {
  color: #6b7280;
  font-size: 16px;
  margin-bottom: 10px;
}

.reviewText h2 {
  font-size: 3rem;
  font-weight: 700;
  color: #193546;
  line-height: 1.2;
}

.reviewText h2 i {
  font-weight: normal;
  color: var(--primary);
}

.reviewGrid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-template-rows: repeat(2, auto);
  gap: 30px;
}

.reviewCard {
  background-color: #ffffff;
  border-radius: 16px;
  padding: 24px;
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.06);
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

.reviewHeader {
  display: flex;
  align-items: center;
  gap: 12px;
  margin-bottom: 16px;
}

.reviewAvatar {
  width: 48px;
  height: 48px;
  border-radius: 50%;
  background-color: #e5e7eb; /* 일단 지금 이미지 없으니깐 임시 */
}

.reviewName {
  font-weight: 600;
  font-size: 15px;
  color: #111827;
}

.reviewId {
  font-size: 13px;
  color: #6b7280;
}

.reviewContent {
  font-size: 14px;
  line-height: 1.6;
  color: #374151;
}

#AboutSection{
	background-color: var(--color-primary);
	min-height: auto; 
}
.aboutContainer{
	display: flex;
}
.aboutLeft{
	margin-right:20px;
}
.aboutLeft img{
	width: 100%;
}
.aboutLeft p{
	border: 1px solid black;
	border-radius: 10px;
	padding: 1rem;
	width: 130px;
}
.aboutRight h2{
	font-size: 3rem;
}
.aboutRight h2 i{
	font-size: 4rem;
}
.aboutRight p{
	margin-top: 30px;
	text-align: left;
}
/*== Footer ==*/
.footer{
	background-color: #1E2A3D;
	min-height: auto;
	color: white;
	padding: 4rem;
}
.footerContainer{
	margin: auto;
}
.footer__center{
	display: flex;
	justify-content: space-between;
	align-items: flex-start;
	border-bottom: 1px solid white;
}
.footer__left{
	display: flex;
	align-items: flex-start;   
	flex-direction: column;
}
.footer__left h3,
.footer__left h4 {
	font-size: 2rem;
}
.footer__left__text{
	display: flex;
}
.footer__left__text img{
	margin-right:10px;
	width: 40px;
}
.footer__right{
	display: flex;
	margin-top:-20px;
}
.footer__right__box{
	min-width: 180px;
	display: flex;
	flex-direction: column;
	line-height: 1.8rem;
}
.footer__right__box h5{
	font-size: 1.2rem;
}
.footer__right__box li{
	color: #ccc;
	transition: transform 0.3s ease;
}
.footer__right__box li:hover{
	color: white;
	cursor: pointer;
	transform: translateY(-1px);
}
.footer__bottom{
	display: flex;
	justify-content: space-between;
	margin-top: 30px;
}
.footer__bottom p{
	color: #ccc;
}
.footer__bottom a{
	color: #ccc;
}
.footer__bottom a:hover{
	color: white;
	cursor: pointer;
}
#footer__bottom__adminModeBtn{
	border: 1px solid white;
	border-radius: 10px;
	padding: 0.7rem;
	background-color: white;
	color: black;
}
#footer__bottom__adminModeBtn:hover{
	background-color: #1E2A3D;
	color: white;
}
</style>
</head>
<body>
	<header class="header">
		<div class="header__left">
			<img src="/histudy/main-img/logo1.png" class="header__logo">
			<h1 class="mainTitle">
				<a href="index.do">Hi, Study</a>
			</h1>
		</div>
		<nav class="header__nav">
			<ul class="header__nav__menu">
				<li class="header__nav__menu__item"><a href="#">Home</a></li>
				<li class="header__nav__menu__item"><a href="#">Study</a></li>
				<li class="header__nav__menu__item"><a href="#">Mentoring</a></li>
				<li class="header__nav__menu__item"><a href="studycafe.do">Study Cafe</a></li>
				<li class="header__nav__menu__item"><a href="#">LMS</a></li>
				<li class="header__nav__menu__item"><a href="#">Lecture</a></li>
			</ul>
		</nav>
		<div class="header__right">
			<input type="button" value="Login" class="header__login">
		</div>
	</header>
	<main>
		<!--Home -->
		<section class="home">
			<div class="home__text">
				<p class="description">함께 성장하는</p>
				<h1 class="home__title">Study & Mentoring</h1>
				<p class="description">목표에 맞는 스터디 그룹과 멘토링으로 학습을 이어가세요.</p>
			</div>
			<div class="home__btns">
				<input type="button" value="스터디 시작하기" class="home__btn">
				<input type="button" value="멘토링 신청" class="home__btn" id="applyMentoringBtn">
			</div>
		</section>
		
		<!-- serviceSection -->
		<section id="serviceSection" class="section">
			<div class="serviceController max-container">
				<div class="service__text">
					<p>우리의 서비스</p>
					<h2>당신의 학습 여정을</h2>
					<h2><i>완벽하게 지원합니다</i></h2>
				</div>
				<div class="service__grid">
					<div class="service__grid__items">
						<div class="service__grid__imgBox">
							<img src="/histudy/main-img/groupStudy.png">
						</div>
						<div class="service__grid__textBox">
							<h3>그룹 스터디</h3>
							<p>함께 목표 달성</p>
						</div>
					</div>
					<div class="service__grid__items">
						<div class="service__grid__imgBox">
							<img src="/histudy/main-img/mentoring.png">
						</div>
						<div class="service__grid__textBox">
							<h3>1:1 멘토링</h3>
							<p>전문가의 맞춤 조언</p>
						</div>
					</div>
					<div class="service__grid__items">
						<div class="service__grid__imgBox">
							<img src="/histudy/main-img/studyCafe.png">
						</div>
						<div class="service__grid__textBox">
							<h3>스터디 카페</h3>
							<p>집중 학습 공간</p>
						</div>
					</div>
					<div class="service__grid__items">
						<div class="service__grid__imgBox">
							<img src="/histudy/main-img/lectuer.png">
						</div>
						<div class="service__grid__textBox">
							<h3>온라인 강의</h3>
							<p>프리미엄 회원 혜택</p>
						</div>
					</div>
				</div>
			</div>
		</section>
		
		<!-- MembershipSection -->
		<section id="MembershipSection" class="section">
			<div class="membershipContainer max-container">
				<div class="membershipBG">
					<div class="membershipTEXT">
						<p class="membership-sub">프리미엄 멤버십</p>
						<h2 class="membership-title">더 많은 혜택을</h2>
						<p class="membership-desc">경험하세요</p>
						<button class="membership-btn">멤버십 알아보기</button>
					</div>
				</div>
			</div>
		</section>
		
		<!-- ReviewSection -->
		<section id="ReviewSection" class="section">
			<div class="reviewContainer max-container">
				<div class="reviewText">
					<p>사용자 후기</p>
					<h2>실제 이용자들의</h2>
					<h2><i>생생한 경험담</i></h2>
				</div>
				<div class="reviewGrid">
					<div class="reviewCard">
						<div class="reviewHeader"> 
							<img class="reviewAvatar">
							<div class="reviewUser">
								<p class="reviewName">서준범</p>
								<p class="reviewId">seoni65</p>
							</div>
						</div>
						<p class="reviewContent">
							"전문 멘토님의 조언 덕분에 진로를 명확하게 설정할 수 있었습니다. 정말 감사드려요. 앞으로도 계속 이용할 예정입니다!"
						</p>
					</div>
					<div class="reviewCard">
						<div class="reviewHeader">
							<img class="reviewAvatar">
							<div class="reviewUser">
								<p class="reviewName">김성지</p>
								<p class="reviewId">tjdwl12</p>
							</div>
						</div>
						<p class="reviewContent">
							"멘토링 덕분에 목표했던 자격증을 단기간에 취득할 수 있었어요. 1:1 맞춤 학습이 정말 효과적이었습니다!"
						</p>
					</div>
					<div class="reviewCard">
						<div class="reviewHeader">
							<img class="reviewAvatar">
							<div class="reviewUser">
								<p class="reviewName">양상연</p>
								<p class="reviewId">sang__chi</p>
							</div>
						</div>
						<p class="reviewContent">
							"스터디 카페 좌석현황을 한 눈에 볼 수 있고, 예약까지..? 저한테 진짜 필요했었는데 매우 유용하게 이용하고 있습니다!"
						</p>
					</div>
					<div class="reviewCard">
						<div class="reviewHeader">
							<img class="reviewAvatar">
							<div class="reviewUser">
								<p class="reviewName">김민영</p>
								<p class="reviewId">alsdud12</p>
							</div>
						</div>
						<p class="reviewContent">
							"그룹 스터디에서 만난 동료들과 함께 성장하는 느낌이 정말 좋아요."
						</p>
					</div>
					<div class="reviewCard">
						<div class="reviewHeader">
							<img class="reviewAvatar">
							<div class="reviewUser">
								<p class="reviewName">유준상</p>
								<p class="reviewId">wnstkd12</p>
							</div>
						</div>
						<p class="reviewContent">
							"온라인 강의 퀄리티가 정말 높아요. 프리미엄 회원이라면 언제 어디서나 학습할 수 있어서 직장인인 저에게 딱 맞습니다!"
						</p>
					</div>
					<div class="reviewCard">
						<div class="reviewHeader">
							<img class="reviewAvatar">
							<div class="reviewUser">
								<p class="reviewName">이주호</p>
								<p class="reviewId">wngh12</p>
							</div>
						</div>
						<p class="reviewContent">
							"스터디 그룹 분위기가 정말 좋아요. 서로 응원하고 격려하면서 함께 성장하는 느낌!"
						</p>
					</div>
				</div>
			</div>
		</section>
		
		<!-- aboutSection -->
		<section id="AboutSection" class="section">
			<div class="aboutContainer max-container">
				<div class="aboutLeft">
					<p>ABOUT US</p>
					<img src="/histudy/main-img/aboutImg.png">
				</div>
				<div class="aboutRight">
					<h2>학습의 새로운 패러다임</h2>
					<h2><i>Hi, Study와 함께</i></h2>
					<h2>시작하세요</h2>
					<p>
						StudyMate는 단순한 학습 플랫폼을 넘어, 여러분의 성장을 함께하는 파트너입니다.
						전문 멘토와의 1:1 맞춤 학습부터 그룹 스터디, 온라인 강의까지 다양한 학습 방법을 제공합니다.
					</p>
					<p>
						집중력을 높이는 스터디 카페 공간과 프리미엄 멤버십 혜택으로 여러분의 학습 목표 달성을 완벽하게 지원합니다.
					</p>
				</div>
			</div>
		</section>
	</main>
	<footer class="footer">
		<div class="footerContainer max-container">
			<div class="footer__center">
				<div class="footer__left">
					<div class="footer__left__text">
						<img src="/histudy/main-img/logo1.png">
						<h3>Hi, Study</h3>
					</div>
					<h4>함께 성장하는<br>학습 커뮤니티</h4>
				</div>
				<div class="footer__right">
					<div class="footer__right__box">	
						<h5>스터디</h5>	
						<ul>
							<li>그룹 스터디</li>
							<li>스터디 카페</li>
							<li>LMS</li>
						</ul>
					</div>
					<div class="footer__right__box">	
						<h5>멘토링</h5>	
						<ul>
							<li>멘토 목록</li>
							<li>멘토링 신청</li>
							<li>후기</li>
						</ul>
					</div>
					<div class="footer__right__box">	
						<h5>강의</h5>	
						<ul>
							<li>전체강의</li>
							<li>인기강의</li>
							<li>신규강의</li>
						</ul>
					</div>
					<div class="footer__right__box">	
						<h5>고객지원</h5>	
						<ul>
							<li>FAQ</li>
							<li>공지사항</li>
							<li>문의하기</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="footer__bottom">
				<div>
					<p>© 2026 Hi, Study. All rights reserved.</p>
				</div>
				<div>
					<a href="#" id="footer__bottom__adminModeBtn">관리자모드</a>
				</div>
				<div>
					<p><a href="#">개인정보처리방침</a> &nbsp;|&nbsp; <a href="#">이용약관</a> &nbsp;|&nbsp; <a href="#">Made with ❤️ by Hi, Study Team</a></p>
				</div>
			</div>
		</div>
	</footer>
</body>
<script>
	//== 페이지 스크롤 시 Header 커스텀 ==
	const header = document.querySelector('.header');
	const headerHeight = header.getBoundingClientRect().height;
	
	document.addEventListener('scroll', function () {
	  if (window.scrollY > headerHeight) {
	    header.classList.add('header--white');
	  } else {
	    header.classList.remove('header--white');
	  }
	});
    	
    //== 검색창 커스텀 ==
	//1. 데이터 수집
	const selectBox = document.querySelector('.custom-select');
	const selected = document.querySelector('.selected');
	const options = document.querySelectorAll('.options li');

	//2. 셀렉트 열기
	selectBox.addEventListener('click', function(e) {
		e.stopPropagation();
		this.classList.toggle('open');
	});

	//3. 셀렉트 변경 후 닫기
	for (var i = 0; i < options.length; i++) {
		options[i].addEventListener('click', function(e) {
			e.stopPropagation();
			selected.innerHTML = this.innerHTML;
			selectBox.classList.remove('open');
		});
	}

	//4. 셀렉트 닫기
	document.addEventListener('click', function() {
		selectBox.classList.remove('open');
	});
</script>
</html>
