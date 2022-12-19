<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BUDDY</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Barrio&display=swap" rel="stylesheet">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Sharp|Material+Icons+Two+Tone|Material+Icons+Outlined" rel="stylesheet">

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Barrio&display=swap');

html, body {
    margin: 0;
    padding: 0;
    height: 100%;
}



.container {
	min-height: 600px;
	padding: 30px;
}

/* --------------------------------------- */

.header-top {
	display: flex;
	
	text-align: center;
}

.header-left, .header-login {
	display: inline-block;
	
	width: 25%;
	height: 120px;
	
	line-height: 160px;
}

.header-logo {
	display: inline-block;
	
	width: 50%;
	height: 120px;
	
	line-height: 120px;
}

#btnLogin, #btnJoin, #btnLogout {
	background: #FF7A85;
	border: none;
}

#btnLogin > a, 
#btnJoin > a, 
#btnLogout > a {
	color: #fff;
	text-decoration: none;
}

button:focus, button:active { 	
    outline:none !important;
    box-shadow:none !important;
}

/* --------------------------------------- */

.nav {
	display: inline-block;
	float: none;
}

.navbar-collapse {
	text-align: center;
}

#navbar-nav > li > a {
	color: #777;
	
	font-size: 22px;
	font-weight: bold;
	
	margin: 0 15px;
}

#navbar-nav > li > a:hover, 
#navbar-nav > li > a:focus {
	color: #FF7A85;
}

.dropdown:hover > .dropdown-menu {
	display: block;
	margin-top: 0;
}

.dropdown-menu {
	padding: 0;
}

.dropdown-menu > li {
	height: 40px;
}

.dropdown-menu > li > a {
	height: 40px;
	line-height: 35px;
}

.dropdown-menu > li > a:hover {
	color: #fff;
	background: #FF7A85;
}

#btnUser > ul {
	right: 100px;
	float: right;
}

/* --------------------------------------- */

a.top {
  position: fixed;
  right: 85px;
  bottom: 150px;
}

a.top:hover {
	text-decoration: none;
}

a.top > #top-icon {
	display: block;
	font-size: 40px;
	color: #FF7A85;
}

a.top > #top-text {
	display: block;
	font-size: 20px;
	color: #FF7A85;
}
</style>

<script type="text/javascript">
$(document).ready(function() {
	$(".top").click(function() {
		$("html, body").animate( { scrollTop : 0 }, 400 )
		return false
	})
})
</script>

</head>
<body>

<div class="wrap">

<header class="header">
	
	<div class="header-top">
		<div class="header-left"></div>
		
		<div class="header-logo">
			<a href="/">
			  <img src="../resources/img/main/buddy.png" height="110">
			</a>
		</div>
		
		<div class="header-login">
			<c:choose>
				<c:when test="${empty login }">
					<button class="btn btn-default" id="btnLogin"><a href="/user/login">로그인</a></button>
					<button class="btn btn-default" id="btnJoin"><a href="/user/join">회원가입</a></button>
				</c:when>
				<c:when test="${not empty login }">
					<div class="btn-group" id="btnUser">
						<span class="btn glyphicon glyphicon-user" data-toggle="dropdown" aria-hidden="true"> ${nick }님</span>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">마이페이지</a></li>
							<li><a href="#">기억한 아이</a></li>
							<li><a href="#">장바구니</a></li>
							<li><a href="#">쪽지</a></li>
						</ul>
					</div>
					<button class="btn btn-default" id="btnLogout"><a href="/user/logout">로그아웃</a></button>
				</c:when>
			</c:choose>
		</div>
	</div>
	
	<div class="header-nav">
		<nav class="navbar navbar-default" style="margin: 0; background: #fff;">
			<div class="container-fluid">
			
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav" id="navbar-nav">
					
					<li><a href="/notice/listPage">BUDDY</a></li>
					
					<li class="dropdown">
						<a href="/comm/list?animal=cat">커뮤니티</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="/comm/list?animal=cat">고양이</a></li>
							<li><a href="/comm/list?animal=dog">강아지</a></li>
						</ul>
					</li>
					
					<li class="dropdown">
						<a href="/date/main">데이트</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="/date/list?category=1">카페</a></li>
							<li><a href="/date/list?category=2">호텔</a></li>
							<li><a href="/date/list?category=3">훈련소</a></li>
							<li><a href="/date/list?category=4">여행지</a></li>
						</ul>
					</li>
					
					<li class="dropdown">
						<a href="/hospital/hosplist">병원</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="/hospital/hosplist">병원</a></li>
							<li><a href="/hospboard/hblist">병원 질문과 정보</a></li>
						</ul>
					</li>
					
					
					<li class="dropdown">
						<a href="/adopt/main">입양</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="/adopt/pro">입양</a></li>
							<li><a href="/adopt/research">입양 신청서</a></li>
							<li><a href="/adopt/news">입양/임보 후 소식</a></li>
						</ul>
					</li>

					<li class="dropdown">
						<a href="#">후원/봉사</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">후원</a></li>
							<li><a href="#">봉사</a></li>
							<li><a href="/report/reptList">회계보고</a></li>
						</ul>
					</li>
					
					<li><a href="/shopping/list">장터</a></li>
					
				</ul>
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		</nav>
	</div>
	
</header>

<a class="top">
	<span class="glyphicon glyphicon-circle-arrow-up" id="top-icon"></span>
	<span id="top-text">TOP</span>
</a>
