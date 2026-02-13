<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 등록</title>
<link rel="stylesheet" href="css/admin/admin_layout.css" type="text/css">
<%@ include file="../adminCheck.jsp" %>
</head>
<body id="adminNoticeWrite">
    <h1>새 공지 등록</h1>

    <form action="adminNoticeWriteOk.do" method="post" enctype="multipart/form-data">
        <table class="notice__write__form">
            <tr>
                <th>카테고리</th>
                <td>
                    <select name="notice_category_idx" class="notice__select__field" required>
                        <option value="">카테고리를 선택하세요</option>
                        <c:forEach var="cat" items="${categoryList}">
                            <option value="${cat.notice_category_idx}">${cat.notice_category_name}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th>공지 제목</th>
                <td>
                    <input type="text" name="notice_title" class="notice__input__field" placeholder="제목을 입력하세요" required>
                </td>
            </tr>
            <tr>
                <th>첨부 파일</th>
                <td>
                    <input type="file" name="uploadFile" class="notice__input__field">
                </td>
            </tr>
            <tr>
                <th>공지 내용</th>
                <td>
                    <textarea name="notice_content" class="notice__textarea__field" placeholder="내용을 입력하세요" required></textarea>
                </td>
            </tr>
        </table>

        <div class="notice__btn__area" style="text-align: center; margin-top: 30px; display: flex; justify-content: center; gap: 10px;">
            <button type="submit" class="notice__admin__btn notice__submit__btn">등록하기</button>
            <button type="button" class="notice__admin__btn notice__cancel__btn" onclick="history.back();">취소</button>
        </div>
    </form>
</body>
</html>