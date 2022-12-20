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

</style>

<div class="container">

<div class="row show-grid">

<!-- 마이페이지 메뉴바 -->
<div class="col-md-2 col-sm-12 hidden-xs hidden-sm left-menu">
	<ul class="nav nav-pills nav-stacked">
<!-- 		<li class="on"> -->
<!-- 			<a href="/shop_mypage/?m2=order" class="text-gray-dark _fade_link">주문 <span class="hidden-xs">조회</span></a> -->
<!-- 		</li> -->
<!-- 		<li class=""> -->
<!-- 			<a href="/shop_mypage/?m2=wish_list" class="text-gray-dark _fade_link">위시 <span class="hidden-xs">리스트</span></a> -->
<!-- 		</li> -->
		<li class="">
			<a href="/shop_mypage/?m2=qna" class="text-gray-dark _fade_link">1:1 문의</a>
		</li>
		<li>
			<a href="javascript:;" onclick="SITE_MEMBER.editProfile('L3Nob3BfbXlwYWdl');" class="text-gray-dark _fade_link">정보 수정</a>
		</li>
		<li>
			<a href="javascript:" onclick="SITE_MEMBER.openGoodbye();" class="text-gray-dark _fade_link">회원탈퇴</a>
		</li>
	</ul>
</div><!-- 마이페이지 메뉴바 END -->

<!-- 마이페이지 내용 -->
<div class="col-md-10 col-sm-12">

<!-- 회원창 -->
<div class="media">
<div class="media-left">
<a href="#">
	<img class="media-object img-circle" src="/resources/img/date/userImg.png" alt="userImg" style="width: 85px; height: 85px;">
</a>
</div>
<div class="media-body">
<h4 class="media-heading">${name }님 안녕하세요.</h4>
<div>
<span>봉사 : </span>
<span>후원 : </span>
</div>
</div>
</div><!-- 회원창 END -->




</div><!-- 마이페이지 내용 END -->


</div>
</div><!-- .container end -->

<c:import url="../layout/footer.jsp" />