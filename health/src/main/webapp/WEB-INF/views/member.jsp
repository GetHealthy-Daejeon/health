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

<title>건강하슈 관리자페이지</title>
<link href="/resources/static/css/member.css" rel="stylesheet">



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
							<p>아아</p>
						</div>
					</div>
					<!--End of col-md-4-->
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 zero_mp">
						<div class="phone">
							<i class="fa fa-phone floatleft"></i>
							<p>+ 8801532-987039</p>
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
						<a class="navbar-brand custom_navbar-brand" href="#"><img
							src="/resources/static/img/logo.png" alt=""></a>
					</div>
					<!--End of navbar-header-->

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse zero_mp"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-right main_menu">
							<li class="active"><a href="#header">Home <span
									class="sr-only">(current)</span></a></li>
							<li><a href="#welcome">about</a></li>
							<li><a href="#portfolio">project</a></li>
							<li><a href="#counter">achivment</a></li>
							<li><a href="#event">event</a></li>
							<li><a href="#testimonial">testimonial</a></li>
							<li><a href="#blog">blog</a></li>
							<li><a href="#contact">contact us</a></li>
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
	<div class="member_list">
		<div class="cardHeader">
			<h2>회원 명단</h2>
		</div>
		<div class="member_button">
			<input type="button" id="delete_member" value="멤버 삭제"> <input
				type="button" id="update_member" value="멤버 수정">
		</div>
		<table>
			<thead>
				<tr>
					<th>멤버 아이디</th>
					<th>멤버 이름</th>
					<th>가입 날짜</th>
				</tr>
			</thead>
			<tbody id="boardData">
				<c:choose>
					<c:when test="${fn:length(membership.list)>0}">
						<c:forEach items="${membership}" var="member">
							<tr>
								<td>${member.memberId}</td>
								<td>${member.memberName}</td>
								<td>${member.creatAt}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan=6 style="text-align: center;">게시글이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>

			</tbody>
		</table>
		<div class="pagination">
			<a href="#">Previous</a> <a href="#">1</a> <a href="#">2</a> <a
				href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">Next</a>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

<script type="text/javascript">
	getPageNum();//페이지 번호 알아내는 함수 호출

	function getPageNum() {
		var pageNum = $('#nowPageNum').val();
		$('#pageNum' + pageNum).css('backgroundColor', '#287bff');
		$('#pageNum' + pageNum).css('color', '#fff');
	}

	function getMemberList() {
		$.ajax({
			url : '/health/member',
			type : 'GET',
			dataType : 'json',
			success : function(response) {
				console.log(response);

				if (response.length > 0) {
					for (var i = 0; i < response.length; i++) {
						html += '<tr><td>' + response[i].memberName
								+ '</td><td>' + response[i].memberId
								+ '</td><td>' + response[i].createAt
								+ '</td></tr>'
					}
				} else {
					//게시글 없음 로직 구현

				}
				$('#data').append(html); //tbody에 json데이터 렌더링
			}
		})
	}
</script>


</body>

</html>