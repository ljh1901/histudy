var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
        center: new kakao.maps.LatLng(lat, lng), // 지도의 중심좌표
        level: 1 // 지도의 확대 레벨
    };
var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 지도를 클릭한 위치에 표출할 마커입니다
var marker = new kakao.maps.Marker({ 
    // 지도 중심좌표에 마커를 생성합니다 
    position: map.getCenter() 
}); 
     marker.setMap(map);
// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
var resultDiv = document.getElementById('clickLatlng');
// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
window.onload=function(){
    var lat = map.getCenter().getLat();
   var lng = map.getCenter().getLng(); 
   geocoder.coord2Address(lng,lat,function(result,status){
		requestAddr(result, status, resultDiv);
   });
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
    // 클릭한 위도, 경도 정보를 가져옵니다 
     var resultDiv = document.getElementById('clickLatlng');
     var latlng = mouseEvent.latLng;
    	searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
		requestAddr(result, status, resultDiv);
    // 마커 위치를 클릭한 위치로 옮깁니다
    marker.setPosition(latlng); 
    });  
});
}
function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}
function requestAddr(result,status,resultDiv){
	     if (status === kakao.maps.services.Status.OK) {
            var detailAddr = '지번 주소 : ' + result[0].address.address_name;
                resultDiv.innerHTML = detailAddr;
        }
}