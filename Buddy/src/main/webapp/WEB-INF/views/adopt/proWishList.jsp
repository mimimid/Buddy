<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {

})
</script>

<div class="container">

<h1>기억한 아이</h1>
<hr>

${wishCount}
<c:forEach items="${proWishList }" var="pro">
<div class="pro_wrap">
	<input type="text" class="state" value="임보 중">
	<p>안녕하세요!</p>
	<p>저는 <span class="data">${pro.aniName}</span>입니다.</p>
	<a href="/adopt/proView?aniNo=${pro.aniNo}">
		<img src="/resources/img/sample_adopt/sample1.jpg" alt="입양프로필" class="img_style img-circle">
	</a>
	<p>저는 약 <span class="data">${pro.aniAge}</span>살이에요.</p>
	<p>중성화 <span class="data">${pro.aniNeutral } ${pro.aniGender}</span>아이에요.</p>
	<div class="btn_wrap">
	
	<!-- 찜 -->
	<a href="/adopt/proWish?aniNo=${pro.aniNo}" ><button class="btnStar">
		<span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
<%-- 	<c:if test="${wish.aniNo == pro.aniNo and wish.userno == userno }"> --%>
<!-- 		<span class="glyphicon glyphicon-star" aria-hidden="true"></span> -->
<%-- 			</c:if> --%>
			
	</button></a>
	<button class="btnAdopt" >입양하기</button>
	</div>
</div>
</c:forEach>

</div><!-- .container end -->

<c:import url="../layout/footer.jsp" />