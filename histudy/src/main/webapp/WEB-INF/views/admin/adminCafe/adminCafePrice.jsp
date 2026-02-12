<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요금제 등록 - ${param.studycafe_name}</title>
<link rel="stylesheet" href="css/admin/admin_layout.css" type="text/css">
<%@ include file="../adminCheck.jsp" %>
<style>
table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
	background: white;
}

th, td {
	border: 1px solid #ddd;
	padding: 12px;
	text-align: center;
}

th {
	background-color: #f4f4f4;
}

.ticket__btn__del {
	background: #ff4d4d;
	color: white;
	border: none;
	padding: 5px 10px;
	border-radius: 4px;
	cursor: pointer;
}

.adminCafeTicketReg {
	margin-bottom: 20px;
	padding: 15px;
	background: #f9f9f9;
	border-radius: 8px;
}

select, input {
	padding: 8px;
	margin-right: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
}
</style>
</head>
<body id="adminCafePrice">
	<fieldset>
		<legend>
			<strong>관리 중인 카페 : ${param.studycafe_name}</strong>
		</legend>
		<div class="adminCafe">
			<ul class="adminCafe__menu">
				<li class="adminCafe__menu__item"><a
					href="adminCafeSales.do?studycafe_idx=${param.studycafe_idx}&studycafe_name=${param.studycafe_name}">총
						매출확인</a></li>
				<li class="adminCafe__menu__item"><a
					href="adminCafeSeat.do?studycafe_idx=${param.studycafe_idx}&studycafe_name=${param.studycafe_name}">스터디카페
						현황 보기</a></li>
				<li class="adminCafe__menu__item"><a
					href="adminCafeInquiryList.do?studycafe_idx=${param.studycafe_idx}&studycafe_name=${param.studycafe_name}">스터디카페
						문의</a></li>
				<li class="adminCafe__menu__item"><a
					href="studycafeEditor.do?studycafe_idx=${param.studycafe_idx}&studycafe_name=${param.studycafe_name}">좌석등록</a></li>
				<li class="adminCafe__menu__item"><a
					href="adminCafePrice.do?studycafe_idx=${param.studycafe_idx}&studycafe_name=${param.studycafe_name}">요금제
						등록</a></li>
			</ul>
		</div>
	</fieldset>

	<h3>요금제 등록하기</h3>

	<div class="adminCafeTicketReg">
		<form id="adminCafeTicketForm">
			<input type="hidden" name="studycafe_idx" value="${param.studycafe_idx}"> 
			<label>카테고리 선택: </label> <select name="ticket_category_idx" id="categorySelect">
				<c:forEach var="cat" items="${categoryList}">
					<option value="${cat.ticket_category_idx}">${cat.ticket_category_name}</option>
				</c:forEach>
			</select> 
			<input type="text" name="ticket_name" id="ticketName" placeholder="티켓명 (예: 2시간권)" required> 
			<input type="number" name="ticket_time" id="ticketTime" placeholder="시간 (예: 2)" required> 
			<input type="number" name="ticket_amount" id="ticketAmount" placeholder="금액 (원)" required>
	
			<button type="button" onclick="registerTicket()" style="padding: 8px 20px; cursor: pointer;">등록</button>
		</form>
	</div>

	<table>
		<thead>
			<tr>
				<th>카테고리 번호</th>
				<th>카테고리 이름</th>
				<th>티켓명</th>
				<th>요금제시간</th>
				<th>금액</th>
				<th>관리</th>
			</tr>
		</thead>
		<tbody id="ticketTableBody">
			<c:forEach var="ticket" items="${ticketList}">
				<tr id="ticket_${ticket.ticket_idx}">
					<td>${ticket.ticket_category_idx}</td>
					<td>${ticket.ticket_category_name}</td>
					<td>${ticket.ticket_name}</td>
					<td>${ticket.ticket_time}</td>
					<td>${ticket.ticket_amount}원</td>
					<td><button class="ticket__btn__del" onclick="deleteTicket(${ticket.ticket_idx})">삭제</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<script>
function registerTicket() {
    const form = document.getElementById("priceForm");
    const select = document.getElementById("categorySelect"); 

    const data = {
        studycafe_idx: form.studycafe_idx.value,
        ticket_category_idx: form.ticket_category_idx.value,
        ticket_name: form.ticket_name.value,
        ticket_amount: form.ticket_amount.value,
        ticket_time: form.ticket_time.value,
        category_name: select.options[select.selectedIndex].text
    };

    if(!data.ticket_name || !data.ticket_amount) {
        alert("내용을 입력해주세요.");
        return;
    }
    fetch("addTicketAction.do", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(data)
    })
    .then(res => res.json())
    .then(result => {
        if(result.status === "success") {
 
            const tbody = document.getElementById("ticketTableBody");
            const newRow = `
                <tr id="ticket_\${result.newIdx}">
                    <td>\${data.ticket_category_idx}</td>
                    <td>\${data.category_name}</td>
                    <td>\${data.ticket_name}</td>
                    <td>\${data.ticket_time}</td>
                    <td>\${data.ticket_amount}원</td>
                    <td><button class="ticket__btn__del" onclick="deleteTicket(\${result.newIdx})">삭제</button></td>
                </tr>
            `;
            tbody.insertAdjacentHTML('beforeend', newRow);
            
            form.ticket_name.value = "";
            form.ticket_time.value = "";
            form.ticket_amount.value = "";
        }
    });
}

function deleteTicket(idx) {
    if(!confirm("삭제하시겠습니까?")) return;

    fetch("deleteTicketAction.do?ticket_idx=" + idx)
    .then(res => res.json())
    .then(result => {
        if(result.status === "success") {
            const row = document.getElementById("ticket_" + idx);
            row.remove();
        }
    });
}
</script>
</body>
</html>