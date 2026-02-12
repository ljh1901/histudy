<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 관리</title>
<link rel="stylesheet" href="css/admin/admin_layout.css" type="text/css">
<%@ include file="adminCheck.jsp" %>
<style>
.status--pending {
	color: #f59e0b;
	font-weight: bold;
} /* 대기중 */
.status--resolved {
	color: #10b981;
} /* 처리완료 */
.report__reason {
	text-align: left !important;
	max-width: 300px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.admin__report__container {
	padding: 40px;
	max-width: 1200px;
	margin: 0 auto;
	background-color: #ffffff;
	border-radius: 12px;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
}

.admin__title {
	font-size: 24px;
	color: #1a202c;
	margin-bottom: 25px;
	border-left: 5px solid #4f46e5; /* 포인트 컬러 (보라/블루) */
	padding-left: 15px;
}

/* 테이블 디자인 */
.user__table {
	width: 100%;
	border-collapse: separate;
	border-spacing: 0;
	margin-top: 10px;
}

.user__table th {
	background-color: #f8fafc;
	color: #64748b;
	font-weight: 600;
	padding: 15px;
	border-bottom: 2px solid #e2e8f0;
	text-transform: uppercase;
	font-size: 13px;
}

.user__table td {
	padding: 16px 15px;
	border-bottom: 1px solid #f1f5f9;
	color: #334155;
	vertical-align: middle;
	font-size: 14px;
}

.user__table tr:hover {
	background-color: #fcfdfe; /* 마우스 올렸을 때 강조 */
}

/* 상태 뱃지 스타일 */
.status--pending {
	background-color: #fffbeb;
	color: #d97706;
	padding: 4px 10px;
	border-radius: 20px;
	font-size: 12px;
}

.status--resolved {
	background-color: #ecfdf5;
	color: #059669;
	padding: 4px 10px;
	border-radius: 20px;
	font-size: 12px;
}

/* 텍스트 생략 처리 */
.report__reason {
	text-align: left !important;
	max-width: 250px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	color: #64748b;
}

/* 버튼 스타일 */
.btn__view, .btn__user__del {
	padding: 6px 12px;
	border-radius: 6px;
	border: none;
	font-size: 13px;
	cursor: pointer;
	transition: all 0.2s;
	margin-right: 5px;
}

.btn__view {
	background-color: #f1f5f9;
	color: #475569;
}

.btn__view:hover {
	background-color: #e2e8f0;
}

.btn__user__del {
	background-color: #4f46e5;
	color: white;
}

.btn__user__del:hover {
	background-color: #4338ca;
	box-shadow: 0 4px 12px rgba(79, 70, 229, 0.3);
}
</style>
</head>
<body id="adminReportList">
	<div class="admin__report__container">
		<div class="admin__header">
			<h1 class="admin__title">신고 관리</h1>
		</div>

		<table class="user__table">
			<thead>
				<tr>
					<th>번호</th>
					<th>신고 유형</th>
					<th>신고 대상(ID/제목)</th>
					<th>신고 사유</th>
					<th>신고자</th>
					<th>상태</th>
					<th>관리</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="r" items="${reportList}">
					<tr>
						<td>${r.report_idx}</td>
						<td>${r.report_type}</td>
						<td><strong>${r.target_name}</strong></td>
						<td class="report__reason" title="${r.report_content}">${r.report_content}</td>
						<td>${r.reporter_name}</td>
						<td><span
							class="${r.report_status == '대기' ? 'status--pending' : 'status--resolved'}">
								${r.report_status} </span></td>
						<td>
							<button class="btn__view" onclick="viewReport(${r.report_idx})">상세보기</button>
							<c:if test="${r.report_status == '대기'}">
								<button class="btn__user__del"
									onclick="resolveReport(${r.report_idx})">처리완료</button>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<script>
        function resolveReport(idx) {
            if(confirm("해당 신고를 처리 완료로 변경하시겠습니까?")) {
                location.href = "adminReportResolve.do?report_idx=" + idx;
            }
        }
    </script>
</body>
</html>