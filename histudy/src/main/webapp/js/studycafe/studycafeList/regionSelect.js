	var regionList = new Array();
    regionList= ['전체', '서울', '경기', '충북', '충남', '경북', '경남', '강원', '전북', '제주'];
	var regionListStr='';
	var xhr = null;
	for(let i=0; i<regionList.length; i++){
			regionListStr += '<button class="regionBtn" type="button" value="'+regionList[i]+'">'+regionList[i]+'</button>'
	}
	document.querySelector('.korea__region').innerHTML = regionListStr;
	function selectRegion(region){
		xhr = new XMLHttpRequest();
		xhr.open('POST','studycafePageList.do',true);
		var data = JSON.stringify({
		currentPage: currentPage,
		region: region});
		xhr.setRequestHeader("Content-type", "application/json");
		xhr.onreadystatechange=showRegion;
		xhr.send(data);
	}
	
	function showRegion(){
		if(xhr.readyState==4){
			if(xhr.status==200){
				var resp=JSON.parse(xhr.responseText);
				var studycafeList=resp.studycafeList;
				var paging=resp.paging;
				if(resp.studycafeList == null || resp.studycafeList == ''){
					document.querySelector('.studycafeList').innerHTML = '<p>해당하는 스터디카페 목록이 없습니다.</p>';
					document.querySelector('.paging__area').innerHTML='';
				}else{
					var str = '';
					studycafeList.forEach(function(respJsonData){
						str += '<div class="studycafeIdx">'
						+'<div class="studycafeList__header">'
						+'<img src="img/histudyNum1.png" alt="histudy">'
						+'<div class="studycafeInfo">'
						+'<div>'+respJsonData.studycafe_name+'</div>'
						+'<div><a href="studycafeReview.do?studycafe_idx='+respJsonData.studycafe_idx+'">이용 후기</a></div></div></div><div class="studycafeList__body">'
						+'<div>💺' +respJsonData.avaliable+'/'+respJsonData.all+'석</div>'
						+'<div>'+respJsonData.studycafe_addr+'</div></div><div class="studycafeList__footer">'
						+'<button class="studycafeUse" value="'+respJsonData.studycafe_idx+'">이용하기</button></div></div>'	
					});
						document.querySelector('.studycafeList').innerHTML=str;
						document.querySelector('.paging__area').innerHTML=paging;
						currentPage = resp.currentPage;
				}
			}
		}
	}
	var order = 0;
	for(let i=0; i<document.querySelectorAll('.regionBtn').length; i++){
		document.querySelectorAll('.regionBtn')[i].addEventListener('click', function(){
				if(document.querySelectorAll('.regionBtn') != null){
					order = i;
					region = document.querySelectorAll('.regionBtn')[i].value;
					document.querySelectorAll('.regionBtn')[i].style.backgroundColor='#6366f1';
					document.querySelectorAll('.regionBtn')[i].style.color='white';
					document.querySelectorAll('.regionBtn')[i].style.borderColor='#6366f1';
					selectRegion(region);
					cssBtn(order);
				}
		});
	}
	for(let i=0; i<document.querySelectorAll('.regionBtn').length; i++){
		if(region==regionList[i]){
			document.querySelectorAll('.regionBtn')[i].style.backgroundColor='#6366f1';
			document.querySelectorAll('.regionBtn')[i].style.color='white';
			document.querySelectorAll('.regionBtn')[i].style.borderColor='#6366f1';
		}
	}
	function cssBtn(order){
		for(let i=0; i<document.querySelectorAll('.regionBtn').length; i++){
			if(order !=i){
			document.querySelectorAll('.regionBtn')[i].style.backgroundColor='white';
			document.querySelectorAll('.regionBtn')[i].style.color='black';
			document.querySelectorAll('.regionBtn')[i].style.borderColor='black';
			document.querySelectorAll('.regionBtn')[i].style.transition='0.2s';
			}
		}
	}