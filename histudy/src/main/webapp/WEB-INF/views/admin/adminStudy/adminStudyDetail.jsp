<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>스터디 상세 관리</title>
    <link rel="stylesheet" href="css/admin/admin_layout.css" type="text/css">
    <%@ include file="../adminCheck.jsp"%>
</head>

<body id="adminStudyDetail">
    <div class="study__detail">
        <div class="study__detail__header">
            <span style="color: #4f46e5;">[${dto.sc_name}]</span>
            ${dto.study_title}
        </div>

        <div class="study__detail__field">
            <span class="study__detail__title">==지원자격==</span>
            <ul class="study__info">
                <li><b>개설자:</b> ${dto.user_name}</li>
                <li><b>모집 인원:</b> <span class="highlight">${dto.study_current_members} / ${dto.study_max_members} 명</span></li>
                <li><b>활동 기간:</b> ${dto.study_start_date.substring(0,10)} ~ ${dto.study_end_date.substring(0,10)}</li>
            </ul>

            <span class="study__detail__title">==스터디 진행 방식==</span>
            <div class="study__content">${dto.study_content}</div>
        </div>

        <div class="study__detail__footer">
            <button class="study__btn__del" onclick="deleteStudy(${dto.study_idx})">삭제</button>
            <button class="study__btn__list" onclick="location.href='adminStudyList.do'">목록으로</button>
        </div>
    </div>

    <script>
        function deleteStudy(idx) {
            if(confirm("이 스터디 게시글을 삭제하시겠습니까?")) {
                location.href = "adminStudyDelete.do?study_idx=" + idx;
            }
        }
    </script>
</body>
</html>