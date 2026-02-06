<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - Hi, Study</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/root.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/loginModal.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
</head>
<body>
<%@ include file="../header.jsp" %>
    <div class="mypage-wrapper">
        <div class="mypage-container">
            <aside class="mypage-sidebar">
                <nav class="sidebar-nav">
                    <ul>
                        <li class="active">
                            <a href="#"><img src="mypage-img/profile-icon.png" alt="프로필"> 프로필</a>
                        </li>
                        <li>
                            <a href="#"><img src="mypage-img/dash-icon.png" alt="대시보드"> 대시보드</a>
                        </li>
                        <li>
                            <a href="#"><img src="mypage-img/calendar-icon.png" alt="일정관리"> 일정관리</a>
                        </li>
                        <li>
                            <a href="#"><img src="mypage-img/cart-icon.png" alt="구매"> 구매 / 혜택</a>
                        </li>
                    </ul>
                </nav>
            </aside>

            <main class="mypage-main">
                <h2 class="content-title">내 프로필</h2>

                <form action="${pageContext.request.contextPath}/updateProfile.do" method="post" enctype="multipart/form-data">
                    <div class="profile-card">
                        <div class="profile-image-section">
                            <div class="image-container">
                                <img src="mypage-img/${not empty user.profile_img ? user.profile_img : 'zoro.jpg'}" id="profilePreview">
                            </div>
                            
                            <input type="file" name="uploadFile" id="fileInput" style="display:none;" accept="image/*" onchange="readURL(this);">
                            <button type="button" class="btn-img-change" onclick="document.getElementById('fileInput').click();">변경</button>
                            
                            <p class="img-guide">
                                png, jpg, jpeg의 확장자<br>1MB 이하의 이미지
                            </p>
                        </div>

                        <div class="profile-info-section">
                            <table class="profile-table">
                                <tr>
                                    <th>이름</th>
                                    <td>${user.user_name}</td>
                                </tr>
                                <tr>
                                    <th>나이</th>
                                    <td>${user.user_age}세</td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td>${user.user_email}</td>
                                </tr>
                                <tr>
                                    <th>전화번호</th>
                                    <td>${user.user_tel}</td>
                                </tr>
                                <tr>
                                    <th>자기소개</th>
                                    <td>
                                        <textarea name="user_intro" class="user-intro-edit" rows="5" 
                                            style="width:100%; padding: 10px; border: 1px solid #ddd; border-radius: 5px; resize: none;" 
                                            placeholder="자기소개를 입력해주세요.">${user.user_intro}</textarea>
                                    </td>
                                </tr>
                            </table>
                            
                            <div style="text-align: right; margin-top: 20px;">
                                <button type="submit" style="background-color: #4A90E2; color: white; border: none; padding: 10px 20px; border-radius: 5px; cursor: pointer; font-weight: bold;">
                                    수정
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </main>
        </div>
    </div>

 

    <script>
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    document.getElementById('profilePreview').src = e.target.result;
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
    <script src="${pageContext.request.contextPath}/js/user/user.js"></script>
<%@ include file="../footer.jsp" %>
</body>
</html>