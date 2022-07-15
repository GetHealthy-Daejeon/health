setStatistics();
function setStatistics() {
	const API = "https://api.odcloud.kr/api";
	// 공원 수
	$.ajax({
		url: API+"/15073859/v1/uddi:7789cfce-8a83-482e-a47d-8b7da41406ec?perPage=1000&serviceKey=eQZma%2BIrvJVJ%2FoYjIe5wYTnAwUZYZNAM5v%2BtmC8hutkmQ%2BFFsfQt5gbWiZ0FNXRs3LK%2BHxQ3oLQji3lZ%2BiLgKA%3D%3D",
		type: "GET",
		dataType: "json",
		success: function(response) {
			$('#park').text(response.currentCount);
		}
	});
	
	// 공공 체육시설 수
	$.ajax({
		url: "/addr/FacilityStatistics",
		type: "GET",
		dataType: "json",
		success: function(response) {
			$('#facility').text(response.count);
		}
	});
	
	// 타슈 정류장 수 
	$.ajax({
		url: API+"/15062798/v1/uddi:cd8c82d9-b88c-42b0-bedd-a8b4b919732b?perPage=1000&serviceKey=eQZma%2BIrvJVJ%2FoYjIe5wYTnAwUZYZNAM5v%2BtmC8hutkmQ%2BFFsfQt5gbWiZ0FNXRs3LK%2BHxQ3oLQji3lZ%2BiLgKA%3D%3D",
		type: "GET",
		dataType: "json",
		success: function(response) {
			$('#tashu').text(response.currentCount);
		}
	});
}