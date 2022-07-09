<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>건강하슈 관리자페이지</title>
<link href="/resources/static/css/map_back.css" rel="stylesheet">
<link href="/resources/static/css/bootstrap.min.css" rel="stylesheet">

</head>
<!--Start Hedaer Section-->
<section id="header">
	<div class="header-area">
		<div class="top_header">
			<div class="container">
				<div class="row">
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 zero_mp">
						<div class="address">
							<i class="fa fa-home floatleft"></i>
							<p>(주)건강하슈-GetHealthy</p>
						</div>
					</div>
					<!--End of col-md-4-->
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 zero_mp">
						<div class="phone">
							<i class="fa fa-phone floatleft"></i>
							<p></p>
						</div>
					</div>
					<!--End of col-md-4-->
					<div class="col-md-4">
						<div class="social_icon text-right">
							<a href=""><i class="fa fa-facebook"></i></a> <a href=""><i
								class="fa fa-twitter"></i></a> <a href=""><i
								class="fa fa-google-plus"></i></a> <a href=""><i
								class="fa fa-youtube"></i></a>
						</div>
					</div>
					<!--End of col-md-4-->
				</div>
				<!--End of row-->
			</div>
			<!--End of container-->
		</div>
		<!--End of top header-->
		<div class="header_menu text-center" data-spy="affix"
			data-offset-top="50" id="nav">
			<div class="container">
				<nav class="navbar navbar-default zero_mp ">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand custom_navbar-brand"
							href="http://localhost:8080/health/index"><img
							src="/resources/static/img/logo.png" alt=""></a>
					</div>
					<!--End of navbar-header-->

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse zero_mp"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-right main_menu">

								<c:if
									test="${authority != '1' && authority !='2' && authority !='3'}">
									<li class="active"><a href="/health/index">Home <span
											class="sr-only">(current)</span></a></li>
									<li><a href="/health/login">Login</a></li>
									<li><a href="/health/join">Join</a></li>
								</c:if>
								<!-- 일반회원에게 보이는 메뉴 -->
								<c:if test="${1 eq authority}">
									<li class="active"><a href="/health/index">Home <span
											class="sr-only">(current)</span></a></li>
									<li><a href="/map">Map</a></li>
									<li><a href="/health/logout">Logout</a></li>
								</c:if>

								<!-- 관리자에게 보이는 메뉴 -->
								<c:if test="${2 eq authority}">
									<li class="active"><a href="/health/index">Home <span
											class="sr-only">(current)</span></a></li>
									<li><a href="/map">Map</a></li>
									<li><a href="/health/members?pageNum=1&pageSize=10">Mem-Manage</a></li>
									<li><a href="/addr?pageNum=1&pageSize=10">Map-Manage</a></li>
									<li><a href="/health/logout">Logout</a></li>
								</c:if>

								<!-- 정지회원에게 보이는 메뉴 -->
								<c:if test="${3 eq authority}">
									<p>정지된 회원이기에 아무것도 이용할 수 없습니다.</p>
									<li><a href="/health/logout">Logout</a></li>
								</c:if>
								<div class="welcome_name">
									<p>${memberName}님환영합니다</p>
								</div>
							</ul>
					</div>
					<!-- /.navbar-collapse -->
				</nav>
				<!--End of nav-->
			</div>
			<!--End of container-->
		</div>
		<!--End of header menu-->
	</div>
	<!--end of header area-->
