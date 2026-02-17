<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하이스터디</title>
<link rel="stylesheet" href="css/root.css" type="text/css">
<link rel="stylesheet" href="css/header.css" type="text/css">
<link rel="stylesheet" href="css/footer.css" type="text/css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@12/swiper-bundle.min.css" />
<script
	src="https://cdn.jsdelivr.net/npm/swiper@12/swiper-bundle.min.js"></script>
<style>
section > h1 {
	margin-left: 5%;
}
section > p{
margin-left: 5%;
	color: gray;
}
#studycafeBody header {
	background: white;
}

.studycafeList {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 24px;
    margin: 2% 5% 5% 5%;  
    padding-top: 0;
}


.studycafeIdx {
	background: #fff;
	border-radius: 12px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
	overflow: hidden;
	cursor: pointer;
	transition: transform 0.2s ease;
}

.studycafeIdx:hover {
	transform: translateY(-5px);
}

.studycafeIdx__img__area {
	width: 100%;
}

.studycafeIdx__img__area img {
	width: 100%;
	height: 220px;
	object-fit: cover;
	display: block;
}

.studycafeInfo {
	display: flex;
	justify-content: space-between;
}

.studycafeName {
	font-weight: 700;
	font-size: 18px;
	padding: 15px;
}

.studycafeCapacity {
	font-weight: 700;
	font-size: 18px;
	padding: 15px;
}

.studycafeUse {
	width: 90%;
	margin: 10px auto 20px auto;
	display: block;
	padding: 14px 0;
	font-size: 16px;
	font-weight: 600;
	border: none;
	border-radius: 8px;
	background-color: #6366f1;
	color: white;
	cursor: pointer;
	transition: background 0.2s ease;
}

.studycafeUse:hover {
	background-color: #4f46e5;
}

.swiper {
	width: 100%;
	height: 300px;
	margin-top: 80px;
	margin-bottom: 5%;
}

.swiper-slide {
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 24px;
	font-weight: 700;
	background: #6366f1;
	transition: 0.2s;
}
</style>
</head>
<body id="studycafeBody">
	<%@include file="../header.jsp"%>
	<form>
		<main>
			<!-- Slider main container -->
			<div class="swiper">
				<div class="swiper-wrapper">
					<!-- Slides -->
					<div class="swiper-slide">
						<fieldset>
							<p>Hi, Study 프리미엄 멤버십 29,000원 /<del>50,000원</del></p>
							<p>분야별 전문 강사의 강의 제공 !! 스터디 카페 이용권 할인 혜택 !!</p>
							<p>멤버십 가입 시 할인권 증정</p> 
							<button id="memberShip" type="button">지금 당장 멤버십 가입하러 가기</button>
						</fieldset>
					</div>
					<div class="swiper-slide">
						<p>쾌적한 환경의 스터디 카페를 이용해보세요!! 스터디 / 멘토링 스터디룸 좌석 구비 완료! 서울, 충북, 경기 스터디카페 이용</p>
					</div>
					<div class="swiper-slide">
					<div class="relative max-w-6xl mx-auto px-6 py-24">
					<div class="max-w-2xl">
					<h2 class="text-4xl font-bold text-white mb-4">함께 성장하는 스터디 플랫폼</h2>
					<p class="text-lg text-teal-100 mb-8">스터디 카페를 예약 및 멘토링을 신청해보세요.</p>
					<div class="flex gap-4">
					<a class="px-6 py-3 bg-white text-teal-700 rounded-lg text-sm font-medium hover:bg-teal-50 transition-colors cursor-pointer whitespace-nowrap" href="/preview/3f1da5de-be5d-470f-9f90-d26ec29c0e8b/6395583/study-registration" data-discover="true">스터디 개설하기</a>
					<button class="mentoring">멘토링 이동</button>
					</div>
					</div>
					</div>
					</div>
				</div>
				<!-- If we need pagination -->
				<div class="swiper-pagination"></div>

				<!-- If we need navigation buttons -->
				<div class="swiper-button-prev"></div>
				<div class="swiper-button-next"></div>

			</div>
			<section>
				<h1>스터디 카페</h1>
				<p>집중할 수 있는 공간을 예약해보세요.</p>
				<div class="studycafeList">
					<c:forEach var="studycafe" items="${requestScope.studycafeList}">
						<div class="studycafeIdx">
							<div class="studycafeIdx__img__area">
								<img src="img/histudyNum1.png" alt="histudy1호점">
								<div class="studycafeInfo">
									<div class=" studycafeName">${studycafe.studycafe_name}</div>
									<div class="studycafeCapacity">
										<a href="#">이용 후기</a>
									</div>
								</div>
								<div>몇명 2000원/시간</div>
								<button class="studycafeUse" type="button" value="${studycafe.studycafe_idx}">이용하기</button>
							</div>
						</div>
					</c:forEach>
				</div>
			</section>
		</main>
	</form>
	<%@include file="../footer.jsp"%>
</body>
<script>
document.getElementById('memberShip').addEventListener('click', function(){
	location.href='membership.do';
})
document.querySelector('.studycafeList').addEventListener('click',function(e){
	var studycafeUseBtn=e.target.closest('.studycafeUse');
	var studycafe_idx = studycafeUseBtn.value;
	location.href='studycafe.do?studycafe_idx='+studycafe_idx;
})
	const swiper = new Swiper('.swiper', {
		// Optional parameters
		direction : 'horizontal',
		loop : true,
		autoplay : {
			delay : 2000
		},
		// If we need pagination
		pagination : {
			el : '.swiper-pagination',
		},

		// Navigation arrows
		navigation : {
			nextEl : '.swiper-button-next',
			prevEl : '.swiper-button-prev',
		},

		// And if we need scrollbar
		scrollbar : {
			el : '.swiper-scrollbar',
		},
	});
</script>
</html>