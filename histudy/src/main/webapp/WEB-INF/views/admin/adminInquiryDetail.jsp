<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 상세 관리</title>
<%@ include file="adminCheck.jsp" %>
<style>
    .container { width: 800px; margin: 20px auto; font-family: sans-serif; }
    .info-table { width: 100%; border-collapse: collapse; margin-bottom: 20px; }
    .info-table th { background-color: #f8f9fa; width: 150px; padding: 10px; border: 1px solid #ddd; }
    .info-table td { padding: 10px; border: 1px solid #ddd; }
    .content-box { min-height: 200px; vertical-align: top; }
    .reply-section { background-color: #f1f3f5; padding: 20px; border-radius: 5px; }
    textarea { width: 100%; height: 150px; resize: none; margin-top: 10px; }
    .btn-area { text-align: center; margin-top: 20px; }
    .btn { padding: 10px 20px; cursor: pointer; border: none; border-radius: 3px; }
    .btn-submit { background-color: #28a745; color: white; }
    .btn-list { background-color: #6c757d; color: white; }
</style>
</head>
<body id="adminInquiryDetail">

<div class="container">
    <h2>문의사항 상세 보기</h2>
    
    <table class="info-table">
        <tr>
            <th>카테고리</th>
            <td>스터디카페</td> <th>작성일</th>
            <td>2026-02-10</td> </tr>
        <tr>
            <th>작성자</th>
            <td colspan="3">홍길동 (user01)</td>
        </tr>
        <tr>
            <th>제목</th>
            <td colspan="3">예약 취소 및 환불 규정 문의합니다.</td>
        </tr>
        <tr>
            <th>문의 내용</th>
            <td colspan="3" class="content-box">
                안녕하세요. 어제 스터디룸을 예약했는데 개인 사정으로 취소해야 할 것 같습니다.<br>
                혹시 전날 취소하면 환불이 100% 가능한지 궁금합니다.
            </td>
        </tr>
    </table>

    <div class="reply-section">
        <h3>관리자 답변</h3>
        <form action="insertReply.do" method="post">
            <input type="hidden" name="inquiryIdx" value="${inquiry.idx}">
            <textarea name="replyContent" placeholder="답변 내용을 입력해 주세요."></textarea>
            
            <div class="btn-area">
                <button type="submit" class="btn btn-submit">답변 등록/수정</button>
                <button type="button" class="btn btn-list" onclick="location.href='adminInquiryList.do'">목록으로</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>