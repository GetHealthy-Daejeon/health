$('#park').click(function(){
  $.ajax({
    url : "https://api.odcloud.kr/api/15073859/v1/uddi:7789cfce-8a83-482e-a47d-8b7da41406ec?perPage=1000&serviceKey=eQZma%2BIrvJVJ%2FoYjIe5wYTnAwUZYZNAM5v%2BtmC8hutkmQ%2BFFsfQt5gbWiZ0FNXRs3LK%2BHxQ3oLQji3lZ%2BiLgKA%3D%3D",
    type : "GET",
    dataType : "json", // 서버 결과를 json으로 응답받겠다.
    success : function(response){
      // 사용할 데이터 : 공원명, 공원종류, 관리청, 비고, 위치
      console.log(response.data[0]);
      for(var i=0; i<response.data.length; i++){
        geocoder.addressSearch(response.data[i].위치, function(result, status) {
          // 검색 완료되면 결과값으로 받은 위치를 마커로 표시
          if (status === kakao.maps.services.Status.OK) {
          // 마커 이미지의 이미지 주소입니다
            var imageSrc = "resources/static/img/park.png"; 
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
            // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
            var iwContent = '<div style="width:100%;text-align:center;padding:20px 0;">공원명 : <br> 주소 : <br> <a href="https://map.kakao.com/link/roadview/'+result[0].y+','+result[0].x+'" target="_blank">로드뷰</a> </div>',
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
      }
    }
  });
});