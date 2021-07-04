<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<div id="map"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bedf0e3c23ad07ddd8a6795d2aa6aabc"></script>
	<script>
		var container = document.getElementById('map'); 
		//지도를 담을 영역의 DOM 레퍼런스
		
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(33.450701, 126.570667), 
			//지도의 중심좌표.
			
			level: 3 //지도의 레벨(확대, 축소 정도)
			};
		
		var map = new kakao.maps.Map(container, options);
	</script>
</body>
</html>