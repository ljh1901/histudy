<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출 통계</title>
<link rel="stylesheet" href="css/admin_layout.css" type="text/css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<%@ include file="adminCheck.jsp" %>

</head>
<body id="adminCafeSales">
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
	<h3>총 매출 확인</h3>
	<fieldset>
		<div>
			<ul class="adminCafeSales__menu">
				<li><a href="adminCafeSales.do?studycafe_idx=${param.studycafe_idx}&studycafe_name=${param.studycafe_name}&type=day">일별</a>|</li>
				<li><a href="adminCafeSales.do?studycafe_idx=${param.studycafe_idx}&studycafe_name=${param.studycafe_name}&type=month">월별</a>|</li>
				<li><a href="adminCafeSales.do?studycafe_idx=${param.studycafe_idx}&studycafe_name=${param.studycafe_name}&type=total">누적</a></li></ul>
		</div>
		<legend>기간 조회</legend>
		<form action="adminCafeSales.do" method="get">
			<input type="hidden" name="studycafe_idx"
				value="${param.studycafe_idx}"> <input type="hidden"
				name="type" value="${empty param.type ? 'day' : param.type}">

			<input type="date" name="startDate" value="${param.startDate}">
			~ <input type="date" name="endDate" value="${param.endDate}">
			<button type="submit">조회</button>
		</form>
	</fieldset>
	<div class="chart__container">
		<canvas id="salesChart"></canvas>
	</div>

	<script>
    let labelName = '일별 매출액 (원)';
    <c:if test="${param.type == 'month'}">labelName = '월별 매출액 (원)';</c:if>
    <c:if test="${param.type == 'total'}">labelName = '누적 총 매출액 (원)';</c:if>

    const ctx = document.getElementById('salesChart').getContext('2d');
    const labels = [
        <c:forEach var="item" items="${salesData}">
            '${item.SALES_DATE}',
        </c:forEach>
    ];
    
    const data = [
        <c:forEach var="item" items="${salesData}">
            ${item.TOTAL_AMOUNT},
        </c:forEach>
    ];

    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [{
                label: labelName,
                data: data,
                backgroundColor: 'rgba(54, 162, 235, 0.5)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            scales: { 
                y: { 
                    beginAtZero: true,
                    ticks: {
                        callback: function(value) {
                            return value.toLocaleString() + '원';
                        }
                    }
                } 
            }
        }
    });
</script>
</body>
</html>