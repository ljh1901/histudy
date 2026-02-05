<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멘토링 개설</title>
<link rel="stylesheet" href="css/root.css" type="text/css">
<link rel="stylesheet" href="css/header.css" type="text/css">
<link rel="stylesheet" href="css/footer.css" type="text/css">
<link rel="stylesheet" href="css/mentoringDesign/mentoringCreate.css" type="text/css">
</head>

<body id="mentoringCreatePage">
<%@ include file="../header.jsp"%>

<section class="mentoringCreate">


  <form id="mentoringOpenForm" method="post" action="<c:url value='/mentoringCreate.do'/>">

 
    <input type="hidden" id="sc_idx" name="sc_idx" value="">
    <input type="hidden" id="skill_tags" name="skill_tags" value="">
    <input type="hidden" id="schedule_json" name="schedule_json" value="[]">

    <div class="card">
      <h3 class="section-title">기본 정보</h3>

      <div class="grid-2">
        <div>
          <label class="required">연락 가능한 번호</label>
          <input type="text" name="contact_phone_public" placeholder="010-1234-5678">
        </div>
        <div>
          <label class="required">연락 가능한 이메일</label>
          <input type="text" name="contact_email_public" placeholder="example@example.com">
        </div>
      </div>
    </div>

    <!-- 2 카테고리 -->
    <div class="card">
      <h3 class="section-title">카테고리</h3>

      <div class="cat-grid">
        <button type="button" class="cat-btn" data-val="1" onclick="pickCategory(this)">개발/프로그래밍</button>
        <button type="button" class="cat-btn" data-val="2" onclick="pickCategory(this)">언어</button>
        <button type="button" class="cat-btn" data-val="3" onclick="pickCategory(this)">취업</button>
        <button type="button" class="cat-btn" data-val="4" onclick="pickCategory(this)">자격증</button>
        <button type="button" class="cat-btn" data-val="5" onclick="pickCategory(this)">학업</button>
      </div>

      <div class="hint">카테고리 1개를 선택해 주세요.</div>
    </div>

    <!-- 3 멘토링 정보 -->
    <div class="card">
      <h3 class="section-title">멘토링 정보 - 예시 보기</h3>

      <div style="margin-bottom:12px;">
        <label class="required">멘토링명 (한 줄 요약)</label>
        <input type="text" name="mentoring_title" placeholder="예) 개발자 취업 / 면접 / 자격증">
      </div>

      <div class="grid-2" style="margin-bottom:12px;">
        <div>
          <label class="required">멘토 직군</label>
          <input type="text" name="job_group" placeholder="예) 개발 / 디자인 / 기획">
        </div>
        <div>
          <label class="required">멘토 직무</label>
          <input type="text" name="job_role" placeholder="예) 백엔드 / 프론트 / 데이터">
        </div>
      </div>

      <div class="grid-2" style="margin-bottom:8px;">
        <div>
          <label class="required">멘토 경력(년차)</label>
          <input type="number" name="career_years" min="0" placeholder="예) 3">
          <div class="hint danger">* 멘토님의 직군/직무와 경력은 선택해 주세요.</div>
        </div>

        <div>
          <label>현재 소속 회사명</label>
          <input type="text" name="company_name" placeholder="예) 하이스터디">
        </div>
      </div>

      <div style="margin-top:14px;">
        <label>멘토링 스킬태그 (최대 5개)</label>
        <div class="tag-row">
          <input type="text" id="tagInput" placeholder="태그 입력 (예: java, html, css, javascript)">
          <button type="button" class="tag-add" onclick="addTag()">추가</button>
        </div>
        <div class="chips" id="tagChips"></div>
      </div>

      <div style="margin-top:14px;">
        <label class="required">1회 시간</label>
        <select name="session_minutes" id="session_minutes">
          <option value="">선택</option>
          <option value="60">1시간</option>
          <option value="120">2시간</option>
          <option value="180">3시간</option>
        </select>
        <div class="hint">시간 선택 후 스케줄을 클릭하면, 선택한 시간만큼 연속으로 자동 선택됩니다.</div>
      </div>

      <div style="margin-top:14px;">
        <label class="required">스케줄 선정 (멘토링 가능한 일정을 선택해주세요)</label>
        <div class="schedule-wrap">
          <table class="schedule" id="scheduleTable">
            <thead>
              <tr>
                <th class="time-col"></th>
                <th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th><th>일</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td class="time-col">14:00</td>
                <td class="slot" data-day="MON" data-time="14:00" onclick="onSlotClick(this)"></td>
                <td class="slot" data-day="TUE" data-time="14:00" onclick="onSlotClick(this)"></td>
                <td class="slot" data-day="WED" data-time="14:00" onclick="onSlotClick(this)"></td>
                <td class="slot" data-day="THU" data-time="14:00" onclick="onSlotClick(this)"></td>
                <td class="slot" data-day="FRI" data-time="14:00" onclick="onSlotClick(this)"></td>
                <td class="slot" data-day="SAT" data-time="14:00" onclick="onSlotClick(this)"></td>
                <td class="slot" data-day="SUN" data-time="14:00" onclick="onSlotClick(this)"></td>
              </tr>
              <tr>
                <td class="time-col">15:00</td>
                <td class="slot" data-day="MON" data-time="15:00" onclick="onSlotClick(this)"></td>
                <td class="slot" data-day="TUE" data-time="15:00" onclick="onSlotClick(this)"></td>
                <td class="slot" data-day="WED" data-time="15:00" onclick="onSlotClick(this)"></td>
                <td class="slot" data-day="THU" data-time="15:00" onclick="onSlotClick(this)"></td>
                <td class="slot" data-day="FRI" data-time="15:00" onclick="onSlotClick(this)"></td>
                <td class="slot" data-day="SAT" data-time="15:00" onclick="onSlotClick(this)"></td>
                <td class="slot" data-day="SUN" data-time="15:00" onclick="onSlotClick(this)"></td>
              </tr>
              <tr>
                <td class="time-col">16:00</td>
                <td class="slot" data-day="MON" data-time="16:00" onclick="onSlotClick(this)"></td>
                <td class="slot" data-day="TUE" data-time="16:00" onclick="onSlotClick(this)"></td>
                <td class="slot" data-day="WED" data-time="16:00" onclick="onSlotClick(this)"></td>
                <td class="slot" data-day="THU" data-time="16:00" onclick="onSlotClick(this)"></td>
                <td class="slot" data-day="FRI" data-time="16:00" onclick="onSlotClick(this)"></td>
                <td class="slot" data-day="SAT" data-time="16:00" onclick="onSlotClick(this)"></td>
                <td class="slot" data-day="SUN" data-time="16:00" onclick="onSlotClick(this)"></td>
              </tr>
              <tr>
                <td class="time-col">17:00</td>
                <td class="slot" data-day="MON" data-time="17:00" onclick="onSlotClick(this)"></td>
                <td class="slot" data-day="TUE" data-time="17:00" onclick="onSlotClick(this)"></td>
                <td class="slot" data-day="WED" data-time="17:00" onclick="onSlotClick(this)"></td>
                <td class="slot" data-day="THU" data-time="17:00" onclick="onSlotClick(this)"></td>
                <td class="slot" data-day="FRI" data-time="17:00" onclick="onSlotClick(this)"></td>
                <td class="slot" data-day="SAT" data-time="17:00" onclick="onSlotClick(this)"></td>
                <td class="slot" data-day="SUN" data-time="17:00" onclick="onSlotClick(this)"></td>
              </tr>
              <tr>
                <td class="time-col">18:00</td>
                <td class="slot" data-day="MON" data-time="18:00" onclick="onSlotClick(this)"></td>
                <td class="slot" data-day="TUE" data-time="18:00" onclick="onSlotClick(this)"></td>
                <td class="slot" data-day="WED" data-time="18:00" onclick="onSlotClick(this)"></td>
                <td class="slot" data-day="THU" data-time="18:00" onclick="onSlotClick(this)"></td>
                <td class="slot" data-day="FRI" data-time="18:00" onclick="onSlotClick(this)"></td>
                <td class="slot" data-day="SAT" data-time="18:00" onclick="onSlotClick(this)"></td>
                <td class="slot" data-day="SUN" data-time="18:00" onclick="onSlotClick(this)"></td>
              </tr>
              <tr>
                <td class="time-col">19:00</td>
                <td class="slot" data-day="MON" data-time="19:00" onclick="onSlotClick(this)"></td>
                <td class="slot" data-day="TUE" data-time="19:00" onclick="onSlotClick(this)"></td>
                <td class="slot" data-day="WED" data-time="19:00" onclick="onSlotClick(this)"></td>
                <td class="slot" data-day="THU" data-time="19:00" onclick="onSlotClick(this)"></td>
                <td class="slot" data-day="FRI" data-time="19:00" onclick="onSlotClick(this)"></td>
                <td class="slot" data-day="SAT" data-time="19:00" onclick="onSlotClick(this)"></td>
                <td class="slot" data-day="SUN" data-time="19:00" onclick="onSlotClick(this)"></td>
              </tr>
              <tr>
                <td class="time-col">20:00</td>
                <td class="slot" data-day="MON" data-time="20:00" onclick="onSlotClick(this)"></td>
                <td class="slot" data-day="TUE" data-time="20:00" onclick="onSlotClick(this)"></td>
                <td class="slot" data-day="WED" data-time="20:00" onclick="onSlotClick(this)"></td>
                <td class="slot" data-day="THU" data-time="20:00" onclick="onSlotClick(this)"></td>
                <td class="slot" data-day="FRI" data-time="20:00" onclick="onSlotClick(this)"></td>
                <td class="slot" data-day="SAT" data-time="20:00" onclick="onSlotClick(this)"></td>
                <td class="slot" data-day="SUN" data-time="20:00" onclick="onSlotClick(this)"></td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="hint">시작 시간을 클릭하면 선택한 “1회 시간”만큼 연속 선택/해제가 됩니다.</div>
      </div>

      <div style="margin-top:14px;">
        <label class="required">멘토링 상세 설명</label>
        <textarea name="description" placeholder="예) 어떤 내용을 어떻게 도와줄 수 있는지 자세히 작성해 주세요."></textarea>
      </div>

      <div style="margin-top:14px;">
        <label>멘토링 사전 안내</label>
        <textarea name="pre_notice" placeholder="예) 수업 전 준비사항, 필요한 자료/준비물, 환영 메시지 등"></textarea>
        <div class="hint danger">
          1. 수업을 신청해준 멘티에게 환영메시지를 작성해주세요.<br/>
          2. 수업 전 필수 준비사항, 준비물이 있는 경우 내용을 작성해주세요.
        </div>
      </div>

      <div class="bottom-actions">
        <button type="button" class="btn gray" onclick="history.back()">취소</button>
        <button type="button" class="btn dark" onclick="submitMentoringForm()">저장하기</button>
      </div>
    </div>

  </form>

