<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멘토링 신청 | Hi, Study</title>

<link rel="stylesheet" href="css/root.css" type="text/css">
<link rel="stylesheet" href="css/header.css" type="text/css">
<link rel="stylesheet" href="css/footer.css" type="text/css">

<style>
.apply-wrap{max-width:980px;margin:40px auto;padding:0 16px}
.apply-top{display:grid;grid-template-columns:1.2fr .8fr;gap:16px}
.card{background:#fff;border-radius:16px;padding:18px;box-shadow:0 6px 18px rgba(0,0,0,.06)}
.title{font-size:20px;font-weight:800;margin-bottom:10px}
.mline{color:#64748b;margin:6px 0}
.area{width:100%;min-height:140px;padding:12px;border-radius:12px;border:1px solid #e2e8f0;resize:vertical}
.btns{display:flex;gap:10px;justify-content:flex-end;margin-top:12px}
.btn{border:none;border-radius:12px;padding:10px 14px;font-weight:700;cursor:pointer}
.btn-dark{background:#0f2d3a;color:#fff}
.btn-gray{background:#e5e7eb;color:#111827}
</style>
</head>

<body>
<%@ include file="../header.jsp"%>

<div class="apply-wrap">
  <div class="apply-top">
    <!-- 멘토링 정보 -->
    <div class="card">
      <div class="title">
        <c:out value="${mentorSummary.mentoring_title}" default="멘토링 제목"/>
      </div>

      <div class="mline">분야: <b><c:out value="${mentorSummary.job_group}" default="-"/></b></div>
      <div class="mline">직무: <b><c:out value="${mentorSummary.job_role}" default="-"/></b></div>
      <div class="mline">경력: <b><c:out value="${mentorSummary.career_years}" default="-"/></b></div>

      <hr style="border:none;border-top:1px solid #eef2f7;margin:14px 0">

      <div class="mline">
        설명:
        <div style="margin-top:6px;color:#0f172a;line-height:1.6">
          <c:out value="${mentoring.description}" default="(설명 없음)"/>
        </div>
      </div>

      <div class="mline" style="margin-top:10px">
        사전 공지:
        <div style="margin-top:6px;color:#0f172a;line-height:1.6">
          <c:out value="${mentoring.pre_notice}" default="(공지 없음)"/>
        </div>
      </div>
    </div>

    <!-- 멘토 정보 -->
    <div class="card">
      <div class="title">멘토 정보</div>
      <div class="mline">이름: <b><c:out value="${mentorSummary.mentor_name}" default="멘토"/></b></div>

      <c:if test="${not empty mentorSummary.mentor_profile_img}">
        <div style="margin-top:10px">
          <img src="<c:out value='${mentorSummary.mentor_profile_img}'/>"
               style="width:120px;height:120px;border-radius:16px;object-fit:cover">
        </div>
      </c:if>

      <div class="mline" style="margin-top:12px;color:#64748b">
        신청 후 멘토가 승인하면 “승인됨”으로 변경됩니다.
      </div>
    </div>
  </div>

  <!-- 신청 폼 -->
  <div class="card" style="margin-top:16px">
    <div class="title">신청 사유</div>

    <form method="post" action="mentoringApplySubmit.do"
          onsubmit="return confirm('이 멘토링을 신청하시겠습니까?');">
      <input type="hidden" name="mentoring_idx" value="${param.mentoring_idx}"/>

      <textarea class="area" name="apply_content"
                placeholder="멘토링을 신청하는 이유를 적어주세요 (예: 목표, 현재 상황, 궁금한 점)"></textarea>

      <div class="btns">
        <button type="button" class="btn btn-gray" onclick="history.back()">뒤로</button>
        <button type="submit" class="btn btn-dark">신청하기</button>
      </div>
    </form>
  </div>
</div>

<%@ include file="../footer.jsp"%>
</body>
</html>
