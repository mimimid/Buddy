<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp" />
<style type="text/css">

p {
	text-align: center;
	font-weight: bold;
}
.div_style {
	 display:inline-block;
	 position:relative;
	 width:172px;
	 height:120px;
	 margin:5px;
	 z-index:1;
}
.img_style {
	width: 190px;
    height: 190px;
    margin: 13px 30px;
}

.pro_wrap{
	width: 255px;
    height: 455px;
	border: 3px solid #FF7A85;
	background-color: antiquewhite;
    border-radius: 0.3em;
	margin-left:15px;
	margin-bottom: 15px;
	display: inline-block;
	position:relative;
}

#wrap{
margin:0 auto;
overflow: hidden;
padding-top: 10px;
}
#panel{
	width:100%;
	height: 400px;
	margin-bottom: 20px;
}
#panel_img{
	width:100%;
	height: 100%;
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
.btn_wrap{
	padding: 5px 0px 0px 7px;
    margin-top: 17px;
}
.btnAdopt{
	width: 185px;
    height: 40px;
    font-size: 17px;
    font-weight: bold;
    background-color: white;
    border-color: #FF7A85;
    border-style: solid;
    color: #FF7A85;
}
.btnStar{
	width: 40px;
    height: 40px;
    margin-right: 3px;
    padding: 0px;
    font-size: 18px;
    background-color: white;
    border-color: #FF7A85;
    border-style: solid;
    color: #FF7A85;
}
.container{
	padding-top: 0px;
}
.cate_wrap{
    margin: 0px 0px 90px 0px;
}
#dropdownMenu1{
	color: #777;
    background-color: #fff;
    margin-right: 35px;
}    
.page{
	margin: 80px 0px;
}
.page > a{
    color: black;
    text-decoration: none;
}
</style>
<script>
$(document).ready(function(){
	<!-- 카테고리 메뉴 클릭 시 아이콘 변경 -->
	$(".dropdown").on("hide.bs.dropdown", function(){
		$("#dropdownMenu1").html('카테고리 <span class="glyphicon glyphicon-chevron-down"></span>');
	});
	$(".dropdown").on("show.bs.dropdown", function(){
		$("#dropdownMenu1").html('카테고리 <span class="glyphicon glyphicon-chevron-up"></span>');
	});
  
	<!-- 카테고리 메뉴 트렌잭션 -->
	$('.dropdown').on('show.bs.dropdown', function() {
		$(this).find('.dropdown-menu').first().stop(true, true).slideDown();
	});
	$('.dropdown').on('hide.bs.dropdown', function() {
		$(this).find('.dropdown-menu').first().stop(true, true).slideUp();
	});
});
</script>
</head>
<body>



<div class="container">

<div id="panel">
<img id="panel_img" src="/resources/img/sample_adopt/sample1.jpg" alt="panel">
</div>

<div id="wrap">
<div class="cate_wrap">
<h3 style="margin-bottom: 40px;">평생 가족을 찾습니다!</h3>

<div class="pull-right">
		<span id="menuMu">입양</span>
		<span style="display:inline-block;" class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
	
	<!-- 카테고리 드롭다운 메뉴 -->
	<div class="dropdown" style="display:inline-block;">
  		<button onclick="handleTitleClick()" class="btn btn-default.focus dropdown-toggle btn-lg" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
    		카테고리 <span id="icon" class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
	  	</button>
	  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
	    <li role="presentation"><a role="menuitem" tabindex="-1" href="/musical/mcList">전체</a></li>
	    <li role="presentation"><a role="menuitem" tabindex="-1" href="/musical/mcList">임보중</a></li>
	    <li role="presentation"><a role="menuitem" tabindex="-1" href="/musical/mcNew">입양완료</a></li>
	  </ul>
	</div>
</div>
</div>


<div class="pro_wrap">
	<input type="text" class="state" value="입양상태">
	<p>안녕하세요!</p>
	<p>저는 {동물이름}입니다.</p>
	<img src="/resources/img/sample_adopt/sample1.jpg" alt="입양프로필" class="img_style img-circle">
	<p>저는 약 {동물나이}살이에요.</p>
	<p>중성화를 (안)한 {성별}아이에요.</p>
	<div class="btn_wrap">
	<button class="btnStar">
<!-- 		<span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span> -->
		<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
	</button>
	<button class="btnAdopt">입양하기</button>
	</div>
</div>




<div class="text-center page">
	<ul class="pagination pagination-sm">

	<%-- 첫 페이지로 이동 --%>
	<c:if test="${paging.curPage ne 1 }">
		<li><a href="/board/list">&larr; 처음</a></li>	
	</c:if>
	
	<%-- 이전 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.startPage ne 1 }">
		<li><a href="/board/list?curPage=${paging.startPage - paging.pageCount }">&laquo;</a></li>
	</c:when>
	<c:when test="${paging.startPage eq 1 }">
		<li class="disabled"><a>&laquo;</a></li>
	</c:when>
	</c:choose>
	
	<%-- 이전 페이지로 가기 --%>
	<c:if test="${paging.curPage > 1 }">
		<li><a href="/board/list?curPage=${paging.curPage - 1 }">&lt;</a></li>
	</c:if>
	
	
	
	<%-- 페이징 리스트 --%>
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
	<c:if test="${paging.curPage eq i }">
		<li class="active"><a href="/board/list?curPage=${i }">${i }</a></li>
	</c:if>
	<c:if test="${paging.curPage ne i }">
		<li><a href="/board/list?curPage=${i }">${i }</a></li>
	</c:if>
	</c:forEach>

	
	
	<%-- 다음 페이지로 가기 --%>
	<c:if test="${paging.curPage < paging.totalPage }">
		<li><a href="/board/list?curPage=${paging.curPage + 1 }">&gt;</a></li>
	</c:if>
	
	<%-- 다음 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.endPage ne paging.totalPage }">
		<li><a href="/board/list?curPage=${paging.startPage + paging.pageCount }">&raquo;</a></li>
	</c:when>
	<c:when test="${paging.endPage eq paging.totalPage }">
		<li class="disabled"><a>&raquo;</a></li>
	</c:when>
	</c:choose>

	<%-- 끝 페이지로 이동 --%>
	<c:if test="${paging.curPage ne paging.totalPage }">
		<li><a href="/board/list?curPage=${paging.totalPage }">끝 &rarr;</a></li>	
	</c:if>
	
	</ul>
</div>









</div>
</div>
<c:import url="../layout/footer.jsp" />