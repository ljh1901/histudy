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
<style>
	.taskInsertBody header{
		background-color: white;
		box-shadow: 0 2px 8px rgba(0,0,0,0.06);
	}
	.taskInsertTopSection{
		margin-top: 80px;
		background: linear-gradient(
	        180deg,
	        #f5f7ff 0%,
	        #f8f5ff 40%,
	        #fff7fb 100%
	    );
		padding: 3.5rem 5rem;
	}
	.TIContainer{
		max-width:1200px;
		margin: 0 auto;
	}
	.TIContainer__top{
		margin-bottom: 10px;
	}
	.TIContainer__top P{
	    color: #888;
	    padding-bottom: 10px;
		font-size: 0.8rem;
	}
	.TIContainer__title{
		font-size: 4rem;
		font-weight: 600;
	}
	.TIContainer__sub{
		font-size: 1.5rem;
		color: #888;
	}
	.taskInsertForm{
		padding: 1rem;
		background-color: #FAFAFA;
	}
	.TIFContainer{
		padding: 1rem;
		max-width:1200px;
		margin: 0 auto;

	}
	.TIF_BOX{
		background-color: white;
		border: none;
		border-radius: 15px;
		margin: 0 auto;
		padding: 4rem;
	}
	.TIF_card{
	  display: flex;
      justify-content: flex-start;
      flex-direction: column;
      text-align: left;
      margin-bottom: 20px;
	}
	.TIF_card label{
	  margin-bottom: 10px;
      margin-top: 10px;
      font-weight: bold;
      font-size: 1.3rem;
      margin-right: 10px;
	}
	.TIF_card input, select{
      border: 1px solid #888;
      border-radius: 10px;
      padding: 1rem;
      font-size: 1rem;
   }
   .TIF_card textarea{
      border-radius: 10px;
      padding:1rem;
      resize: none;
   }
   .TIF_card p{
   	  font-size: 0.8rem;
      color: #888;
   }
   .TIF_card_keynum{
   	display: flex;
   }
   .TIF_card span{
      color: red;
   }
   .TIF_card div{
   	width: 100%;
   }
   .TIF_card_date{
   	  display: flex;
   	  gap: 2rem;
   }
   .TIF_card_date input{
   	  flex: 1;
   	  width: 100%;
   }
   .TIF__selectbox{
   	 display: flex;
   }
   .TIF__selectbox select{
   	  flex: 1;
   	  width: 20%;
   	  margin: 0 10px;
   }
   .TIF_card_file{
   	 border: 1px double #ccc;
   	 border-radius: 10px;
   	 padding:5rem;
   	 background-color: #F9FAFB;
   	 text-align: center;
   }
   .TIF_card_file_imgbox img{
   	 width: 80px;
   	 height: 80px;
   }
   .TIF_card_imgBox{
   	 max-width:70px;
   }
   .TIF_card_imgBox img{
   	 width: 70px;
   	 height: 70px;
   }
   .task_guide{
   	 background-color: #EFF6FF;
   	 display: flex;
   	 padding: 1rem;
   	 border-radius: 10px;
   }
   .TIF_card_text{
   	 margin-left: 20px;
   	 line-height: 2rem;
   }
   .TIF_card_text li{
   	 color: #888;
   	 font-size: 0.9rem;
   }
   .TIF_btns{
   	  display: flex;
   }
   .TIF_btns input[type="reset"]{
   	  width: 100%;
   	  background-color: white;
   	  border: 1px solid black;
      border-radius: 10px;
      font-size: 1.3rem;
      padding: 1rem;
   }
   .TIF_btns input[type="reset"]:hover{
   	 background-color: var(--color-navy);
   	 color: white;
   	 cursor: pointer;
   }
   .TIF_btns input[type="submit"]{
      width:100%;
      background-color: #111827;
      color: white;
      border: 1px solid #ccc;
      border-radius: 10px;
      font-size: 1.3rem;
      padding: 1rem;
   }
   .TIF_btns input[type="submit"]:hover{
      cursor: pointer;
      background-color: var(--color-navy);
      cursor: pointer;
   }
