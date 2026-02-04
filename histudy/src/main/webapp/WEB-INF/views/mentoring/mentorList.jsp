<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멘토 목록 | Hi, Study</title>
<link rel="stylesheet" href="css/header.css" type="text/css">
<link rel="stylesheet" href="css/root.css" type="text/css">
<link rel="stylesheet" href="css/footer.css" type="text/css">

<style>
/* ===== Mentor List ===== */
.mentor-list-container { margin: auto; }

.mentor-filter { display:flex; gap:12px; margin-bottom:40px; flex-wrap:wrap; }
.mentor-filter a{
  border:1px solid #e5e7eb; background:#fff; border-radius:20px;
  padding:8px 18px; font-size:.85rem; cursor:pointer; transition:.2s;
  display:inline-block; color:#111827;
}
.mentor-filter a:hover,.mentor-filter a.active{
  background:#1E293B; color:#fff; border-color:#1E293B;
}

.mentor-grid { display:grid; grid-template-columns: repeat(4, 1fr); gap:28px; }

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
padding:6px 14px; 
font-size:.8rem; 
background:#1E293B; 
color:#fff; 
cursor:pointer; 
}
</style>
</head>

<body>

<%@ include file="../header.jsp"%>

<form name="mentoringForm">
<main class="section">
  <div class="mentor-list-container max-container">

    <div class="service__text">
      <p>멘토링</p>
      <h2>전문 멘토를</h2>
      <h2><i>지금 만나보세요</i></h2>
    </div>

    <div class="mentor-filter">
      <a class="${activeCategory == 0 ? 'active' : ''}" href="mentorList.do">전체</a>
      <a class="${activeCategory == 1 ? 'active' : ''}" href="mentorListCategory.do?sc_idx=1">개발</a>
      <a class="${activeCategory == 2 ? 'active' : ''}" href="mentorListCategory.do?sc_idx=2">언어</a>
      <a class="${activeCategory == 3 ? 'active' : ''}" href="mentorListCategory.do?sc_idx=3">코딩</a>
      <a class="${activeCategory == 4 ? 'active' : ''}" href="mentorListCategory.do?sc_idx=4">취업</a>
      <a class="${activeCategory == 5 ? 'active' : ''}" href="mentorListCategory.do?sc_idx=5">자격증</a>
      <a class="${activeCategory == 6 ? 'active' : ''}" href="mentorListCategory.do?sc_idx=6">학업</a>
    </div>

    <div class="mentor-grid">
      <c:choose>
        <c:when test="${empty mentorList}">
          <p style="grid-column:1/-1; color:#6b7280;">등록된 멘토가 없습니다.</p>
        </c:when>

        <c:otherwise>
          <c:forEach var="m" items="${mentorList}">
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
                  <c:otherwise>기타</c:otherwise>
                </c:choose>
              </p>

              <p class="mentor-desc"><c:out value="${m.mentor_intro}"/></p>

              <div class="mentor-footer">
                <span class="mentor-badge">멘토</span>
                <button type="button" class="mentor-btn"
                        onclick="event.stopPropagation(); openMentorProfile(${m.mentor_idx});">
                  상세보기
                </button>
              </div>
            </div>
          </c:forEach>
        </c:otherwise>
      </c:choose>
    </div>

  </div>
<%@ include file="mentorProfileModal.jsp" %>

</main>
</form>
<%@ include file="../footer.jsp" %>

<script>
function openMentorProfile(mentor_idx) {
  location.href = "mentorProfile.do?mentor_idx=" + mentor_idx;
}
</script>

</body>
</html>
