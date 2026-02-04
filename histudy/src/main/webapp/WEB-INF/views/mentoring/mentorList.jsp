<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멘토 목록 | Hi, Study</title>
<<<<<<< HEAD
=======
<link rel="stylesheet" href="css/header.css" type="text/css">
<link rel="stylesheet" href="css/root.css" type="text/css">
<link rel="stylesheet" href="css/footer.css" type="text/css">
>>>>>>> 2d18fb5529cf63e64c396b1873a0593c9e746586

<style>
/* ===== Mentor List ===== */
.mentor-list-container { margin: auto; }

<<<<<<< HEAD
.mentor-filter { display:flex; 
gap:12px; 
margin-bottom:40px; 
flex-wrap:wrap; 
}
.mentor-filter a{
  border:1px solid #e5e7eb;  
  background:#fff; 
  border-radius:20px;
  padding:8px 18px; 
  font-size:.85rem; 
  cursor:pointer; 
  transition:.2s;
  display:inline-block; 
  color:#111827;
=======
.mentor-filter { display:flex; gap:12px; margin-bottom:40px; flex-wrap:wrap; }
.mentor-filter a{
  border:1px solid #e5e7eb; background:#fff; border-radius:20px;
  padding:8px 18px; font-size:.85rem; cursor:pointer; transition:.2s;
  display:inline-block; color:#111827;
>>>>>>> 2d18fb5529cf63e64c396b1873a0593c9e746586
}
.mentor-filter a:hover,.mentor-filter a.active{
  background:#1E293B; color:#fff; border-color:#1E293B;
}

<<<<<<< HEAD
.mentor-grid { display:grid; grid-template-columns: repeat(4, 1fr); gap:28px; 
}
=======
.mentor-grid { display:grid; grid-template-columns: repeat(4, 1fr); gap:28px; }
>>>>>>> 2d18fb5529cf63e64c396b1873a0593c9e746586

.mentor-card{
  background:#fff; border-radius:18px; padding:20px;
  box-shadow:0 8px 24px rgba(0,0,0,0.06);
  transition: transform .2s ease, box-shadow .2s ease;
  cursor:pointer;
}
.mentor-card:hover{ transform:translateY(-6px); box-shadow:0 16px 32px rgba(0,0,0,0.1); }

.mentor-profile-img{
  width:100%; height:180px; border-radius:14px;
  background:#f3f4f6; margin-bottom:14px;
}
<<<<<<< HEAD
.mentor-name{ font-size:1.1rem; 
font-weight:700; 
color:#111827; 
margin-bottom:4px; 
}
.mentor-job{ font-size:.85rem;
 color:#6b7280; 
 margin-bottom:8px; 
 }
.mentor-desc{ font-size:.85rem; 
color:#374151; 
line-height:1.5; 
margin-bottom:14px; 
min-height:40px; 
}

.mentor-footer{ display:flex; 
justify-content:space-between; 
align-items:center; 
}
.mentor-badge{ font-size:.75rem; 
padding:4px 10px; 
border-radius:999px; 
background:#eef2ff; 
color:#1E293B; 
}
.mentor-btn{ border:none; 
border-radius:16px; 
=======
.mentor-name{ font-size:1.1rem; font-weight:700; color:#111827; margin-bottom:4px; 
}
.mentor-job{ font-size:.85rem; color:#6b7280; margin-bottom:8px; 
}
.mentor-desc{ font-size:.85rem; color:#374151; line-height:1.5; margin-bottom:14px; min-height:40px; 
}

.mentor-footer{ display:flex; justify-content:space-between; align-items:center; 
}
.mentor-badge{ font-size:.75rem; padding:4px 10px; border-radius:999px; background:#eef2ff; color:#1E293B; 
}
.mentor-btn{ border:none; border-radius:16px; 
>>>>>>> 2d18fb5529cf63e64c396b1873a0593c9e746586
padding:6px 14px; 
font-size:.8rem; 
background:#1E293B; 
color:#fff; 
cursor:pointer; 
}
</style>
</head>

<body>

<<<<<<< HEAD
<%@ include file="/header.jsp"%>

=======
<%@ include file="../header.jsp"%>

<form name="mentoringForm">
>>>>>>> 2d18fb5529cf63e64c396b1873a0593c9e746586
<main class="section">
  <div class="mentor-list-container max-container">

    <div class="service__text">
      <p>멘토링</p>
      <h2>전문 멘토를</h2>
      <h2><i>지금 만나보세요</i></h2>
    </div>

<<<<<<< HEAD
    <!-- sc_idx 값은 너희가 정한 카테고리 번호로 맞춰서 쓰면 됨 -->
    <div class="mentor-filter">
      <a class="${activeCategory == 0 ? 'active' : ''}" href="mentorList.do">전체</a>
      <a class="${activeCategory == 1 ? 'active' : ''}" href="mentorListCategory.do?sc_idx=1">개발</a>
      <a class="${activeCategory == 2 ? 'active' : ''}" href="mentorListCategory.do?sc_idx=2">디자인</a>
      <a class="${activeCategory == 3 ? 'active' : ''}" href="mentorListCategory.do?sc_idx=3">기획</a>
      <a class="${activeCategory == 4 ? 'active' : ''}" href="mentorListCategory.do?sc_idx=4">취업</a>
      <a class="${activeCategory == 5 ? 'active' : ''}" href="mentorListCategory.do?sc_idx=5">자격증</a>
=======
    <div class="mentor-filter">
      <a class="${activeCategory == 0 ? 'active' : ''}" href="mentorList.do">전체</a>
      <a class="${activeCategory == 1 ? 'active' : ''}" href="mentorListCategory.do?sc_idx=1">개발</a>
      <a class="${activeCategory == 2 ? 'active' : ''}" href="mentorListCategory.do?sc_idx=2">언어</a>
      <a class="${activeCategory == 3 ? 'active' : ''}" href="mentorListCategory.do?sc_idx=3">코딩</a>
      <a class="${activeCategory == 4 ? 'active' : ''}" href="mentorListCategory.do?sc_idx=4">취업</a>
      <a class="${activeCategory == 5 ? 'active' : ''}" href="mentorListCategory.do?sc_idx=5">자격증</a>
      <a class="${activeCategory == 6 ? 'active' : ''}" href="mentorListCategory.do?sc_idx=6">학업</a>
>>>>>>> 2d18fb5529cf63e64c396b1873a0593c9e746586
    </div>

    <div class="mentor-grid">
      <c:choose>
<<<<<<< HEAD
        <c:when test="${empty list}">
=======
        <c:when test="${empty mentorList}">
>>>>>>> 2d18fb5529cf63e64c396b1873a0593c9e746586
          <p style="grid-column:1/-1; color:#6b7280;">등록된 멘토가 없습니다.</p>
        </c:when>

        <c:otherwise>
          <c:forEach var="m" items="${mentorList}">
<<<<<<< HEAD
            <div class="mentor-card" onclick="openMentorProfile(${m.mentorIdx})">
              <div class="mentor-profile-img"></div>

              <p class="mentor-name"><c:out value="${m.userName}"/></p>

              <!-- 카테고리 이름: DB에 없으니 scIdx를 화면에서 매핑 -->
              <p class="mentor-job">
                <c:choose>
                  <c:when test="${m.scIdx == 1}">개발</c:when>
                  <c:when test="${m.scIdx == 2}">디자인</c:when>
                  <c:when test="${m.scIdx == 3}">기획</c:when>
                  <c:when test="${m.scIdx == 4}">취업</c:when>
                  <c:when test="${m.scIdx == 5}">자격증</c:when>
=======
            <div class="mentor-card" onclick="openMentorProfile(${m.mentor_idx})">
              <div class="mentor-profile-img"></div>

              <p class="mentor-name"><c:out value="${m.user_name}"/></p>

              <p class="mentor-job">
                <c:choose>
                  <c:when test="${m.sc_idx == 1}">개발</c:when>
                  <c:when test="${m.sc_idx == 2}">언어</c:when>
                  <c:when test="${m.sc_idx == 3}">코딩</c:when>
                  <c:when test="${m.sc_idx == 4}">취업</c:when>
                  <c:when test="${m.sc_idx == 5}">자격증</c:when>
                  <c:when test="${m.sc_idx == 6}">학업</c:when>
>>>>>>> 2d18fb5529cf63e64c396b1873a0593c9e746586
                  <c:otherwise>기타</c:otherwise>
                </c:choose>
              </p>

<<<<<<< HEAD
              <p class="mentor-desc"><c:out value="${m.mentorIntro}"/></p>

              <div class="mentor-footer">
                <span class="mentor-badge">멘토</span>
                <button type="button" class="mentor-btn" onclick="event.stopPropagation(); openMentorProfile(${m.mentor_idx});">
=======
              <p class="mentor-desc"><c:out value="${m.mentor_intro}"/></p>

              <div class="mentor-footer">
                <span class="mentor-badge">멘토</span>
                <button type="button" class="mentor-btn"
                        onclick="event.stopPropagation(); openMentorProfile(${m.mentor_idx});">
>>>>>>> 2d18fb5529cf63e64c396b1873a0593c9e746586
                  상세보기
                </button>
              </div>
            </div>
          </c:forEach>
        </c:otherwise>
      </c:choose>
    </div>

  </div>
<<<<<<< HEAD
</main>

<%@ include file="/footer.jsp" %>

<script> 
function openMentorProfile(mentorIdx) {
  // 상세 페이지/모달 구현 시 이 파라미터명만 맞춰주면 됨
  location.href = "mentorProfile.do?mentor_idx=" + mentorIdx;
=======
<%@ include file="mentorProfileModal.jsp" %>

</main>
</form>
<%@ include file="../footer.jsp" %>

<script>
function openMentorProfile(mentor_idx) {
  location.href = "mentorProfile.do?mentor_idx=" + mentor_idx;
>>>>>>> 2d18fb5529cf63e64c396b1873a0593c9e746586
}
</script>

</body>
</html>
