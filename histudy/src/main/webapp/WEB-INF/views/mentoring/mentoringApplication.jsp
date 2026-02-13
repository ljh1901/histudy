<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>멘토링 신청현황 | Hi, Study</title>

  <link rel="stylesheet" href="css/root.css" type="text/css">
  <link rel="stylesheet" href="css/header.css" type="text/css">
  <link rel="stylesheet" href="css/footer.css" type="text/css">
  <link rel="stylesheet" href="css/mentoringDesign/mentoringApplication.css" type="text/css">
</head>

<body id="app-page">
<%@ include file="../header.jsp"%>

<section class="ma-page">
  <div class="ma-wrap">

    <h2 class="ma-title">멘토링 신청현황</h2>

    <!-- 상단 카드 영역 -->
    <div class="ma-top">
      <!-- 왼쪽: 멘토링 카드 -->
      <div class="ma-card ma-mentoring">
        <div class="ma-card-title">멘토링</div>

        <!-- mentoring_title -->
        <div class="ma-mentoring-quote">
          <c:out value="${mentorSummary.mentoring_title}" default="(멘토링 제목이 여기에 표시됩니다)"/>
        </div>

        <div class="ma-tags">
          <c:forEach var="t" items="${mentorSummary.tags}">
            <span class="ma-tag"><c:out value="${t}"/></span>
          </c:forEach>
        </div>
      </div>

      <!-- 오른쪽: 멘토 프로필 카드 -->
      <div class="ma-card ma-mentor">
        <div class="ma-mentor-row">
          <div class="ma-mentor-img">
            <c:choose>
              <c:when test="${not empty mentorSummary.mentor_profile_img}">
                <img src="<c:out value='${mentorSummary.mentor_profile_img}'/>" alt="멘토 프로필">
              </c:when>
              <c:otherwise>
                <div class="ma-mentor-img-fallback"></div>
              </c:otherwise>
            </c:choose>
          </div>

          <div class="ma-mentor-info">
            <div class="ma-mentor-name"><c:out value="${mentorSummary.mentor_name}" default="멘토명"/></div>
            <div class="ma-mentor-meta">
              <div>분야: <b><c:out value="${mentorSummary.job_group}" default="-"/></b></div>
              <div>직무: <b><c:out value="${mentorSummary.job_role}" default="-"/></b></div>
              <div>경력: <b><c:out value="${mentorSummary.career_years}" default="-"/></b></div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- 하단: 신청자 테이블 -->
    <div class="ma-card ma-table-card">
      <div class="ma-table-head">
        <div class="ma-card-title">멘토링 신청 인원 현황</div>

        <form class="ma-search" method="get" action="mentoringApplication.do">
          <input id="kw" name="kw" type="text" value="${param.kw}" placeholder="이름/이메일 검색">
          <button type="button" class="ma-btn ma-btn-dark">검색</button>
        </form>
      </div>

      <c:choose>
        <c:when test="${empty applications}">
          <div class="ma-empty">신청이 없습니다.</div>
        </c:when>
        <c:otherwise>
          <div class="ma-table-wrap">
            <table class="ma-table" id="appTable">
              <thead>
                <tr>
                  <th style="width:90px;">신청번호</th>
                  <th style="width:120px;">이름</th>
                  <th>이메일</th>
                  <th style="width:160px;">전화번호</th>
                  <th style="width:140px;">지원 날짜</th>
                  <th style="width:110px;">프로필</th>
                  <th style="width:170px;">상태</th>
                </tr>
              </thead>

              <tbody>
              <c:forEach var="a" items="${applications}">
                <tr>
                  <td><c:out value="${a.ma_id}"/></td>
                  <td class="ma-name"><c:out value="${a.mentee_name}"/></td>
                  <td class="ma-email"><c:out value="${a.mentee_email}"/></td>
                  <td><c:out value="${a.mentee_phone}"/></td>
                  <td>
                    <fmt:formatDate value="${a.created_at}" pattern="yyyy-MM-dd"/>
                  </td>

                  <!-- 프로필 클릭: 모달 -->
                  <td>
                    <button type="button"
                            class="ma-btn ma-btn-ghost"
                            onclick="openReasonModal(
                              '${a.ma_id}',
                              '${fn:escapeXml(a.mentee_name)}',
                              '${fn:escapeXml(a.apply_content)}',
                              '${fn:escapeXml(a.mentee_profile_img)}'
                            )">
                      보기
                    </button>
                  </td>

                  <!-- 상태 + 승인/거절 -->
                  <td>
  <div class="ma-actions">

    <c:choose>
      <c:when test="${a.status eq '승인대기중'}">
        <!-- 승인대기중일 때만 버튼 2개 -->
        <form method="post" action="mentoringApprove.do" class="ma-inline"
              onsubmit="return confirm('이 신청을 승인하시겠습니까?');">
          <input type="hidden" name="ma_id" value="${a.ma_id}">
          <button type="submit" class="ma-btn ma-btn-dark">승인</button>
        </form>

        <form method="post" action="mentoringDelete.do" class="ma-inline"
              onsubmit="return confirm('이 신청을 정말 거절(삭제)하시겠습니까?');">
          <input type="hidden" name="ma_id" value="${a.ma_id}">
          <button type="submit" class="ma-btn ma-btn-gray">거절</button>
        </form>
      </c:when>

      <c:otherwise>
        <!-- 승인된 경우 -->
        <span class="ma-badge ok">승인됨</span>
      </c:otherwise>
    </c:choose>

  </div>