</style>
</head>
<body class="taskInsertBody">
<%@include file="../header.jsp" %>
<main>
	<section class="taskInsertTopSection">
		<div class="TIContainer">
			<div class="TIContainer__top">
				<p>LMS &nbsp; > &nbsp; 과제 등록</p>
			</div>
			<h1 class="TIContainer__title">과제 등록</h1>
			<p class="TIContainer__sub">스터디 멤버들에게 새로운 과제를 등록하세요</p>
		</div>
	</section>
	<section class="taskInsertForm">
		<div class="TIFContainer">
			<form name="taskInsertForm" action="taskInsert.do" method="POST" enctype="multipart/form-data">
				<div class="TIF_BOX">
					<div class="TIF_card">
						<label>스터디 선택 <span>*</span></label>
						<select name="study_idx" required>
							<c:forEach var="s" items="${studyList}">
								<option value="${s.study_idx}">${s.study_title}</option>
							</c:forEach>
						</select>
						<p>리더로 참여 중인 스터디만 표시됩니다.</p>
					</div>
					<div class="TIF_card">
						<label>과제 제목 <span>*</span><span id="maxTitle"></span></label>
						<input type="text" name="a_title" oninput="titleCheck(this)" placeholder="과제 제목을 입력해주세요." required>
					</div>
					<div class="TIF_card">
						<label>주차 <span>*</span></label>
						<select name="a_weeks" required>
							<option value="1">1주차</option>
							<option value="2">2주차</option>
							<option value="3">3주차</option>
							<option value="4">4주차</option>
							<option value="5">5주차</option>
							<option value="6">6주차</option>
							<option value="7">7주차</option>
							<option value="8">8주차</option>
							<option value="9">9주차</option>
							<option value="10">10주차</option>
						</select>
					</div>
					<div class="TIF_card">
						<label>과제 설명 <span>*</span></label>
						<textarea 
							name="a_content"
							rows="10" cols="40"
							oninput="studyContentCheck(this)"
                     		maxlength="300"required></textarea>
                     	<div class="TIF_card_keynum">
							<p id="keynum">0</p>
                     		<p>/300자</p>
                     	</div>
					</div>
					<div class="TIF_card">
						<div class="TIF_card_date">
							<div>
								<label>마감 날짜 <span>*</span></label>
								<input type="date" name="a_end_date" onchange="dateCheck()" required>
							</div>
							<div>
								<label>마감 시간 <span>*</span></label>
								<div class="TIF__selectbox">
									<select name="a_end_time" required>
										<c:forEach var="i" begin="0" end="23" step="1">
											<c:choose>
												<c:when test="${i<=9}">
													<option value="${i}">0${i} 시</option>
												</c:when>
												<c:when test="${i>9}">
													<option value="${i}">${i} 시</option>
												</c:when>
											</c:choose>
										</c:forEach>
									</select>
									<select name="a_end_time_m" required>
										<c:forEach var="i" begin="1" end="59" step="1">
											<c:choose>
												<c:when test="${i<=9}">
													<option value="${i}">0${i} 분</option>
												</c:when>
												<c:when test="${i>9}">
													<option value="${i}">${i} 분</option>
												</c:when>
											</c:choose>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="TIF_card">
						<label>첨부 파일</label>
						<div class="TIF_card_file">
							<div class="TIF_card_file_imgbox">
								<img src="/histudy/lms-img/fileimg.png">
							</div>
							<p>파일을 드래그하거나 클릭하여 업로드</p>
							<p>PDF, ZIP, 이미지 파일 등 (최대 50MB)</p>
							<input type="file" name="prve_a_fname">
						</div>
					</div>
					<div class="TIF_card">
						<div class="task_guide">
							<div class="TIF_card_imgBox">
								<img src="/histudy/lms-img/guide.png">
							</div>
							<div class="TIF_card_text">
								<h3>과제 등록 안내</h3>
								<ul>
									<li>- 과제 등록 후 스터디 멤버들에게 알림이 전송됩니다</li>
									<li>- 등록된 과제는 수정 및 삭제가 가능합니다.</li>
									<li>- 멤버들의 제출 현황은 LMS 페이지의 멤버 관리를 클릭하여 확인할 수 있습니다.</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="TIF_btns">
						<input type="reset" value="취소">
						<input type="submit" value="과제 등록하기">
					</div>
				</div>
			</form>
		</div>
	</section>
</main>
<%@include file="../footer.jsp" %>
</body>
<script>
// 제목 글자수 제한 유효성 검사
function titleCheck(el){
	const MAX = 25;
	const titleCount = el.value.length;
	const data = document.getElementById('maxTitle');
	
	if(titleCount>=MAX){
		data.innerHTML = '제목은 25자 이내로 작성해주세요!';
	}else{
		data.innerHTML = '';
	}
	
}
// 스터디 내용 글자수 제한 유효성 검사 
function studyContentCheck(el){
   const MAX = 300;
   const count = el.value.length;
   const keynum = document.getElementById('keynum');
   
   keynum.textContent = count;
   
    if (count >= MAX) {
        keynum.style.color = 'red';
    } else {
        keynum.style.color = 'black';
    } 
}
// 이전 날짜 제한 유효성 검사
function dateCheck(){
   var selectDate = document.taskInsertForm.a_end_date.value;
   
   var selectDateAll = selectDate.split('-');
   
   var now = new Date();
   var nowYear = now.getFullYear();
   var nowMonth = now.getMonth()+1;
   var nowDate = now.getDate();
   
   if(selectDateAll[0]<nowYear){
      alert('현재 년도 이후로 선택하셔야 합니다.');
      document.taskInsertForm.a_end_date.value='';
   }else if(selectDateAll[1]<nowMonth){
      alert('현재 월 이후로 선택하셔야 합니다.');
      document.taskInsertForm.a_end_date.value='';
   }else if(selectDateAll[2]<nowDate){
      alert('현재 일 이후로 선택하셔야 합니다.');
      document.taskInsertForm.a_end_date.value='';
   }
}
</script>
</html>