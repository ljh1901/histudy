/* === 전역 변수 (상태 관리) === */
var isIdChecked = false;
var isEmailChecked = false;

/** 1. 로그인 처리 함수  */
function loginCheck() {

	var userId = document.login.user_id.value;
    var userPwd = document.login.user_pwd.value;
    var rememberId = document.login.rememberId.checked ? "on" : null;

    return fetch("userSignIn.do", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
            user_id: userId,
            user_pwd: userPwd,
            remember_id: rememberId
        })
    })
    .then(function(res) { return res.text(); })
    .then(function(data) {
        alert(data);
        location.reload();
    })
    .catch(function(err) { console.error("로그인 중 오류 발생:", err); });
}


/** 2. 쿠키 읽기 함수 (안전한 버전) */
function getCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') c = c.substring(1, c.length); // 공백 제거
        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
    }
    return null;
}

/** 3. 로그인 모달 열기 함수 */
function openSignInModal() {
    fetch("userSignIn.do")
        .then(function(response) {
            if (!response.ok) throw new Error("서버 응답 오류");
            return response.text();
        })
        .then(function(html) {
            var parser = new DOMParser();
            var doc = parser.parseFromString(html, 'text/html');
            var fragment = doc.querySelector('#signInFragment');
            var modalContent = document.getElementById('modalContent');
            if (!modalContent) return;

            modalContent.innerHTML = fragment ? fragment.innerHTML : html;
            var overlay = document.getElementById('modalOverlay');
            if (overlay) overlay.style.display = 'flex';

            var id = getCookie("id");
            if (id) {
                var idInput = modalContent.querySelector('input[name="user_id"]');
                var rememberCheck = modalContent.querySelector('input[name="rememberId"]');
                if (idInput) idInput.value = id;
                if (rememberCheck) rememberCheck.checked = true;
            }

            if (!modalContent.querySelector('.close-btn')) {
                var closeBtn = document.createElement('div');
                closeBtn.className = 'close-btn';
                closeBtn.innerHTML = '&times;';
                closeBtn.onclick = closeSignInModal;
                Object.assign(closeBtn.style, {
                    position: 'absolute', right: '25px', top: '20px',
                    cursor: 'pointer', fontSize: '20px', fontWeight: 'bold', color: '#666'
                });
                modalContent.appendChild(closeBtn);
            }
        })
        .catch(function(error) { console.error("모달 로드 실패:", error); });
}

/** 4. 모달 닫기 함수 */
function closeSignInModal() {
    var overlay = document.getElementById('modalOverlay');
    if (overlay) overlay.style.display = 'none';
}

/** 5. 아이디 중복 확인 */
function checkId() {
    var userIdEl = document.getElementById('user_id');
    if (!userIdEl) return;
    
    var userId = userIdEl.value.trim();
    if (!userId) { alert("아이디를 입력해주세요."); return; }

    var idRegExp = /^[a-zA-Z0-9]+$/;
    if (!idRegExp.test(userId)) { alert("아이디는 영문과 숫자만 가능합니다."); return; }

    fetch("userCheckId.do?user_id=" + userId)
        .then(function(res) { return res.text(); })
        .then(function(data) {
            if (data.trim() === "0") {
                alert("사용 가능한 아이디입니다.");
                isIdChecked = true;
                userIdEl.onchange = function() { isIdChecked = false; };
            } else {
                alert("이미 존재하는 아이디입니다.");
                isIdChecked = false;
            }
        });
}

