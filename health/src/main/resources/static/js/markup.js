 function displayDaedeokArea(coordinates, name) {
      var daedeokPolygonPath = [];
      var points = [];
      $.each(coordinates[0], function (index, coordinate) {
        var point = new Object();
        point.x = coordinate[1];
        point.y = coordinate[0];
        points.push(point);
        daedeokPolygonPath.push(
          new kakao.maps.LatLng(coordinate[1], coordinate[0])
        );
      });
      // 대덕구 다각형 설정
      var daedeokPolygon = new kakao.maps.Polygon({
        map: map, // 다각형을 표시할 지도 객체
        path: daedeokPolygonPath, // 좌표 배열
        strokeWeight: 4, // 선 두께
        strokeColor: "#FFFFFF", // 선 색깔
        strokeOpacity: 0.8, // 선 불투명도
        fillColor: "#FFD700", // 채우기 색깔
        fillOpacity: 0.8, // 채우기 불투명도
      });
      polygons.push(daedeokPolygon); // 폴리곤 제거하기 위한 배열
      // 대덕구 폴리곤을 클릭하면 대덕구 행정동 폴리곤 데이터 가져오기
      kakao.maps.event.addListener(
        daedeokPolygon,
        "click",
        function (mouseEvent) {
            $(".banner").css({"visibility":"visible", "width":"8%"}) // 구를 클릭했을 때 배너 표시
            getParkInfo(name); // name = 대덕구
            getTashuInfo(name);
        	
        	var level = map.getLevel() - 2;
          map.setLevel(level, {
            anchor: centroid(points),
            animate: {
              duration: 350, // 확대 애니메이션 시간
            },
          });
          $.getJSON("resources/static/구별json/daedeok.json", function (geojson) {
            var data = geojson.features;
            var coordinates = [];
            var dongName = "";
            $.each(data, function (index, val) {
              coordinates = val.geometry.coordinates;
              name = val.properties.SGG_NM;
              displayYuseong_dong(coordinates, name); // 행정동 폴리곤 만들기 공동사용
            });
          });
          deletePolygon(polygons);
          customOverlay.setMap(null); // 커스텀 오버레이(구 이름) 제거
          <c:forEach items="${daedeokList}" var="item">
	  		// 도로명 주소로 좌표 검색 & 마커 생성
	  		geocoder.addressSearch("${item.addr_road}", function(result, status) {
	  		    // 검색 완료되면 결과값으로 받은 위치를 마커로 표시
	  		     if(status === kakao.maps.services.Status.OK) {
	  		    	// 마커 이미지의 이미지 주소입니다
	  		    	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	  		    	var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					// 마커 이미지의 이미지 크기
					var imageSize = new kakao.maps.Size(24, 35); 
					// 마커 이미지를 생성  
					var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	  		        var marker = new kakao.maps.Marker({
	  		            map: map,
	  		            position: coords,
	  		          	image : markerImage // 마커 이미지 
	  		        });
  		      		markers.push(marker); // marker를 제거하기 위해 배열에 담음
					// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
	  		      	var iwContent = '<div style="width:100%;text-align:center;padding:20px 0;">장소 : ${item.fac_name} <br> 주소 : ${item.addr_road} <br> <a href="https://map.kakao.com/link/roadview/'+result[0].y+','+result[0].x+'" target="_blank">로드뷰</a> </div>',
						iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
					// 인포윈도우를 생성합니다
					var infowindow = new kakao.maps.InfoWindow({
					    content : iwContent,
					    removable : iwRemoveable
					});
					// 마커에 클릭이벤트를 등록합니다
					kakao.maps.event.addListener(marker, 'click', function() {
					      // 마커 위에 인포윈도우를 표시합니다
					      infowindow.open(map, marker);  
					});
	  		    }
	  		});
			</c:forEach>
        }
      );
      // 마우스오버 이벤트
      kakao.maps.event.addListener(daedeokPolygon, "mouseover", function () {
        daedeokPolygon.setOptions(mouseoverOption);
      });
      // 마우스오버 이벤트 채우기
      var mouseoverOption = {
        fillColor: "#FFD700", // 색상
        fillOpacity: 1, // 불투명도
      };
      // 마우스아웃 이벤트
      daum.maps.event.addListener(daedeokPolygon, "mouseout", function () {
        daedeokPolygon.setOptions(mouseoutOption);
      });
      // 마우스아웃 채우기
      var mouseoutOption = {
        fillColor: "#FFD700",
        fillOpacity: 0.8, // 채우기 불투명도
      };

      // 커스텀 오버레이 내용
      var content = '<div class ="label" style ="font-size:40px; font-weight : 800">'+name+'</div>';
      // 커스텀 오버레이 위치
      var position = centroid(points);
      // 커스텀 오버레이 생성
      var customOverlay = new kakao.maps.CustomOverlay({
        position: position,
        content: content,
      });
      // 커스텀 오버레이를 지도에 표시
      customOverlay.setMap(map);
    }