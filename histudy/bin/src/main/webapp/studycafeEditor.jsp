<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>StudyCafe Editor</title>

<style>

body{
    background:#F1F5F9;
    font-family:Arial;
}

.editor-wrap{
    width:1200px;
    margin:auto;
}

.toolbar button{
    padding:8px 14px;
    margin:6px;
    border:none;
    background:#2563EB;
    color:white;
    border-radius:8px;
    cursor:pointer;
}

svg{
    background:white;
    height:700px;
    box-shadow:0 10px 20px rgba(0,0,0,.1);
}

/* 선택 표시 */
.selected rect{
    stroke:#2563EB;
    stroke-width:3;
}

/* 리사이즈 핸들 */
.handle{
    fill:white;
    stroke:#2563EB;
    stroke-width:2;
    cursor:nwse-resize;
}

</style>
</head>

<body>

<div class="editor-wrap">

<div class="toolbar">
    <button onclick="tool='seat'">좌석</button>
    <button onclick="tool='room'">스터디룸</button>
</div>

<svg id="editor" viewBox="0 0 1200 700"></svg>

</div>

<script>

// SVG 기본 설정
const NS="http://www.w3.org/2000/svg";
const svg=document.getElementById("editor");

let tool="seat";

// 현재 상태
let action=null; // drag | resize
let target=null;
let offsetX=0;
let offsetY=0;


// 마우스 → SVG 좌표 변환 (필수)
function cursor(evt){
    const pt=svg.createSVGPoint();
    pt.x=evt.clientX;
    pt.y=evt.clientY;
    return pt.matrixTransform(svg.getScreenCTM().inverse());
}


// ================= 생성 함수 =================

function createBox(x,y,w,h,color,label,stroke=false){

    const g=document.createElementNS(NS,"g");

    const rect=document.createElementNS(NS,"rect");
    rect.setAttribute("x",x-w/2);
    rect.setAttribute("y",y-h/2);
    rect.setAttribute("width",w);
    rect.setAttribute("height",h);
    rect.setAttribute("fill",color);
    rect.setAttribute("rx",8);

    if(stroke){
        rect.setAttribute("stroke","#6366F1");
        rect.setAttribute("stroke-width","2");
    }

    g.appendChild(rect);

    // 텍스트
    if(label){
        const text=document.createElementNS(NS,"text");
        text.textContent=label;
        text.setAttribute("text-anchor","middle");
        text.setAttribute("dominant-baseline","middle");

        text.setAttribute("x",x);
        text.setAttribute("y",y);

        g.appendChild(text);
    }

    // 리사이즈 핸들
    const handle=document.createElementNS(NS,"circle");
    handle.setAttribute("r",6);
    handle.setAttribute("class","handle");

    g.appendChild(handle);

    updateHandle(g);

    enableElement(g);

    svg.appendChild(g);
}


// 핸들 위치 업데이트
function updateHandle(g){

    const rect=g.querySelector("rect");
    const handle=g.querySelector("circle");

    const x=Number(rect.getAttribute("x"));
    const y=Number(rect.getAttribute("y"));
    const w=Number(rect.getAttribute("width"));
    const h=Number(rect.getAttribute("height"));

    handle.setAttribute("cx",x+w);
    handle.setAttribute("cy",y+h);
}


// 요소 활성화 (드래그 + 리사이즈)
function enableElement(g){

    g.addEventListener("mousedown",(e)=>{

        e.stopPropagation();

        // 선택 표시
        document.querySelectorAll(".selected")
            .forEach(el=>el.classList.remove("selected"));

        g.classList.add("selected");

        const rect=g.querySelector("rect");
        const handle=g.querySelector("circle");

        target=g;

        const c=cursor(e);

        // 핸들 눌렀으면 resize
        if(e.target===handle){

            action="resize";
        }
        else{

            action="drag";

            offsetX=c.x-rect.getAttribute("x");
            offsetY=c.y-rect.getAttribute("y");
        }

    });

}


// ================= SVG에서 생성 =================

// click ❌
// mousedown ✔

svg.addEventListener("mousedown",(e)=>{

    // 빈공간만 생성
    if(e.target!==svg) return;

    const c=cursor(e);

    if(tool==="seat")
        createBox(c.x,c.y,40,40,"#60A5FA","좌석");

    if(tool==="room")
        createBox(c.x,c.y,160,120,"#EEF2FF","스터디룸",true);

});


// ================= 이동 / 크기조절 =================

svg.addEventListener("mousemove",(e)=>{

    if(!action) return;

    const rect=target.querySelector("rect");
    const text=target.querySelector("text");

    const c=cursor(e);

    const x=Number(rect.getAttribute("x"));
    const y=Number(rect.getAttribute("y"));

    // 드래그
    if(action==="drag"){

        const newX=c.x-offsetX;
        const newY=c.y-offsetY;

        rect.setAttribute("x",newX);
        rect.setAttribute("y",newY);

        if(text){
            const w=rect.getAttribute("width");
            const h=rect.getAttribute("height");

            text.setAttribute("x",Number(newX)+Number(w)/2);
            text.setAttribute("y",Number(newY)+Number(h)/2);
        }
    }

    // 리사이즈
    if(action==="resize"){

        const newW=c.x-x;
        const newH=c.y-y;

        if(newW>20) rect.setAttribute("width",newW);
        if(newH>20) rect.setAttribute("height",newH);

        if(text){
            text.setAttribute("x",x+newW/2);
            text.setAttribute("y",y+newH/2);
        }
    }

    updateHandle(target);

});


// 마우스 놓으면 종료
window.addEventListener("mouseup",()=>{

    action=null;
    target=null;

});

</script>

</body>
</html>
