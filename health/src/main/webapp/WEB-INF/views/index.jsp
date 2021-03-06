<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="icon" href="/resources/static/img/marker_img/favicon.ico">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<title>대전시민 모두 건강하슈</title>

<link rel="stylesheet" href="/resources/static/css/style.css" />
<link href="/resources/static/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/> <!-- 추가 -->
<!-- fontawesome kit(아이콘) -->
<script src="https://kit.fontawesome.com/70d780dcf7.js"
	crossorigin="anonymous"></script>
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
								<!-- <i class="fa fa-home floatleft"></i> -->
								<a href="https://github.com/GetHealthy-Daejeon/GetHealthy"
									target="_blank"><i class="fa-brands fa-github"></i>Github</a>
							</div>
						</div>
						<!--End of col-md-4-->
						<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 zero_mp">
							<!--<div class="phone">
								<i class="fa fa-phone floatleft"></i>
								<p>+ 8801532-987039</p>
							</div>-->
						</div>
						<!--End of col-md-4-->
						<div class="col-md-4">
							<div class="social_icon text-right">
								<a href=""><i class="fa fa-twitter"></i></a> <a href=""><i
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
									<div class="welcome_name">
										<p>${memberName}님환영합니다</p>
									</div>
								</c:if>

								<!-- 관리자에게 보이는 메뉴 -->
								<c:if test="${2 eq authority}">
									<li class="active"><a href="/health/index">Home <span
											class="sr-only">(current)</span></a></li>
									<li><a href="/map">Map</a></li>
									<li><a href="/admin/members?pageNum=1&pageSize=10">Mem-Manage</a></li>
									<li><a href="/admin/addr?pageNum=1&pageSize=10">Map-Manage</a></li>
									<li><a href="/health/logout">Logout</a></li>
									<div class="welcome_name">
										<p>${memberName}님 환영합니다</p>
									</div>
								</c:if>

								<!-- 정지회원에게 보이는 메뉴 -->
								<c:if test="${3 eq authority}">
									<p>정지된 회원이기에 아무것도 이용할 수 없습니다.</p>
									<li style="position:absolute; right:0;"><a href="/health/logout">Logout</a></li>
									<div class="welcome_name">
										<p>${memberName}님환영합니다</p>
									</div>
								</c:if>
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

	<!--Start of slider section-->
	<section id="slider">
    <div class="swiper-wrapper"> <!-- 추가 -->
		<div id="carousel-example-generic"
			class="carousel slide carousel-fade" data-ride="carousel"
			data-interval="3000">
			<!-- Indicators -->
			<ol class="carousel-indicators">
			</ol>
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<!-- <div class="item active"> --> 
				<!-- swiper -->
				<div class="container" id="gara">
					<div class="swiper">
						<div class="swiper-wrapper"> <!-- 추가 -->
							<div class="swiper-slide"> <!-- 추가 아래에 반복-->
								<div class="slider_overlay"> <!-- swiper-slide -->
									<img src="/resources/static/img/img1.jpg" alt="...">
									<div class="carousel-caption">
										<div class="slider_text">
											<h2>Get Healthy</h3>
											<h3>건강하슈</h3>
											<h4>대전 시민 건강증진을 위해 대전시에 위치한 공공 체육시설을 안내하는 지도 서비스</h2>
											<p></p>
			 								<a href="#welcome" id ="moreView" class="custom_btn" name="scroll_move">살펴보기</a>
			 							</div>
									</div>
								</div>
							</div>
							<!--End of item With Active-->
							<!-- <div class="item"> -->
							<div class="swiper-slide">
								<div class="slider_overlay">
									<img src="/resources/static/img/img2.jpg" alt="...">
									<div class="carousel-caption">
										<div class="slider_text">
											<h2>Get Healthy</h3>
											<h3>UPDATES</h2>
											<p>지도가 새로 업데이트 됐습니다.</p>
											<a href="#welcome" id ="moreView" class="custom_btn" name="scroll_move">살펴보기</a>
										</div>
									</div>
								</div>
							</div>
							<!--End of Item-->
							<!-- <div class="item"> -->
							<div class="swiper-slide">
								<div class="slider_overlay">
									<img src="/resources/static/img/img3.jpg" alt="...">
									<div class="carousel-caption">
										<div class="slider_text">
											<h2>Get Healthy</h3>
											<h3>UPDATES</h2>
											<p>@@구 @@동에 새로운 풋볼장이 생겼습니다.</p>
											<a href="#welcome" id ="moreView" class="custom_btn" name="scroll_move">살펴보기</a>
										</div>
									</div>
								</div>
							</div>
							<!--End of item-->
						</div>
						<div class="swiper-pagination"></div>
						<div class="swiper-button-prev"></div>
		    			<div class="swiper-button-next"></div>
					</div>
				</div>
			</div>
			<!--End of Carousel Inner-->
		</div>
	</div> <!-- 추가 -->
	</section>
	<!--end of slider section-->



	<!--Start of welcome section-->
	<section id="welcome">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="wel_header"></div>
				</div>
			</div>
			<!--End of row-->
			 <section class='section' id="arrivalSection"></section>
			<div class="map-field">
				<p class="text-map">내 근처의 공공시설을 찾아보세요!</p>
				<div class="col-md-3">
					<div class="item">
						<div class="single_item">
							<div class="item_list">
								<div class="welcome_icon">
								<c:if test="${authority != '1' && authority !='2' && authority !='3'}">
								<a target="_blank"> 
										<img class="nonmember" src="/resources/static/img/대전.png">
											<h3 class="t1">로그인 후 이용 가능합니다.</h3>
										</a>
									
									</c:if>
									<!-- 일반 회원 -->
									<c:if test="${authority eq '1'}">
										<a href="/map" target="_blank"> <img class="daejeon"
											src="/resources/static/img/대전.png"
											href="/map">
											<h3 class="t1"><< 이미지를 클릭하여 지도로 이동하기 >></h3>
										</a>
									</c:if>
									<!-- 관리자 -->
									<c:if test="${authority eq '2'}">
										<a href="/map" target="_blank"> <img class="daejeon"
											src="/resources/static/img/대전.png"
											href="/map">
											<h3 class="t1"><< 이미지를 클릭하여 지도로 이동하기 >></h3>
										</a>
									</c:if>
									<!-- 정지 회원 -->
									<c:if test="${authority eq '3'}">
										<a target="_blank"> 
										<img class="ban_daejeon" src="/resources/static/img/대전.png">
											<h3 class="t1">정지회원은 이용할 수 없습니다.</h3>
										</a>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
			<!--End of row-->
		</div>
		<!--End of container-->
	</section>
	<!--end of welcome section-->

	<!--Start of counter-->
	<section id="counter">
		<div class="counter_img_overlay">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="counter_header">
							<h2>대전시 건강 현황</h2>
							<h3>Sports Facilities in Daejeon</h3>
						</div>
					</div>
					<!--End of col-md-12-->
				</div>
				<!--End of row-->
				<div class="row">
					<div class="col-md-3">
						<div class="counter_item text-center">
							<div class="sigle_counter_item">
								<img src="/resources/static/img/main_park.png" alt="">
								<div class="counter_text">
									<span class="counter" id="park">&nbsp;</span>
									<p>공원</p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="counter_item text-center">
							<div class="sigle_counter_item">
								<img src="/resources/static/img/weightlifter.png" alt="">
								<div class="counter_text">
									<span class="counter" id="facility">&nbsp;</span>
									<p>공공 체육시설</p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="counter_item text-center">
							<div class="sigle_counter_item">
								<img src="/resources/static/img/bicycle.png" alt="">
								<div class="counter_text">
									<span class="counter" id="tashu">&nbsp;</span>
									<p>타슈 정류장</p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="counter_item text-center">
							<div class="sigle_counter_item">
								<img src="/resources/static/img/people.png" alt="">
								<div class="counter_text">
									<span class="counter">1,448,401</span>
									<p>대전시 총 인구</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--End of row-->
			</div>
			<!--End of container-->
		</div>
	</section>
	<!--end of counter-->

	<!--Start of testimonial-->
	<section id="testimonial">
		<div class="testimonial_overlay">
			<div class="container">
				<div class="row">
						<div class="testimonial_header text-center">
							<h2>대전시 건강 소식<h2>
							<h3>Sports News in Daejeon</h3>
							<br>
						</div>
				</div>
				<!--End of row-->
				<section id="carousel">
					<div class="container">
						<div class="row">
							<div class="col-md-12 text-center">
								<div class="carousel slide" id="fade-quote-carousel"
									data-ride="carousel" data-interval="3000">
									<div class="carousel-inner">
										<div class="active item">
											<div class="row">
												<div class="col-md-6">
													<div class="testimonial_content">
														<a href="http://www.ggilbo.com/news/articleView.html?idxno=921218">
														<img src="/resources/static/img/marker_img/tashuNews.jpg" alt="">
														<br><br>[新타슈시대 열린다] 더 편하고 경쾌하게 … 타슈 시즌2, 일상을 바꾸다</a>
													</div>
													
												</div>
												<div class="col-md-6">
													<div class="testimonial_content">
														<a href="http://mbnmoney.mbn.co.kr/news/view?news_no=MM1004593365">
													   <img src="/resources/static/img/marker_img/daejeonNews.jpg" alt="">
														<br><br> [대전시 생활체육 인프라 확충] 서남부종합스포츠타운 등 조성 '순항'</a>
													</div>
													
												</div>
											</div>
										</div>
										<!--End of item with active-->
										<div class="item">
											<div class="row">
												<div class="col-md-6">
													<div class="profile-circle">
														<img src="/resources/static/img/tree_cut_3.jpg" alt="">
													</div>
													<div class="testimonial_content">
														<i class="fa fa-quote-left"></i>
														<p>Lorem ipsum dolor sit amet, consectetur adipisicing
															elit. Quidem, veritatis nulla eum laudantium totam
															tempore optio doloremque laboriosam quas, quos eaque
															molestias odio aut eius animi. Impedit temporibus nisi
															accusamus.</p>
													</div>
													<div class="testimonial_author">
														<h5>Sadequr Rahman Sojib</h5>
														<p>CEO, Fourder</p>
													</div>
												</div>
												<div class="col-md-6">
													<div class="profile-circle">
														<img src="/resources/static/img/tree_cut_3.jpg" alt="">
													</div>
													<div class="testimonial_content">
														<i class="fa fa-quote-left"></i>
														<p>Lorem ipsum dolor sit amet, consectetur adipisicing
															elit. Quidem, veritatis nulla eum laudantium totam
															tempore optio doloremque laboriosam quas, quos eaque
															molestias odio aut eius animi. Impedit temporibus nisi
															accusamus.</p>
													</div>
													<div class="testimonial_author">
														<h5>Sadequr Rahman Sojib</h5>
														<p>CEO, Fourder</p>
													</div>
												</div>
											</div>
										</div>
										<!--ENd of item-->
									</div>
								</div>
							</div>
						</div>
						<!--End of row-->
					</div>
					<!--End of container-->
				</section>
				<!--End of carousel-->
			</div>
		</div>
		<!--End of container-->
	</section>
	<!--end of testimonial-->

	<!--Start of Market-->
	<section id="market">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="market_area text-center">
						<div class="row">
							<div class="col-md-3">
								<div class="market_logo">
									<a href="https://www.daejeon.go.kr/"><img src="/resources/static/img/banner_img/banner_daejeon.jpg" alt=""></a>
								</div>
							</div>
							<div class="col-md-3">
								<div class="market_logo">
									<a href="https://www.donggu.go.kr/dg/kor"><img src="/resources/static/img/banner_img/banner_dongGu.jpg" alt=""></a>
								</div>
							</div>
							<div class="col-md-3">
								<div class="market_logo">
									<a href="https://www.seogu.go.kr/kor/main.do"><img	src="/resources/static/img/banner_img/banner_seoGu.jpg" alt=""></a>
								</div>
							</div>
							<div class="col-md-3">
								<div class="market_logo">
									<a href="https://www.djjunggu.go.kr/kr/index.do"><img src="/resources/static/img/banner_img/banner_jungGu.jpg" alt=""></a>
								</div>
							</div>
						</div>
						<!--End of row-->
					</div>
					<!--End of market Area-->
				</div>
				<!--End of col-md-12-->
			</div>
			<!--End of row-->
		</div>
		<!--End of container-->
	</section>
	<!--End of market-->

	<!--Start of contact-->
	<section id="contact">
		<div class="container">
			<div class="row">
				<div class="colmd-12">
					<div class="contact_area text-center">
						<h3>get in touch</h3>
						<p>문의사항은 메세지로 남겨주세요^^</p>
					</div>
				</div>
			</div>
			<!--End of row-->
			<div class="row">
				<div class="col-md-6">
					<div class="office">
						<div class="title">
							<h5>our office info</h5>
						</div>
						<div class="office_location">
							<div class="address">
								<i class="fa fa-map-marker"><span>대전 중구 중앙로121번길 20
										방산빌딩 DW아카데미학원</span></i>
							</div>
							<div class="phone">
								<i class="fa fa-phone"><span>042-222-2402</span></i>
							</div>
							<div class="email">
								<i class="fa fa-envelope"><span>cozy2402@gmail.com</span></i>
							</div>
							<div id="map">
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="msg">
						<div class="msg_title">
							<h5>Drop A Message</h5>
						</div>
						<div class="form_area">
							<!-- CONTACT FORM -->
							<div class="contact-form wow fadeIn animated"
								data-wow-offset="10" data-wow-duration="1.5s">
								<div id="message"></div>
								<form class="gform" method="POST" action="https://script.google.com/macros/s/AKfycbwRzx1orraJZucktfL2AzNpwyAgIvD0_KNsPKd9ow/exec">
									<div class="form-group">
										<div class="col-sm-6">
											<input type="text" class="form-control" name="name" id="name" placeholder="이름" required>
										</div>
										<div class="col-sm-6">
											<input type="text" class="form-control" name="email" id="email" placeholder="이메일" required>
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-12">
											<div class="text_area">
												<textarea name="message" id="msg" class="form-control" cols="30" rows="8" placeholder="문의하실 내용을 적어주세요." required></textarea>
											</div>
											<button type="submit" class="btn custom-btn" data-loading-text="Loading...">보내기</button>
											<div style="display:none" class="thankyou_message">전송되었습니다!</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!--End of col-md-6-->
			</div>
			<!--End of row-->
		</div>
		<!--End of container-->
	</section>
	<!--End of contact-->

	<!--Start of footer-->
	<section id="footer">
		<div class="container">
			<div class="row text-center">
				<div class="col-md-6">
					<div class="copyright">
						<p>
							@ 2022 - Design By 건강하슈 <span><a href="">&#9798;</a></span>
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
	<!--End of footer-->

	<!--Scroll to top-->
	<a href="#" id="back-to-top" title="Back to top">&uarr;</a>
	<!--End of Scroll to top-->
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<!-- <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js'></script>-->
	<script src="/resources/static/js/jquery-1.12.3.min.js"></script>

	<!--Counter UP Waypoint-->
	<!-- <script src="/resources/static/js/waypoints.min.js"></script> -->
	<!--Counter UP-->
	<script src="/resources/static/js/jquery.counterup.min.js"></script>

	<script>
		//for counter up
		$('.counter').counterUp({
			delay : 10,
			time : 1000
		});
		$('.ban_daejeon').click(function(){
			alert("정지회원은 사용하실 수 없습니다.")
		})
		$('.nonmember').click(function(){
			alert("로그인 후 이용 가능합니다.")
		})
	</script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=42189fc27ae4cf0d73678ba4cae1e6a0"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(36.3291227, 127.4229921), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	var map = new kakao.maps.Map(mapContainer, mapOption);
	var marker = new kakao.maps.Marker({
	    map: map, 
	    position: new kakao.maps.LatLng(36.3286904, 127.4229992)
	});
	var content = '<div class="wrap">' + 
	            '    <div class="info">' + 
	            '        <div class="title">' + 
	            '            DW 아카데미' +
	            '        </div>' + 
	            '            <div class="desc">' + 
	            '                <div class="ellipsis">대전광역시 중구 중앙로121번길 20</div>' + 
	            '                <div class="jibun ellipsis">(우) 34838 (지번) 선화동 41</div>' + 
	            '                <div><br><a href="https://map.kakao.com/link/map/DW아카데미,36.3286904,127.4229992" style="color:blue" target="_blank">큰지도</a> <a href="https://map.kakao.com/link/to/DW아카데미,36.3286904,127.4229992" style="color:blue" target="_blank">길찾기</a></div>' + 
	            '            </div>' + 
	            '        </div>' + 
	            '    </div>' +    
	            '</div>';

	// 마커 위에 커스텀오버레이를 표시합니다
	// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
	var overlay = new kakao.maps.CustomOverlay({
	    content: content,
	    map: map,
	    position: marker.getPosition()       
	});
	</script>
	
	<!-- 문의하기(get in touch) 버튼 클릭 결과를 메세지로 변경 -->
	<script data-cfasync="false" type="text/javascript" src="https://cdn.rawgit.com/dwyl/html-form-send-email-via-google-script-without-server/master/form-submission-handler.js"></script>
	<!--Back To Top-->
	<script src="/resources/static/js/backtotop.js"></script>

	<!--JQuery Click to Scroll down with Menu-->
	<script src="/resources/static/js/jquery.localScroll.min.js"></script>
	<script src="/resources/static/js/jquery.scrollTo.min.js"></script>
	<!--WOW With Animation-->
	<script src="/resources/static/js/wow.min.js"></script>
	<!--WOW Activated-->
	<script>
		new WOW().init();
		$('.ban_daejeon').click(function(){
			alert("정지회원은 사용하실 수 없습니다.");
		})
	</script>
	<script src="/resources/static/js/statistics.js"></script>
	<script src="/resources/static/js/jquery.counterup.min.js"></script>
	<!--Counter UP Waypoint-->
	<!-- <script src="/resources/static/js/waypoints.min.js"></script> -->
	<!--Counter UP-->
	<script>
		//for counter up
		$('.counter').counterUp({
			delay : 10,
			time : 1000
		});
	</script>
	<script>
		//버튼 누르면 스크롤 내려지는 로직 (22.07.08 양다은)
		$('a[name="scroll_move"]').on('click',function(event){
        event.preventDefault(); //a태그에서 기본으로 정의된 이벤트 작동 막기
        $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
      	});
	</script>
	<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
    <script>
    	const swiper = new Swiper('.swiper', {
	        autoplay : {delay: 10000},
	        loop: true,
	        pagination: {el:'.swiper-pagination'},
	        navigation: {
	          nextEl: '.swiper-button-next',
	          prevEl: '.swiper-button-prev',
	        },
		});
	</script>
</body>
</html>