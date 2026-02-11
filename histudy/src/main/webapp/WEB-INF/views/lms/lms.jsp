<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/histudy/css/header.css">
<link rel="stylesheet" type="text/css" href="/histudy/css/footer.css">
<link rel="stylesheet" type="text/css" href="/histudy/css/root.css">
<link rel="stylesheet" type="text/css" href="/histudy/css/lmsDesign/lms.css">
</head>
<body id="lmsBody">
<%@include file="../header.jsp" %>
<main>
	<form name="lmsForm">
	<section class="lmsSection">
		<div class="lmsTopContainer">
			<h1 class="lmsTopContainer__title">학습 관리</h1>
			<p class="lmsTopContainer__sub">스터디 과제를 관리하고 학습 진도를 확인하세요</p>
			<div class="lmsTopContainer__cards">
				<div class="lmsTopContainer__card">
					<div class="lmsTopContainer__card__imgBox">
						<img src="/histudy/lms-img/lms-studying.png">
					</div>
					<div class="lmsTopContainer__card__text">
						<p class="lmsTopContainer__card__text__num">${studyCount}</p>
						<p class="lmsTopContainer__card__text__sub">진행 중인 스터디</p>
					</div>
				</div>
				<div class="lmsTopContainer__card">
					<div class="lmsTopContainer__card__imgBox">
						<img src="/histudy/lms-img/lms-waitTask.png">
					</div>
					<div class="lmsTopContainer__card__text">
						<p class="lmsTopContainer__card__text__num">${waitTaskCount}</p>
						<p class="lmsTopContainer__card__text__sub">대기 중인 과제</p>
					</div>
				</div>
				<div class="lmsTopContainer__card">
					<div class="lmsTopContainer__card__imgBox">
						<img src="/histudy/lms-img/lms-studyOk.png">
					</div>
					<div class="lmsTopContainer__card__text">
						<p class="lmsTopContainer__card__text__num">${taskSubmitOkCount}</p>
						<p class="lmsTopContainer__card__text__sub">제출 완료</p>
					</div>
				</div>
				<div class="lmsTopContainer__card">
					<div class="lmsTopContainer__card__imgBox">
						<img src="/histudy/lms-img/lms-taskOk.png">
					</div>
					<div class="lmsTopContainer__card__text">
						<p class="lmsTopContainer__card__text__num">3</p>
						<p class="lmsTopContainer__card__text__sub">완료한 스터디</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="lmsTaskSection">
		<div class="lmsCenterContainer">
			<div class="lmsCenterContainer__leftBox">
				<div class="lmsCenterContainer__leftBox__stduyIng">
					<div class="lmsCenterContainer__leftBox__stduyIng__top">
						<h2>내 스터디</h2>
						<p>전체보기</p>
					</div>
					<c:if test="${!empty s_list}">
						<c:forEach var="s_list" items="${s_list}">
							<div class="lmsCenterContainer__leftBox__stduyIng__card">
								<div class="studyIng__card__title">
									<h3>${s_list.study_title }</h3>
									<div class="leader">
										<span>리더</span>
										<span>멤버</span>
									</div>
								</div>
								<div class="studyIng__card__members">
									<span>5/${s_list.study_total_weeks}주차</span>
									<span class="maxMembers">${s_list.study_current_members}명</span>
								</div>
								<div class="studyIng__card__graph">
									<meter value="70" min="0" max="100"></meter>
								</div>
								<div class="studyIng__card__graphText">
									<span>진도율 80%</span>
									<span class="taskCount">과제 ${s_list.taskCount}개</span>
								</div>
							</div>
						</c:forEach>
					</c:if>
					<c:if test="${!empty approved_List}">
						<c:forEach var="a_list" items="${approved_List }">
							<div class="lmsCenterContainer__leftBox__stduyIng__card">
								<div class="studyIng__card__title">
									<h3>${a_list.study_title}</h3>
								</div>
								<div class="studyIng__card__members">
									<span>5/${a_list.study_total_weeks}주차</span>
									<span class="maxMembers">${a_list.study_current_members}명</span>
								</div>
								<div class="studyIng__card__graph">
									<meter value="70" min="0" max="100"></meter>
								</div>
								<div class="studyIng__card__graphText">
									<span>진도율 80%</span>
									<span class="taskCount">과제 ${a_list.taskCount2}개</span>
								</div>
							</div>
						</c:forEach>
					</c:if>
				<div class="lmsCenterContainer__leftBox__studyOk">
					<h3>완료한 스터디</h3>
					<div class="lmsCenterContainer__leftBox__studyOk__card">
						<p>Python 데이터 분석</p>
						<div>★★★★☆ <span>2024.12.20</span></div>
					</div>
					<div class="lmsCenterContainer__leftBox__studyOk__card">
						<p>정보처리기사 실기 대비</p>
						<div>★★★★☆ <span>2025.01.30</span></div>
					</div>
				</div>
				</div>
			</div>
			<div class="lmsCenterContainer__rightBox">
				<div class="lmsCenterContainer__rightBox__title">
					<h2>과제 관리</h2>
					<c:if test="${!empty s_list}">
						<a href="taskInsertForm.do">과제 등록</a>
					</c:if>
				</div>
				<div class="lmsCenterContainer__rightBox__toggleBtns">
					<input type="button" value="진행중(${C_task_list.size()+A_task_list.size()})" class="togglebtn toggle">
					<input type="button" value="완료" class="togglebtn">
				</div>
				<c:if test="${!empty C_task_list}">
					<c:forEach var="c_task_list" items="${C_task_list}">
						<div class="lmsCenterContainer__rightBox__card">
							<div class="lmsCenterContainer__rightBox__card__top">
								<span class="tag-title">${c_task_list.study_title}</span>
								<span class="tag-weeks">${c_task_list.a_weeks}주차</span>
							</div>
							<div class="lmsCenterContainer__rightBox__card__middle">
								<h3>${c_task_list.a_title}</h3>
								<p>${c_task_list.a_content }</p>
								<div class="lmsCenterContainer__rightBox__middle__file">
									<div class="files__file">
										<img src="/histudy/lms-img/clip.png">
										<span>${empty c_task_list.a_fname?'첨부된 파일이 없습니다.':c_task_list.a_fname}</span>
									</div>
								</div>
							</div>
							<div class="lmsCenterContainer__rightBox__card__row">
								<div class="row__left">
									<img src="/histudy/lms-img/calendar.png">
									<p>${c_task_list.a_end_date}</p>
									<p class="endDateText">마감</p>
								</div>
								<div class="row__right__myTask">
									<input type="button" value="내가 등록한 과제">
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${!empty A_task_list}">
					<c:forEach var="A_task_list" items="${A_task_list}">
						<div class="lmsCenterContainer__rightBox__card">
							<div class="lmsCenterContainer__rightBox__card__top">
								<span class="tag-title">${A_task_list.study_title}</span>
								<span class="tag-weeks">${A_task_list.a_weeks}주차</span>
							</div>
							<div class="lmsCenterContainer__rightBox__card__middle">
								<h3>${A_task_list.a_title}</h3>
								<p>${A_task_list.a_content }</p>
								<div class="lmsCenterContainer__rightBox__middle__file">
									<div class="files__file">
										<img src="/histudy/lms-img/clip.png">
										<span>${empty A_task_list.a_fname?'첨부된 파일이 없습니다.':A_task_list.a_fname}</span>
									</div>
								</div>
							</div>
							<div class="lmsCenterContainer__rightBox__card__row">
								<div class="row__left">
									<img src="/histudy/lms-img/calendar.png">
									<p>${A_task_list.a_end_date}</p>
									<p class="endDateText">마감</p>
								</div>
								<div class="row__right">
									<c:if test="${empty OK_task_list}">
										<div class="row__right__abtn">
											<a href="taskSubmit.do?a_idx=${A_task_list.a_idx}&study_title=${A_task_list.study_title}">제출하기</a>
										</div>
									</c:if>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${(empty A_task_list && empty C_task_list)}">
					<div class="lmsCenterContainer__rightBox__card">
						<div class="emptyTask">
							<h3>등록된 과제가 없습니다!</h3>
						</div>
					</div>
				</c:if>
			</div>
		</div>
	</section>
	</form>
</main>
<%@include file="../footer.jsp" %>
</body>
<script>
	// 왼쪽 카드 클릭 시
	var cards = document.querySelectorAll('.lmsCenterContainer__leftBox__stduyIng__card');
	for(let i=0; i<cards.length; i++){
		cards[i].addEventListener('click', function(){
			
			for(let j=0; j<cards.length; j++){
				cards[j].classList.remove('active');
			}
			
			cards[i].classList.add('active');
		});	
	}
	// 오른쪽 토글 버튼 클릭 시
	var togglebtns = document.querySelectorAll('.togglebtn');
	for(let i=0; i<togglebtns.length; i++){
		togglebtns[i].addEventListener('click', function(){
			
			for(let j=0; j<togglebtns.length; j++){
				togglebtns[j].classList.remove('toggle');
			}
			
			togglebtns[i].classList.add('toggle');
		});	
	}
</script>
</html>