</section>
<!--End of Hedaer Section-->
<section id="member">
	<div class="search">
		<label>
			<input id="searchBar" type="text" placeholder="시설명을 검색하세요...">
			<input id="keyword"	type="hidden" value="null">
		</label>
	</div>
	<div class="write-popup">
		<div class="editor">
			<p class="addr-insert">주소 등록</p>
			<div class="input-box">
				<label for="gu_code">구 코드 : </label>
				<input id="insertGuCode" type="text" placeholder="구 코드를 입력해주세요">
			</div>
			<div class="input-box">
				<label for="event_code">종목 코드 : </label>
				<input id="insertEventCode" type="text" placeholder="종목 코드를 입력해주세요">
			</div>
			<div class="input-box">
				<label for="fac_name">시설 이름 : </label>
				<input id="insertFacName" type="text" placeholder="시설 이름을 입력해주세요">
			</div>
			<div class="input-box">
				<label for="addr-road">도로명주소 : </label>
				<input id="insertAddrRoad" type="text" placeholder="도로명주소를 입력해주세요">
			</div>
			<div class="input-box">
				<label for="digit">전화번호 : </label>
				<input id="insertDigit" type="text" placeholder="전화번호를 입력해주세요">
			</div>
			<div class="btn-area">
				<a href="#" class="btn-cancel">취소</a> 
				<a id="contentSubmit" href="#" class="btn-success" onclick="insert_addr()">등록</a>
			</div>
		</div>
	</div>
	<section>
		<div class="update-popup">
			<div class="editor">
				<div class="close">
					<a href="#" class="btn-close">X</a>
				</div>
				<div class="input-box">
					<label for="place_no">시설 번호 : &nbsp;</label> 
					<input id="place_no" type="text" value="${place_no}" readonly>
				</div>
				<div class="input-box">
					<label for="gu_code">구 코드 :&nbsp;&nbsp;&nbsp;&nbsp;</label>
					<input id="gu_code" type="text" placeholder="구 코드를 입력하세요">
				</div>
				<div class="input-box">
					<label for="event_code">종목 코드 :&nbsp;</label>
					<input id="event_code" type="text" placeholder="종목 코드를 입력하세요">
				</div>
				<div class="input-box">
					<label for="fac_name">시설명 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
					<input id="fac_name" type="text" placeholder="시설명을 입력하세요">
				</div>
				<div class="input-box">
					<label for="addr_road">도로명주소 :</label>
					<input id="addr_road" type="text" placeholder="도로명주소를 입력하세요">
				</div>
				<div class="input-box">
					<label for="digit">전화번호 :&nbsp;&nbsp;</label>
					<input id="digit" type="text" placeholder="전화번호를 입력하세요">
				</div>
				<div class="btn-area">
					<input id="boardIdHidden" type="hidden"> 
					<a id="contentUpdate" href="#" type="button" class="btn-update">수정</a>
					<a id="contentDelete" href="#" type="button" class="btn-delete">삭제</a>
				</div>
			</div>
		</div>

		<div class="member_list">
			<div class="cardHeader">
				<input type="button" class="btn-addr" value="주소 등록">
			</div>

			<table>
				<thead>
					<tr>
						<th>시설 번호</th>
						<th>구코드</th>
						<th>종목코드</th>
						<th>시설명</th>
						<th>소재지도로명주소</th>
						<th>위도</th>
						<th>경도</th>
						<th>전화번호</th>
					</tr>
				</thead>
				<tbody id="boardData">
					<c:forEach items="${pageHelper.list}" var="Addr">
						<tr onclick="getAddr(${Addr.place_no})">
							<td>${Addr.place_no}</td>
							<td>${Addr.gu_code}</td>
							<td>${Addr.event_code}</td>
							<td>${Addr.fac_name}</td>
							<td>${Addr.addr_road}</td>
							<td>${Addr.latitude}</td>
							<td>${Addr.longitude}</td>
							<td>${Addr.digit}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="pagination">
				<c:if test="${pageHelper.hasPreviousPage}">
					<a onclick="getAddrList(1,10)">←</a>
					<a onclick="getAddrList(${pageHelper.pageNum-1},10)">이전</a>
				</c:if>
				<c:forEach begin="${pageHelper.navigateFirstPage}"
					end="${pageHelper.navigateLastPage}" var="pageNum">
					<a id="pageNum${pageNum}" onclick="getAddrList(${pageNum},10)">${pageNum}</a>
				</c:forEach>
				<c:if test="${pageHelper.hasNextPage}">
					<a onclick="getAddrList(${pageHelper.pageNum+1},10)">다음</a>
					<a onclick="getAddrList(${pageHelper.pages},10)">→</a>
				</c:if>
			</div>
			<input id="nowPageNum" type="hidden" value="${pageHelper.pageNum}">
			<input id="lastPage" type="hidden" value="${pageHelper.pages}">
		</div>
	</section>
</section>
<!--Start of footer-->
<section id="footer">
	<div class="container">
		<div class="row text-center">
			<div class="col-md-6">
				<div class="copyright">
					<p>
						@ 2016 - Design By <span><a href="">&#9798;</a></span>
					</p>
				</div>
			</div>
			<div class="col-md-6">
				<div class="designer">
					<p>
						A Design By <a href="#">XpeedStudio</a>
					</p>
				</div>
			</div>
		</div>
		<!--End of row-->
	</div>
	<!--End of container-->
</section>

<!--Scroll to top-->
<a href="#" id="back-to-top" title="Back to top">&uarr;</a>
<!--End of Scroll to top-->

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script type="module"
	src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule
	src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<script>
    $('.btn-addr').click(function(){
        $('.write-popup').css('display', 'block');
    });
    $('.btn-cancel').click(function(){
        $('.write-popup').css('display', 'none');
    });
    $('.btn-close').click(function(){
        $('.update-popup').css('display','none');
    })

    let list = document.querySelectorAll('.navigation li');
    function activeLink(){
        list.forEach((item) => {item.classList.remove('hovered')});
        this.classList.add('hovered');
    }
    list.forEach((item) => {item.addEventListener('mouseover',activeLink)});
    
//esc 누르면 팝업 닫기
    $(document).keydown(function(key){
        if(key.keyCode == 27){
            $('.update-popup').css('display', 'none')
            $('.write-popup').css('display', 'none')
            return false;
        }
    })
