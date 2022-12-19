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
    color: white;
    background-color: #FF7A85;
        border: none;
}
.btnAdopt:hover{
    color: lemonchiffon;
}
.btnStar{
	width: 40px;
    height: 40px;
    margin-right: 3px;
    padding: 0px;
    font-size: 20px;
    background-color: white;
    border: 3px solid #FF7A85;
    color: #FF7A85;
}
.btnStar:hover{
	background-color: lemonchiffon;
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
    margin-right: 10px;
}    
.page{
	margin: 80px 0px;
}
.page > a{
    color: black;
    text-decoration: none;
}
.data{
	color: #FF7A85;
	font-size: 16px;
}
.btnUp{
	background-color: cornflowerblue;
    color: white;
}
</style>
<script>
$(document).ready(function(){
	
	$(".btnAdopt").click(function() {
		location.href = "/adopt/research"
	});
	
	$(".btnStar").click(function() {
		if(${empty userno }){
			alert("아이를 기억하려면 로그인이 필요해요.");
			return false;
		}
	});
	$(".btnUp").click(function() {
		location.href = "/adopt/proWrite"
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

<!-- 찜목록 -->
<a href="/adopt/proWishList" ><button class="btnStar">
<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
</button></a>

<div class="pull-right">
		<span id="menuMu">입양</span>
		<span style="display:inline-block;" class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
	
	<!-- 카테고리 드롭다운 메뉴 -->
	<div class="dropdown" style="display:inline-block;">
  		<button onclick="handleTitleClick()" class="btn btn-default.focus dropdown-toggle btn-lg" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
    		구분 <span id="icon" class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
	  	</button>
	  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
	    <li role="presentation"><a role="menuitem" tabindex="-1" href="/musical/mcList">전체</a></li>
	    <li role="presentation"><a role="menuitem" tabindex="-1" href="/musical/mcList">임보 중</a></li>
	    <li role="presentation"><a role="menuitem" tabindex="-1" href="/musical/mcNew">입양완료</a></li>
	  </ul>
	</div>
</div>
</div>

<c:forEach items="${list }" var="pro">
<div class="pro_wrap">
	<input type="text" class="state" value="${pro.ANI_CATE}" readonly="readonly">
	<p>안녕하세요!</p>
	<p>저는 <span class="data">${pro.ANI_NAME}</span>입니다.</p>
	<a href="/adopt/proView?aniNo=${pro.ANI_NO}">
		<img src="/adopt/adoptDown?anifileNo=${pro.ANIFILE_NO}" alt="입양프로필" class="img_style img-circle" onerror="this.src='/resources/img/sample_adopt/noImg.jpg'">
	</a>
	<p>저는 약 <span class="data">${pro.ANI_AGE}</span>살이에요.</p>
	<p>중성화 <span class="data">${pro.ANI_NEUTRAL } ${pro.ANI_GENDER}</span>아이에요.</p>
	
	<!-- 찜 -->
	<div class="btn_wrap">
	<a href="/adopt/proWish?aniNo=${pro.ANI_NO}" ><button class="btnStar">
	<c:if test="${empty userno or pro.USERNO != userno}">
		<span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
	</c:if>
	<c:if test="${not empty userno and pro.USERNO == userno}">
		<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
	</c:if>
	</button></a>
	<button class="btnAdopt" >입양하기</button>
	</div>
</div>
</c:forEach>

<div style="padding:20px;">
<c:if test="${userno == 1 }">
<button class="btn btnUp pull-right">글쓰기</button>
</c:if>
</div>

<div class="text-center page">
	<ul class="pagination pagination-sm">

	<%-- 첫 페이지로 이동 --%>
	<c:if test="${paging.curPage ne 1 }">
		<li><a href="/adopt/pro">처음</a></li>	
	</c:if>
	
	<%-- 이전 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.startPage ne 1 }">
		<li><a href="/adopt/pro?curPage=${paging.startPage - paging.pageCount }">&laquo;</a></li>
	</c:when>
	<c:when test="${paging.startPage eq 1 }">
		<li class="disabled"><a>&laquo;</a></li>
	</c:when>
	</c:choose>
	
	<%-- 이전 페이지로 가기 --%>
	<c:if test="${paging.curPage > 1 }">
		<li><a href="/adopt/pro?curPage=${paging.curPage - 1 }">&lt;</a></li>
	</c:if>
	
	
	
	<%-- 페이징 리스트 --%>
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
	<c:if test="${paging.curPage eq i }">
		<li class="active"><a href="/adopt/pro?curPage=${i }">${i }</a></li>
	</c:if>
	<c:if test="${paging.curPage ne i }">
		<li><a href="/adopt/pro?curPage=${i }">${i }</a></li>
	</c:if>
	</c:forEach>

	
	
	<%-- 다음 페이지로 가기 --%>
	<c:if test="${paging.curPage < paging.totalPage }">
		<li><a href="/adpt/pro?curPage=${paging.curPage + 1 }">&gt;</a></li>
	</c:if>
	
	<%-- 다음 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.endPage ne paging.totalPage }">
		<li><a href="/adpt/pro?curPage=${paging.startPage + paging.pageCount }">&raquo;</a></li>
	</c:when>
	<c:when test="${paging.endPage eq paging.totalPage }">
		<li class="disabled"><a>&raquo;</a></li>
	</c:when>
	</c:choose>

	<%-- 끝 페이지로 이동 --%>
	<c:if test="${paging.curPage ne paging.totalPage }">
		<li><a href="/adpt/pro?curPage=${paging.totalPage }">끝</a></li>	
	</c:if>
	
	</ul>
</div>









</div>
</div>
<c:import url="../layout/footer.jsp" />