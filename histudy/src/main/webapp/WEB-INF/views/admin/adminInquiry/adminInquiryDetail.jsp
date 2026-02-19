<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 상세 관리</title>
<link rel="stylesheet" href="css/admin/admin_layout.css" type="text/css">
<%@ include file="../adminCheck.jsp"%>
<style>
.adminInquiry {
	width: 800px;
	margin: 40px auto;
	font-family: sans-serif;
	background: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.inquiry__table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 30px;
}

.inquiry__table th {
	background-color: #f8f9fa;
	width: 150px;
	padding: 12px;
	border: 1px solid #dee2e6;
	text-align: left;
}

.inquiry__table td {
	padding: 12px;
	border: 1px solid #dee2e6;
}

.inquiry__content {
	min-height: 250px;
	vertical-align: top;
	white-space: pre-wrap;
} /* 줄바꿈 유지 */
.inquiry__reply {
	background-color: #f8f9fa;
	padding: 25px;
	border-radius: 8px;
	border: 1px solid #e9ecef;
}

.inquiry__textarea {
	width: 100%;
	height: 180px;
	resize: none;
	margin-top: 10px;
	padding: 15px;
	border: 1px solid #ced4da;
	border-radius: 4px;
	box-sizing: border-box;
}

.inquiry__btn {
	text-align: center;
	margin-top: 20px;
	display: flex;
	justify-content: center;
	gap: 10px;
}

.btn {
	padding: 12px 25px;
	cursor: pointer;
	border: none;
	border-radius: 4px;
	font-weight: bold;
}

.inquiry__btn__submit {
	background-color: #4f46e5;
	color: white;
}

.inquiry__btn__list {
	background-color: #6c757d;
	color: white;
}

.reply__date {
	font-size: 0.9em;
	color: #6c757d;
	margin-left: 10px;
}
</style>
</head>

<body id="adminInquiryDetail">

	<div class="adminInquiry">
		<h2 style="margin-bottom: 20px; color: #1a202c;">문의사항 상세 보기</h2>

		<table class="inquiry__table">
			<tr>
				<th>카테고리</th>
				<td>${dto.inquiry_category_name}</td>
				<th>작성일</th>
				<td>${dto.inquiry_date}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td colspan="3">${dto.user_name}(유저 아이디 : ${dto.user_id})</td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3">${dto.inquiry_title}</td>
			</tr>
			<tr>
				<th>문의 내용</th>
				<td colspan="3" class="inquiry__content">${dto.inquiry_content}</td>
			</tr>
			<c:if test="${not empty dto.inquiry_reply_date}">
				<tr>
					<th>최종 답변일</th>
					<td colspan="3">${dto.inquiry_reply_date}</td>
				</tr>
			</c:if>
		</table>

		<div class="inquiry__reply">
			<h3>관리자 답변 작성</h3>
			<form action="adminInquiryReply" method="post">
				<input type="hidden" name="inquiry_idx" value="${dto.inquiry_idx}">

				<textarea class="inquiry__textarea" name="inquiry_reply"
					placeholder="사용자에게 전달할 답변 내용을 입력해 주세요.">${dto.inquiry_reply}</textarea>

				<div class="inquiry__btn">
					<button type="submit" class="btn inquiry__btn__submit">답변
						등록/수정</button>
					<button type="button" class="btn inquiry__btn__list"
						onclick="location.href='adminInquiryList.do'">목록으로</button>
				</div>
			</form>
		</div>
	</div>

</body>
</html>