</script>
<script>
getPageNum();

function getAddrList(pageNum, pageSize){
	location.href="/addr?pageNum="+pageNum+"&pageSize="+pageSize;    
}

//페이지 번호 색칠하는 함수
function getPageNum(){
	var pageNum = $('#nowPageNum').val();
	$('#pageNum'+pageNum).css('backgroundColor','#287bff'); // id가 pageNum + pageNumber 문자를 합친거
	$('#pageNum'+pageNum).css('color','#fff');
}

$('#searchBar').keyup(function(key) {
	var pageNum = 1;
	var pageSize = 10;
	if (key.keyCode == 13) {
		var search = $('#searchBar').val().trim();//input에 작성한 작성자를 가져옴
		if (search != '') {
			location.href = "/addr/search?name=" + search + "&pageNum=" + pageNum + "&pageSize=" + pageSize;
		}else{
			alert("검색어를 입력해주세요.")
		}
	}
});
</script>
<script>
// 클릭한 주소 확인
function getAddr(placeNo){
    $('.update-popup').css('display','block');
    $.ajax({
        url : '/addr/placeNo/'+placeNo,
        type : 'GET',
        dataType : 'json',
        success : function(response){
        	$('#place_no').val(response.placeNo);
            $('#gu_code').val(response.guCode);
            $('#event_code').val(response.eventCode);
            $('#fac_name').val(response.facName);
            $('#addr_road').val(response.addrRoad);
            $('#digit').val(response.digit);
        }
	});
}

//게시물 수정 함수
$('#contentUpdate').click(function() { 
	var place_no = $('#place_no').val();
	
	var guCode = $('#gu_code').val();
	var eventCode = $('#event_code').val();
	var addrRoad = $('#addr_road').val();
	var latitude = $('#latitude').val();
	var longitude = $('#longitude').val();
	var facName = $('#fac_name').val();
	var diGit = $('#digit').val();
	
	var jsonData = {
			guCode: guCode,
			eventCode: eventCode,
			addrRoad: addrRoad,
			facName: facName,
			digit: diGit
	};
	$.ajax({
		url: '/addr/placeno/' + place_no,
		type: 'PATCH', //HTTP 메소드는 PATCH
		contentType: 'application/json', //서버에 json 타입으로 보낼 예정(요청)
		dataType: 'json', //서버 결과를 json으로 응답받겠다.
		data: JSON.stringify(jsonData),
		success: function(response) {
			if (response > 0) {
				alert('수정완료');
				var lastPage = $('#lastPage').val();
				getAddrList(lastPage, 10);
			}
		}
	});//ajax end
});//end

//주소 등록 함수
	function insert_addr(){
		var guCode = $('#insertGuCode').val();
		var eventCode = $('#insertEventCode').val();
		var facName = $('#insertFacName').val();
		var addrRoad = $('#insertAddrRoad').val();
		var digit = $('#insertDigit').val();
		if (guCode == '') {
			alert('구 코드를 입력 해주세요');
			$('#insertGuCode').focus();
			return false;
		}
		if (eventCode == '') {
			alert('종목 코드를 입력 해주세요');
			$('#insertEventCode').focus();
			return false;
		}
		if (facName == '') {
			alert('시설 이름을 입력 해주세요');
			$('#insertFacName').focus();
			return false;
		}
		if (addrRoad == '') {
			alert('주소를 작성 해주세요');
			$('#insertAddrRoad').focus();
			return false;
		}
		if (digit == '') {
			alert('주소를 작성 해주세요');
			$('#insertDigit').focus();
			return false;
		}
		var jsonData = {
				guCode: guCode,
				eventCode: eventCode,
				facName: facName,
				addrRoad: addrRoad,
				digit: digit
		};
		$.ajax({
			url: '/addr/insert',
			type: 'POST',
			contentType: 'application/json', //서버에 json 타입으로 보낼 예정(요청)
			dataType: 'json', //서버 결과를 json으로 응답받겠다.
			data: JSON.stringify(jsonData),
			success: function(response) {
				if (response > 0) {
					alert('주소가 등록되었습니다.');
					var lastPage = $('#lastPage').val();
					getAddrList(lastPage, 10);
				}
			}
		});//ajax end
};

//삭제 함수
$('.btn-delete').click(function(){
        // 게시판 번호 확인
        var place_no = $('#place_no').val();
        if(confirm('정말 삭제 하시겠습니까?')){
            $.ajax({
	            url : '/addr/delete/'+place_no,
	            type : 'DELETE',
	            dataType : 'json',
	            success : function(response){
	            	alert('삭제 완료')
	            	var pageNum = $('#nowPageNum').val();
	            	getAddrList(pageNum,10);     
	            }
			}); //ajax end
        }
    })
</script>
</body>
</html>