<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {

})
</script>

<style type="text/css">

.show-gird {
	padding-top: 50px;
}

#mypage_menuBar {
	padding-top: 10px;
    margin-top: 50px;
}

#user_media {
	padding-top: 20px;
    padding-left: 30px;
}

#user_head {
	padding: 30px;
    margin-top: 50px;
    margin-bottom: 30px;
    background: #fff0f0;
    border-radius: 2em;
}

#user_name {
	font-weight: bold;
}

.nav>li>a:focus, .nav>li>a:hover {
    background-color: #ff7a85;
    color: #fff;
}

.nav>li>a {
	color: #ff7a85;
	font-size: 16px;
	font-weight: bolder;
}

#badgeIcon {
	background: #ff7a85
}

#menu_contant {
	color: #878787;
}

#like_buddy {
	background: #ff7a85;
	color: #fff;
}

</style>

<div class="container">

<div class="row show-grid">

<!-- 마이페이지 메뉴바 -->
<div id="mypage_menuBar" class="col-md-2 col-sm-12 hidden-xs hidden-sm left-menu">
	<ul class="nav nav-pills nav-stacked">
		<li class="on">
			<a id="order" href="/mypage/order" class="text-gray-dark _fade_link">주문 <span class="hidden-xs">조회</span></a>
		</li>
		<li class="">
			<a id="like_buddy" href="/mypage/like_buddy" class="text-gray-dark _fade_link">찜한 아이</a>
		</li>
		<li class="">
			<a id="qna" href="/mypage/qna" class="text-gray-dark _fade_link">1:1 문의</a>
		</li>
		<li>
			<a href="javascript:;" onclick="SITE_MEMBER.editProfile('L3Nob3BfbXlwYWdl');" class="text-gray-dark _fade_link">정보 수정</a>
		</li>
		<li>
			<a href="javascript:" onclick="userDelete()" class="text-gray-dark _fade_link">회원탈퇴</a>
		</li>
	</ul>
</div><!-- 마이페이지 메뉴바 END -->

<!-- 마이페이지 내용 -->
<div class="col-md-10 col-sm-12">

<!-- 회원창 -->
<div id="user_head" class="media">
<div class="media-left">
<a href="#">
	<img class="media-object img-circle" src="/resources/img/date/userImg.png" alt="userImg" style="width: 85px; height: 85px;">
</a>
</div>
<div id="user_media" class="media-body">
<h3 id="user_name" class="media-heading">${name }님 안녕하세요.</h3>
<div>
<span>봉사 : </span>
<span>후원 : </span>
</div>
</div>
</div><!-- 회원창 END -->

<!-- 마이페이지 컨텐츠 -->
<div id="user_body" class="media">


</div><!-- 회원창 END -->

<!-- 메뉴 이름 -->
<div id="menu_name">
	<div class="page-header">
		<h3>찜한 아이 <span id="badgeIcon" class="badge bg-secondary">0</span></h3>
	</div>
</div>

<!-- 메뉴 ajax -->
<div class="text-center">
<span id="menu_contant">주문 내역이 없습니다.</span>
</div>

</div><!-- 마이페이지 내용 END -->


</div>
</div><!-- .container end -->

<c:import url="../layout/footer.jsp" />