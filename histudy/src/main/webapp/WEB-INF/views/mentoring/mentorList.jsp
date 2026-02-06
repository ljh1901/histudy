<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멘토 목록 | Hi, Study</title>
<link rel="stylesheet" href="css/root.css" type="text/css">
<link rel="stylesheet" href="css/header.css" type="text/css">
<link rel="stylesheet" href="css/mainLayout.css" type="text/css">
<link rel="stylesheet" href="css/footer.css" type="text/css">
<link rel="stylesheet" href="css/mentoringDesign/mentoringList.css" type="text/css">
</head>

<body id="mentoringPage">
<%@ include file="../header.jsp"%>

<!-- ===== 상단 ===== -->
<section class="mentoring-hero">
  <div class="hero-inner">
    <div class="hero-sub">1:1 맞춤 멘토링</div>
    <div class="hero-title">나에게 딱 맞는 멘토를<br/>찾아보세요</div>
    <div class="hero-desc">다양한 분야의 전문가들이 여러분의 성장을 도와드립니다</div>
     </div>
</section>

<section class="mentoring-search">
    <div class="hero-search">
      <span style="color:#94a3b8;">🔎</span>
      <input type="text" placeholder="멘토 이름, 분야, 키워드로 검색" />
    </div>

   

    <!-- ===== 카테고리 필터 ===== -->
    <div class="mentor-filter">
      <a class="${activeCategory == 0 ? 'active' : ''}" href="mentorList.do">전체</a>
      <a class="${activeCategory == 1 ? 'active' : ''}" href="mentorListCategory.do?sc_idx=1">개발</a>
      <a class="${activeCategory == 2 ? 'active' : ''}" href="mentorListCategory.do?sc_idx=2">언어</a>
      <a class="${activeCategory == 3 ? 'active' : ''}" href="mentorListCategory.do?sc_idx=3">취업</a>
      <a class="${activeCategory == 4 ? 'active' : ''}" href="mentorListCategory.do?sc_idx=4">자격증</a>
      <a class="${activeCategory == 5 ? 'active' : ''}" href="mentorListCategory.do?sc_idx=5">학업</a>
    </div>
 
</section>

<!-- ===== 리스트 ===== -->
<section class="mentoring-list">
<div class="mentor-list-wrap">
  <div class="mentor-grid">
    <c:choose>
      <c:when test="${empty mentorList}">
        <p style="grid-column:1/-1; color:#6b7280;">등록된 멘토가 없습니다.</p>
      </c:when>

      <c:otherwise>
        <c:forEach var="m" items="${mentorList}">
          <div class="mentor-card" onclick="openMentorProfile(${m.mentor_idx})">
            <div class="card-top">
              <div class="avatar"></div>
              <div>
                <div class="m-name"><c:out value="${m.user_name}"/></div>
                <div class="m-meta">
                  <c:choose>
                    <c:when test="${m.sc_idx == 1}">개발</c:when>
                    <c:when test="${m.sc_idx == 2}">언어</c:when>
                    <c:when test="${m.sc_idx == 3}">취업</c:when>
                    <c:when test="${m.sc_idx == 4}">자격증</c:when>
                    <c:when test="${m.sc_idx == 5}">학업</c:when>
                    <c:otherwise>기타</c:otherwise>
                  </c:choose>
                </div>
              </div>
            </div>

            <div class="chips">
              <span class="chip">멘토</span>
              <span class="chip">
                <c:choose>
                  <c:when test="${m.sc_idx == 1}">IT/개발</c:when>
                  <c:when test="${m.sc_idx == 2}">언어</c:when>
                  <c:when test="${m.sc_idx == 3}">취업</c:when>
                  <c:when test="${m.sc_idx == 4}">자격증</c:when>
                  <c:when test="${m.sc_idx == 5}">학업</c:when>
                  <c:otherwise>기타</c:otherwise>
                </c:choose>
              </span>
            </div>

            <div class="desc"><c:out value="${m.mentor_intro}"/></div>

            <div class="card-bottom">
              <span class="small">프로필 보기</span>
              <button type="button" class="btn-detail"
                      onclick="event.stopPropagation(); openMentorProfile(${m.mentor_idx});">상세</button>
            </div>
          </div>
        </c:forEach>
      </c:otherwise>
    </c:choose>
  </div>
</div>
</section>
<!-- ===== 하단 멘토 모집 ===== -->
<section class="cta">
  <div class="cta-inner">
    <div class="cta-badge">멘토 모집</div>
    <div class="cta-title">당신의 경험을 나눠주세요</div>
    <div class="cta-desc">전문 지식과 경험을 바탕으로 후배들의 성장을 도와주세요.</div>

    <c:choose>
  <c:when test="${isMentor}">
    <button type="button" class="cta-btn" onclick="location.href='mentoringCreate.do'">멘토링 개설하기</button>
  </c:when>

  <c:otherwise>
  <button type="button" class="cta-btn" onclick="openMentorGuideModal()">멘토 신청하기</button>
  </c:otherwise>
</c:choose>

  </div>
</section>

<%@ include file="mentorProfileModal.jsp" %>

<%@ include file="../footer.jsp" %>

<script>
function openMentorProfile(mentor_idx) {
  location.href = "mentorProfile.do?mentor_idx=" + mentor_idx;
}

/* ===== 모달 토글(팀원이 하던 방식) ===== */
function openMentorGuideModal(){
  document.getElementById("mentorGuideModal").style.display = "block";
}
function closeMentorGuideModal(){
  document.getElementById("mentorGuideModal").style.display = "none";
}
function openMentorFormModal(){
  closeMentorGuideModal();
  document.getElementById("mentorFormModal").style.display = "block";
}
function closeMentorFormModal(){
  document.getElementById("mentorFormModal").style.display = "none";
}
function closeByBackdrop(e, modalId){
  if(e.target && e.target.id === modalId){
    document.getElementById(modalId).style.display = "none";
  }
}


  var btns = document.querySelectorAll(".cat-btn");
  for(var i=0;i<btns.length;i++){
    btns[i].className = "cat-btn";
  }
  var target = document.getElementById("cat_"+sc_idx);
  if(target) target.className = "cat-btn active";

  
</script>

<c:if test="${not empty msg}">
  <script>
    alert("${msg}");
  </script>
</c:if>


</body>
</html>
