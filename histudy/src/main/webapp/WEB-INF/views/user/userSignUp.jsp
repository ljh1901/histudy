<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="css/root.css">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/user/userSignUp.css">

<style>
/* JSP 내부에 추가로 정의된 스타일 */
.signup-form {
   width: 300px;
   margin: 50px auto;
}

.signup-form button {
   width: 100%;
   padding: 10px;
   background-color: #007bff;
   color: white;
   border: none;
}
</style>
</head>

<body class="signupBody">
   <div class="signup-container">
      <h2>회원 가입</h2>
      <br>
      <form action="userSignUp.do" method="post" id="signupForm">
         <div class="input-group">
            <input type="text" name="user_id" id="user_id" class="icon-id"
               placeholder="아이디" required>
            <button type="button" class="check-btn" onclick="checkId()">중복확인</button>
         </div>

         <div class="input-group">
            <input type="password" name="user_pw" id="user_pw" class="icon-pw"
               placeholder="비밀번호 (7자리 이상)" required>
         </div>

         <div class="input-group" style="position: relative;">
            <img src="/histudy/user-img/pw2-icon.png" id="pw_icon" class="pw-icon-style"> 
            <input type="password" id="user_pw_confirm" class="icon-pw2" placeholder="비밀번호 확인" required style="background-image: none !important;">
         </div>
         <span id="pw_msg" style="font-size: 12px; margin-left: 10px; display: block; margin-bottom: 10px;"></span>

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
               <option>연도</option>

            </select> 
            <select name="birth_month" id="birth_month" class="birth-select">
               <option value="">월</option>
</select> 
<select name="birth_day" id="birth_day" class="birth-select">
               <option value="">일</option>

            </select>
         </div>

         <input type="hidden" name="user_birthdate" id="user_birthdate">
         <button type="submit" class="signup-btn">가입하기</button>
      </form>
   </div>

   <script>
   var now = new Date();
   var year=now.getFullYear();
   var month = now.getMonth(1, 12);
   alert(month)
   var years = '';
	for(let i=1950; i<=year; i++){
	   years += '<option>'+i+'</option>'
   }
	for(let i=1; i<=12; i++){
		months += '<option>'+i+'</option>'
	}
   document.getElementById('signupForm').birth_year.innerHTML += years;
   document.getElementById('signupForm').birth_month.innerHTML += month;
    let isIdChecked = false;

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

    document.getElementById('user_pw_confirm').onkeyup = function() {
        const pw = document.getElementById('user_pw').value;
        const pwConfirm = this.value;
        const msg = document.getElementById('pw_msg');
        const icon = document.getElementById('pw_icon'); // 아이콘 객체 가져오기
        
        // 기본 아이콘 경로 (열린 자물쇠)
        const unlockImg = "/histudy/user-img/pw2-icon.png";
        // 일치 시 아이콘 경로 (잠긴 자물쇠)
        const lockImg = "/histudy/user-img/pw-icon.png";

        if(pwConfirm === "") { 
            msg.innerHTML = ""; 
            icon.src = unlockImg; // 비어있을 땐 기본값
            return; 
        }
        
        if(pw.length < 7) { 
            msg.innerHTML = "비밀번호는 7자리 이상이어야 합니다."; 
            msg.style.color = "orange"; 
            icon.src = unlockImg;
            return; 
        }
        
        if(pw === pwConfirm) {
            msg.innerHTML = "비밀번호가 일치합니다."; 
            msg.style.color = "green";
            icon.src = lockImg; // 비밀번호 일치 시 잠긴 자물쇠로 변경!
        } else {
            msg.innerHTML = "비밀번호가 일치하지 않습니다."; 
            msg.style.color = "red";
            icon.src = unlockImg; // 불일치 시 다시 열린 자물쇠
        }
    };

    document.getElementById('signupForm').onsubmit = function() {
        if(!isIdChecked) { alert("아이디 중복 검사를 진행해주세요."); return false; }
        const pw = document.getElementById('user_pw').value;
        const pwConfirm = document.getElementById('user_pw_confirm').value;
        if(pw.length < 7) { alert("비밀번호는 7자리 이상이어야 합니다."); return false; }
        if(pw !== pwConfirm) { alert("비밀번호가 일치하지 않습니다."); return false; }
        const year = document.getElementById('birth_year').value;
        const month = document.getElementById('birth_month').value;
        const day = document.getElementById('birth_day').value;
        if (!year || !month || !day) { alert("생년월일을 모두 선택해주세요."); return false; }
        document.getElementById('user_birthdate').value = year + "-" + month + "-" + day;
        return true;
    };
    </script>

</body>
</html>