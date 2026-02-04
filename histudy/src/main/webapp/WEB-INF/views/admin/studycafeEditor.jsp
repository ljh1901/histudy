<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>StudyCafe Editor - ${param.studycafe_name}</title>
<link rel="stylesheet" href="css/admin_layout.css" type="text/css">
<style>
    html, body { 
        height: 100%; 
        margin: 0; 
        padding: 0; 
        overflow: hidden;
    }

    body { 
        background: #F1F5F9; 
        font-family: 'Pretendard', Arial, sans-serif; 
        display: flex;
        flex-direction: column;
    }

    .editor-wrap { 
        width: 98%; 
        max-width: 1400px;
        margin: 0 auto;
        height: 100vh;
        display: flex;
        flex-direction: column;
        padding: 10px 0;
        box-sizing: border-box;
    }
    .toolbar { 
        background: white; 
        padding: 8px 16px; 
        border-radius: 8px; 
        margin-bottom: 8px; 
        box-shadow: 0 2px 5px rgba(0,0,0,0.05);
        display: flex; 
        justify-content: space-between; 
        align-items: center;
        flex-shrink: 0; /* 높이 고정 */
    }

    .tool-group button {
        padding: 6px 12px; 
        margin-right: 4px; 
        border: none;
        background: #2563EB; 
        color: white; 
        border-radius: 6px; 
        cursor: pointer;
        font-size: 13px;
    }

    .save-btn {
        padding: 6px 18px; 
        border: none; 
        background: #10B981;
        color: white; 
        border-radius: 6px; 
        cursor: pointer; 
        font-weight: bold;
        font-size: 13px;
    }

    svg { 
        background: white; 
        width: 100%; 
        flex-grow: 1; /* 남은 공간 다 차지 */
        min-height: 0; /* flex 버그 방지 */
        box-shadow: 0 4px 12px rgba(0,0,0,0.08); 
        border-radius: 8px; 
        border: 1px solid #E2E8F0;
        display: block;
    }

    .selected rect { stroke: #2563EB; stroke-width: 3; }
    .handle { fill: white; stroke: #2563EB; stroke-width: 2; cursor: nwse-resize; }
    text { font-size: 12px; font-weight: bold; pointer-events: none; user-select: none; fill: #1E293B; }
</style>
</head>
<body>

<div class="editor-wrap">
<fieldset>
        <legend><strong >관리 중인 카페 : ${param.studycafe_name}</strong></legend>
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
    <svg id="editor" viewBox="0 0 1200 700">
     <div class="toolbar">
        <div class="tool-group">
            <button onclick="tool='seat'">좌석 추가</button>
            <button onclick="tool='room'">스터디룸 추가</button>
        </div>
        <div>
            <span style="margin-right:20px; font-size:14px; color:#64748b;">
                카페: <strong>${param.studycafe_name}</strong>
            </span>
            <button class="save-btn" onclick="saveLayout()">배치 저장하기</button>
        </div>
    </div></svg>
</div>

<script>
const NS = "http://www.w3.org/2000/svg";
const svg = document.getElementById("editor");

let tool = "seat";
let action = null; 
let target = null;
let offsetX = 0, offsetY = 0;

function getNextNumber(type) {
    const texts = Array.from(svg.querySelectorAll("text")).map(t => t.textContent);
    const filterKeyword = type === "seat" ? "좌석" : "룸";
    const usedNums = texts.filter(t => t.includes(filterKeyword)).map(t => parseInt(t)).filter(n => !isNaN(n)).sort((a, b) => a - b);
    let next = 1;
    for (let num of usedNums) { if (num === next) next++; else if (num > next) break; }
    return next;
}

function cursor(evt) {
    const pt = svg.createSVGPoint();
    pt.x = evt.clientX; pt.y = evt.clientY;
    return pt.matrixTransform(svg.getScreenCTM().inverse());
}

function createBox(x, y, w, h, color, label, isRoom=false) {
    const g = document.createElementNS(NS, "g");
    g.setAttribute("class", isRoom ? "item-room" : "item-seat");
    const rect = document.createElementNS(NS, "rect");
    rect.setAttribute("x", x - w / 2);
    rect.setAttribute("y", y - h / 2);
    rect.setAttribute("width", w);
    rect.setAttribute("height", h);
    rect.setAttribute("fill", color);
    rect.setAttribute("rx", 6);
    if (isRoom) { rect.setAttribute("stroke", "#6366F1"); rect.setAttribute("stroke-width", "2"); }
    g.appendChild(rect);
    if (label) {
        const text = document.createElementNS(NS, "text");
        text.textContent = label;
        text.setAttribute("text-anchor", "middle");
        text.setAttribute("dominant-baseline", "middle");
        text.setAttribute("x", x);
        text.setAttribute("y", y);
        g.appendChild(text);
    }
    const handle = document.createElementNS(NS, "circle");
    handle.setAttribute("r", 6);
    handle.setAttribute("class", "handle");
    g.appendChild(handle);
    updateHandle(g);
    enableElement(g);
    svg.appendChild(g);
}

function updateHandle(g) {
    const rect = g.querySelector("rect");
    const handle = g.querySelector("circle");
    const x = Number(rect.getAttribute("x")), y = Number(rect.getAttribute("y"));
    const w = Number(rect.getAttribute("width")), h = Number(rect.getAttribute("height"));
    handle.setAttribute("cx", x + w); handle.setAttribute("cy", y + h);
}

function enableElement(g) {
    g.addEventListener("mousedown", (e) => {
        e.stopPropagation();
        document.querySelectorAll(".selected").forEach(el => el.classList.remove("selected"));
        g.classList.add("selected");
        target = g;
        const c = cursor(e);
        if (e.target.classList.contains("handle")) action = "resize";
        else {
            action = "drag";
            offsetX = c.x - g.querySelector("rect").getAttribute("x");
            offsetY = c.y - g.querySelector("rect").getAttribute("y");
        }
    });
}

svg.addEventListener("mousedown", (e) => {
    if (e.target !== svg) return;
    const c = cursor(e);
    if (tool === "seat") createBox(c.x, c.y, 40, 40, "#60A5FA", getNextNumber("seat") + "번 좌석");
    else createBox(c.x, c.y, 160, 120, "#EEF2FF", getNextNumber("room") + "번 룸", true);
});

svg.addEventListener("mousemove", (e) => {
    if (!action) return;
    const rect = target.querySelector("rect"), text = target.querySelector("text"), c = cursor(e);
    const x = Number(rect.getAttribute("x")), y = Number(rect.getAttribute("y"));
    if (action === "drag") {
        const nx = c.x - offsetX, ny = c.y - offsetY;
        rect.setAttribute("x", nx); rect.setAttribute("y", ny);
        if (text) {
            text.setAttribute("x", nx + Number(rect.getAttribute("width")) / 2);
            text.setAttribute("y", ny + Number(rect.getAttribute("height")) / 2);
        }
    } else if (action === "resize") {
        const nw = Math.max(20, c.x - x), nh = Math.max(20, c.y - y);
        rect.setAttribute("width", nw); rect.setAttribute("height", nh);
        if (text) { text.setAttribute("x", x + nw / 2); text.setAttribute("y", y + nh / 2); }
    }
    updateHandle(target);
});

window.addEventListener("mouseup", () => { action = null; target = null; });
window.addEventListener("keydown", (e) => {
    if (e.key === "Delete" || e.key === "Backspace") {
        const sel = document.querySelector(".selected");
        if (sel && confirm("삭제하시겠습니까?")) sel.remove();
    }
});

function saveLayout() {
    const items = [];
    svg.querySelectorAll("g").forEach(g => {
        const rect = g.querySelector("rect");
        const text = g.querySelector("text");
        items.push({
            label: text.textContent,
            x: parseFloat(rect.getAttribute("x")),
            y: parseFloat(rect.getAttribute("y")),
            width: parseFloat(rect.getAttribute("width")),
            height: parseFloat(rect.getAttribute("height")),
            type: g.classList.contains("item-room") ? "ROOM" : "SEAT"
        });
    });
    const studycafe_idx = "${param.studycafe_idx}";
    fetch("saveCafeLayoutAction.do", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ studycafe_idx: studycafe_idx, layout: items })
    })
    .then(res => res.json())
    .then(data => { if(data.status === "success") alert("저장되었습니다!"); else alert("실패"); })
    .catch(err => console.error("Error:", err));
}

