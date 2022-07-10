<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="/resources/static/css/member.css" />
<link href="/resources/static/css/bootstrap.min.css" rel="stylesheet">

<title>건강하슈 관리자페이지</title>
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
						<a class="navbar-brand custom_navbar-brand" href="/health/index"><img
							src="/resources/static/img/logo.png" alt=""></a>
					</div>
					<!--End of navbar-header-->

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse zero_mp"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-right main_menu">

								<c:if
									test="${authority != '1' && authority !='2' && authority !='3'}">
									<li><a href="/health/index">Home <span
											class="sr-only">(current)</span></a></li>
									<li><a href="/health/login">Login</a></li>
									<li><a href="/health/join">Join</a></li>
								</c:if>
								<!-- 일반회원에게 보이는 메뉴 -->
								<c:if test="${1 eq authority}">
									<li><a href="/health/index">Home <span
											class="sr-only">(current)</span></a></li>
									<li><a href="/map">Map</a></li>
									<li><a href="/health/logout">Logout</a></li>
								</c:if>

								<!-- 관리자에게 보이는 메뉴 -->
								<c:if test="${2 eq authority}">
									<li><a href="/health/index">Home <span
											class="sr-only">(current)</span></a></li>
									<li><a href="/map">Map</a></li>
									<li class="active"><a href="/admin/members?pageNum=1&pageSize=10">Mem-Manage</a></li>
									<li><a href="/admin/addr?pageNum=1&pageSize=10">Map-Manage</a></li>
									<li><a href="/health/logout">Logout</a></li>
								</c:if>

								<!-- 정지회원에게 보이는 메뉴 -->
								<c:if test="${3 eq authority}">
									<p>정지된 회원이기에 아무것도 이용할 수 없습니다.</p>
									<li><a href="/health/logout">Logout</a></li>
								</c:if>
								<div class="welcome_name">
									<p>${memberName}님 환영합니다</p>
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
	<!-- 학생 추가 팝업 -->
	<div class="write-popup">
	    <div class="editor">
	    	<p class="mem-insert">회원 등록</p>
	        <div class="input-box">
	            <label for="memberName">이름 : </label>
	            <input id="insertMemberName" type="text" placeholder="이름">
	        </div>
	        <div class="input-box">
	            <label for="memberPassword">비밀번호 : </label>
	            <input id="insertMemberPassword" type="text" placeholder="비밀번호">
	        </div>
	        <div class="input-box">
	            <label for="memberAuthority">권한 : </label>
	            <input id="insertMemberAuthority" type="text" placeholder="권한">
	        </div>
	        <div class="btn-area">
	            <a id="contentSubmit" href="#" class="btn-success">등록</a>
	            <a href="#" class="btn-cancel">취소</a>
	        </div>
	    </div>
	</div>
	<!-- 학생 정보 수정 팝업 -->
	<div class="update-popup">
		<div class="editor">
			<div class="close">
				<a href="#" class="btn-close">X</a>
			</div>
			<div class="input-box">
				<label for="memberName">멤버 번호 : </label> 
				<input id="memberId" type="text"  value="${memberId}" readonly>
				<%-- <input id="memberHiddenId" type="hidden" value="${memberId}"> --%>
			</div>
			<div class="input-box">
				<label for="memberName">멤버 이름 : </label> 
				<input id="memberName" type="text" placeholder="회원의 이름을 입력하세요" >
			</div>
			<div class="input-box">
				<label for="title">비밀번호 : </label>
				<input id="memberPassword" type="text" placeholder="비밀번호를 입력하세요...">
			</div>
			<div class="input-box">
				<label for="authority">회원 권한 : </label> 
				<input id="authority" type="text" placeholder="회원의 권한을 입력하세요" >
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
			<h2>회원 명단</h2>
            <input type="button" class="btn-mem" value="회원 등록">
			<div class="search">
                <label>
                    <input id="searchBar" type="text" placeholder="회원을 검색하세요..." >
                </label>
            </div>
		</div>
		<div class="member_button">
		</div>
		<table>
			<thead>
				<tr>
					<th>멤버 번호</th>
					<th>멤버 이름</th>
					<th>비밀번호</th>
					<th>권한</th>
					<th>가입 날짜</th>
				</tr>
			</thead>
			<tbody id="boardData">
				<c:choose>
					<c:when test="${fn:length(pageHelper.list) > 0}">
						<c:forEach items="${pageHelper.list}" var="item">
							<tr onclick="getMember(${item.memberId})">
								<td>${item.memberId}</td>
								<td>${item.memberName}</td>
								<td>${item.memberPassword}</td>
								<td>${item.authority}</td>
								<td>${item.createAt}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5" style="text-align:center;">회원이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<div class="pagination">
		<c:if test="${fn:length(pageHelper.list) > 0}">
			<c:if test="${pageHelper.hasPreviousPage}">
				<a onclick="getMemberList(1,10)">←</a>
				<a onclick="getMemberList(${pageHelper.pageNum-1},10)">이전</a>
			</c:if>
			<c:forEach begin="${pageHelper.navigateFirstPage}"
				end="${pageHelper.navigateLastPage}" var="pageNum">
				<a id="pageNum${pageNum}" onclick="getMemberList(${pageNum},10)">${pageNum}</a>
			</c:forEach>
			<c:if test="${pageHelper.hasNextPage}">
				<a onclick="getMemberList(${pageHelper.pageNum+1},10)">다음</a>
				<a onclick="getMemberList(${pageHelper.pages},10)">→</a>
			</c:if>
			<input id="nowPageNum" type="hidden" value="${pageHelper.pageNum}">
		</c:if>
		</div>
	</div>

