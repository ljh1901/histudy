<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - Hi, Study</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/root.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/user/loginModal.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/mypage.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/footer.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/header.css">
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="mypage-wrapper">
		<div class="mypage-container">
			<aside class="mypage-sidebar">
				<nav class="sidebar-nav">
					<ul>
						<li><a href="myPage.do"><img src="mypage-img/user.png" width="30">프로필</a>
						<li><a href="myDashboard.do"><img src="mypage-img/report.png" width="30">대시보드</a>
						<li><a href="mySchedule.do"><img src="mypage-img/calendar.png" width="30">일정관리</a>
						<li><a href="myPurchase.do"><img src="mypage-img/shopping-cart.png" width="30">구매 / 혜택</a>
						<li><a href="myHeart.do"><img src="mypage-img/heart.png" width="30">찜 목록</a>
						<li><a href="myAlarm.do"><img src="mypage-img/bell.png" width="30">알림 설정</a>
						</li>
					</ul>
				</nav>
			</aside>

			<main class="mypage-main">
				<h2 class="content-title">내 프로필</h2>

				<form action="${pageContext.request.contextPath}/updateProfile.do"
					method="post" enctype="multipart/form-data">
					<input type="hidden" id="user_idx" value="${user.user_idx}">
					<div class="profile-card">
						<div class="profile-image-section">
							<div class="image-container">
								<img
									src="mypage-img/${user.profile_img}"
									id="profilePreview">
							</div>

							<input type="file" name="uploadFile" id="fileInput"
								style="display: none;" accept="image/*"
								onchange="readURL(this);">
							<button type="button" class="btn-img-change edit-mode" style="display: none;"
  							    onclick="document.getElementById('fileInput').click();">변경</button>
							<p class="img-guide">
								png, jpg, jpeg의 확장자<br>1MB 이하의 이미지
							</p>
						</div>

						<div class="profile-info-section">
							<table class="profile-table">
							<c:if test="${sessionScope.membership == 'premium'}">
							    <tr>
							        <th style="color: gold;">프리미엄 멤버</th>
							        <td>
							            <c:forEach var="pay" items="${list}">
							                <c:if test="${pay.PAY_TYPE == '멤버십'}">
							                    ${pay.PAY_DATE}&nbsp;~&nbsp;${pay.END_DATE}
							                </c:if>
							            </c:forEach>
							        </td>
							    </tr>
							</c:if>
								<tr>
									<th>이름</th>
									<td><span class="view-mode">${user.user_name}</span> <input
										type="text" id="name-input" class="edit-mode"
										value="${user.user_name}" style="display: none;"></td>
								</tr>
								<tr>
									<th>생년월일</th>
									<td><span class="view-mode">${user.user_age}세</span> <input
										type="date" id="birthdate-input" class="edit-mode"
										value="${user.user_birthdate}" style="display: none;"></td>
								</tr>
								<tr>
									<th>이메일</th>
									<td><span class="view-mode">${user.user_email}</span> <input
										type="email" id="email-input" class="edit-mode"
										value="${user.user_email}" style="display: none;"></td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td><span class="view-mode">${user.user_tel}</span> <input
										type="text" id="tel-input" class="edit-mode"
										value="${user.user_tel}" style="display: none;"></td>
								</tr>
								<tr>
									<th>자기소개</th>
									<td>
										<div id="intro-text" class="view-mode user-info-display"
											style="padding: 10px; line-height: 1.5;">
											${user.user_intro}</div> <textarea id="intro-input"
											class="edit-mode user-intro-edit" rows="5"
											style="display: none; width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 5px; resize: none;">${user.user_intro}</textarea>
									</td>
								</tr>
							</table>
							<div style="text-align: right; margin-top: 20px;">
								<div id="view-buttons">
									<button type="button" onclick="toggleEditMode(true)"
										style="background-color: #4A90E2; color: white; border: none; padding: 10px 20px; border-radius: 5px; cursor: pointer; font-weight: bold;">
										수정하기</button>
								</div>

								<div id="edit-buttons" style="display: none;">
									<button type="button" onclick="submitProfileUpdate()"
										style="background-color: #28a745; color: white; border: none; padding: 10px 20px; border-radius: 5px; cursor: pointer; font-weight: bold; margin-right: 5px;">
										저장</button>
									<button type="button" onclick="toggleEditMode(false)"
										style="background-color: #6c757d; color: white; border: none; padding: 10px 20px; border-radius: 5px; cursor: pointer; font-weight: bold;">
										취소</button>
								</div>
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
		// ===== 전역 변수 =====
		var today = new Date();
		var viewYear = today.getFullYear();
		var viewMonth = today.getMonth(); // 0~11

		var selectedDateKey = null; // "YYYY-MM-DD"

		var calendarBody = document.getElementById("calendar-body");
		var labelMonth = document.getElementById("label-month");
		var labelDate = document.getElementById("label-date");
		var memoText = document.getElementById("memo-text");

		// ===== 유틸 함수 =====
		function makeDateKey(dateObj) {
			var y = dateObj.getFullYear();
			var m = dateObj.getMonth() + 1;
			var d = dateObj.getDate();

			if (m < 10) {
				m = "0" + m;
			}
			if (d < 10) {
				d = "0" + d;
			}

			return y + "-" + m + "-" + d; // 예: 2025-11-20
		}

		function loadMemo(dateKey) {
			var memo = localStorage.getItem("memo_" + dateKey);
			if (memo == null) {
				return "";
			}
			return memo;
		}

		function saveMemo(dateKey, memo) {
			if (memo == null || memo.trim() === "") {
				localStorage.removeItem("memo_" + dateKey);
			} else {
				localStorage.setItem("memo_" + dateKey, memo);
			}
		}

		// 긴 메모 → 한 줄 요약(최대 10글자 정도)
		function makePreviewText(memo) {
			if (memo == null) {
				return "";
			}
			// 개행 제거
			memo = memo.replace(/\r/g, "");
			var idx = memo.indexOf("\n");
			if (idx !== -1) {
				memo = memo.substring(0, idx);
			}
			// 너무 길면 10글자만 표시
			if (memo.length > 10) {
				memo = memo.substring(0, 10) + "...";
			}
			return memo;
		}

		// ===== 달력 그리기 =====
		function drawCalendar(year, month) {
			// 상단 "YYYY년 M월"
			labelMonth.textContent = year + "년 " + (month + 1) + "월";

			// 이번 달 1일, 마지막 날
			var firstDayObj = new Date(year, month, 1);
			var lastDayObj = new Date(year, month + 1, 0);

			var firstWeekDay = firstDayObj.getDay(); // 0~6 (일~토)
			var lastDateNum = lastDayObj.getDate(); // 28~31

			// tbody 비우기
			calendarBody.innerHTML = "";

			var dateNum = 1;
			var week, day;

			// 최대 6주(6행)
			for (week = 0; week < 6; week++) {
				var rowHtml = "<tr>";

				// 7일(7열)
				for (day = 0; day < 7; day++) {
					var cellHtml = "";
					var attr = "";

					// 첫 주의 경우 시작 요일 전까지 빈칸
					if (week === 0 && day < firstWeekDay) {
						// 빈 칸
						cellHtml = "";
					} else if (dateNum > lastDateNum) {
						// 이번 달 날짜를 다 채웠으면 나머지도 빈칸
						cellHtml = "";
					} else {
						// 실제 날짜
						var cellDateObj = new Date(year, month, dateNum);
						var key = makeDateKey(cellDateObj);

						var memo = loadMemo(key);
						var preview = makePreviewText(memo);

						attr = ' data-date="' + key + '"';

						cellHtml = "<div>" + dateNum + "</div>";
						if (preview !== "") {
							cellHtml += '<div class="memo-preview">' + preview
									+ "</div>";
						}

						dateNum = dateNum + 1;
					}

					rowHtml += "<td" + attr + ">" + cellHtml + "</td>";
				}

				rowHtml += "</tr>";
				calendarBody.innerHTML += rowHtml;
			}

			// 셀 클릭 이벤트 다시 설정
			setCellClickEvents();

			// 선택 정보 초기화
			labelDate.textContent = "날짜를 선택하세요";
			memoText.value = "";
		}

		// ===== 셀 클릭 이벤트 설정 =====
		function setCellClickEvents() {
			var tds = calendarBody.getElementsByTagName("td");
			var i;

			for (i = 0; i < tds.length; i++) {
				tds[i].onclick = function() {
					var key = this.getAttribute("data-date");
					if (!key) {
						return; // 빈 칸
					}

					clearSelectedClass();

					this.classList.add("selected");

					selectedDateKey = key;
					labelDate.textContent = key + " 일정";
					memoText.value = loadMemo(key);
				};
			}
		}

		function clearSelectedClass() {
			var tds = calendarBody.getElementsByTagName("td");
			var i;
			for (i = 0; i < tds.length; i++) {
				tds[i].classList.remove("selected");
			}
		}

		// ===== 이전/다음 달 버튼 =====
		document.getElementById("btn-prev").onclick = function() {
			viewMonth = viewMonth - 1;
			if (viewMonth < 0) {
				viewMonth = 11;
				viewYear = viewYear - 1;
			}
			drawCalendar(viewYear, viewMonth);
		};

		document.getElementById("btn-next").onclick = function() {
			viewMonth = viewMonth + 1;
			if (viewMonth > 11) {
				viewMonth = 0;
				viewYear = viewYear + 1;
			}
			drawCalendar(viewYear, viewMonth);
		};

		// ===== 메모 저장 버튼 =====
		document.getElementById("btn-save").onclick = function() {
			if (selectedDateKey == null) {
				alert("먼저 날짜를 선택하세요.");
				return;
			}
			saveMemo(selectedDateKey, memoText.value);
			alert("저장되었습니다.");

			// 다시 그려서 미리보기 반영
			drawCalendar(viewYear, viewMonth);

			// 다시 선택 표시
			var tds = calendarBody.getElementsByTagName("td");
			var i;
			for (i = 0; i < tds.length; i++) {
				if (tds[i].getAttribute("data-date") === selectedDateKey) {
					tds[i].classList.add("selected");
				}
			}
			labelDate.textContent = selectedDateKey + " 일정";
			memoText.value = loadMemo(selectedDateKey);
		};
		// ===== 메모 삭제 버튼 ===== (메모 저장 버튼 아래에 추가)
		document.getElementById("btn-delete").onclick = function() {
			if (selectedDateKey == null) {
				alert("먼저 날짜를 선택하세요.");
				return;
			}

			if (confirm("정말 이 날짜의 메모를 삭제하시겠습니까?")) {
				saveMemo(selectedDateKey, ""); // 빈 문자열로 저장하면 삭제됨
				alert("삭제되었습니다.");

				// 다시 그려서 미리보기 제거
				drawCalendar(viewYear, viewMonth);

				// 다시 선택 표시
				var tds = calendarBody.getElementsByTagName("td");
				var i;
				for (i = 0; i < tds.length; i++) {
					if (tds[i].getAttribute("data-date") === selectedDateKey) {
						tds[i].classList.add("selected");
					}
				}
				labelDate.textContent = selectedDateKey + " 일정";
				memoText.value = "";
			}
		};

		// ===== 처음 페이지 로드 시 현재 달 표시 =====
		drawCalendar(viewYear, viewMonth);

		// ===== 기존 버튼 이동 =====
		document.getElementById("goMovie").onclick = function() {
			location.href = "/fvsb/admin/movieAllList.jsp";
		};
		document.getElementById("goActor").onclick = function() {
			location.href = "/fvsb/admin/actorList.jsp";
		};
		document.getElementById("goUsers").onclick = function() {
			location.href = "/fvsb/admin/usersList.jsp";
		};
		document.getElementById("goBbs").onclick = function() {
			location.href = "/fvsb/admin/adminBbsList.jsp";
		};
		document.getElementById("goQna").onclick = function() {
			location.href = "/fvsb/admin/adminQnaList.jsp";
		};
		document.getElementById("goVote").onclick = function() {
			location.href = "/fvsb/poll/pollCreate.jsp";
		};
	</script>
	<script>
    var contextPath = "${pageContext.request.contextPath}";
</script>
	<script src="${pageContext.request.contextPath}/js/user/user.js"></script>
	<%@ include file="../footer.jsp"%>
</body>
</html>