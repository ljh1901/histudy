<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/admin_layout.css" type="text/css">
</head>
<body>
<h1>스터디 모임 관리</h1>
<table>
    <thead>
        <tr>
            <th>번호</th>
            <th>카테고리</th>
            <th>스터디명</th>
            <th>작성자</th>
            <th>인원</th>
            <th>기간</th>
            <th>관리</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="s" items="${studyList}">
            <tr>
                <td>${s.study_idx}</td>
                <td><span class="#">${s.sc_name}</span></td>
                <td class="text-left">${s.study_title}</td>
                <td>${s.user_name}</td>
                <td>${s.study_current_members} / ${s.study_max_members}</td>
                <td>${s.study_start_date} ~ ${s.study_end_date}</td>
                <td>
                    <button class="admin__btn__del" onclick="deleteStudy(${s.study_idx})">삭제</button>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>