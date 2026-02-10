<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 묻는 질문 등록</title>
<link rel="stylesheet" href="css/admin_layout.css" type="text/css">
<%@ include file="adminCheck.jsp" %>
</head>
<body id="adminFaqWrite">
	<h1>새 질문 등록</h1>

	<form action="adminFaqWriteOk.do" method="post">
		<table class="faq__write__form">
			<tr>
				<th>카테고리</th>
				<td><select name="menu_category_idx" class="faq__select__field"
					required>
						<option value="">카테고리를 선택하세요</option>
						<c:forEach var="cat" items="${categoryList}">
							<option value="${cat.menu_category_idx}">${cat.menu_category_name}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<th>질문 제목</th>
				<td><input type="text" name="faq_title"
					class="faq__input__field" placeholder="질문을 입력하세요" required>
				</td>
			</tr>
			<tr>
				<th>답변 내용</th>
				<td><textarea name="faq_content" class="faq__textarea__field"
						placeholder="답변 내용을 입력하세요" required></textarea></td>
			</tr>
		</table>

		<div class="faq__btn__area">
			<button type="submit" class="faq__admin__btn faq__submit__btn">등록하기</button>
			<button type="button" class="faq__admin__btn faq__cancel__btn"
				onclick="history.back();">취소</button>
		</div>
	</form>
</body>
</html>