<script>
  /* 카테고리 */
  function pickCategory(btn){
    const val = btn.getAttribute("data-val");
    const sc = document.getElementById("sc_idx");
    if(sc) sc.value = val;

    document.querySelectorAll(".cat-btn").forEach(b => b.classList.remove("active"));
    btn.classList.add("active");
  }

  /* 스킬태그 (최대 5개) */
  const tags = [];
  const tagInput = document.getElementById("tagInput");
  const tagChips = document.getElementById("tagChips");

  if(tagInput){
    tagInput.addEventListener("keydown", function(e){
      if(e.key === "Enter"){
        e.preventDefault();
        addTag();
      }
    });
  }

  function addTag(){
    const raw = (tagInput.value || "").trim();
    if(!raw) return;

    const t = raw.replace(/\s+/g, "");
    if(!t) return;

    if(tags.includes(t)){
      alert("이미 추가된 태그입니다.");
      return;
    }
    if(tags.length >= 5){
      alert("스킬태그는 최대 5개까지 선택할 수 있어요.");
      return;
    }

    tags.push(t);
    tagInput.value = "";
    renderTags();
  }

  function removeTag(t){
    const idx = tags.indexOf(t);
    if(idx >= 0) tags.splice(idx, 1);
    renderTags();
  }

  function renderTags(){
    tagChips.innerHTML = "";
    tags.forEach(t => {
      const el = document.createElement("div");
      el.className = "chip";
      el.innerHTML = `<span>#${t}</span><button type="button" onclick="removeTag('${t}')">×</button>`;
      tagChips.appendChild(el);
    });

    const hidden = document.getElementById("skill_tags");
    if(hidden) hidden.value = tags.join(",");
  }

  /* 스케줄 */
 const selectedSlots = new Set();
  const TIMES = ["14:00","15:00","16:00","17:00","18:00","19:00","20:00"];
  function onSlotClick(td){
	  td.style.background="#c9ffbf";
	  console.log("onSlotClick fired", td.dataset.day, td.dataset.time, document.getElementById("session_minutes")?.value);
	
    const minutes = parseInt(document.getElementById("session_minutes").value || "0", 10);
    if(!minutes){
      alert("먼저 1회 시간을 선택해 주세요.");
      return;
    }

    const blocks = Math.ceil(minutes / 60);
    const day = td.dataset.day;
    const startTime = td.dataset.time;

    const startIdx = TIMES.indexOf(startTime);
    if(startIdx < 0) return;

    if(startIdx + blocks > TIMES.length){
      alert("선택한 시작 시간으로는 설정한 시간만큼 채울 수 없어요.");
      return;
    }

    const keys = [];
    for(let i = startIdx; i < startIdx + blocks; i++){
      keys.push(`${day}_${TIMES[i]}`);
    }

    const allSelected = keys.every(k => selectedSlots.has(k));

    keys.forEach(k => {
      const [d, t] = k.split("_");
      const cell = document.querySelector(`.slot[data-day="${d}"][data-time="${t}"]`);
      if(!cell) return;

      if(allSelected){
        selectedSlots.delete(k);
        cell.classList.remove("selected");
      }else{
        selectedSlots.add(k);
        cell.classList.add("selected");
        td.style.background="#c9ffbf";
      }
    });

    const arr = Array.from(selectedSlots).map(k => {
      const [day, time] = k.split("_");
      return { day, time };
    });
    document.getElementById("schedule_json").value = JSON.stringify(arr);
  }

  /* 최종 제출 */
  function submitMentoringForm(){
    const phone = document.querySelector("input[name='contact_phone_public']").value.trim();
    const email = document.querySelector("input[name='contact_email_public']").value.trim();
    const sc = document.getElementById("sc_idx").value;
    const title = document.querySelector("input[name='mentoring_title']").value.trim();
    const jobGroup = document.querySelector("input[name='job_group']").value.trim();
    const jobRole = document.querySelector("input[name='job_role']").value.trim();
    const career = document.querySelector("input[name='career_years']").value.trim();
    const session = document.getElementById("session_minutes").value;
    const desc = document.querySelector("textarea[name='description']").value.trim();

    if(!phone){ alert("연락 가능한 번호를 입력해 주세요."); return; }
    if(!email){ alert("연락 가능한 이메일을 입력해 주세요."); return; }
    if(!sc){ alert("카테고리를 선택해 주세요."); return; }
    if(!title){ alert("멘토링명을 입력해 주세요."); return; }
    if(!jobGroup || !jobRole || !career){ alert("직군/직무/경력을 입력해 주세요."); return; }
    if(!session){ alert("1회 시간을 선택해 주세요."); return; }
    if(selectedSlots.size === 0){ alert("스케줄을 1개 이상 선택해 주세요."); return; }
    if(!desc){ alert("멘토링 상세 설명을 입력해 주세요."); return; }

    document.getElementById("mentoringOpenForm").submit();
  }
</script>

</section>

<%@ include file="../footer.jsp"%>
</body>
</html>
