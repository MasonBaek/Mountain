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
		//������ ���� ������ DOM ���۷���
		
		var options = { //������ ������ �� �ʿ��� �⺻ �ɼ�
			center: new kakao.maps.LatLng(33.450701, 126.570667), 
			//������ �߽���ǥ.
			
			level: 3 //������ ����(Ȯ��, ��� ����)
			};
		
		var map = new kakao.maps.Map(container, options);
	</script>
</body>
</html>