</section>
<!--Start of footer-->
<section id="footer">
	<div class="container">
		<div class="row text-center">
			<div class="col-md-6">
				<div class="copyright">
					<p>
						@ 2022 - Design By 건강하슈 
					</p>
				</div>
			</div>
			<div class="col-md-6">
				<div class="designer">
					<p>
						A Design By XpeedStudio
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
<script>
$('.btn-mem').click(function(){
    $('.write-popup').css('display', 'block');
});
$('.btn-cancel').click(function(){
    $('.write-popup').css('display', 'none');
});
$('.btn-close').click(function(){
	$('.update-popup').css('display','none');
});
</script>
<script>
	function getPageNum() {
		var pageNum = $('#nowPageNum').val();
		$('#pageNum' + pageNum).css('backgroundColor', '#287bff');
		$('#pageNum' + pageNum).css('color', '#fff');
	}
</script>
<script>
getPageNum();//페이지 번호 알아내는 함수 호출

//페이지 번호 알아내는 함수
function getPageNum(){
	var pageNum = $('#nowPageNum').val();
	$('#pageNum'+pageNum).css('backgroundColor','#287bff'); // id가 pageNum + pageNumber 문자를 합친거
	$('#pageNum'+pageNum).css('color','#fff');
}

function getMemberList(pageNum, pageSize){
	location.href="/admin/members?pageNum="+pageNum+"&pageSize="+pageSize;    
}
</script>
<script>
function getMember(memberId) {//클릭한 게시물 확인하는 함수 
	//boardId html에 hidden 하기
	//1. 화면 none -> block
	var mamberName = $('#memberName').val();
	var memberPassword = $('#memberPassword').val();
	/* var mamberCreatAt = $('#mamberCreatAt').val(); */
	$('.update-popup').css('display', 'block');
	//AJAX 작성
	//2. AJAX를 이용해서 서버와 연결
	$.ajax({
		url: '/health/member/' + memberId,
		type: 'GET',
		dataType: 'json',
		success: function(response) {
			//3. input에 데이터 set 해주기!  
			$('#memberId').val(response.memberId);
			$('#memberName').val(response.memberName);
			$('#memberPassword').val(response.memberPassword);
			$('#authority').val(response.authority);
		}
	});
}//end

    let list = document.querySelectorAll('.navigation li');
    function activeLink(){
        list.forEach((item) => {item.classList.remove('hovered')});
        this.classList.add('hovered');
    }
    list.forEach((item) => {item.addEventListener('mouseover',activeLink)});
    //end
</script>

<script>
// 회원 등록
$("#contentSubmit").click(function(){
    var memberName = $("#insertMemberName").val();
    var memberPassword = $("#insertMemberPassword").val();
    var authority = $("#insertMemberAuthority").val();
    if(memberName == ""){
      alert("이름을 입력해주세요.");
      return false;
    }
    if(memberPassword == ""){
      alert("비밀번호를 입력해주세요");
      return false;
    }
    if(authority == ""){
        alert("권한을 입력해주세요");
        return false;
    }
    if(confirm('회원을 등록하시겠습니까?')){
        var jsonData = {
            "memberName" : memberName,
            "memberPassword" : memberPassword,
            "authority" : authority
        }
        $.ajax({
            url : "/health/member",
            type : "POST",
            contentType : "application/json",
            dataType : "json",
            data : JSON.stringify(jsonData), 
            success : function(response){
                if(response >0){
                	alert("등록되었습니다!");
                    location.reload();
                }
            }  
        })
    }
})

//회원 삭제 하는 함수
$('#contentDelete').click(function() {
	var memberId = $('#memberId').val(); //hidden에 숨겨둔 boardId 가져오기.
	if (confirm('해당 회원을 정말 삭제하시겠습니까?')) {
		$.ajax({
			url: '/health/member/' + memberId,
			type: 'DELETE',
			dataType: 'json',
			success: function(response) {
				if (response > 0) {
					alert('삭제완료');
					location.reload();
				}
			}
		});
	}
});

//회원 수정 하는 함수
$('#contentUpdate').click(function() { 
	//1. 게시판 번호 확인
	var memberId = $('#memberId').val(); //hidden에 숨겨둔 boardId 가져오기.
	//2. JSON 생성
	var memberName = $('#memberName').val();
	var memberPassword = $('#memberPassword').val();
	var authority = $('#authority').val();
	
	var jsonData = {
			memberName: memberName,
			memberPassword: memberPassword,
			authority : authority
	};
	//3. AJAX를 이용해서 업데이트!
	$.ajax({
		url: '/health/member/' + memberId,
		type: 'PATCH', //HTTP 메소드는 PATCH
		contentType: 'application/json', //서버에 json 타입으로 보낼 예정(요청)
		dataType: 'json', //서버 결과를 json으로 응답받겠다.
		data: JSON.stringify(jsonData),
		success: function(response) {
			if (response > 0) {
				alert('수정완료');
				location.reload();
/* 				var pageNum = $('#nowPageNum').val();
				getMemberList(pageNum, 10); */
			}
		}
	});//ajax end
});//end

// 검색 함수
$('#searchBar').keyup(function(key){
    var pageNum = 1;
    var pageSize = 10;
    if(key.keyCode == 13){
        var search = $('#searchBar').val().trim();
        if(search !=''){
        	location.href="/admin/members/search?name="+search+"&pageNum="+pageNum+"&pageSize="+pageSize;
        	console.log(search)
        }else{
        	alert("검색어를 입력해주세요.")
        }
    }
});

//esc 누르면 팝업 닫기
$(document).keydown(function(key){
    if(key.keyCode == 27){
        $('.update-popup').css('display', 'none')
        $('.write-popup').css('display', 'none')
        return false;
    }
})
</script>
</body>
</html>