/** 6. 이메일 중복 확인 */
function emailCheck() {
    var emailEl = document.getElementById('user_email');
    if (!emailEl) return;

    var userEmail = emailEl.value.trim();
    if (userEmail === "") { alert("이메일을 입력해주세요."); emailEl.focus(); return; }

    var emailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    if (!emailPattern.test(userEmail)) { alert("유효한 이메일 형식이 아닙니다."); return; }

    fetch("userCheckEmail.do?user_email=" + encodeURIComponent(userEmail))
        .then(function(res) { return res.text(); })
        .then(function(data) {
            if (data.trim() === "1") {
                alert("이미 사용 중인 이메일입니다.");
                isEmailChecked = false;
            } else {
                alert("사용 가능한 이메일입니다.");
                isEmailChecked = true; // 중요: 중복 확인 성공 시 상태 업데이트
                emailEl.onchange = function() { isEmailChecked = false; };
            }
        })
        .catch(function(err) { console.error("이메일 중복 체크 오류:", err); });
}

/** 7. 비밀번호 실시간 일치 확인 초기화 */
function initPasswordCheck() {
    var pwConfirmEl = document.getElementById('user_pw_confirm');
    if (!pwConfirmEl) return;

    pwConfirmEl.onkeyup = function() {
        var pw = document.getElementById('user_pw').value;
        var pwConfirm = this.value;
        var msg = document.getElementById('pw_msg');
        var icon = document.getElementById('pw_icon');
        var unlockImg = "/histudy/user-img/pw2-icon.png";
        var lockImg = "/histudy/user-img/pw-icon.png";

        if (pwConfirm === "") { msg.innerHTML = ""; if(icon) icon.src = unlockImg; return; }
        if (pw.length < 7) {
            msg.innerHTML = "비밀번호는 7자리 이상이어야 합니다.";
            msg.style.color = "orange";
            if(icon) icon.src = unlockImg;
            return;
        }
        if (pw === pwConfirm) {
            msg.innerHTML = "비밀번호가 일치합니다.";
            msg.style.color = "green";
            if(icon) icon.src = lockImg;
        } else {
            msg.innerHTML = "비밀번호가 일치하지 않습니다.";
            msg.style.color = "red";
            if(icon) icon.src = unlockImg;
        }
    };
}

/** 8. 회원가입 전체 유효성 검사 */
function validateSignUp() {
    if (!isIdChecked) { alert("아이디 중복 검사를 진행해주세요."); return false; }
    if (!isEmailChecked) { alert("이메일 중복 검사를 진행해주세요."); return false; }

    var pw = document.getElementById('user_pw').value;
    var pwConfirm = document.getElementById('user_pw_confirm').value;
    if (pw.length < 7) { alert("비밀번호는 7자리 이상이어야 합니다."); return false; }
    if (pw !== pwConfirm) { alert("비밀번호가 일치하지 않습니다."); return false; }

    var year = document.getElementById('birth_year').value;
    var month = document.getElementById('birth_month').value;
    var day = document.getElementById('birth_day').value;
    if (!year || !month || !day) { alert("생년월일을 모두 선택해주세요."); return false; }

    var birthdateEl = document.getElementById('user_birthdate');
    if (birthdateEl) birthdateEl.value = year + "-" + month + "-" + day;

    return true;
}

/** 9. 공통 이벤트 리스너 등록 */
document.addEventListener('DOMContentLoaded', function() {
    initPasswordCheck(); // 비밀번호 실시간 체크 활성화
    
    // [A] 로그인 버튼 클릭 위임
    document.addEventListener('click', function(e) {
       
    });

    // [B] 메뉴 바깥쪽 클릭 시 닫기
    document.addEventListener('click', function(e) {
        var menu = document.getElementById('userMenu');
        var dropdown = e.target.closest('.user-dropdown');
        if (menu && !dropdown) menu.style.display = 'none';
    });

    // [C] 회원가입 폼 전송 이벤트 연결
    var signupForm = document.getElementById('signupForm');
    if (signupForm) {
        signupForm.onsubmit = function() { return validateSignUp(); };
    }
});

/** 10. 메뉴 토글 함수 */
function toggleUserMenu(event) {
    if (event) event.stopPropagation();
    var menu = document.getElementById('userMenu');
    if (menu) {
        var isVisible = (menu.style.display === 'block');
        menu.style.display = isVisible ? 'none' : 'block';
    }
}

