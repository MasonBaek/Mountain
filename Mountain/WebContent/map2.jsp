<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<div id="map"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bedf0e3c23ad07ddd8a6795d2aa6aabc"></script>
	
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(35.58, 129), // 지도의 중심좌표
	        level: 8, // 지도의 확대 레벨
	        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
	    }; 
	// 지도를 생성한다 
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	// 커스텀 오버레이를 생성하고 지도에 표시한다
	var customOverlay = new kakao.maps.CustomOverlay({
		map: map,
		clickable : true, // 커스텀 오버레이 클릭 시 지도에 이벤트를 전파하지 않도록 설정한다
		content: '<div style="padding:0 5px;background:#fff;">HTML코드를 입력해주세요 :D</div>', 
		position: new kakao.maps.LatLng(50, 50), // 커스텀 오버레이를 표시할 좌표
		xAnchor: 1.4, // 컨텐츠의 x 위치
		yAnchor: 0 // 컨텐츠의 y 위치
	});
	var sw = new kakao.maps.LatLng(35.58, 129.025), // 사각형 영역의 남서쪽 좌표 
		ne = new kakao.maps.LatLng(35.59, 129.015); // 사각형 영역의 북동쪽 좌표
	// 사각형을 구성하는 영역정보를 생성한다
	var rectangleBounds = new kakao.maps.LatLngBounds(sw, ne);
	// 지도에 사각형을 표시한다 
	var rectangle = new kakao.maps.Rectangle({
		map: map, // 사각형을 표시할 지도 객체
		bounds: rectangleBounds, // 사각형의 영역 
		fillColor: '#FF0000', // 채움 색
		fillOpacity: 0.5, // 채움 불투명도
		strokeWeight: 3, // 선의 두께 
		strokeColor: '#FF0000', // 선 색
		strokeOpacity: 0.9, // 선 투명도
		strokeStyle: 'solid' // 선 스타일 
	});
        sw = new kakao.maps.LatLng(35.56, 129.025), // 사각형 영역의 남서쪽 좌표 
		ne = new kakao.maps.LatLng(35.57, 129.015);
        rectangleBounds = new kakao.maps.LatLngBounds(sw, ne);
    var rectangle_2 = new kakao.maps.Rectangle({
		map: map, // 사각형을 표시할 지도 객체
		bounds: rectangleBounds, // 사각형의 영역 
		fillColor: '#FF0000', // 채움 색
		fillOpacity: 0.5, // 채움 불투명도
		strokeWeight: 3, // 선의 두께 
		strokeColor: '#FF0000', // 선 색
		strokeOpacity: 0.9, // 선 투명도
		strokeStyle: 'solid' // 선 스타일 
	});
	// 도형에 mouseover 이벤트를 등록한다 
	kakao.maps.event.addListener(rectangle, 'mouseover', function() {
		console.log('도형에 mouseover 이벤트가 발생했습니다!');
	});
	// 도형에 mouseout 이벤트를 등록한다 
	kakao.maps.event.addListener(rectangle, 'mouseout', function() {
		console.log('도형에 mouseout 이벤트가 발생했습니다!');
	});
	// 도형에 mousedown 이벤트를 등록한다
	kakao.maps.event.addListener(rectangle, 'mousedown', function() {
		console.log('도형에 mousedown 이벤트가 발생했습니다!');
	});
</script>
</body>
</html>