<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="css/userSignUp.css">
<link rel="stylesheet" href="css/root.css" type="text/css"> 
<link rel="stylesheet" href="css/header.css" type="text/css"> 
<link rel="stylesheet" href="css/footer.css" type="text/css"> 
<style>
    .signup-form { width: 300px; margin: 50px auto; }
    .signup-form button { width: 100%; padding: 10px; background-color: #007bff; color: white; border: none; }
</style>
</head>
<%@include file="/header.jsp" %>
<body>

<div class="signup-container">
    <h2>회원 가입</h2><br>
    <form action="userSignUp.do" method="post" id="signupForm">
        <div class="input-group">
            <input type="text" name="user_id" id="user_id" class="icon-id" placeholder="아이디" required>
            <button type="button" class="check-btn" onclick="checkId()">중복확인</button>
        </div>
        <div class="input-group">
            <input type="password" name="user_pw" id="user_pw" class="icon-pw" placeholder="비밀번호 (7자 이상 영문/숫자)" required>
        </div>
        <div class="input-group">
            <input type="password" id="user_pw_confirm" class="icon-pw2" placeholder="비밀번호 확인" required>
            <span id="pw_msg" style="font-size: 12px; margin-left: 10px;"></span>
        </div>
        <div class="input-group">
            <input type="text" name="user_name" class="icon-name" placeholder="성명" required>
        </div>
        <div class="input-group">
            <input type="tel" name="user_tel" class="icon-tel" placeholder="전화번호" required>
        </div>
        <div class="input-group">
            <input type="email" name="user_email" class="icon-email" placeholder="이메일" required>
        </div>
    <div class="birth-group">
            <select name="birth_year" id="birth_year" class="birth-select">
                <option value="">연도</option>
                <% for(int i=2026; i>=1950; i--) { %>
                    <option value="<%=i%>"><%=i%></option>
                <% } %>
            </select>
            <select name="birth_month" id="birth_month" class="birth-select">
                <option value="">월</option>
                <% for(int i=1; i<=12; i++) { %>
                    <option value="<%=String.format("%02d", i)%>"><%=i%></option>
                <% } %>
            </select>
            <select name="birth_day" id="birth_day" class="birth-select">
                <option value="">일</option>
                <% for(int i=1; i<=31; i++) { %>
                    <option value="<%=String.format("%02d", i)%>"><%=i%></option>
                <% } %>
            </select>
        </div>
        
        <input type="hidden" name="user_birthdate" id="user_birthdate">
        
        <button type="submit" class="signup-btn">가입하기</button>
    </form>
</div>
<script>
let isIdChecked = false; // 중복 확인 여부 체크 변수

// [함수] 아이디 중복 확인 로직 (중복확인 버튼 클릭 시 실행)
function checkId() {
    const userId = document.getElementById('user_id').value;
    
    if(!userId) {
        alert("아이디를 입력해주세요.");
        return;
    }

    const idRegExp = /^[a-zA-Z0-9]+$/;
    if(!idRegExp.test(userId)) {
        alert("아이디는 영문과 숫자만 가능합니다.");
        return;
    }

    fetch("userCheckId.do?user_id=" + userId)
        .then(response => response.text())
        .then(data => {
            if (data.trim() === "0") {
                alert("사용 가능한 아이디입니다.");
                isIdChecked = true;
                // 아이디 변경 시 중복 체크 무효화
                document.getElementById('user_id').onchange = function() {
                    isIdChecked = false;
                };
            } else {
                alert("이미 존재하는 아이디입니다.");
                isIdChecked = false;
            }
        })
        .catch(err => {
            console.error("에러 발생: ", err);
            alert("서버 통신 중 오류가 발생했습니다.");
        });
}

// [이벤트] 비밀번호 실시간 일치 확인
document.getElementById('user_pw_confirm').onkeyup = function() {
    const pw = document.getElementById('user_pw').value;
    const pwConfirm = this.value;
    const msg = document.getElementById('pw_msg');
    
    if(pwConfirm === "") {
        msg.innerHTML = "";
        return;
    }
 
    // 길이는 주황색으로 강조
    if(pw.length < 7) {
        msg.innerHTML = "비밀번호는 7자리 이상이어야 합니다.";
        msg.style.color = "orange"; 
        return;
    }
    
    if(pw === pwConfirm) {
        msg.innerHTML = "비밀번호가 일치합니다.";
        msg.style.color = "green";
    } else {
        msg.innerHTML = "비밀번호가 일치하지 않습니다.";
        msg.style.color = "red";
    }
};

// [통합 검증] 가입하기 버튼 클릭 시 실행 (onsubmit)
document.getElementById('signupForm').onsubmit = function() {
    // 1. 아이디 중복 검사 필수 여부 확인
    if(!isIdChecked) {
        alert("아이디 중복 검사를 진행해주세요.");
        return false;
    }

    // 2. 비밀번호 유효성 체크 (7자리 이상)
    const pw = document.getElementById('user_pw').value;
    const pwConfirm = document.getElementById('user_pw_confirm').value;
    if(pw.length < 7) {
        alert("비밀번호는 7자리 이상이어야 합니다.");
        return false;
    }

    // 3. 비밀번호 일치 확인
    if(pw !== pwConfirm) {
        alert("비밀번호가 일치하지 않습니다.");
        return false;
    }

    // 4. 생년월일 선택 여부 및 값 합치기
    const year = document.getElementById('birth_year').value;
    const month = document.getElementById('birth_month').value;
    const day = document.getElementById('birth_day').value;

    if (!year || !month || !day) {
        alert("생년월일을 모두 선택해주세요.");
        return false;
    }

    // 모든 검사 통과 시 히든 필드에 날짜 세팅 후 서버 전송
    document.getElementById('user_birthdate').value = year + "-" + month + "-" + day;
    return true;
};
</script>

<%@include file="/footer.jsp" %>
</body>
</html>