/** 모든 항목 수정 모드 전환 */
function toggleEditMode(isEdit) {
    const viewElements = document.querySelectorAll('.view-mode');
    const editElements = document.querySelectorAll('.edit-mode');
    const viewBtnGroup = document.getElementById('view-buttons');
    const editBtnGroup = document.getElementById('edit-buttons');

    if (isEdit) {
        // 수정 모드: 텍스트 숨기고 입력창 보이기
        viewElements.forEach(el => el.style.display = 'none');
        editElements.forEach(el => el.style.display = 'block');
        viewBtnGroup.style.display = 'none';
        editBtnGroup.style.display = 'block';
    } else {
        // 읽기 모드: 다시 원상복구
        viewElements.forEach(el => el.style.display = 'block');
        editElements.forEach(el => el.style.display = 'none');
        viewBtnGroup.style.display = 'block';
        editBtnGroup.style.display = 'none';
    }
}

/** 12. 비밀번호 변경 모드로 전환 */
function openPasswordChange(event) {
    if (event) event.preventDefault();
    const profileForm = document.getElementById('profileForm');
    const pwSection = document.getElementById('password-change-section');
    const profileMain = document.getElementById('profile-info-section'); // 섹션 ID 확인 필요

    // profileForm이 아닌 전체 섹션을 숨겨야 함
    if (profileMain && pwSection) {
        profileMain.style.display = 'none';
        pwSection.style.display = 'block';
        const title = document.querySelector('.content-title');
        if(title) title.innerText = "비밀번호 변경";
    }
}

/** 13. 비밀번호 변경 데이터 전송 */
function submitPasswordUpdate() {
    const currentPw = document.getElementById('current_pw').value;
    const newPw = document.getElementById('new_pw').value;
    const confirmPw = document.getElementById('confirm_new_pw').value;
    const userIdx = document.getElementById('user_idx').value;

    if (!currentPw || !newPw || !confirmPw) { alert("모든 필드를 입력해주세요."); return; }
    if (newPw !== confirmPw) { alert("새 비밀번호가 일치하지 않습니다."); return; }
    if (newPw.length < 7) { alert("비밀번호는 7자리 이상이어야 합니다."); return; }

    const formData = new FormData();
    formData.append('user_idx', userIdx);
    formData.append('current_pw', currentPw);
    formData.append('new_pw', newPw);

    fetch(contextPath + "/updatePassword.do", { 
        method: 'POST',
        body: formData
    })
    .then(res => res.text())
    .then(data => {
        const result = data.trim();
        if (result === 'success') {
            alert('비밀번호가 성공적으로 변경되었습니다. 다시 로그인해주세요.');
            location.href = contextPath + "/index.do";
        } else if (result === 'wrong_pw') {
            alert('현재 비밀번호가 일치하지 않습니다.');
        } else {
            alert('비밀번호 변경에 실패했습니다.');
        }
    })
    .catch(err => {
        console.error("비밀번호 변경 중 오류 발생:", err);
    });
}

/** 14. 다시 프로필 화면으로 복구 */
function closePasswordChange() {
    const profileSection = document.getElementById('profile-info-section');
    const pwSection = document.getElementById('password-change-section');
    
    if (profileSection && pwSection) {
        profileSection.style.display = 'block';
        pwSection.style.display = 'none';
        const title = document.querySelector('.content-title');
        if(title) title.innerText = "내 프로필";
    }
}
/**
 * 모든 정보 한꺼번에 서버로 전송
 */
