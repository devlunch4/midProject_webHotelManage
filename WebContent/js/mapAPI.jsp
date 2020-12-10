<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>Kakao 지도 시작하기</title>
</head>
<body>
	<div id="map" style="width: 500px; height: 400px;"></div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5571f6f63935faa5254783ef52726e8c"></script>
	<script>
		var mapContainer = document.getElementById('map');
		var mapOption = {
				/* 36.32498501617164, 127.42016219617635 */
			center : new kakao.maps.LatLng(36.324985, 127.420162),
			level : 3
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 지도를 클릭한 위치에 표출할 마커입니다
		var marker = new kakao.maps.Marker({ 
		    // 지도 중심좌표에 마커를 생성합니다 
		    position: map.getCenter() 
		}); 
		// 지도에 마커를 표시합니다
		marker.setMap(map);
		
		
	</script>
</body>
</html>