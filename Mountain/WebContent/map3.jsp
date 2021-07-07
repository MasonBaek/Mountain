<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
#cha_mt{
    border-radius:50%;
}
</style>
</head>
<body>
	<div id="map"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bedf0e3c23ad07ddd8a6795d2aa6aabc"></script>
<div id="map" style="width:750px;height:650px;"></div>

<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(35.56, 129.025), // 지도의 중심좌표
	        level: 8, // 지도의 확대 레벨
	        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
	    }; 
	// 지도를 생성한다 
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	// 지형도 타일 이미지 추가
	map.addOverlayMapTypeId(kakao.maps.MapTypeId.TERRAIN); 
	// 지도 클릭 이벤트를 등록한다 (좌클릭 : click, 우클릭 : rightclick, 더블클릭 : dblclick)
	kakao.maps.event.addListener(map, 'click', function (mouseEvent) {
		console.log('지도에서 클릭한 위치의 좌표는 ' + mouseEvent.latLng.toString() + ' 입니다.');
	});	
	// 커스텀 오버레이를 생성하고 지도에 표시한다
	var customOverlay = new kakao.maps.CustomOverlay({
		map: map,
		clickable : true, // 커스텀 오버레이 클릭 시 지도에 이벤트를 전파하지 않도록 설정한다
		content: '<div style="padding:0 5px;background:#fff;"><img src="img/map_mt.png" style="width="50px" height="50px"" id="cha_mt"></div>', 
		position: new kakao.maps.LatLng(35.56, 129.025), // 커스텀 오버레이를 표시할 좌표
		xAnchor: 1.4, // 컨텐츠의 x 위치
		yAnchor: 0 // 컨텐츠의 y 위치
	});
</script>

</body>
</html>