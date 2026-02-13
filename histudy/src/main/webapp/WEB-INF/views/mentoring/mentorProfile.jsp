<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멘토 프로필 | Hi, Study</title>

<link rel="stylesheet" href="css/root.css" type="text/css">
<link rel="stylesheet" href="css/header.css" type="text/css">
<link rel="stylesheet" href="css/footer.css" type="text/css">
<link rel="stylesheet" href="css/mentoringDesign/mentoringProfile.css" type="text/css">

</head>

<body id="mentor_profile">
<%@ include file="../header.jsp"%>

<section class="mentor-profile-ground">
  <div style="max-width:1100px;margin:40px auto;padding:0 16px;">

    <div style="display:grid;grid-template-columns:1.2fr .8fr;gap:16px;">
      <div class="card">
        <h2 style="margin:0 0 10px 0;"><c:out value="${detail.mentoring_title}" /></h2>
        <div>분야: <b><c:out value="${detail.job_group}" /></b></div>
        <div>직무: <b><c:out value="${detail.job_role}" /></b></div>
        <div>경력: <b><c:out value="${detail.career_years}" /></b></div>
        <hr style="border:none;border-top:1px solid #eef2f7;margin:14px 0">
        <div class="ma-tags">
          <c:forEach var="t" items="${detail.tags}">
            <span class="ma-tag"><c:out value="${t}"/></span>
          </c:forEach>
        </div>
      </div>

      <div class="card">
        <h3 style="margin:0 0 12px 0;">멘토 정보</h3>
        <div class="mentor-card">
          <div class="mentor-avatar">
            <c:choose>
              <c:when test="${not empty detail.mentor_profile_img}">
                <img src="<c:out value='${detail.mentor_profile_img}'/>" alt="mentor">
              </c:when>
              <c:otherwise><span>멘토</span></c:otherwise>
            </c:choose>
          </div>
          <div style="flex:1;">
            <div>이름: <b><c:out value="${detail.mentor_name}" /></b></div>
            <div class="mentor-meta">
              <div>분야: <b><c:out value="${detail.job_group}" /></b></div>
              <div style="margin-top:6px;">
                <span class="stars" style="--rating:${empty detail.avg_rating ? 0 : detail.avg_rating};"></span>
                <span class="rating-num"><c:out value="${empty detail.avg_rating ? 0 : detail.avg_rating}" /></span>
              </div>
            </div>
          </div>
        </div>
        <div style="margin-top:16px;">
          <c:choose>
    <%-- 멘토링 상태가 '종료'인 경우 --%>
    <c:when test="${detail.status eq '종료'}">
      <button type="button" disabled
              style="width:100%; border:none; border-radius:12px; padding:12px 14px; font-weight:900; 
                     background:#e2e8f0; color:#94a3b8; cursor:not-allowed;">
        모집이 완료된 멘토링입니다
      </button>
    </c:when>
    
    <%-- 그 외(정상) 상태인 경우 --%>
    <c:otherwise>
      <button type="button" 
              style="width:100%; border:none; border-radius:12px; padding:12px 14px; font-weight:900; 
                     cursor:pointer; background:#b7f34e;"
              onclick="location.href='mentoringApply.do?mentor_idx=${param.mentor_idx}'">
        멘토링 신청하기
      </button>
    </c:otherwise>
  </c:choose>
        </div>
      </div>
    </div>

    <div class="mp-tabs">
      <a class="mp-tab" href="#secIntro">멘토링 소개</a>
      <a class="mp-tab" href="#secReview">멘토링 리뷰 <small>(<c:out value="${fn:length(reviews)}"/>)</small></a>
    </div>
<div class="card" style="margin-top:16px;">
    <h3>📅 신청 가능한 시간</h3>
    <ul class="schedule-list">
        <c:forEach var="s" items="${detail.schedules}">
            <li class="schedule-item">
                <fmt:formatDate value="${s.mentoring_starttime}" pattern="yyyy-MM-dd HH:mm" /> 
                ~ 
                <fmt:formatDate value="${s.mentoring_endtime}" pattern="HH:mm" />
              
            </li>
        </c:forEach>
    </ul>
    <c:if test="${empty detail.schedules}">
        <p>현재 예약 가능한 일정이 없습니다.</p>
    </c:if>
