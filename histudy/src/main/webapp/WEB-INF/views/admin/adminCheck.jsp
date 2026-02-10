<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    Object role = session.getAttribute("role_idx");
    if (role == null || !role.toString().equals("1")) {
%>
    <script>
        alert("관리자 권한이 필요합니다.");
        location.href = "${pageContext.request.contextPath}/index.do";
    </script>
<%
        return;
    }
%>