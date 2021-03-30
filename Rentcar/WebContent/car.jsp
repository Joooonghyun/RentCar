<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Level HTML Template by Tooplate</title>
<script src="https://kit.fontawesome.com/5d6834125d.js"
	crossorigin="anonymous"></script>
<!--

Tooplate 2095 Level

https://www.tooplate.com/view/2095-level

-->
<!-- load stylesheets -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
<!-- Google web font "Open Sans" -->
<link rel="stylesheet"
	href="font-awesome-4.7.0/css/font-awesome.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Bootstrap style -->
<link rel="stylesheet" type="text/css" href="slick/slick.css" />
<link rel="stylesheet" type="text/css" href="slick/slick-theme.css" />
<link rel="stylesheet" type="text/css" href="css/datepicker.css" />
<link rel="stylesheet" href="css/tooplate-style2.css">
<!-- Templatemo style -->

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
          <![endif]-->
<style>
table {
	margin: auto;
	text-align: center;
	width: 1200px;
	height: 500px;
}

table, tr, td, th {
	border: 1px solid black;
	background-color: transparent;
}

span {
	color: #ee5057;
}

tr:hover {
	color: white;
	background: #ee5057;
}

input[type=radio] {
	width: 40px;
	height: 40px;
	border: 1px;
}

input[type=checkbox] {
	width: 25px;
	height: 25px;
}

.graycolor {
	color: #4b4b4b;
}

/* color: #d1d1d1; */
#checkCar {
	text-align: center;
}
</style>
</head>

