<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hi, Study | 함께 성장하는 학습 플랫폼</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/histudy/css/mainLayout.css">
<link rel="stylesheet" type="text/css" href="/histudy/css/header.css">
<link rel="stylesheet" type="text/css" href="/histudy/css/footer.css">
<link rel="stylesheet" type="text/css" href="/histudy/css/root.css">

<style>
/* --- 2. 로그인 모달 전용 스타일 --- */
#modalOverlay {
    display: none; /* 기본은 숨김 */
    position: fixed; 
    top: 0; left: 0; 
    width: 100%; height: 100%; 
    background: rgba(0,0,0,0.6); 
    z-index: 9999; 
    justify-content: center; 
    align-items: center;
}

.login-modal-box {
    background: white;
    padding: 40px;
    border-radius: 20px;
    width: 400px;
    text-align: center;
    position: relative;
    box-shadow: 0 10px 25px rgba(0,0,0,0.2);
}

/* 입력창 및 아이콘 스타일 */
.login-modal-box .input-group { position: relative; margin-bottom: 15px; }
.login-modal-box .input-group input {
    width: 100%; height: 50px;
    padding: 0 20px 0 50px !important;
    border: 1px solid #ddd;
    border-radius: 10px;
    box-sizing: border-box;
}
.login-modal-box .icon-id { background: url('/histudy/user-img/user-icon.png') no-repeat 15px center / 20px; }
.login-modal-box .icon-pw { background: url('/histudy/user-img/pw-icon.png') no-repeat 15px center / 20px; }

/* 아이디 기억하기 */
.login-modal-box .login-options {
    display: flex;
    align-items: center;
    margin: 15px 0 20px 5px;
    font-size: 14px;
    color: #666;
    cursor: pointer;
    width: fit-content;
}
.login-modal-box .login-options input[type="checkbox"] {
    margin-right: 8px;
    width: 16px; height: 16px;
    cursor: pointer;
}

/* 로그인 버튼 */
.login-modal-box .login-submit-btn {
    width: 100%; height: 50px;
    background-color: black; color: white;
    border: none; border-radius: 10px;
    font-weight: bold; cursor: pointer;
}

