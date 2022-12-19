<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="./layout/header.jsp" />

<style type="text/css">
table {
	table-layout: fixed;
}

td, tr {
	height: 50px;
	
	line-height: 50px !important;
}

#rlist {
	padding-top: 40px;
	padding-right: 40px;
}

#plist {
	padding-top: 40px;
	padding-left: 40px;
}

button:focus, button:active { 	
    outline:none !important;
    box-shadow:none !important;
}
</style>

<script type="text/javascript">
$(document).ready(function() {
	
})
</script>

<div class="slider">
	<div id="myCarousel" class="carousel slide" data-ride="carousel" style="height: 400px;">
	
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
	
		<!-- Content -->
		<div class="carousel-inner">
		
			<!-- 추후 슬라이더 이미지 변경 필요... -->
			<!-- Slide 1 -->
			<div class="item active" data-interval="2000">
			<img src="./resources/img/main/slider01.png" alt="slide01" style="width:100%; height: 400px;">
			</div>
			
			<!-- Slide 2 -->
			<div class="item">
			<img src="./resources/img/main/slider02.png" alt="slide02" style="width:100%; height: 400px;">
			</div>
			
			<!-- Slide 3 -->
			<div class="item">
			<img src="./resources/img/main/slider03.png" alt="slide03" style="width:100%; height: 400px;">
			</div>
		
		</div>
	
		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span>
			<span class="sr-only">Previous</span>
		</a>
		<a class="right carousel-control" href="#myCarousel" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right"></span>
			<span class="sr-only">Next</span>
		</a>
	
	</div>
</div>

<div class="container">

<div class="col-md-6 pull-left" id="rlist">
	<div class="rlist-top">
		<span style="font-size: 25px;">최신글 </span>
		<a href="/comm/list">더보기</a>
	</div>
	<hr>
	<table class="table table-striped table-hover table-condensed">
	<thead>
		<tr>
			<th style="width: 10%;"></th>
			<th style="width: 10%;">제목</th>
			<th style="width: 10%;">작성자</th>
			<th style="width: 10%;">조회수</th>
			<th style="width: 10%;">작성일</th>
		</tr>
	</thead>
	
	<tbody>
	<c:forEach items="${rlist }" var="rlist">
		<tr>
			<td>
				<c:choose>
					<c:when test="${rlist.cateContent eq 'daily' }">#일상</c:when>
					<c:when test="${rlist.cateContent eq 'info' }">#정보</c:when>
					<c:when test="${rlist.cateContent eq 'ask' }">#질문</c:when>
					<c:when test="${rlist.cateContent eq 'etc' }">#기타</c:when>
				</c:choose>
			</td>
			<td><a href="/comm/view?commNo=${rlist.commNo }">${rlist.commTitle }</a></td>
			<td>${rlist.commWriterNick }</td>
			<td>${rlist.commHit }</td>
			<td><fmt:formatDate value="${rlist.commWritedate }" pattern="yyyy-MM-dd"/></td>
		</tr>
	</c:forEach>
	</tbody>
	</table>
</div>

<div class="col-md-6 pull-right" id="plist">
	<div class="plist-top">
		<span style="font-size: 25px;">인기글 </span>
		<a href="/comm/list">더보기</a>
	</div>
	<hr>
	<table class="table table-striped table-hover table-condensed">
	<thead>
		<tr>
			<th style="width: 10%;"></th>
			<th style="width: 10%;">제목</th>
			<th style="width: 10%;">작성자</th>
			<th style="width: 10%;">좋아요</th>
			<th style="width: 10%;">작성일</th>
		</tr>
	</thead>
	
	<tbody>
	<c:forEach items="${plist }" var="plist">
		<tr>
			<td>
				<c:choose>
					<c:when test="${plist.cateContent eq 'daily' }">#일상</c:when>
					<c:when test="${plist.cateContent eq 'info' }">#정보</c:when>
					<c:when test="${plist.cateContent eq 'ask' }">#질문</c:when>
					<c:when test="${plist.cateContent eq 'etc' }">#기타</c:when>
				</c:choose>
			</td>
			<td><a href="/comm/view?commNo=${plist.commNo }">${plist.commTitle }</a></td>
			<td>${plist.commWriterNick }</td>
			<td>${plist.commLikeCnt }</td>
			<td><fmt:formatDate value="${plist.commWritedate }" pattern="yyyy-MM-dd"/></td>
		</tr>
	</c:forEach>
	</tbody>
	</table>
</div>

</div><!-- .container -->

<c:import url="./layout/footer.jsp" />