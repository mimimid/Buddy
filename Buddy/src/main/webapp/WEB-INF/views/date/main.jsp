<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<!-- 슬라이더 slick -->
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<!-- 아이콘 CSS -->
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-bold-rounded/css/uicons-bold-rounded.css'>

<!-- <link rel="stylesheet" type="text/css" href="/resources/css/slick/slick.css"/> -->
<!-- <link rel="stylesheet" type="text/css" href="/resources/css/slick/slick-theme.css"/> -->

<script type="text/javascript">
$(document).ready(function () {
	$('.slick').slick({
		  infinite: true,
		  slidesToShow: 5,
		  slidesToScroll: 5,
		  prevArrow: "<i class='fi fi-br-angle-left'></i>",
		  nextArrow: "<i class='fi fi-br-angle-right'></i>"
		});
	
})
</script>

<!-- 데이트게시판 메인 시작 -->
<div class="container">

<div class="row">
	<div class="text-center">
		<a href="/date/main" class="thumbnail">
			<img src="https://cdn.imweb.me/thumbnail/20220422/0be5230e57bb5.png" alt="...">
		</a>
	</div>
<div class="text-center">
	<a href="/date/list?category=1"><button type="button" id="cafe" class="btn btn-default">카페</button></a>
	<a href="/date/list?category=2"><button type="button" id="hotel" class="btn btn-default">호텔</button></a>
	<a href="/date/list?category=3"><button type="button" id="training" class="btn btn-default">훈련소</button></a>
	<a href="/date/list?category=4"><button type="button" id="trip" class="btn btn-default">여행지</button></a>
</div>
</div>

<div class="page-header">
	<h2>HOT NEWS!</h2>
	<hr>
<div class="row">
<c:forEach items="${hitList }" var="dateBoardHit" begin="0" end="4">
	<div class="col-sm-5 col-md-2">
	<a href="./view?dateNo=${dateBoardHit.dateNo }">
		<div class="thumbnail">
<%-- 			<img alt="포스터" src="/resources/img/mc/<%=reviewList.get(i).getMcimg() %>" --%>
<!-- 				onerror="this.src='/resources/img/mc/noImg.jpg'"> -->
			<div class="caption">
				<h4>${dateBoardHit.title }</h4>
				<p>
				<fmt:formatDate value="${dateBoardHit.writeDate }" pattern="yy-MM-dd"/>
				</p>
			</div>
		</div>
	</a>
	</div>
</c:forEach>
</div>
</div><!-- HOT NEWS! END -->

<div class="page-header">
	<h2>OPEN NEWS!</h2>
	<hr>
<div class="row">
<c:forEach items="${list }" var="dateBoard" begin="0" end="4">
	<div class="col-sm-5 col-md-2">
	<a href="./view?dateNo=${dateBoard.dateNo }">
		<div class="thumbnail">
<%-- 			<img alt="포스터" src="/resources/img/mc/<%=reviewList.get(i).getMcimg() %>" --%>
<!-- 				onerror="this.src='/resources/img/mc/noImg.jpg'"> -->
			<div class="caption">
				<h4>${dateBoard.title }</h4>
				<p>
				<fmt:formatDate value="${dateBoard.writeDate }" pattern="yy-MM-dd"/>
				</p>
			</div>
		</div>
	</a>
	</div>
</c:forEach>
</div>
</div><!-- OPEN NEWS! END -->

<div class="page-header">
	<h2>카페 데이트 <a href="/date/list?category=1"><small>더보기</small></a></h2>
	<hr>
<div class="row slick">
<c:forEach items="${list }" var="dateBoard">
<c:if test="${dateBoard.dateCate eq '1' }">
	<div class="col-sm-5 col-md-2">
	<a href="./view?dateNo=${dateBoard.dateNo }">
		<div class="thumbnail">
			<div class="caption">
				<h4>${dateBoard.title }</h4>
				<p>
				<fmt:formatDate value="${dateBoard.writeDate }" pattern="yy-MM-dd"/>
				</p>
			</div>
		</div>
	</a>
	</div>
</c:if>
</c:forEach>
</div>
<!-- <button class="slick-prev" id="prev"><i class="fi fi-br-angle-left"></i></button> -->
<!-- <button class="slick-next" id="next"><i class="fi fi-br-angle-right"></i></button> -->
</div><!-- 카페데이트 END -->

<div class="page-header">
	<h2>호텔 데이트 <a href="/date/list?category=2"><small>더보기</small></a></h2>
	<hr>
<div class="row slick">
<c:forEach items="${list }" var="dateBoard">
<c:if test="${dateBoard.dateCate eq '2' }">
	<div class="col-sm-5 col-md-2">
	<a href="./view?dateNo=${dateBoard.dateNo }">
		<div class="thumbnail">
			<div class="caption">
				<h4>${dateBoard.title }</h4>
				<p>
				<fmt:formatDate value="${dateBoard.writeDate }" pattern="yy-MM-dd"/>
				</p>
			</div>
		</div>
	</a>
	</div>
</c:if>
</c:forEach>
</div>
</div><!-- 호텔데이트 END -->

<div class="page-header">
	<h2>훈련소 데이트 <a href="/date/list?category=3"><small>더보기</small></a></h2>
	<hr>
<div class="row slick">
<c:forEach items="${list }" var="dateBoard">
<c:if test="${dateBoard.dateCate eq '3' }">
	<div class="col-sm-5 col-md-2">
	<a href="./view?dateNo=${dateBoard.dateNo }">
		<div class="thumbnail">
			<div class="caption">
				<h4>${dateBoard.title }</h4>
				<p>
				<fmt:formatDate value="${dateBoard.writeDate }" pattern="yy-MM-dd"/>
				</p>
			</div>
		</div>
	</a>
	</div>
</c:if>
</c:forEach>
</div>
</div><!-- 훈련소데이트 END -->

<div class="page-header">
	<h2>여행지 데이트 <a href="/date/list?category=4"><small>더보기</small></a></h2>
	<hr>
<div class="row slick">
<c:forEach items="${list }" var="dateBoard">
<c:if test="${dateBoard.dateCate eq '4' }">
	<div class="col-sm-5 col-md-2">
	<a href="./view?dateNo=${dateBoard.dateNo }">
		<div class="thumbnail">
			<div class="caption">
				<h4>${dateBoard.title }</h4>
				<p>
				<fmt:formatDate value="${dateBoard.writeDate }" pattern="yy-MM-dd"/>
				</p>
			</div>
		</div>
	</a>
	</div>
</c:if>
</c:forEach>
</div>
</div><!-- 호텔데이트 END -->

</div><!-- 메인 END -->

<c:import url="../layout/footer.jsp" />