/* 하단 링크 (회원가입 등) */
.login-modal-box .login-footer-links {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 25px;
    font-size: 13px;
}
.login-modal-box .login-footer-links a {
    color: #888;
    text-decoration: none;
}
.login-modal-box .login-footer-links a:not(:last-child)::after {
    content: "";
    display: inline-block;
    width: 1px; height: 12px;
    background-color: #eee;
    margin: 0 12px;
    vertical-align: middle;
}
</style>
</head>
<body>

    <%@include file="header.jsp" %>

    <main>
        <section class="home">
            <div class="home__text">
                <p class="description">함께 성장하는</p>
                <h1 class="home__title">Study & Mentoring</h1>
                <p class="description">목표에 맞는 스터디 그룹과 멘토링으로 학습을 이어가세요.</p>
            </div>
            <div class="home__btns">
                <input type="button" value="스터디 시작하기" class="home__btn">
                <input type="button" value="멘토링 신청" class="home__btn" id="applyMentoringBtn">
            </div>
        </section>
        
        <section id="serviceSection" class="section">
            <div class="serviceController max-container">
                <div class="service__text">
                    <p>우리의 서비스</p>
                    <h2>당신의 학습 여정을 <i>완벽하게 지원합니다</i></h2>
                </div>
                <div class="service__grid">
                    <div class="service__grid__items">
                        <div class="service__grid__imgBox"><img src="/histudy/main-img/groupStudy.png"></div>
                        <div class="service__grid__textBox"><h3>그룹 스터디</h3><p>함께 목표 달성</p></div>
                    </div>
                    <div class="service__grid__items">
                        <div class="service__grid__imgBox"><img src="/histudy/main-img/mentoring.png"></div>
                        <div class="service__grid__textBox"><h3>1:1 멘토링</h3><p>전문가의 맞춤 조언</p></div>
                    </div>
                    <div class="service__grid__items">
                        <div class="service__grid__imgBox"><img src="/histudy/main-img/studyCafe.png"></div>
                        <div class="service__grid__textBox"><h3>스터디 카페</h3><p>집중 학습 공간</p></div>
                    </div>
                    <div class="service__grid__items">
                        <div class="service__grid__imgBox"><img src="/histudy/main-img/lectuer.png"></div>
                        <div class="service__grid__textBox"><h3>온라인 강의</h3><p>프리미엄 회원 혜택</p></div>
                    </div>
                </div>
            </div>
        </section>
        
        <section id="MembershipSection" class="section">
            <div class="membershipContainer max-container">
                <div class="membershipBG">
                    <div class="membershipTEXT">
                        <p class="membership-sub">프리미엄 멤버십</p>
                        <h2 class="membership-title">더 많은 혜택을 경험하세요</h2>
                        <button class="membership-btn">멤버십 알아보기</button>
                    </div>
                </div>
            </div>
        </section>
        
        <section id="ReviewSection" class="section">
            <div class="reviewContainer max-container">
                <div class="reviewText">
                    <p>사용자 후기</p>
                    <h2>실제 이용자들의 <i>생생한 경험담</i></h2>
                </div>
                <div class="reviewGrid">
                    <div class="reviewCard">
                        <div class="reviewHeader"><img class="reviewAvatar"><div class="reviewUser"><p class="reviewName">서준범</p><p class="reviewId">seoni65</p></div></div>
                        <p class="reviewContent">"전문 멘토님의 조언 덕분에 진로를 명확하게 설정할 수 있었습니다."</p>
                    </div>
                    </div>
            </div>
        </section>

        <section id="AboutSection" class="section">
            <div class="aboutContainer max-container">
                <div class="aboutLeft">
                    <p>ABOUT US</p>
                    <img src="/histudy/main-img/aboutImg.png">
                </div>
                <div class="aboutRight">
                    <h2>학습의 새로운 패러다임 <i>Hi, Study와 함께</i> 시작하세요</h2>
                    <p>전문 멘토와의 1:1 맞춤 학습부터 그룹 스터디까지 다양한 학습 방법을 제공합니다.</p>
                </div>
            </div>
        </section>
    </main>

    <%@include file="footer.jsp" %>

    <div id="modalOverlay">
        <div id="modalContent" class="login-modal-box">
            </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    
    window.onload = function() {
        // JSP 표현식을 사용하여 request에 담긴 메시지를 가져옵니다.
        // 값이 없을 경우를 대비해 "" 공백 처리를 합니다.
        var message = "${msg}";
        
        if (message && message !== "") {
            alert(message);
        }
    };
        // [1] 헤더 스크롤 효과
        const header = document.querySelector('.header');
        document.addEventListener('scroll', function () {
            if (window.scrollY > 50) {
                header.classList.add('header--white');
            } else {
                header.classList.remove('header--white');
            }
        });

        // [2] 로그인 모달 열기/닫기 (Ajax)
        function openSignInModal() {
            // userSignIn.do 페이지에서 id가 signInFragment인 요소만 로드
            $('#modalContent').load("userSignIn.do #signInFragment", function(response, status, xhr) {
                if (status == "error") {
                    alert("로그인 페이지를 불러오지 못했습니다. 경로를 확인하세요.");
                } else {
                    $('#modalOverlay').css('display', 'flex');
                    // 닫기 버튼 추가
                    $('#modalContent').append('<div onclick="closeSignInModal()" style="position:absolute; right:25px; top:20px; cursor:pointer; font-size:20px; font-weight:bold; color:#666;">&times;</div>');
                }
            });
        }

        function closeSignInModal() {
            $('#modalOverlay').hide();
        }

        // [3] 헤더 로그인 버튼에 클릭 이벤트 강제 연결 (header.jsp 수정 대신 안전한 방법)
        $(document).ready(function() {
            // header__login 클래스를 가진 버튼을 누르면 모달 실행
            $('.header__login').on('click', function(e) {
                e.preventDefault();
                openSignInModal();
            });
        });

        // [4] 검색창/셀렉트박스 커스텀
        const selectBox = document.querySelector('.custom-select');
        const selected = document.querySelector('.selected');
        const options = document.querySelectorAll('.options li');

        if(selectBox) {
            selectBox.addEventListener('click', function(e) {
                e.stopPropagation();
                this.classList.toggle('open');
            });
        }

        options.forEach(option => {
            option.addEventListener('click', function(e) {
                e.stopPropagation();
                selected.innerHTML = this.innerHTML;
                selectBox.classList.remove('open');
            });
        });

        document.addEventListener('click', function() {
            if(selectBox) selectBox.classList.remove('open');
        });
    </script>
</body>
</html>