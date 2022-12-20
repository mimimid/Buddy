<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp" />

<style>
#panel{
	width:100%;
	height: 400px;
	margin-bottom: 20px;
	background-color: #FF7A86;
}
#panel_img{
	width:90%;
	height: 100%;
	margin-left: 56px;
}
.img_style {
	width: 190px;
    height: 190px;
    margin: 13px 30px;
}

.pro_wrap{
	width: 255px;
    height: 420px;
	border: 3px solid #FF7A85;
	background-color: antiquewhite;
    border-radius: 0.3em;
	margin-left:15px;
	margin-bottom: 15px;
	display: inline-block;
	position:relative;
}
.state{
	width: 85px;
    height: 40px;
    border: none;
    color: white;
    background-color: #FF7A85;
    text-align: center;
    border-radius: 0.3em;
    margin-bottom: 5px;
    font-weight: bold;
    font-size: 16px;
}
p {
	text-align: center;
	font-weight: bold;
}
.data{
	color: #FF7A85;
	font-size: 16px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#back").click(function() {
		location.href = "/adopt/pro"
	})
})
</script>

<div class="container">

<div id="panel">
<img id="panel_img" src="/resources/img/sample_adopt/panel3.png" alt="panel">
</div>

<div style="margin: 40px 0px">
<h3>기억한 아이</h3>
<h5><span class="glyphicon glyphicon-star" style="color:#FF7A85;">${nick }</span>님께서 기억한 아이는 총 <span style="color:#FF7A85;">${wishCount}</span>마리입니다.</h3>
</div>
<hr style="margin-bottom: 40px;">


<c:forEach items="${proWishList }" var="pro">
<div class="pro_wrap">
	<input type="text" class="state" value="${pro.ANI_CATE }" readonly="readonly">
	<a href="/adopt/proWish?aniNo=${pro.ANI_NO}" >
		<button id="delete" class="pull-right"><span class="glyphicon glyphicon-remove"></button>
	</a>
	<p>안녕하세요!</p>
	<p>저는 <span class="data">${pro.ANI_NAME}</span>입니다.</p>
	<a href="/adopt/proView?aniNo=${pro.ANI_NO}">
		<img src="/adopt/adoptDown?anifileNo=${pro.ANIFILE_NO}"alt="입양프로필" class="img_style img-circle" onerror="this.src='/resources/img/sample_adopt/noImg.jpg'">
	</a>
	<p>저는 약 <span class="data">${pro.ANI_AGE}</span>살이에요.</p>
	<p>중성화 <span class="data">${pro.ANI_NEUTRAL } ${pro.ANI_GENDER}</span>아이에요.</p>
</div>
</c:forEach>

<div class="text-center" style="margin: 40px 0px;">
	<button id="back" class="btn btn-default" >목록</button>
</div>
</div><!-- .container end -->

<c:import url="../layout/footer.jsp" />