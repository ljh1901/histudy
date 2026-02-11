<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
<body id ="mentor_profile">
<%@ include file="../header.jsp"%>

<section class="mentor-profile-ground">

<div style="max-width:1100px;margin:40px auto;padding:0 16px;">

  <!-- ===== 상단: 멘토링/멘토 정보 ===== -->
  <div style="display:grid;grid-template-columns:1.2fr .8fr;gap:16px;">
    <div style="background:#fff;border-radius:16px;padding:18px;box-shadow:0 6px 18px rgba(0,0,0,.06)">
      <h2 style="margin:0 0 10px 0;">
        <c:out value="${detail.mentoring_title}" />
      </h2>

      <div>분야: <b><c:out value="${detail.job_group}" /></b></div>
      <div>직무: <b><c:out value="${detail.job_role}" /></b></div>
      <div>경력: <b><c:out value="${detail.career_years}" /></b></div>

      <hr style="border:none;border-top:1px solid #eef2f7;margin:14px 0">
      <div>설명</div>
      <div style="color:#0f172a;line-height:1.6;margin-top:6px;">
        <c:out value="${detail.description}" default="(설명 없음)"/>
      </div>
    </div>

    <div style="background:#fff;border-radius:16px;padding:18px;box-shadow:0 6px 18px rgba(0,0,0,.06)">
      <h3 style="margin:0 0 12px 0;">멘토 정보</h3>
      <div>이름: <b><c:out value="${detail.mentor_name}" /></b></div>

      <!-- 신청 버튼: 여기만 중요 -->
      <div style="margin-top:16px;">
        <button type="button"
                style="width:100%;border:none;border-radius:12px;padding:12px 14px;font-weight:800;cursor:pointer;background:#b7f34e;"
                onclick="location.href='mentoringApply.do?mentor_idx=${param.mentor_idx}'">
          멘토링 신청하기
        </button>
      </div>
    </div>
  </div>

  <!-- ===== 하단: 리뷰 목록/작성 ===== -->
  <div style="margin-top:16px;background:#fff;border-radius:16px;padding:18px;box-shadow:0 6px 18px rgba(0,0,0,.06)">
    <h3 style="margin:0 0 12px 0;">멘토링 리뷰</h3>

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
            <div style="margin-top:4px;">
              평점: <b><c:out value="${r.rating}"/></b>
            </div>
            <div style="margin-top:6px;line-height:1.6;">
              <c:out value="${r.review_content}"/>
            </div>
          </div>
        </c:forEach>
      </c:otherwise>
    </c:choose>

    <!-- 매칭된 사람만 작성 가능 -->
    <c:if test="${not empty writableMatchId}">
      <form method="post" action="mentoringReviewWrite.do" style="margin-top:14px;">
        <input type="hidden" name="mentor_idx" value="${param.mentor_idx}"/>

        <div style="margin-bottom:8px;">
          <label>평점</label>
          <input type="number" name="rating" min="0" max="5" step="0.5" value="5"
                 style="margin-left:8px;width:80px;">
        </div>

        <textarea name="review_content" rows="4"
                  style="width:100%;border:1px solid #e2e8f0;border-radius:12px;padding:12px;"
                  placeholder="리뷰를 작성해주세요"></textarea>

        <div style="display:flex;justify-content:flex-end;margin-top:10px;">
          <button type="submit"
                  style="border:none;border-radius:12px;padding:10px 14px;font-weight:800;cursor:pointer;background:#0f2d3a;color:#fff;">
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