// ================= 수정된 로드 로직 =================
window.onload = function() {
    console.log("페이지 로드 완료 - 복원 시작");
    
    // 데이터가 아예 없을 경우를 대비한 안전한 배열 생성
    const savedLayout = [];
    
    <c:forEach var="item" items="${layoutList}">
        savedLayout.push({
            // MyBatis의 대소문자 무관하게 값을 가져오기 위한 처리
            type: "${item.TYPE != null ? item.TYPE : item.type}",
            label: "${item.LABEL != null ? item.LABEL : item.label}",
            x: Number("${item.X != null ? item.X : item.x}"),
            y: Number("${item.Y != null ? item.Y : item.y}"),
            width: Number("${item.WIDTH != null ? item.WIDTH : item.width}"),
            height: Number("${item.HEIGHT != null ? item.HEIGHT : item.height}")
        });
    </c:forEach>

    console.log("불러온 데이터 리스트:", savedLayout);

    savedLayout.forEach(item => {
        // 데이터가 유효한 경우에만 그림
        if (item.label) {
            // createBox는 중심점 기반이므로 (x + 너비/2) 형태로 보정하여 호출
            createBox(
                item.x + (item.width / 2),
                item.y + (item.height / 2),
                item.width,
                item.height,
                item.type === 'SEAT' ? "#60A5FA" : "#EEF2FF",
                item.label,
                item.type === 'ROOM'
            );
        }
    });
};
</script>
</body>
</html>