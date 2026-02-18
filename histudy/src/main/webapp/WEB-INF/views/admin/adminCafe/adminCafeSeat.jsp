<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/admin/admin_layout.css" type="text/css">
<%@ include file="../adminCheck.jsp" %>
</head>
<style>
    /* 예약 가능 좌석 */
    .item-seat.available rect { fill: #60A5FA; cursor: pointer; transition: 0.3s; }
    .item-seat.available:hover rect { fill: #2563EB; }
    
    /* 사용 중 좌석 */
    .item-seat.occupied rect { fill: #CBD5E1; cursor: not-allowed; }
    
    /* 스터디룸 스타일 */
    .item-room.available rect { fill: #EEF2FF; stroke: #6366F1; cursor: pointer; }
    .item-room.occupied rect { fill: #F1F5F9; stroke: #94A3B8; cursor: not-allowed; }
</style>
<body id="adminCafeSeat">
<fieldset>
        <legend><strong>관리 중인 카페 : ${param.studycafe_name}</strong></legend>
        <div class="adminCafe">
    <ul class="adminCafe__menu">
  <li class="adminCafe__menu__item"><a href="adminCafeSales.do?studycafe_idx=${param.studycafe_idx}&studycafe_name=${param.studycafe_name}">총 매출확인</a></li>
        <li class="adminCafe__menu__item"><a href="adminCafeSeat.do?studycafe_idx=${param.studycafe_idx}&studycafe_name=${param.studycafe_name}">스터디카페 현황 보기</a></li>
        <li class="adminCafe__menu__item"><a href="adminCafeInquiryList.do?studycafe_idx=${param.studycafe_idx}&studycafe_name=${param.studycafe_name}">스터디카페 문의</a></li>
        <li class="adminCafe__menu__item"><a href="studycafeEditor.do?studycafe_idx=${param.studycafe_idx}&studycafe_name=${param.studycafe_name}">좌석등록</a></li>
        <li class="adminCafe__menu__item"><a href="adminCafePrice.do?studycafe_idx=${param.studycafe_idx}&studycafe_name=${param.studycafe_name}">요금제 등록</a></li>
    </ul>
</div>	
    </fieldset>
<div class="viewer-wrap">
    <h2>${param.studycafe_name} 좌석 현황</h2>
    <div class="status-legend">
        <span class="badge available">■ 이용가능</span>
        <span class="badge occupied">■ 사용중</span>
    </div>

    <svg id="seatViewer" viewBox="0 0 1200 700">
        <image id="bgImage" href="<c:url value='/img/histudy.jpg'/>" x="0" y="0" width="1200" height="700" style="opacity: 0.3;" />
    </svg>
</div>
<script>
// 1. 데이터 로드 및 그리기 (에디터 로직 활용)
function drawLayout(item) {
    const g = document.createElementNS("http://www.w3.org/2000/svg", "g");
    
    // 실시간 상태 확인 (이 부분은 AJAX나 서버 데이터로 'occupied' 클래스를 붙여야 함)
    const statusClass = item.isOccupied ? "occupied" : "available";
    g.setAttribute("class", (item.type === 'ROOM' ? "item-room " : "item-seat ") + statusClass);
    
    const rect = document.createElementNS("http://www.w3.org/2000/svg", "rect");
    rect.setAttribute("x", item.x); rect.setAttribute("y", item.y);
    rect.setAttribute("width", item.width); rect.setAttribute("height", item.height);
    rect.setAttribute("rx", 4);
    
    const text = document.createElementNS("http://www.w3.org/2000/svg", "text");
    text.textContent = item.label;
    text.setAttribute("x", item.x + item.width/2);
    text.setAttribute("y", item.y + item.height/2);
    text.setAttribute("text-anchor", "middle");
    text.setAttribute("dominant-baseline", "middle");

    g.appendChild(rect);
    g.appendChild(text);

    // 2. 클릭 이벤트 추가: 사용 가능할 때만 결제 페이지로 이동
    if(!item.isOccupied) {
        g.addEventListener("click", () => {
            if(confirm(item.label + "번 좌석을 예약하시겠습니까?")) {
                // 결제/이용권 선택 페이지로 이동 (좌석 인덱스 전달)
                location.href = "buyPass.do?studycafe_idx=${param.studycafe_idx}&seat_label=" + encodeURIComponent(item.label) + "&type=" + item.type;
            }
        });
    }
    
    document.getElementById("seatViewer").appendChild(g);
}

// 초기 로드 시 실행 (서버에서 넘겨준 layoutList 반복문)
window.onload = function() {
    <c:forEach var="item" items="${layoutList}">
        drawLayout({
            type: "${item.type}",
            label: "${item.label}",
            x: ${item.x},
            y: ${item.y},
            width: ${item.width},
            height: ${item.height},
            isOccupied: ${item.isOccupied == 'Y' ? true : false} // DB에서 사용여부 가져옴
        });
    </c:forEach>
};
</script>
</body>
</html>