function submitProfileUpdate() {
    const formData = new FormData();
    const userIdx = document.getElementById('user_idx').value;
    formData.append('user_idx', userIdx);
    
    // 안전한 엘리먼트 값 가져오기
    const getValue = (id) => document.getElementById(id) ? document.getElementById(id).value : "";
    
    formData.append('user_name', getValue('name-input'));
    formData.append('user_birthdate', getValue('birthdate-input'));
    formData.append('user_email', getValue('email-input'));
    formData.append('user_tel', getValue('tel-input'));
    formData.append('user_intro', getValue('intro-input'));
    
    const fileInput = document.getElementById('fileInput');
    if (fileInput && fileInput.files[0]) {
        formData.append('uploadFile', fileInput.files[0]);
    }

   // [변경 1] 요청 주소를 절대 경로로 변경
    fetch(contextPath + "/updateProfile.do", { 
        method: 'POST',
        body: formData
    })
    .then(res => res.text())
    .then(data => {
    const result = data.trim();
    
    if (result === "success" || result === "1") {
        alert('프로필이 성공적으로 수정되었습니다.');
        location.href = contextPath + "/myPage.do"; 
    } else {
        // 컨트롤러가 -2를 fail로 바꿔버리므로 여기서 포괄적으로 안내합니다.
        alert('정보 수정에 실패했습니다.\n- 이미 사용 중인 이메일이나 전화번호일 수 있습니다.\n- 혹은 입력한 데이터에 문제가 있습니다.');
    }
})
    .catch(err => console.error("오류:", err));
}
    /** 아이디 찾기 함수 */
    function findUserId() {
    	var name = document.getElementById('find_name').value;
    	var tel = document.getElementById('find_tel').value;
    	
    	if(!name || !tel) {
    	alert("이름과 전화번호 모두 입력");
    	return;
    }
    fetch("userFindId.do", {
    method:"POST",
    headers: {"Content-Type" : "application/json" },
    body: JSON.stringify({
    	user_name : name,
    	user_tel: tel
    	})
    })
    .then(res => res.text())
    .then(data => {
    if(data === "fail") {
    alert("일치하는 정보가 없습니다");
    } else{
    	alert("찾으시는 아이디는 ["+data+"]입니다");
    }
    })
    .catch(err=> console.error("아이디찾기 오류:",err));
    }
    
/** 비밀번호 찾기 함수 */
function findUserPw() {
    var id = document.getElementById('find_pw_id').value;
    var name = document.getElementById('find_pw_name').value;
    var tel = document.getElementById('find_pw_tel').value;

    if (!id || !name || !tel) { alert("모든 정보를 입력해주세요."); return; }

    fetch("userFindPw.do", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ user_id: id, user_name: name, user_tel: tel })
    })
    .then(res => res.text())
    .then(data => {
        if (data.trim() === "fail") {
            alert("회원 정보가 일치하지 않습니다.");
        } else {
            alert("임시 비밀번호가 발급되었습니다: [" + data + "]");
            
            // [수정 포인트] location.href 대신 아래 함수 호출!
            // 이렇게 하면 모달이 유지되면서 로그인 입력창으로 바뀝니다.
            showSection('login'); 
            
            // 발급 후 입력했던 값들 초기화 (선택사항)
            document.getElementById('find_pw_id').value = "";
            document.getElementById('find_pw_name').value = "";
            document.getElementById('find_pw_tel').value = "";
        }
    })
    .catch(err => console.error("비밀번호 찾기 오류:", err));

}
function showSection(sectionId) {
    // 1. 실제 JSP에 정의된 ID들과 매칭
    const sections = {
        'login': 'login-section',
        'find-id': 'find-id-section',
        'find-pw': 'find-pw-section'
    };

    // 2. 모든 섹션을 먼저 숨김
    Object.values(sections).forEach(function(id) {
        const el = document.getElementById(id);
        if (el) el.style.display = 'none';
    });

    // 3. 선택한 섹션만 보여줌
    const targetId = sections[sectionId];
    const targetEl = document.getElementById(targetId);
    if (targetEl) {
        targetEl.style.display = 'block';
    } else {
        console.error("대상 섹션을 찾을 수 없습니다: " + sectionId);
    }
}

