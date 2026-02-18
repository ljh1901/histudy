<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하이스터디</title>

<link rel="stylesheet" href="css/root.css">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/footer.css">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@12/swiper-bundle.min.css" />
<script
	src="https://cdn.jsdelivr.net/npm/swiper@12/swiper-bundle.min.js"></script>

<style>
section>h1, section>p {
	margin-left: 5%;
}

section>p {
	color: gray;
}

#studycafeBody header {
	background: white;
}

.korea__region {
	display: flex;
	justify-content: center;
	gap: 10px;
	margin: 20px 0;
	flex-wrap: wrap;
}

.korea__region button {
	padding: 6px 14px;
	background: white;
	border: 1px solid #ddd;
	border-radius: 20px;
	cursor: pointer;
	transition: 0.2s;
}

.korea__region button:hover {
	background: #6366f1;
	color: white;
	border-color: #6366f1;
}

.studycafeList {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 24px;
	margin: 2% 5% 5%;
}

.studycafeIdx {
	background: #fff;
	border-radius: 14px;
	box-shadow: 0 4px 14px rgba(0, 0, 0, 0.08);
	overflow: hidden;
	transition: 0.2s;
	display: flex;
	flex-direction: column;
}

.studycafeIdx:hover {
	transform: translateY(-6px);
}

.studycafeList__header img {
	width: 100%;
	height: 220px;
	object-fit: cover;
}

.studycafeInfo {
	display: flex;
	justify-content: space-between;
	padding: 15px;
	font-weight: 700;
	font-size: 18px;
}

.studycafeList__body {
	padding: 0 15px 15px 15px;
	display: flex;
	justify-content: space-between;
	font-size: 14px;
	color: #555;
}

.studycafeList__footer {
	padding: 15px;
	margin-top: auto;
}

.studycafeUse {
	width: 100%;
	padding: 12px 0;
	border: none;
	border-radius: 8px;
	background: #6366f1;
	color: white;
	font-weight: 600;
	cursor: pointer;
	transition: 0.2s;
}

.studycafeUse:hover {
	background: #4f46e5;
}

.swiper {
	width: 100%;
	height: 300px;
	margin: 80px 0 5%;
}

.swiper-slide {
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 22px;
	font-weight: 700;
}

.swiper-slide fieldset {
	width: 100%;
	height: 100%;
	border: none;
	margin: 0;
	background: #fefade;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	gap: 10px;
}

.slide2 {
	background: url("main-img/primiam.png") center/cover no-repeat;
	position: relative;
}

.slide2::before {
	content: "";
	position: absolute;
	inset: 0;
	background: rgba(0, 0, 0, 0.4);
}

.slide2-content {
	position: relative;
	z-index: 1;
	color: white;
	text-align: center;
}
.paging__area{
	text-align: center;
}
</style>
</head>
<body id="studycafeBody">
	<%@include file="../header.jsp"%>
	<main>
		<div class="swiper">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<fieldset>
						<p>Hi, Study 프리미엄 멤버십 29,000원 /<del>50,000원</del></p>
						<p>분야별 전문 강사의 강의 제공 !!</p>
						<p>멤버십 가입 시 할인권 증정</p>
						<button id="memberShip" type="button">멤버십 가입</button>
					</fieldset>
				</div>

				<div class="swiper-slide slide2">
					<div class="slide2-content">
						<h1>쾌적한 환경의 스터디 카페</h1>
						<p>histudy 1호점</p>
						<p>histudy 2호점</p>
						<p>histudy 3호점</p>
					</div>
				</div>
				<div class="swiper-slide slide3">
					<div class="slide3-content">
						<h2 class="text-4xl font-bold text-white mb-4">함께 성장하는 스터디
							플랫폼</h2>
						<p class="text-lg text-teal-100 mb-8">스터디 카페를 예약 및 멘토링을
							신청해보세요.</p>
						<div class="flex gap-4">
							<a href="#" data-discover="true">스터디 개설하기</a>
							<button class="mentoring">멘토링 이동</button>
						</div>
					</div>
				</div>
			</div>
			<div class="swiper-pagination"></div>
			<div class="swiper-button-prev"></div>
			<div class="swiper-button-next"></div>
		</div>
		<section>
			<h1>스터디 카페</h1>
			<p>집중할 수 있는 공간을 예약해보세요.</p>
			<div class="korea__region"></div>
			<div class="studycafeList">
				<c:forEach var="studycafe" items="${requestScope.studycafeList}">
					<div class="studycafeIdx">
						<div class="studycafeList__header">
							<img src="img/histudyNum1.png" alt="histudy">
							<div class="studycafeInfo">
								<div>${studycafe.studycafe_name}</div>
								<div>
									<a href="studycafeReview.do?studycafe_idx=${studycafe.studycafe_idx}">이용 후기</a>
								</div>
							</div>
						</div>
						<div class="studycafeList__body">
							<div>💺 ${studycafe.avaliable}/${studycafe.all}석</div>
							<div>${studycafe.studycafe_addr}</div>
						</div>
						<div class="studycafeList__footer">
							<button class="studycafeUse" value="${studycafe.studycafe_idx}">이용하기</button>
						</div>
					</div>
				</c:forEach>
			</div>
				<div class="paging__area">${paging}</div>
		</section>
	</main>
	<%@include file="../footer.jsp"%>
</body>
	<script>
	var region = '${region}';
	var currentPage = ${currentPage};
	document.querySelector('.studycafeList').addEventListener('click', function(e) {
		var btn = e.target.closest('.studycafeUse');
		location.href = 'studycafe.do?studycafe_idx=' + btn.value;
	});
	</script>
	<script src="js/studycafe/studycafeList/swiper.js" type="text/javascript"></script>
<script src="js/studycafe/studycafeList/regionSelect.js" type="text/javascript"></script>
</html>
