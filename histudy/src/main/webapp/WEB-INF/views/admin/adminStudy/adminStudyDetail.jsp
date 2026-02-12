<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디 상세 관리</title>
<link rel="stylesheet" href="css/admin/admin_layout.css" type="text/css">
<%@ include file="../adminCheck.jsp"%>
<style>
#adminStudyDetail {
	margin: 0;
	padding: 0;
	height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	overflow: hidden;
}

.detail__container {
	width: 95%;
	max-width: 750px;
	max-height: 90vh;
	border: 3px solid #333;
	border-radius: 20px;
	padding: 25px;
	background: #fff;
	display: flex;
	flex-direction: column;
}

.detail__header {
	margin-bottom: 15px;
	font-size: 1.4rem;
	font-weight: bold;
	flex-shrink: 0; /* 헤더는 크기 고정 */
}

.detail__box {
	border: 2px solid #444;
	border-radius: 15px;
	padding: 20px;
	background-color: #f9f9f9;
	overflow-y: auto;
	flex-grow: 1;
}

.detail__box::-webkit-scrollbar {
	width: 8px;
}

.detail__box::-webkit-scrollbar-thumb {
	background: #cbd5e1;
	border-radius: 10px;
}

.section__title {
	display: block;
	margin: 5px 0 10px 0;
	font-weight: bold;
	font-size: 1.1rem;
	color: #4f46e5;
}

.info-list {
	list-style: none;
	padding: 0;
	margin: 0 0 20px 10px;
	border-bottom: 1px solid #e2e8f0;
	padding-bottom: 15px;
}

.info-list li {
	position: relative;
	padding-left: 20px;
	margin-bottom: 8px;
	font-size: 1rem;
}

.info-list li::before {
	content: "•";
	position: absolute;
	left: 0;
	font-weight: bold;
}

.highlight {
	font-weight: bold;
}

.section__content__text {
	line-height: 1.6;
	font-size: 1rem;
	white-space: pre-wrap;
	word-break: break-all;
}

.detail__footer {
	display: flex;
	justify-content: flex-end;
	margin-top: 20px;
	gap: 10px;
	flex-shrink: 0;
}

.btn__del__big, .btn__list {
	padding: 10px 30px;
	border-radius: 8px;
	font-size: 1rem;
	font-weight: bold;
	cursor: pointer;
	border: none;
	transition: 0.2s;
}

.btn__del__big {
	background-color: #4f78ff;
	color: white;
}

.btn__list {
	background-color: #64748b;
	color: white;
}

.btn__del__big:hover {
	background-color: #3b5bdb;
}

.btn__list:hover {
	background-color: #475569;
}
</style>
</head>

<body id="adminStudyDetail">
	<div class="detail__container">
		<div class="detail__header">
			<span style="color: #4f46e5;">[${dto.sc_name}]</span>
			${dto.study_title}
		</div>

		<div class="detail__box">
			<span class="section__title">==지원자격==</span>
			<ul class="info-list">
				<li><b>개설자:</b> ${dto.user_name}</li>
				<li><b>모집 인원:</b> <span class="highlight">${dto.study_current_members}
						/ ${dto.study_max_members} 명</span></li>
				<li><b>활동 기간:</b> ${dto.study_start_date.substring(0,10)} ~
					${dto.study_end_date.substring(0,10)}</li>
			</ul>

			<span class="section__title">==스터디 진행 방식==</span>
			<div class="section__content__text">${dto.study_content}</div>
		</div>

		<div class="detail__footer">
			<button class="btn__del__big" onclick="deleteStudy(${dto.study_idx})">삭제</button>
			<button class="btn__list" onclick="location.href='adminStudyList.do'">목록으로</button>
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