<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    Integer roleIdx = (Integer) session.getAttribute("role_idx");
    
    if (roleIdx == null || roleIdx != 1) {
%>
    <script>
        alert("관리자 권한이 필요합니다.");
        location.href = "index.do";
    </script>
<%
        return;
    }
%>