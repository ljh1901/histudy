<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 관리</title>
<link rel="stylesheet" href="css/admin/admin_layout.css" type="text/css">
<%@ include file="../adminCheck.jsp" %>

</head>
<body id="adminInquiryList">

    <div class="inquiry__container">
        <div class="admin__header">
            <h1 class="admin__title">문의사항 관리</h1>
        </div>

       <form action="adminInquiryList.do" method="get" class="inquiry__cat">
    <select name="category_idx">
        <option value="0">전체 카테고리</option> <c:forEach var="cat" items="${categoryList}">
            <option value="${cat.inquiry_category_idx}" 
                <c:if test="${param.category_idx == cat.inquiry_category_idx}">selected</c:if>>
                ${cat.inquiry_category_name}
            </option>
        </c:forEach>
    </select> 
    <input type="text" name="keyword" value="${param.keyword}" placeholder="제목 또는 작성자 검색">
    <button type="submit" class="inquiry__btn__search">검색</button>
</form>

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
                <c:forEach var="dto" items="${inquiryList}">
                    <tr>
                        <td align="center">${dto.inquiry_idx}</td>
                        <td align="center">
                            <span class="badge inquiry__cat__item">${dto.inquiry_category_name}</span>
                        </td>
                        <td style="text-align: left;">
                            <a href="adminInquiryDetail.do?inquiry_idx=${dto.inquiry_idx}" class="inquiry__link">
                                ${dto.inquiry_title}
                            </a>
                        </td>
                        <td align="center">${dto.user_name}</td> <td align="center">${dto.inquiry_date}</td>
                        <td align="center">
                            <c:choose>
                                <c:when test="${dto.inquiry_status eq '대기'}">
                                    <span class="badge inquiry__status__ok__wait">답변대기</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge inquiry__status__ok">답변완료</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
                
                <c:if test="${empty inquiryList}">
                    <tr>
                        <td colspan="6" align="center" style="padding: 50px 0;">등록된 문의사항이 없습니다.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>

</body>
</html>