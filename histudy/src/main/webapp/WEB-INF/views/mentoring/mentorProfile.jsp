<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멘토 프로필 | Hi, Study</title>

<link rel="stylesheet" href="css/root.css">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/mentoringDesign/mentoringProfile.css">

<!-- ⭐ 별점 CSS -->
<style>
.ratingWrap { display:flex; align-items:center; gap:12px; margin:10px 0 14px; }
.starRow { display:flex; gap:6px; }

.starBtn{
  position: relative;
  width: 26px;
  height: 26px;
  border:0;
  background:transparent;
  cursor:pointer;
}

.starBtn::before{
  content:"★";
  position:absolute;
  inset:0;
  font-size:26px;
  color:#e5e7eb;
}

/* 전체 채움 */
.starBtn.full::after{
  content:"★";
  position:absolute;
  inset:0;
  font-size:26px;
  color:#fbbf24;
}

/* 반 별 */
.starBtn.half::after{
  content:"★";
  position:absolute;
  inset:0;
  font-size:26px;
  color:#fbbf24;
  clip-path: inset(0 50% 0 0);
}

.ratingValue{
  font-weight:800;
  font-size:15px;
  color:#0f172a;
}

/* 리뷰 표시용 별 */
.reviewStars{
  color:#fbbf24;
  font-size:18px;
  letter-spacing:2px;
}
</style>

<!-- ⭐ 별점 JS -->
<script>
function renderStars(val){
  const stars=document.querySelectorAll(".starBtn");
  stars.forEach((btn,i)=>{
    const n=i+1;
    btn.classList.remove("full","half");

    if(val>=n) btn.classList.add("full");
    else if(val>=n-0.5) btn.classList.add("half");
  });

  document.getElementById("ratingLabel").textContent=Number(val).toFixed(1);
  document.getElementById("ratingInput").value=Number(val).toFixed(1);
}

function onStarClick(e,n){
  const rect=e.currentTarget.getBoundingClientRect();
  const x=e.clientX-rect.left;
  const val=(x<rect.width/2)?(n-0.5):n;
  renderStars(val);
}

window.addEventListener("DOMContentLoaded",()=>renderStars(5));
</script>

</head>
<body id="mentor_profile">

<%@ include file="../header.jsp"%>

<section class="mentor-profile-ground">

<div style="max-width:1100px;margin:40px auto;padding:0 16px;">

  <!-- 상단 -->
  <div style="display:grid;grid-template-columns:1.2fr .8fr;gap:16px;">

    <div style="background:#fff;border-radius:16px;padding:18px;box-shadow:0 6px 18px rgba(0,0,0,.06)">
      <h2><c:out value="${detail.mentoring_title}" /></h2>

      <div>분야: <b>${detail.job_group}</b></div>
      <div>직무: <b>${detail.job_role}</b></div>
      <div>경력: <b>${detail.career_years}</b></div>

      <hr style="margin:14px 0">
      <div>설명</div>
      <div style="line-height:1.6;margin-top:6px;">
        <c:out value="${detail.description}" default="(설명 없음)"/>
      </div>
    </div>

    <div style="background:#fff;border-radius:16px;padding:18px;box-shadow:0 6px 18px rgba(0,0,0,.06)">
      <h3>멘토 정보</h3>
      <div>이름: <b>${detail.mentor_name}</b></div>

      <div style="margin-top:16px;">
        <button type="button"
          style="width:100%;border:none;border-radius:12px;padding:12px;font-weight:800;background:#b7f34e;cursor:pointer;"
          onclick="location.href='mentoringApply.do?mentor_idx=${param.mentor_idx}'">
          멘토링 신청하기
        </button>
      </div>
    </div>

  </div>


  <!-- 리뷰 영역 -->
  <div style="margin-top:16px;background:#fff;border-radius:16px;padding:18px;box-shadow:0 6px 18px rgba(0,0,0,.06)">
    <h3>멘토링 리뷰</h3>

    <!-- 리뷰 목록 -->
    <c:choose>
      <c:when test="${empty reviews}">
        <div style="color:#64748b;">등록된 리뷰가 없습니다.</div>
      </c:when>

      <c:otherwise>
        <c:forEach var="r" items="${reviews}">
          <div style="padding:12px 0;border-bottom:1px solid #eef2f7;">

            <div style="font-size:13px;color:#64748b;">
              <fmt:formatDate value="${r.review_date}" pattern="yyyy.MM.dd HH:mm"/>
            </div>

            <!-- ⭐ 리뷰 별 표시 -->
            <div class="reviewStars">
              <c:set var="full" value="${r.rating.intValue()}" />
              <c:set var="half" value="${(r.rating - full) >= 0.5}" />

              <c:forEach begin="1" end="${full}">★</c:forEach>
              <c:if test="${half}">☆</c:if>
            </div>

            <div style="margin-top:6px;line-height:1.6;">
              ${r.review_content}
            </div>

          </div>
        </c:forEach>
      </c:otherwise>
    </c:choose>


    <!-- 작성 가능 -->
    <c:if test="${not empty writableMatchId}">
      <form method="post" action="mentoringReviewWrite.do" style="margin-top:14px;">
        <input type="hidden" name="mentor_idx" value="${param.mentor_idx}"/>

        <!-- ⭐ 별점 선택 -->
        <div class="ratingWrap">
          <div class="starRow">
            <button type="button" class="starBtn" onclick="onStarClick(event,1)"></button>
            <button type="button" class="starBtn" onclick="onStarClick(event,2)"></button>
            <button type="button" class="starBtn" onclick="onStarClick(event,3)"></button>
            <button type="button" class="starBtn" onclick="onStarClick(event,4)"></button>
            <button type="button" class="starBtn" onclick="onStarClick(event,5)"></button>
          </div>

          <div class="ratingValue">
            <span id="ratingLabel">5.0</span>
          </div>

          <input id="ratingInput" type="hidden" name="rating" value="5.0"/>
        </div>

        <textarea name="review_content" rows="4"
          style="width:100%;border:1px solid #e2e8f0;border-radius:12px;padding:12px;"
          placeholder="리뷰를 작성해주세요"></textarea>

        <div style="display:flex;justify-content:flex-end;margin-top:10px;">
          <button type="submit"
            style="border:none;border-radius:12px;padding:10px 14px;font-weight:800;background:#0f2d3a;color:#fff;">
            리뷰 등록
          </button>
        </div>
      </form>
    </c:if>

    <c:if test="${empty writableMatchId}">
      <div style="margin-top:10px;color:#94a3b8;font-size:13px;">
        리뷰는 매칭 완료 후 1회 작성할 수 있습니다.
      </div>
    </c:if>

  </div>

</div>
</section>

<%@ include file="../footer.jsp"%>
</body>
</html>
