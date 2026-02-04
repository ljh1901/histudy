<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 묻는 질문 수정</title>
<link rel="stylesheet" href="css/admin_layout.css" type="text/css">
</head>
<body>
    <h1>자주 묻는 질문 수정</h1>
	
    <form action="adminFaqEditAction.do" method="post">
        <input type="hidden" name="faq_idx" value="${faq.faq_idx}">

        <table class="faq__edit-form">
            <tr>
                <th>카테고리</th>
                <td>
                    <select name="menu_category_idx" class="faq__input">
                        <c:forEach var="cat" items="${categoryList}">
                            <option value="${cat.menu_category_idx}" 
                                ${faq.menu_category_idx == cat.menu_category_idx ? 'selected' : ''}>
                                ${cat.menu_category_name}
                            </option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th>질문 제목</th>
                <td>
                    <input type="text" name="faq_title" class="faq__input" value="${faq.faq_title}" required>
                </td>
            </tr>
            <tr>
                <th>답변 내용</th>
                <td>
                    <textarea name="faq_content" class="faq__textarea" required>${faq.faq_content}</textarea>
                </td>
            </tr>
        </table>

        <div class="faq__edit__btn">
            <button type="submit" class="faq__admin__btn">수정 완료</button>
            <button type="button" class="faq__btn__del" onclick="history.back()">취소</button>
        </div>
    </form>
</body>
</html>