<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>문의하기</title>
    <link rel="stylesheet" href="css/admin/admin_layout.css" type="text/css">
</head>
<body id="userInquiryWrite">

    <div class="inquiry__container">
        <div class="admin__header">
            <h1 class="admin__title">1:1 문의 작성</h1>
        </div>

        <form action="userInquiryWriteOk.do" method="post" class="inquiry__form">
            <table class="inquiry__table">
                <tbody>
                    <tr>
                        <th>카테고리</th>
                        <td>
                            <select name="inquiry_category_idx" class="inquiry__select__field">
                                <c:forEach var="cat" items="${categoryList}">
                                    <option value="${cat.inquiry_category_idx}">${cat.inquiry_category_name}</option>
                                </c:forEach>
                            </select>
                        </td>
                        <th>작성자</th>
                        <td>
                            <input type="text" value="${sessionScope.user_id}" class="inquiry__input__field" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th>제목</th>
                        <td colspan="3"> <input type="text" name="inquiry_title" class="inquiry__input__field" placeholder="제목을 입력해 주세요." required>
                        </td>
                    </tr>
                    <tr>
                        <th>문의 내용</th>
                        <td colspan="3">
                            <textarea name="inquiry_content" class="inquiry__textarea" placeholder="문의 내용을 상세히 입력해 주세요." required></textarea>
                        </td>
                    </tr>
                </tbody>
            </table>

            <div class="inquiry__btn">
                <button type="submit" class="btn inquiry__btn__submit">문의 등록</button>
                <button type="button" class="btn inquiry__btn__list" onclick="history.back()">취소</button>
            </div>
        </form>
    </div>

</body>
</html>