</div>
    <div id="secIntro" class="card anchor-offset" style="margin-top:16px;">
      <h3 style="margin:0 0 10px 0;">멘토링 소개</h3>
      <div style="font-weight:900;">멘토링 설명</div>
      <div style="color:#0f172a;line-height:1.6;margin-top:6px;"><c:out value="${detail.description}"/></div>
      <div style="font-weight:900;margin-top:10px;">사전 공지</div>
      <div style="color:#0f172a;line-height:1.6;margin-top:6px;"><c:out value="${detail.pre_notice}" default="(사전 공지 없음)"/></div>
      <hr style="border:none;border-top:1px solid #eef2f7;margin:14px 0">
      
    </div>

    <div id="secReview" class="card anchor-offset" style="margin-top:16px;">
      <h3 style="margin:0 0 12px 0;">멘토링 리뷰</h3>
      <c:choose>
        <c:when test="${empty reviews}">
          <div style="color:#64748b;">등록된 리뷰가 없습니다.</div>
        </c:when>
        <c:otherwise>
          <div id="reviewList">
            <c:forEach var="r" items="${reviews}" varStatus="st">
              <div class="review-item" data-idx="${st.index}">
                <div style="font-size:13px;color:#64748b;"><fmt:formatDate value="${r.review_date}" pattern="yyyy.MM.dd HH:mm"/></div>
                <div style="margin-top:6px;">
                  <span class="stars" style="--rating:${r.rating};"></span>
                  <span class="rating-num"><c:out value="${r.rating}"/></span>
                </div>
                <div style="margin-top:8px;line-height:1.6;"><c:out value="${r.review_content}"/></div>
              </div>
            </c:forEach>
          </div>
          <div class="more-wrap"><button type="button" id="btnMore" class="btn-more">더 보기</button></div>
        </c:otherwise>
      </c:choose>

      <c:if test="${not empty writableMatchId}">
        <form method="post" action="mentoringReviewWrite.do" style="margin-top:24px; padding-top:24px; border-top:1px dashed #e2e8f0;">
          <input type="hidden" name="mentor_idx" value="${param.mentor_idx}"/>
          <input type="hidden" name="rating" id="ratingValue" value="5"/>

          <div class="rating-picker">
            <div class="rating-click" id="ratingClick">
              <span class="stars" id="ratingStars" style="--rating:5;"></span>
            </div>
            <div>
              <div style="font-size:15px; font-weight:800;">선택 평점: <span id="ratingText" style="color:#f59e0b;">5.0</span></div>
              <div class="rating-help">별을 클릭하면 0.5 단위로 선택됩니다.</div>
            </div>
          </div>

          <textarea name="review_content" rows="4" required
                    style="width:100%;border:1px solid #e2e8f0;border-radius:12px;padding:12px;margin-top:12px;"
                    placeholder="멘토링은 어떠셨나요? 솔직한 리뷰를 남겨주세요."></textarea>

          <div style="display:flex;justify-content:flex-end;margin-top:10px;">
            <button type="submit" style="border:none;border-radius:12px;padding:10px 20px;font-weight:900;cursor:pointer;background:#0f2d3a;color:#fff;">
              리뷰 등록
            </button>
          </div>
        </form>
      </c:if>
    </div>
  </div>
</section>

<%@ include file="../footer.jsp"%>

<script>
  // 1. 부드러운 스크롤 이동
  document.querySelectorAll('.mp-tab').forEach(a => {
    a.addEventListener('click', (e) => {
      const href = a.getAttribute('href');
      if (!href || href.charAt(0) !== '#') return;
      e.preventDefault();
      const el = document.querySelector(href);
      if (el) el.scrollIntoView({ behavior: 'smooth', block: 'start' });
    });
  });

  // 2. 리뷰 더보기 로직
  (function() {
    const items = Array.from(document.querySelectorAll('#reviewList .review-item'));
    const btn = document.getElementById('btnMore');
    if (!items.length || !btn) return;
    let shown = 5;
    function apply() {
      items.forEach((it, idx) => { it.style.display = (idx < shown) ? '' : 'none'; });
      if (shown >= items.length) btn.style.display = 'none';
    }
    apply();
    btn.addEventListener('click', () => { shown += 5; apply(); });
  })();

  // 3. 별점 클릭 보정 (정밀도 개선)
  (function() {
    const area = document.getElementById('ratingClick');
    const stars = document.getElementById('ratingStars');
    const val = document.getElementById('ratingValue');
    const text = document.getElementById('ratingText');
    if (!area || !stars || !val || !text) return;

    area.addEventListener('click', (e) => {
      const rect = area.getBoundingClientRect();
      const x = e.clientX - rect.left;
      const width = rect.width;
      
      // 0~5점 사이 위치 계산
      let rawRating = (x / width) * 5;
      
      // 0.5 단위 올림 처리 (사용자가 별 앞부분만 눌러도 해당 별점이 선택되게)
      let finalRating = Math.ceil(rawRating * 2) / 2;
      
      // 범위 제한 (최소 0.5, 최대 5.0)
      finalRating = Math.max(0.5, Math.min(5, finalRating));
      
      stars.style.setProperty('--rating', finalRating);
      val.value = finalRating;
      text.textContent = finalRating.toFixed(1);
    });
  })();
</script>
</body>
</html>