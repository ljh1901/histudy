<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 묻는 질문 관리</title>
<link rel="stylesheet" href="css/admin_layout.css" type="text/css">
</head>
<body>
	<h1>자주 묻는 질문 관리</h1>

	<fieldset class="faq__category">
		<legend>카테고리 선택</legend>
		<ul class="faq__category__list">
			<li class="faq__category__item ${empty param.menu_category_idx ? 'active' : ''}"
				onclick="location.href='adminFaqForm.do'">전체</li>
			<c:forEach var="cat" items="${categoryList}">
				<li class="faq__category__item ${param.menu_category_idx == cat.menu_category_idx ? 'active' : ''}"
					onclick="location.href='adminFaqForm.do?menu_category_idx=${cat.menu_category_idx}'">
					${cat.menu_category_name}</li>
			</c:forEach>
		</ul>
	</fieldset>

	<div style="margin-top: 20px; display: flex; justify-content: space-between; align-items: center;">
		<p>총 <strong>${faqList.size()}</strong>개의 질문이 있습니다.</p>
		<button type="button" class="faq__admin__btn"
			onclick="location.href='adminFaqWrite.do'">새 질문 등록</button>
	</div>

	<table class="faq__list">
		<thead>
			<tr>
				<th width="10%">번호</th>
				<th width="15%">카테고리</th>
				<th width="50%">질문 내용</th>
				<th width="25%">관리</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="faq" items="${faqList}">
				<tr>
					<td>${faq.faq_idx}</td>
					<td>${faq.menu_category_name}</td>
					<td>${faq.faq_title}</td>
					<td>
						<button class="faq__btn__edit"
							onclick="location.href='adminFaqEdit.do?faq_idx=${faq.faq_idx}'">수정</button>
						<button class="faq__btn__del"
							onclick="if(confirm('정말 삭제하시겠습니까?')) location.href='adminFaqDelete.do?faq_idx=${faq.faq_idx}'">삭제</button>
					</td>
				</tr>
			</c:forEach>
			<c:if test="${empty faqList}">
				<tr>
					<td colspan="4" style="text-align: center; padding: 30px;">등록된 질문이 없습니다.</td>
				</tr>
			</c:if>
		</tbody>
	</table>
</body>
</html>