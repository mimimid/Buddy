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

<style type="text/css">
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
	height: 100px;
	
	line-height: 100px;
}

.header-logo {
	display: inline-block;
	
	width: 50%;
	height: 100px;
	
	line-height: 100px;
}

.header-logo > a {
	color: #FF7A85;
	
	font-size: 50px;
	font-weight: bold;
	
	text-decoration: none;
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

/* --------------------------------------- */

.nav {
	display: inline-block;
	float: none;
}

.navbar-collapse {
	text-align: center;
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

.dropdown-menu > li > a:hover {
	color: #fff;
	background: #FF7A85;
}

/* --------------------------------------- */

a.top {
  position: fixed;
  right: 100px;
  bottom: 150px;
  display: none;
}

a.top > span {
	font-size: 40px;
	color: #FF7A85;
}
</style>

<script type="text/javascript">
$(document).ready(function() {
	$(window).scroll(function() {
		if( $(this).scrollTop() > 150 ) {
			$(".top").fadeIn()
		} else {
			$(".top").fadeOut()
		}
	})
	
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
		
			<!-- 로고 디자인 or 이미지로 변경 필요 -->
			<a href="/">
			  <img src="../resources/img/main/logo.png" width="50"> BUDDY
			</a>
		</div>
		
		<div class="header-login">
			<c:choose>
				<c:when test="${empty login }">
					<button class="btn btn-default" id="btnLogin"><a href="/user/login">로그인</a></button>
					<button class="btn btn-default" id="btnJoin"><a href="/user/join">회원가입</a></button>
				</c:when>
				<c:when test="${not empty login }">
					
					<!-- 마이페이지 로직 구현 필요 -->
					<strong style="padding-right: 7px;">${usernick }님</strong>
					<button class="btn btn-default" id="btnLogout"><a href="/user/logout">로그아웃</a></button>
				</c:when>
			</c:choose>
		</div>
	</div>
	
	<div class="header-nav">
		<nav class="navbar navbar-default" style="margin: 0; background: #fff;">
			<div class="container-fluid">
			
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav" id="navbar-nav">
					
					<li><a href="/notice/list">BUDDY</a></li>
					
					<li class="dropdown">
						<a href="/comm/list">커뮤니티</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="/comm/cat">고양이</a></li>
							<li><a href="/omm/dog">강아지</a></li>
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


<!-- footer 쪽에 안나오게 하고싶은데...ㅠㅠ -->

<a class="top">
	<span class="glyphicon glyphicon-circle-arrow-up"></span>
</a>