</td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
          </div>
        </c:otherwise>
      </c:choose>
       <c:if test="${not empty pageStr}">
        <div class="paging">
          ${pageStr}
        </div>
      </c:if>
    </div>
  </div>
</section>

<!-- 신청사유 모달 -->
<div class="ma-modal" id="reasonModal" onclick="closeByBackdrop(event, 'reasonModal')">
  <div class="ma-modal-box">
    <div class="ma-modal-head">
      <div class="ma-modal-title" id="reasonTitle">신청 사유</div>
      <button class="ma-x" type="button" onclick="closeModal('reasonModal')">×</button>
    </div>

    <div class="ma-modal-body">
      <div class="ma-modal-profile">
        <div class="ma-modal-img" id="reasonImg"></div>
        <div>
          <div class="ma-modal-name" id="reasonName">-</div>
          <div class="ma-modal-sub" id="reasonId">-</div>
        </div>
      </div>

      <div class="ma-modal-text" id="reasonContent"></div>
    </div>

    <div class="ma-modal-foot">
      <button type="button" class="ma-btn ma-btn-gray" onclick="closeModal('reasonModal')">닫기</button>
    </div>
  </div>
</div>

<script>
  function closeByBackdrop(e, id){
    if(e.target && e.target.id === id) closeModal(id);
  }
  function closeModal(id){
    document.getElementById(id).classList.remove("open");
  }
  function openModal(id){
    document.getElementById(id).classList.add("open");
  }

  function openReasonModal(maId, name, content, imgUrl){
    document.getElementById("reasonId").innerText = "신청번호: " + maId;
    document.getElementById("reasonName").innerText = name || "-";
    document.getElementById("reasonContent").innerText = content || "(내용 없음)";

    const box = document.getElementById("reasonImg");
    box.innerHTML = "";
    if(imgUrl && imgUrl !== "null"){
      const img = document.createElement("img");
      img.src = imgUrl;
      img.alt = "프로필";
      box.appendChild(img);
    } else {
      box.classList.add("fallback");
    }
    openModal("reasonModal");
  }

  

  function filterRows(){
    const kw = (document.getElementById("kw").value || "").toLowerCase();
    const rows = document.querySelectorAll("#appTable tbody tr");
    rows.forEach(r => {
      const name = (r.querySelector(".ma-name")?.innerText || "").toLowerCase();
      const email = (r.querySelector(".ma-email")?.innerText || "").toLowerCase();
      r.style.display = (name.includes(kw) || email.includes(kw)) ? "" : "none";
    });
  }
</script>

<%@ include file="../footer.jsp"%>
</body>
</html>
