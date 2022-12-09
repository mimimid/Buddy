<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Buddy</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- 슬라이더 slick -->
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<script type="text/javascript">
$(document).ready(function () {
	$('.slick').slick({
		  infinite: true,
		  slidesToShow: 5,
		  slidesToScroll: 5
		});
})
</script>

</head>
<body>

<h1>헤더부분</h1>
<hr>

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
	</div>
</c:forEach>
</div>
</div><!-- OPEN NEWS! END -->

<div class="page-header">
	<h2>카페 데이트 <small>더보기</small></h2>
	<hr>
<div class="row slick">
<c:forEach items="${list }" var="dateBoard">
<c:if test="${dateBoard.dateCate eq '1' }">
	<div class="col-sm-5 col-md-2">
		<div class="thumbnail">
			<div class="caption">
				<h4>${dateBoard.title }</h4>
				<p>
				<fmt:formatDate value="${dateBoard.writeDate }" pattern="yy-MM-dd"/>
				</p>
			</div>
		</div>
	</div>
</c:if>
</c:forEach>
</div>
</div><!-- 카페데이트 END -->

<div class="page-header">
	<h2>호텔 데이트 <small>더보기</small></h2>
	<hr>
<div class="row slick">
<c:forEach items="${list }" var="dateBoard">
<c:if test="${dateBoard.dateCate eq '2' }">
	<div class="col-sm-5 col-md-2">
		<div class="thumbnail">
			<div class="caption">
				<h4>${dateBoard.title }</h4>
				<p>
				<fmt:formatDate value="${dateBoard.writeDate }" pattern="yy-MM-dd"/>
				</p>
			</div>
		</div>
	</div>
</c:if>
</c:forEach>
</div>
</div><!-- 호텔데이트 END -->

<div class="page-header">
	<h2>훈련소 데이트 <small>더보기</small></h2>
	<hr>
<div class="row slick">
<c:forEach items="${list }" var="dateBoard">
<c:if test="${dateBoard.dateCate eq '3' }">
	<div class="col-sm-5 col-md-2">
		<div class="thumbnail">
			<div class="caption">
				<h4>${dateBoard.title }</h4>
				<p>
				<fmt:formatDate value="${dateBoard.writeDate }" pattern="yy-MM-dd"/>
				</p>
			</div>
		</div>
	</div>
</c:if>
</c:forEach>
</div>
</div><!-- 훈련소데이트 END -->

<div class="page-header">
	<h2>여행지 데이트 <small>더보기</small></h2>
	<hr>
<div class="row slick">
<c:forEach items="${list }" var="dateBoard">
<c:if test="${dateBoard.dateCate eq '4' }">
	<div class="col-sm-5 col-md-2">
		<div class="thumbnail">
			<div class="caption">
				<h4>${dateBoard.title }</h4>
				<p>
				<fmt:formatDate value="${dateBoard.writeDate }" pattern="yy-MM-dd"/>
				</p>
			</div>
		</div>
	</div>
</c:if>
</c:forEach>
</div>
</div><!-- 호텔데이트 END -->



</div><!-- 메인 END -->

<hr>
<h1>푸터부분</h1>

</body>
</html>