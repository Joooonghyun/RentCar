<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Renting car in Incheon</title>
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
	width: 500px;
	height: 500px;
	text-align: center;
	border: 3px solid #777777;
	position: absolute;
}

.center {
	display: inline-block;
}

td {
	height: 62.5px;
	width: 62.5px;
}

span {
	color: #ee5057;
}

#icon:hover {
	transform: scale(1.2);
}

.overlay, .overlaying, .overlayings, .overlayings1, .overlayings2,
	.overlayings3 {
	position: fixed;
	display: none;
	align-items: center;
	justify-content: center;
	height: 100%;
	width: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: 100;
	top: 0;
}

.overlay.open, .overlaying.open, .overlayings.open, .overlayings1.open,
	.overlayings2.open, .overlayings3.open {
	display: flex;
	animation: show-overlay 0.5s;
}

#div1 {
	display: inline-block;
	margin-left: 701.5px;
	margin-right: 701.5px;
	margin-top: 0px;
}

/* #icons{
display: none;} */
</style>
</head>
<!-- 홈페이지 -->
<body>
	<!-- 전체를 덮는 div -->
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
						<div id="mainNav" class="collapse navbar-collapse tm-bg-white">
							<ul class="navbar-nav ml-auto">
								<li class="nav-item"><a class="nav-link" href="#top">홈페이지
								</a></li>
								<li class="nav-item"><a class="nav-link"
									href="#tm-section-1s">예약하기</a></li>
								<c:choose>
									<c:when test="${membersView.userid != null}">
										<li class="nav-item"><a class="nav-link"
											href="#tm-section-2" onclick="toggleMypage()">내정보</a></li>
										<li class="nav-item"><a class="nav-link" href="#bottom"
											onclick="reservation()">예약정보</a></li>
									</c:when>
									<c:otherwise>
										<li class="nav-item"><a class="nav-link"
											href="#tm-section-2" onclick="toggleLogin()">로그인</a></li>
										<li class="nav-item"><a class="nav-link" href="#bottom"
											onclick="toggleJoin()">회원가입</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
					</nav>
				</div>
			</div>
		</div>

		<!-- 로그인폼 -->
		<div class="overlay">
			<table id="loginForm" style="background-color: white">
				<tr>
					<td><h2>Login</h2></td>
				</tr>
				<div id="login">
					<form action="membersLogin" method="post" class="form">
						<tr>
							<td>
								<p class="fieldset">
									<label class="image-replace email" for="signin-email">아이디</label>
									<input class="full-width has-padding has-border" id="userid"
										name="userid" type="text" placeholder="id를 입력">
								</p>
							</td>
						</tr>
						<tr>
							<td><p class="fieldset">
									<label class="image-replace password" for="signin-password">비밀번호</label>
									<input class="full-width has-padding has-border" id="userpw"
										name="userpw" type="password" placeholder="Password를 입력">
								</p></td>
						</tr>
						<tr>
							<td><p class="fieldset">
									<input class="full-width" type="submit" value="Login">
								</p></td>
						</tr>
					</form>
				</div>
			</table>
		</div>

		<!-- 회원가입폼 -->
		<div class="overlaying">
			<table id="loginForm" style="background-color: white">
				<tr>
					<td><h2>Join</h2></td>
				</tr>
				<div id="login">
					<form action="membersJoin" method="post" class="form">
						<tr>
							<td>아이디</td>
							<td><input type="text" id="userid" name="userid"></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="userpw"></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="username"></td>
						</tr>
						<tr>
							<td>생일</td>
							<td><input type="date" name="userbirth"></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td><input type="text" name="userpnum"></td>
						</tr>
						<tr>
							<td><p class="fieldset">
									<input class="full-width" type="submit" value="Join">
								</p></td>
						</tr>
						<tr>
					</form>
				</div>
			</table>
		</div>

		<!-- 내정보폼 -->
		<div class="overlayings">
			<table id="loginForm" style="background-color: white">
				<tr>
					<td><h2>My Page</h2></td>
				</tr>
				<div id="login">
					<tr>
						<td>아이디</td>
						<td>${membersView.userid}</td>
					</tr>
					<tr>
						<td>이름</td>
						<td>${membersView.username}</td>
					</tr>
					<tr>
						<td>생일</td>
						<td>${membersView.userbirth}</td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td>${membersView.userpnum}</td>
					</tr>
					<tr>
						<td colspan="2"><input type="button"
							onclick="location.href='membersLogout'" value="로그아웃"> <input
							style="margin: 10px 75px" type="button" onclick="toggleModify()"
							value="회원 수정"> <input type="button"
							onclick="membersDelete()" value="회원탈퇴"></td>
				</div>
			</table>
		</div>

		<!-- 회원수정폼 -->
		<div class="overlayings1">
			<table id="modifyProcess" style="background-color: white">
				<tr>
					<td><h2>Login</h2></td>
				</tr>
				<div id="login">
					<form action="modifyProcess" method="post" id="modifyForm">
						<tr>
							<td>아이디</td>
							<td><input type="hidden" value="${membersView.userid }"
								name="userid">${membersView.userid }</td>
						</tr>
						<tr>
							<td>현재 비밀번호</td>
							<td><input type="password" name="userpw" id="userpw123"></td>
						</tr>
						<tr>
							<td>새 비밀번호</td>
							<td><input type="password" name="usernewpw"></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="username"
								value="${membersView.username }"></td>
						</tr>
						<tr>
							<td>생일</td>
							<td><input type="date" name="userbirth"
								value="${membersView.userbirth }"></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td><input type="text" name="userpnum"
								value="${membersView.userpnum }"></td>
						</tr>
						<tr>
							<td><p class="fieldset">
									<button onclick="membersModify()">정보수정</button>
									<button onclick="goMain()">메인으로</button>
								</p></td>
						</tr>
					</form>
				</div>
			</table>
		</div>

		<!-- 예약정보폼 -->
		<div class="overlayings2">
			<table id="ReserveForw"
				style="background-color: white; width: 1000px">
				<tr>
					<td><h2>Reservation</h2></td>
				</tr>
				<div id="login">
					<tr>
						<td>예약번호</td>
						<td>예약자 아이디</td>
						<td>지역</td>
						<td>대여 날짜</td>
						<td>대여 시작 시간</td>
						<td>반납 날짜</td>
						<td>반납 시간</td>
						<td>차종</td>
						<td>보험</td>
					</tr>
					<c:forEach items="${reserveView}" var="reserveView">
						<tr>
							<td>${reserveView.renum}</td>
							<td>${reserveView.reid}</td>
							<td>${reserveView.locations}</td>
							<td>${reserveView.starts}</td>
							<td>${reserveView.starttime}</td>
							<td>${reserveView.ends}</td>
							<td>${reserveView.endtime}</td>
							<td>${reserveView.variety}</td>
							<td>${reserveView.insurance}</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="9"><p class="fieldset">

								<button onclick="reservation()">메인으로</button>
							</p></td>
					</tr>

				</div>
			</table>
		</div>

		<!-- 예약수정폼 -->
		<div class="overlayings3">
			<table id="ReserveForw"
				style="background-color: white; width: 1000px">
				<tr>
					<td><h2>Reservation Modify</h2></td>
				</tr>
				<div id="login">
					<tr>
						<td>예약번호</td>
						<td>예약자 아이디</td>
						<td>지역</td>
						<td>대여 날짜</td>
						<td>대여 시작 시간</td>
						<td>반납 날짜</td>
						<td>반납 시간</td>
						<td>차종</td>
						<td>보험</td>
					</tr>
					<c:forEach items="${reserveView}" var="reserveView">
						<tr>
							<td>${reserveView.renum}</td>
							<td>${reserveView.reid}</td>
							<td>${reserveView.locations}</td>
							<td><input type="date" name="newstarts"></td>
							<td><select name="newstarttime"
								class="form-control tm-select" id="newstarttime">
									<optgroup label="시작시간">
										<option value="10:00">10:00</option>
										<option value="11:00">11:00</option>
										<option value="12:00">12:00</option>
										<option value="13:00">13:00</option>
										<option value="14:00">14:00</option>
										<option value="15:00">15:00</option>
										<option value="16:00">16:00</option>
										<option value="17:00">17:00</option>
										<option value="18:00">18:00</option>
										<option value="19:00">19:00</option>
										<option value="20:00">20:00</option>
										<option value="21:00">21:00</option>
										<option value="22:00">22:00</option>
									</optgroup>
							</select></td>
							<td><input type="date" name="newends"></td>
							<td><select name="newendtime" class="form-control tm-select"
								id="newendtime">
									<optgroup label="반납시간">
										<option value="10:00">10:00</option>
										<option value="11:00">11:00</option>
										<option value="12:00">12:00</option>
										<option value="13:00">13:00</option>
										<option value="14:00">14:00</option>
										<option value="15:00">15:00</option>
										<option value="16:00">16:00</option>
										<option value="17:00">17:00</option>
										<option value="18:00">18:00</option>
										<option value="19:00">19:00</option>
										<option value="20:00">20:00</option>
										<option value="21:00">21:00</option>
										<option value="22:00">22:00</option>
									</optgroup>
							</select></td>
							<td>${reserveView.variety}</td>
							<td>${reserveView.insurance}</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="9"><p class="fieldset">
								<button onclick="membersModify()">예약수정</button>
								<button onclick="reservationModify()">메인으로</button>
							</p></td>
					</tr>

				</div>
			</table>
		</div>

		<!-- 환영합니다 고갱님 -->
		<div class="tm-section-2">
			<div class="container">
				<div class="row">
					<div class="col text-center">
						<h2 class="tm-section-title">
							어서오세요?
							<c:if test="${membersView.username != null}">${membersView.username}님</c:if>
							환영합니다.
						</h2>
						<p class="tm-color-white tm-section-subtitle">차를 빌리러오셨습니까?</p>
					</div>
				</div>
			</div>
		</div>

		<!-- 커지는 메뉴 관리 -->
		<div class="tm-section tm-position-relative">
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"
				preserveAspectRatio="none" class="tm-section-down-arrow">
                    <polygon fill="#ee5057" points="0,0  100,0  50,60"></polygon>                   
                </svg>
			<div class="container tm-pt-5 tm-pb-4">
				<div class="row text-center">
					<!-- 1번 박스 -->
					<article class="col-sm-12 col-md-4 col-lg-4 col-xl-4 tm-article">
						<i class="fa tm-fa-6x fa-legal tm-color-primary tm-margin-b-20"></i>
						<h3 class="tm-color-primary tm-article-title-1">머가리</h3>
						<p>기대하는게 그렇습니다.</p>
						<a href="#"
							class="text-uppercase tm-color-primary tm-font-semibold">Dduk-Bea-ki...</a>
					</article>
					<!-- 2번 박스 -->
					<article class="col-sm-12 col-md-4 col-lg-4 col-xl-4 tm-article">
						<i class="fa tm-fa-6x fa-plane tm-color-primary tm-margin-b-20"></i>
						<h3 class="tm-color-primary tm-article-title-1">에어플레인</h3>
						<p>비행기보다 차가 좋읍니다.</p>
						<a href="#"
							class="text-uppercase tm-color-primary tm-font-semibold">Ariplane...</a>
					</article>
					<!-- 3번 박스 -->
					<article class="col-sm-12 col-md-4 col-lg-4 col-xl-4 tm-article">
						<i
							class="fa tm-fa-6x fa-life-saver tm-color-primary tm-margin-b-20"></i>
						<h3 class="tm-color-primary tm-article-title-1">준비중...</h3>
						<p>당신은 필요을 요구합니다.</p>
						<a href="#"
							class="text-uppercase tm-color-primary tm-font-semibold">Coming
							Soon...</a>
					</article>
				</div>
			</div>
		</div>

		<!-- 지도 -->
		<div class="tm-section tm-bg-gray" id="tm-section-1s" style="">
			<!-- 세 개 구 -->
			<div id="div1">
				<table background="map/지도.jpg" style="z-index: 1;">
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td colspan="2"><span><i
								class="fas fa-map-marker-alt fa-2x" onclick="bupyeong()"
								id="icon"></i></span></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td colspan="2"><span><i
								class="fas fa-map-marker-alt fa-2x" onclick="michuhol()"
								id="icon"></i></span></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td colspan="2"><span><i
								class="fas fa-map-marker-alt fa-2x" onclick="namdong()"
								id="icon"></i></span></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</table>

				<!-- 부평구  -->
				<table background="map/부평구.jpg" id="bupyeongGu">
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td><span><i class="fas fa-map-marker-alt fa-2x"
								id="icon" onclick="bupyeongGu1()"></i></span></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><span><i class="fas fa-map-marker-alt fa-2x"
								id="icon" onclick="bupyeongGu2()"></i></span></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td><span><i class="fas fa-map-marker-alt fa-2x"
								id="icon" onclick="bupyeongGu3()"></i></span></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td><span><i class="fas fa-map-marker-alt fa-2x"
								id="icon" onclick="bupyeongGu4()"></i></span></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td><input type="button" onclick="allMap()" value="전체보기"></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</table>

				<!-- 미추홀구  -->
				<table background="map/미추홀구.jpg" id="michuholGu">
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td><span><i class="fas fa-map-marker-alt fa-2x"
								id="icon" onclick="michuholGu1()"></i></span></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><span><i class="fas fa-map-marker-alt fa-2x"
								id="icon" onclick="michuholGu4()"></i></span></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td>
						<td><span><i class="fas fa-map-marker-alt fa-2x"
								id="icon" onclick="michuholGu2()"></i></span></td>
						</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><span><i class="fas fa-map-marker-alt fa-2x"
								id="icon" onclick="michuholGu3()"></i></span></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td><input type="button" onclick="allMap()" value="전체보기"></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</table>

				<!-- 남동구  -->
				<table background="map/남동구.jpg" id="namdongGu">
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><span><i class="fas fa-map-marker-alt fa-2x"
								id="icon" onclick="namdongGu4()"></i></span></td>
						<td></td>
					</tr>
					<tr>
						<td><span><i class="fas fa-map-marker-alt fa-2x"
								id="icon" onclick="namdongGu1()"></i></span></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td><span><i class="fas fa-map-marker-alt fa-2x"
								id="icon" onclick="namdongGu2()"></i></span></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><span><i class="fas fa-map-marker-alt fa-2x"
								id="icon" onclick="namdongGu3()"></i></span></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td><input type="button" onclick="allMap()" value="전체보기"></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</table>
			</div>

		</div>

	</div>

	<!-- 예약 div -->
	<div class="tm-section tm-bg-img" id="tm-section-4">
		<div class="tm-bg-white ie-container-width-fix-2">
			<div class="container ie-h-align-center-fix">
				<div class="row">
					<div class="col-xs-12 ml-auto mr-auto ie-container-width-fix">

						<!-- 예약 -->
						<form action="rentcarView" method="post"
							class="tm-search-form tm-section-pad-2" id="rentView">
							<div class="form-row tm-search-form-row">
								<div class="form-group tm-form-element tm-form-element-100"
									style="margin-left: 300px">
									<i class="fa fa-map-marker fa-2x tm-form-element-icon"></i> <input
										name="locations" type="text" class="form-control"
										id="locations" placeholder="지역" readonly>
								</div>
							</div>
							<div class="form-row tm-search-form-row">
								<div class="form-group tm-form-element tm-form-element-50"
									style="margin-left: 182.5px">
									<i class="fa fa-calendar fa-2x tm-form-element-icon"></i> <input
										name="starts" type="date" class="form-control" id="starts"
										placeholder="시작일">
								</div>
								<div class="form-group tm-form-element tm-form-element-2"
									style="margin-right: 182.5px">
									<select name="starttime" class="form-control tm-select"
										id="starttime">
										<optgroup label="시작시간">
											<option value="10:00">10:00</option>
											<option value="11:00">11:00</option>
											<option value="12:00">12:00</option>
											<option value="13:00">13:00</option>
											<option value="14:00">14:00</option>
											<option value="15:00">15:00</option>
											<option value="16:00">16:00</option>
											<option value="17:00">17:00</option>
											<option value="18:00">18:00</option>
											<option value="19:00">19:00</option>
											<option value="20:00">20:00</option>
											<option value="21:00">21:00</option>
											<option value="22:00">22:00</option>
										</optgroup>
									</select> <i class="fa fa-2x fa-user tm-form-element-icon"></i>
								</div>
							</div>
							<div class="form-row tm-search-form-row">
								<div class="form-group tm-form-element tm-form-element-50"
									style="margin-left: 182.5px">
									<i class="fa fa-calendar fa-2x tm-form-element-icon"></i> <input
										name="ends" type="date" class="form-control" id="ends"
										placeholder="반납일">
								</div>


								<div class="form-group tm-form-element tm-form-element-2"
									style="margin-right: 182.5px">
									<select name="endtime" class="form-control tm-select"
										id="endtime">
										<optgroup label="반납시간">
											<option value="10:00">10:00</option>
											<option value="11:00">11:00</option>
											<option value="12:00">12:00</option>
											<option value="13:00">13:00</option>
											<option value="14:00">14:00</option>
											<option value="15:00">15:00</option>
											<option value="16:00">16:00</option>
											<option value="17:00">17:00</option>
											<option value="18:00">18:00</option>
											<option value="19:00">19:00</option>
											<option value="20:00">20:00</option>
											<option value="21:00">21:00</option>
											<option value="22:00">22:00</option>
										</optgroup>
									</select> <i
										class="fa fa-user tm-form-element-icon tm-form-element-icon-small"></i>
								</div>
							</div>
							<div class="form-row tm-search-form-row">
								<div class="form-group tm-form-element tm-form-element-2"
									style="margin-left: 337.5px">
									<button type="button" class="btn btn-primary tm-btn-search"
										onclick="rent()">예약하기</button>
								</div>
							</div>
							<div class="form-row clearfix pl-2 pr-2 tm-fx-col-xs">
								<p class="tm-margin-b-0">Lorem ipsum dolor sit amet,
									consectetur adipiscing elit.</p>
								<a href="#"
									class="ie-10-ml-auto ml-auto mt-1 tm-font-semibold tm-color-primary">Go
									top?</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 푸터 div -->
	<footer class="tm-bg-dark-blue">
		<div class="container">
			<div class="row">
				<p
					class="col-sm-12 text-center tm-font-light tm-color-white p-4 tm-margin-b-0">
					Copyright &copy; <span class="tm-current-year">2020</span> 인천일보
					아카데미: <a rel="nofollow" href="https://www.tooplate.com"
						class="tm-color-primary tm-font-normal" target="_parent">RentCar</a>
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
		/* Google map
		------------------------------------------------*/
		var map = '';
		var center;

		function initialize() {
			var mapOptions = {
				zoom : 13,
				center : new google.maps.LatLng(-23.013104, -43.394365),
				scrollwheel : false
			};

			map = new google.maps.Map(document.getElementById('google-map'),
					mapOptions);

			google.maps.event.addDomListener(map, 'idle', function() {
				calculateCenter();
			});

			google.maps.event.addDomListener(window, 'resize', function() {
				map.setCenter(center);
			});
		}

		function calculateCenter() {
			center = map.getCenter();
		}

		function loadGoogleMap() {
			var script = document.createElement('script');
			script.type = 'text/javascript';
			script.src = 'https://maps.googleapis.com/maps/api/js?key=AIzaSyDVWt4rJfibfsEDvcuaChUaZRS5NXey1Cs&v=3.exp&sensor=false&'
					+ 'callback=initialize';
			document.body.appendChild(script);
		}

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

			// Google Map
			loadGoogleMap();

			// Date Picker
			const pickerCheckIn = datepicker('#inputCheckIn');
			const pickerCheckOut = datepicker('#inputCheckOut');

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

			// Control video
			$('.tm-btn-play').click(function() {
				togglePlayPause();
			});

			$('.tm-btn-pause').click(function() {
				togglePlayPause();
			});

			// Update the current year in copyright
			$('.tm-current-year').text(new Date().getFullYear());
		});

		function bupyeong() {
			$('#bupyeongGu').attr('style', 'z-index:3');
		}

		function michuhol() {
			$('#michuholGu').attr('style', 'z-index:3');
		}

		function namdong() {
			$('#namdongGu').attr('style', 'z-index:3');
		}

		function allMap() {
			$('#bupyeongGu').attr('style', 'z-index:0');
			$('#michuholGu').attr('style', 'z-index:0');
			$('#namdongGu').attr('style', 'z-index:0');
		}

		/* 로그인, 회원가입 창 등 */
		function toggleLogin() {
			document.querySelector(".overlay").classList.toggle("open");
		}

		function toggleJoin() {
			document.querySelector(".overlaying").classList.toggle("open");
		}

		function toggleMypage() {
			document.querySelector(".overlayings").classList.toggle("open");
		}

		function toggleModify() {
			document.querySelector(".overlayings").classList.toggle("open");
			document.querySelector(".overlayings1").classList.toggle("open");
		}

		function reservation() {
			document.querySelector(".overlayings").classList.toggle("open");
			document.querySelector(".overlayings2").classList.toggle("open");
		}

		function reservationModify() {
			document.querySelector(".overlayings2").classList.toggle("open");
			document.querySelector(".overlayings3").classList.toggle("open");
		}
		/* 부평구 선택하고 지점 선택 */
		function bupyeongGu1() {
			document.getElementById("locations").value = "부평 1호점";
		}

		function bupyeongGu2() {
			document.getElementById("locations").value = "부평 2호점";
		}

		function bupyeongGu3() {
			document.getElementById("locations").value = "부평 3호점";
		}

		function bupyeongGu4() {
			document.getElementById("locations").value = "부평 4호점";
		}

		/* 미추홀구 선택하고 지점 선택 */
		function michuholGu1() {
			document.getElementById("locations").value = "미추홀 1호점";
		}

		function michuholGu2() {
			document.getElementById("locations").value = "미추홀 2호점";
		}

		function michuholGu3() {
			document.getElementById("locations").value = "미추홀 3호점";
		}

		function michuholGu4() {
			document.getElementById("locations").value = "미추홀 4호점";
		}

		/* 남동구 선택하고 지점 선택 */
		function namdongGu1() {
			document.getElementById("locations").value = "남동 1호점";
		}

		function namdongGu2() {
			document.getElementById("locations").value = "남동 2호점";
		}

		function namdongGu3() {
			document.getElementById("locations").value = "남동 3호점";
		}

		function namdongGu4() {
			document.getElementById("locations").value = "남동 4호점";
		}

		function rent() {
			var locations = document.getElementById("locations").value;
			var starts = document.getElementById("starts").value;
			var starttime = document.getElementById("starttime").value;
			var ends = document.getElementById("ends").value;
			var endtime = document.getElementById("endtime").value;
			var userid = '${membersView.userid}'

			if (userid != null) {
				if (locations != null && starts != null && starttime != null) {
					if (ends != null && endtime != null) {
						rentView.submit();
					}
				}
			}
		}

		/* 회원 수정 스크립트 */
		function membersModify() {
			var passwordConfirm = document.getElementById("userpw123").value;
			var password = '${loginpw}';
			if (passwordConfirm == password) {
				modifyForm.submit();
			} else {

				alert('비밀번호가 틀립니다.')
			}
		}

		function membersDelete() {
			var passwordConfirm = prompt('비밀번호를 입력하세요');
			var password = '${loginpw}';
			if (passwordConfirm == password) {
				alert('회원 탈퇴 성공')
				location.href = "membersDelete";
			} else {
				alert('비밀번호가 틀립니다.')
			}
		}

		function goMain() {
			location.href = "Main.jsp";
		}
	</script>

</body>

</html>