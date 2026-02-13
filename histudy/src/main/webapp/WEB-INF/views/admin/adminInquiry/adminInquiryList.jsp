<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 관리</title>
<link rel="stylesheet" href="css/admin/admin_layout.css" type="text/css">
<%@ include file="../adminCheck.jsp" %>
<style>
/* 컨테이너 및 기본 설정 */
.inquiry__container {
	padding: 40px;
	max-width: 1200px;
	margin: 0 auto;
	background-color: #fff;
	border-radius: 12px;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
}

.admin__title {
	font-size: 24px;
	color: #1a202c;
	margin-bottom: 25px;
	border-left: 5px solid #4f46e5;
	padding-left: 15px;
}

/* 필터/검색 영역 */
.inquiry__cat {
	background-color: #f8fafc;
	padding: 20px;
	border-radius: 8px;
	margin-bottom: 25px;
	display: flex;
	align-items: center;
	gap: 10px;
}

.inquiry__cat select, .inquiry__cat input {
	padding: 10px;
	border: 1px solid #e2e8f0;
	border-radius: 6px;
	font-size: 14px;
}

.inquiry__cat select {
	min-width: 120px;
}

.inquiry__cat input {
	flex-grow: 1;
}

.inquiry__btn__search {
	background-color: #4f46e5;
	color: white;
	border: none;
	padding: 10px 20px;
	border-radius: 6px;
	cursor: pointer;
	transition: 0.2s;
}

.inquiry__btn__search:hover {
	background-color: #4338ca;
}

/* 테이블 스타일 */
.inquiry__list__table {
	width: 100%;
	border-collapse: separate;
	border-spacing: 0;
}

.inquiry__list__table th {
	background-color: #f1f5f9;
	color: #64748b;
	font-weight: 600;
	padding: 15px;
	border-bottom: 2px solid #e2e8f0;
	font-size: 13px;
	text-transform: uppercase;
}

.inquiry__list__table td {
	padding: 16px 15px;
	border-bottom: 1px solid #f1f5f9;
	color: #334155;
	font-size: 14px;
	vertical-align: middle;
}

.inquiry__list__table tr:hover {
	background-color: #fcfdfe;
}

/* 링크 스타일 */
.inquiry__link {
	text-decoration: none;
	color: #1e293b;
	font-weight: 500;
	transition: 0.2s;
}

.inquiry__link:hover {
	color: #4f46e5;
	text-decoration: underline;
}

/* 카테고리/상태 태그 */
.badge {
	padding: 4px 10px;
	border-radius: 20px;
	font-size: 12px;
	font-weight: bold;
}

.inquiry__cat__item {
	background-color: #e2e8f0;
	color: #475569;
}

.inquiry__status__ok__wait {
	background-color: #fee2e2;
	color: #ef4444;
} /* 답변대기 */
.inquiry__status__ok {
	background-color: #dcfce7;
	color: #22c55e;
}
</style>
</head>
<body id="adminInquiryList">

	<div class="inquiry__container">
		<div class="admin__header">
			<h1 class="admin__title">문의사항 관리</h1>
		</div>

		<div class="inquiry__cat">
			<select name="category">
				<option value="all">전체 카테고리</option>
				<option value="study">스터디</option>
				<option value="mentoring">멘토링</option>
				<option value="cafe">스터디카페</option>
				<option value="lecture">강의</option>
				<option value="lms">LMS</option>
			</select> <input type="text" placeholder="제목 또는 작성자 검색">
			<button type="button" class="inquiry__btn__search">검색</button>
		</div>

		<table class="inquiry__list__table">
			<thead>
				<tr>
					<th>번호</th>
					<th>카테고리</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
					<th>상태</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td align="center">1</td>
					<td align="center"><span class="badge inquiry__cat__item">스터디카페</span></td>
					<td style="text-align: left;"><a href="adminInquiryDetail.do"
						class="inquiry__link">예약 취소 관련 문의드립니다.</a></td>
					<td align="center">홍길동</td>
					<td align="center">2026-02-10</td>
					<td align="center"><span class="badge inquiry__status__ok__wait">답변대기</span></td>
				</tr>
				<tr>
					<td align="center">2</td>
					<td align="center"><span class="badge inquiry__cat__item">LMS</span></td>
					<td style="text-align: left;"><a href="adminInquiryDetail.do"
						class="inquiry__link">강의 자료가 열리지 않아요.</a></td>
					<td align="center">김철수</td>
					<td align="center">2026-02-09</td>
					<td align="center"><span class="badge inquiry__status__ok">답변완료</span></td>
				</tr>
			</tbody>
		</table>
	</div>

</body>
</html>