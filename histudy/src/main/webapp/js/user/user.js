    // 2. 로그인 함수 
	function loginCheck(){
		return fetch("userSignIn.do", 
		{method: "POST",
		 headers: {
		 	"Content-Type":"application/json"	
		 },
		 body:JSON.stringify({
		 	user_id: document.login.user_id.value,
		 	user_pwd: document.login.user_pwd.value,
		 	remember_id: document.login.rememberId.checked ? "on" : null
		 })
		})
		.then(function(res){
			return res.text();
		})
		.then(function(data){
			alert(data);
			location.reload();
		})
	
	}

function getCookie(name){

    const cookies = document.cookie.split(";");

    for(let i=0; i<cookies.length; i++){

        const cookie = cookies[i].trim();

        if(cookie.indexOf(name + "=") === 0){
            return cookie.substring(name.length + 1);
        }
    }
    return null;
}

function openSignInModal() {
    $('#modalContent').load("userSignIn.do #signInFragment", function() {
        $('#modalOverlay').css('display', 'flex');
		const id = getCookie("id");

		if(id){
    		document.querySelector('#modalContent input[name="user_id"]').value = id;
    		document.querySelector('#modalContent input[name="rememberId"]').checked = true;
		}
        // 닫기 버튼 추가
        if($('#modalContent .close-btn').length === 0) {
            $('#modalContent').append('<div class="close-btn" onclick="closeSignInModal()" style="position:absolute; right:25px; top:20px; cursor:pointer; font-size:20px; font-weight:bold; color:#666;">&times;</div>');
        }
    });
}



    function closeSignInModal() {
        $('#modalOverlay').hide();
    } 

    $(document).ready(function() {
        $(document).on('click', '.header__login', function(e) { 
            e.preventDefault();
            openSignInModal();
        }); 
    });
 // [1] 메뉴 토글 함수
    function toggleUserMenu(event) {
        if (event) event.stopPropagation(); // 이벤트 버블링 방지
        const menu = document.getElementById('userMenu');
        const isVisible = menu.style.display === 'block';
        menu.style.display = isVisible ? 'none' : 'block';
    }

    // [2] 메뉴 바깥쪽 클릭 시 닫기 (더 안전한 방식)
    $(document).on('click', function(e) {
        const $target = $(e.target);
        // 클릭한 곳이 드롭다운 버튼이나 메뉴 내부가 아니라면 닫기
        if (!$target.closest('.user-dropdown').length) {
            $('#userMenu').hide();
        }
    });