<body>
	<!-- 전체 -->
	<div class="tm-main-content" id="top">
		<div class="tm-top-bar-bg"></div>
		<!-- 메뉴 -->
		<div class="tm-top-bar" id="tm-top-bar">
			<!-- Top Navbar -->
			<div class="container">
				<div class="row">
					<nav class="navbar navbar-expand-lg narbar-light">
						<a class="navbar-brand mr-auto" href="#"><h3>
								<span> <i class="fas fa-caravan fa-2x"></i></span> <strong>차빌리기</strong>
							</h3> </a>
						<button type="button" id="nav-toggle"
							class="navbar-toggler collapsed" data-toggle="collapse"
							data-target="#mainNav" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
					</nav>
				</div>
			</div>
		</div>

		<!-- 차량 선택 -->
		<div id="checkCar">
			<form action="reserveClear" method="post">
				<!-- 메인에서 넘겨 받은 것들을 ReserveController.java 서블릿으로 넘겨주기 위함 -->
				<input type="hidden" value="${rcDTO.locations}" name="locations">
				<input type="hidden" value="${rcDTO.starts}" name="starts">
				<input type="hidden" value="${rcDTO.ends}" name="ends"> <input
					type="hidden" value="${rcDTO.starttime}" name="starttime">
				<input type="hidden" value="${rcDTO.endtime}" name="endtime">
                  <input type="hidden" value="${rcDTO.reid}" name="reid">				
                  <!-- 차량 선택 테이블 -->
				<table style="font-size: 15px; margin-top: 0px">
					<tr style="background-color: #ee5057; height: 50px;">
						<th>차종</th>
						<th style="width: 200px">설명</th>
						<th>가격</th>
						<th>선택</th>
					</tr>
					<tr>
						<td><img
							src="https://imgauto-phinf.pstatic.net/20190730_242/auto_1564468650615RBwUe_PNG/20190730153720_wMc08g64.png?type=f567_410"
							width="200px" height="200px"> <br>[람보르기니 아벤타도르]</td>
						<td>
							<ol style="list-style-type: none; text-align: left">
								<li><span class="graycolor">연비</span> 4.4km/L</li>
								<li><span class="graycolor">연료</span> 가솔린</li>
								<li><span class="graycolor">출력</span> 770hp</li>
								<li><span class="graycolor">판매</span> 국내출시</li>
							</ol>
						</td>
						<td>93,000원</td>
						<td><input type="radio" name="variety" value="aventador"></td>
					</tr>
					<tr>
						<td><img
							src="https://imgauto-phinf.pstatic.net/20200407_260/auto_158622334588119POx_PNG/20200407103528_nX2tmWyk.png?type=f567_410"
							width="200px" height="200px"><br> [마세라티 콰트로포르테]</td>
						<td>
							<ol style="list-style-type: none; text-align: left">
								<li><span class="graycolor">연비</span> 6.6 ~ 9.4km/L</li>
								<li><span class="graycolor">연료</span> 디젤, 가솔린</li>
								<li><span class="graycolor">출력</span> 275 ~ 530hp</li>
								<li><span class="graycolor">판매</span> 국내출시</li>
							</ol>
						</td>
						<td>91,000원</td>
						<td><input type="radio" name="variety" value="Maserati"></td>
					</tr>
					<tr>
						<td><img
							src="https://imgauto-phinf.pstatic.net/20200225_11/auto_1582597044111KMROU_PNG/20200225111712_aAgzJ6X9.png?type=f567_410"
							width="200px" height="200px"><br> [포르쉐 카브리올레]</td>
						<td>
							<ol style="list-style-type: none; text-align: left">
								<li><span class="graycolor">연비</span> 7.9 ~ 8.2km/L</li>
								<li><span class="graycolor">연료</span> 가솔린</li>
								<li><span class="graycolor">출력</span> 392 ~ 444hp</li>
								<li><span class="graycolor">판매</span> 국내출시</li>
							</ol>
						</td>
						<td>90,000원</td>
						<td><input type="radio" name="variety" value="Cabriolet"></td>
					</tr>
					<tr>
						<td><img
							src="https://imgauto-phinf.pstatic.net/20200608_268/auto_1591589437828jKg3R_PNG/20200608131014_yq6Wuigf.png?type=f567_410"
							width="200px" height="200px"><br> [랜드로버 디펜더]</td>
						<td>
							<ol style="list-style-type: none; text-align: left">
								<li><span class="graycolor">연비</span> 9.6km/L</li>
								<li><span class="graycolor">연료</span> 디젤</li>
								<li><span class="graycolor">출력</span> 240hp</li>
								<li><span class="graycolor">판매</span> 국내출시</li>
							</ol>
						</td>
						<td>90,000원</td>
						<td><input type="radio" name="variety" value="Landrover"></td>
					</tr>
					<tr>
						<td><img
							src="https://imgauto-phinf.pstatic.net/20170728_259/auto_1501230739643Pb5Av_PNG/20170728173158_9GIZYify.png?type=f567_410"
							width="200px" height="200px"><br> [BMW 컨버터블]</td>
						<td>
							<ol style="list-style-type: none; text-align: left">
								<li><span class="graycolor">연비</span> 11.1km/L</li>
								<li><span class="graycolor">연료</span> 가솔린</li>
								<li><span class="graycolor">출력</span> 252hp</li>
								<li><span class="graycolor">판매</span> 국내출시</li>
							</ol>
						</td>
						<td>80,000원</td>
						<td><input type="radio" name="variety" value="BMW"></td>
					</tr>
				</table>
				<br>
				<!-- 보험가입 유/무 -->
				<h2>
					<label>보험에 가입하시겠습니까 ?<input type="checkbox" value="가입"
						name="insurance"></label>
				</h2>
				<br> <br> <br> <br>
				<!-- 예약버튼 *크기조정 -->
				<input type="submit" value="예약하기">
			</form>
		</div>
		<br> <br>
		<!-- 푸터 -->
		<footer class="tm-bg-dark-blue">
			<div class="container">
				<div class="row">
					<p
						class="col-sm-12 text-center tm-font-light tm-color-white p-4 tm-margin-b-0">
						Copyright &copy; <span class="tm-current-year">2018</span> Your
						Company - Design: <a rel="nofollow"
							href="https://www.tooplate.com"
							class="tm-color-primary tm-font-normal" target="_parent">Tooplate</a>
					</p>
				</div>
			</div>
		</footer>
	</div>

	<!-- load JS files -->
	<script src="js/jquery-1.11.3.min.js"></script>
	<!-- jQuery (https://jquery.com/download/) -->
	<script src="js/popper.min.js"></script>
	<!-- https://popper.js.org/ -->
	<script src="js/bootstrap.min.js"></script>
	<!-- https://getbootstrap.com/ -->
	<script src="js/datepicker.min.js"></script>
	<!-- https://github.com/qodesmith/datepicker -->
	<script src="js/jquery.singlePageNav.min.js"></script>
	<!-- Single Page Nav (https://github.com/ChrisWojcik/single-page-nav) -->
	<script src="slick/slick.min.js"></script>
	<!-- http://kenwheeler.github.io/slick/ -->
	<script>

		function setCarousel() {

			if ($('.tm-article-carousel').hasClass('slick-initialized')) {
				$('.tm-article-carousel').slick('destroy');
			}

			if ($(window).width() < 438) {
				// Slick carousel
				$('.tm-article-carousel').slick({
					infinite : false,
					dots : true,
					slidesToShow : 1,
					slidesToScroll : 1
				});
			} else {
				$('.tm-article-carousel').slick({
					infinite : false,
					dots : true,
					slidesToShow : 2,
					slidesToScroll : 1
				});
			}
		}

		function setPageNav() {
			if ($(window).width() > 991) {
				$('#tm-top-bar').singlePageNav({
					currentClass : 'active',
					offset : 79
				});
			} else {
				$('#tm-top-bar').singlePageNav({
					currentClass : 'active',
					offset : 65
				});
			}
		}

		function togglePlayPause() {
			vid = $('.tmVideo').get(0);

			if (vid.paused) {
				vid.play();
				$('.tm-btn-play').hide();
				$('.tm-btn-pause').show();
			} else {
				vid.pause();
				$('.tm-btn-play').show();
				$('.tm-btn-pause').hide();
			}
		}

		$(document).ready(function() {

			$(window).on("scroll", function() {
				if ($(window).scrollTop() > 100) {
					$(".tm-top-bar").addClass("active");
				} else {
					//remove the background property so it comes transparent again (defined in your css)
					$(".tm-top-bar").removeClass("active");
				}
			});
		}
			// Slick carousel
			setCarousel();
			setPageNav();

			$(window).resize(function() {
				setCarousel();
				setPageNav();
			});

			// Close navbar after clicked
			$('.nav-link').click(function() {
				$('#mainNav').removeClass('show');
			});
		
	</script>

</body>
</html>