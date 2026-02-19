<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/histudy/css/header.css">
<link rel="stylesheet" type="text/css" href="/histudy/css/root.css">
<link rel="stylesheet" type="text/css" href="/histudy/css/footer.css">
<link rel="stylesheet" type="text/css" href="/histudy/css/studyDesign/studyList.css">
<script src="https://kit.fontawesome.com/3f5acacf0e.js" crossorigin="anonymous"></script>
</head>
<body id="studyPage">
<%@ include file="../header.jsp" %>
   <main>
      <section class="studyList">
      	 <form name="studySearchForm" action="studyList.do">
	         <div class="studyList__container">
	            <div class="studyList__container__top">
	               <p>홈 &nbsp; > &nbsp;스터디 목록</p>
	               <p class="slt__text"><i class="fa-solid fa-circle-exclamation"></i> 모집 마감일이 지난 스터디는 조회되지 않습니다.</p>
	            </div>
	            <h2 class="studyList__title">스터디 찾기</h2>   
	            <p class="studyList__sub">함께 성장할 스터디를 찾아보세요</p>
	            <div class="studyList__Find">
	               <img src="/histudy/main-img/search.png">
	               <input type="text" name="studyFind" placeholder="스터디 제목을 검색해서 원하는 스터디를 찾아보세요!" onkeyup="studySearch()">
	               <input type="submit" value="검색">
	            </div>
	            <div id="findList"></div>
	         </div>
         </form>
      </section>
      <section class="studyCategory">
         <div class="studyCategory__container max-container">
            <div class="studyCategory__left">
               <p>카테고리</p>
               <div class="studyCategory__left__list">
					<a href="studyList.do?cp=1&sc_idx=0" class="cate ${param.sc_idx=='0'?'active':''}">전체</a>
					<a href="studyList.do?cp=1&sc_idx=1" class="cate ${param.sc_idx=='1'?'active':''}">코딩</a>
					<a href="studyList.do?cp=1&sc_idx=2" class="cate ${param.sc_idx=='2'?'active':''}">언어</a>
					<a href="studyList.do?cp=1&sc_idx=3" class="cate ${param.sc_idx=='3'?'active':''}">학업</a>
					<a href="studyList.do?cp=1&sc_idx=4" class="cate ${param.sc_idx=='4'?'active':''}">자격증</a>
					<a href="studyList.do?cp=1&sc_idx=5" class="cate ${param.sc_idx=='5'?'active':''}">취업</a>
               </div>
               <div class="studyCategory__left__text">
	               <p class="slt__count">총 <span>${studyListCount}</span>개의 스터디</p>
               </div>
            </div>
         </div>
      </section>
      <section class="studyGrid">
         <c:if test="${!empty requestScope.studyList}">
            <c:forEach var="dto" items="${requestScope.studyList}">
            	<a href="studyContent.do?study_idx=${dto.study_idx}">
	                <article class="studyCard">
	                   <div class="studyCard__thumb">
	                     <img src="/histudy/study-img/${!empty dto.study_upload_img ? dto.study_upload_img : 'groupStudy.png'}" alt="스터디 이미지">
	                   </div>
	                   <div class="studyCard__content">
	                     <div class="studyCard__tags">
	                        <span class="tag">${dto.sc_name}</span>
	                     </div>
	                        <h3 class="studyCard__title">${dto.study_title}</h3>
	                     <div class="studyCard__rating">
	                       <div>
		                         <c:if test="${dto.dday == 0}">
									  <span class="badge urgent">오늘마감</span>
								 </c:if>
									
								 <c:if test="${dto.dday > 0 && dto.dday <= 3}">
									  <span class="badge soon">마감임박 D-${dto.dday}</span>
								 </c:if>
									
								 <c:if test="${dto.dday > 3}">
									  <span class="badge normal">모집중</span>
								 </c:if>
	                       </div>
	                    </div>
	                        <ul class="studyCard__meta">
	                          <li><img src="/histudy/main-img/user.png">${dto.user_name}</li>
	                             <li><img src="/histudy/main-img/personnel.png">${dto.study_current_members }/${dto.study_max_members}명</li>
	                          <li><img src="/histudy/main-img/clock.png">마감일 - ${dto.study_end_date.substring(0, 10)}</li>
	                          <li><img src="/histudy/main-img/location.png">${empty dto.study_addr?'장소가 지정되지 않았어요':dto.study_addr }</li>
	                       </ul>
	                   </div>
	                </article>
                </a>
            </c:forEach>
         </c:if>
         <c:if test="${empty requestScope.studyList}">
		    <div id="notStudy">
		        <img src="/histudy/main-img/cross-sign.png">
		        <h2>아직 개설된 스터디가 없어요</h2>
		        <p>첫 번째 스터디를 만들어보세요 🚀</p>
		    </div>
         </c:if>
      </section>
      <div class="paging">
         ${pageStr}
      </div>
         <section class="studyCreate">
            <form name="studyCreateForm" action="studyCreateForm.do">
               <div class="studyCreateContainer">
                  <h1>원하는 스터디를 찾지 못하셨나요?</h1>
                  <p>직접 스터디를 개설하고 함께할 멤버를 모집해보세요</p>
                  <input type="submit" value="스터디 개설하기">
               </div>
            </form>
         </section>
   </main>
   <%@include file="../footer.jsp" %>
</body>
<script>
	var xhr;
	function getXHR(){
		if(window.ActiveXObject){
			return new ActiveXObject('Msxml2.XMLHTTP');	
		}else if(window.XMLHttpRequest){
			return new XMLHttpRequest();
		}else{
			return null;
		}
	}
	
	function studySearch(){
		var keyword = document.studySearchForm.studyFind.value;
		
		xhr = getXHR();
		xhr.open('GET','studyFind.do?keyword=' + encodeURIComponent(keyword.trim()),true);
		xhr.onreadystatechange = studySearchResult;
		xhr.send(null);
	}
	
	function studySearchResult(){
		if(xhr.readyState == 4){
			if(xhr.status == 200){
				var data = xhr.responseText.trim();	// 서버에서 데이터 받아오기
				var keyStr = data.split(','); // CSV - 콤마를 기준으로 짤라서 배열로 저장하기
				var count = data==''?0:keyStr.length; // 서버에서 넘어온 데이터가 없다면 0 있다면 배열 길이 구하기
				var findList = document.getElementById('findList'); // 데이터를 화면에 보여줄 수 있는 div 태그 생성 후 id로 가져오기
				
				if(count == 0){
					findList.style.display = 'none';
				}else{
					var content = '';

					for(let i=0; i<keyStr.length; i++){
						content += '<div class="findTitle">'+keyStr[i]+'</div>';	
					}
					findList.innerHTML = content;
					findList.style.display = 'block';
					
					var titleDivs = document.getElementsByClassName('findTitle');
					for(let i=0; i<titleDivs.length; i++){
						titleDivs[i].addEventListener('click', function(){
							document.studySearchForm.studyFind.value = this.textContent; // this.textContent를 이용해서 값 넣기
							findList.style.display = 'none'; // 클릭 후 숨기기
						});
					}
				}
					
				// 바깥 클릭 시
				document.addEventListener('click', function(){
					findList.style.display = 'none';
				});
			}
		}	
	}
		
</script>
</html>
