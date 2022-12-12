<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="./layout/header.jsp" />

<style type="text/css">

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
			<img src="./resources/image/slide01.png" alt="slide01" style="width:100%; height: 400px;">
			</div>
			
			<!-- Slide 2 -->
			<div class="item">
			<img src="./resources/image/slide02.png" alt="slide02" style="width:100%; height: 400px;">
			</div>
			
			<!-- Slide 3 -->
			<div class="item">
			<img src="./resources/image/slide03.png" alt="slide03" style="width:100%; height: 400px;">
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

<!-- 최신글, 인기글 리스트 제작 필요... -->

<h1>메인 화면1</h1>
<h1>메인 화면2</h1>
<h1>메인 화면3</h1>
<h1>메인 화면4</h1>
<h1>메인 화면5</h1>
<h1>메인 화면6</h1>

</div><!-- .container -->

<c:import url="./layout/footer.jsp" />