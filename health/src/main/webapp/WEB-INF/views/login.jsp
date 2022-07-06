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
<link rel="stylesheet" href="/resources/static/css/login.css" />
<link href="/resources/static/css/bootstrap.min.css" rel="stylesheet">
<title>건강하슈 로그인</title>
</head>
<body data-spy="scroll" data-target="#header">

	<!--Start Hedaer Section-->
	<section id="header">
		<div class="header-area">
			<div class="top_header">
				<div class="container">
					<div class="row">
						<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 zero_mp">
							<div class="address">
								<i class="fa fa-home floatleft"></i>
								<p>Elephant Road, Dhaka 1205, Bangladesh</p>
							</div>
						</div>
						<!--End of col-md-4-->
						<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 zero_mp">
							<div class="phone">
								<i class="fa fa-phone floatleft"></i>
								<p>+82-5390-2530</p>
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
								data-target="#bs-example-navbar-collapse-1"
								aria-expanded="false">
								<span class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
							<a class="navbar-brand custom_navbar-brand" href="http://localhost:8080/health/index"><img
								src="/resources/static/img/logo.png" alt=""></a>
						</div>
						<!--End of navbar-header-->

						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse zero_mp"
							id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav navbar-right main_menu">
								<li class="active">
								<a href="/health/index">Home
								 <span class="sr-only">(current)</span></a></li>
								<li><a href="/health/login">Login</a></li>
								<li><a href="/health/join">Join</a></li>

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

	<!--Start of Purches-->
	<section id="purches">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h2 class="purches_title">Lets-Health Login Page</h2>
				</div>
				<div class="col-md-2 col-md-offset-4">
					<!-- 검은색 창 위 -->
					<!-- <a href="" class="purches_btn">purches</a> -->

				</div>
			</div>
		</div>
		<!--End of row-->
		</div>
		<!--End of container-->
	</section>
	<!--End of purches-->
	<section id="login">
		<h1>Login</h1>
		<div class="txt-field">
			<input type="text" id="userId" required /> <label>이름</label>
		</div>
		<div class="txt-field">
			<input type="password" id="userPassword" required /> <label>비밀번호</label>
		</div>
		<input class="login-btn" type="button" value="로그인" onclick="login()" />
		<div class="signup-link">
			<br>회원이 아닌가요? <a href="/health/join">회원가입</a>
		</div>
	</section>

	<!--Start of footer-->
	<section id="footer">
		<div class="container">
			<div class="row text-center">
				<div class="col-md-6">
					<div class="copyright">
						<p>
							@ 2022 - Design By minyoung<span><a href="">&#9798;</a></span>
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
	<!--End of footer-->
	<!--Scroll to top-->
	<a href="#" id="back-to-top" title="Back to top">&uarr;</a>
	<!--End of Scroll to top-->

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script>
		// 엔터 누르면 로그인 실행되게
		$('#userId').keyup(function(key){
	        if(key.keyCode == 13){
				login();
	        }
	    })
	    $('#userPassword').keyup(function(key){
	        if(key.keyCode == 13){
				login();
	        }
	    })
	    
		function login() {
			var userId = $('#userId').val();
			var userPassword = $('#userPassword').val();
			if (userId == '' || userPassword == '') {
				alert('회원 정보를 정확히 입력해주십시오.');
				return false;
			}
			console.log(userId)
			console.log(userPassword)
			
			
			
			var jsonData = {
				memberName : userId,
				memberPassword : userPassword
			}

			$.ajax({
				url : '/health/login',
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify(jsonData),
				success : function(response) {
					if (response) {
						alert('로그인 되었습니다.')
						location.href = 'http://localhost:8080/health/index';
					} else {
						alert('아이디 혹은 비밀번호가 틀렸습니다.')
					}

				}
			})
		}
	</script>
</body>
</html>