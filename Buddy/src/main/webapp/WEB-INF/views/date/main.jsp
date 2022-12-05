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

</head>
<body>

<h1>헤더부분</h1>
<hr>

<!-- 데이트게시판 메인 시작 -->
<div class="container">

<div class="row">
	<div class="text-center">
		<a href="#" class="thumbnail">
			<img src="https://cdn.imweb.me/thumbnail/20220422/0be5230e57bb5.png" alt="...">
		</a>
	</div>
<div class="text-center">
	<button id="cafe" class="cafe">카페</button>
	<button id="hotel" class="hotel">호텔</button>
	<button id="training" class="training">훈련소</button>
	<button id="trip" class="trip">여행지</button>
</div>
</div>

<div class="page-header">
	<h1>HOT NEWS! <small>더보기</small></h1>
	<hr>
<div class="row">
<c:forEach items="${hitList }" var="dateBoardHit" begin="0" end="5">
	<div class="col-sm-5 col-md-2">
<%-- 	<a href="./view?reviewno=<%=reviewList.get(i).getReviewno() %>"> --%>
		<div class="thumbnail">
<%-- 			<img alt="포스터" src="/resources/img/mc/<%=reviewList.get(i).getMcimg() %>" --%>
<!-- 				onerror="this.src='/resources/img/mc/noImg.jpg'"> -->
			<div class="caption">
				<h3>${dateBoardHit.title }</h3>
				<p>
				<fmt:formatDate value="${dateBoardHit.writeDate }" pattern="yy-MM-dd"/>
				</p>
			</div>
		</div>
<!-- 	</a> -->
	</div>
</c:forEach>
</div>
</div><!-- HOT NEWS! END -->

<div class="page-header">
	<h1>OPEN NEWS! <small>더보기</small></h1>
	<hr>
<div class="row">
<c:forEach items="${list }" var="dateBoard" begin="0" end="5">
	<div class="col-sm-5 col-md-2">
<%-- 	<a href="./view?reviewno=<%=reviewList.get(i).getReviewno() %>"> --%>
		<div class="thumbnail">
<%-- 			<img alt="포스터" src="/resources/img/mc/<%=reviewList.get(i).getMcimg() %>" --%>
<!-- 				onerror="this.src='/resources/img/mc/noImg.jpg'"> -->
			<div class="caption">
				<h3>${dateBoard.title }</h3>
				<p>
				<fmt:formatDate value="${dateBoard.writeDate }" pattern="yy-MM-dd"/>
				</p>
			</div>
		</div>
<!-- 	</a> -->
	</div>
</c:forEach>
</div>
</div><!-- OPEN NEWS! END -->

<div class="page-header">
	<h1>카페 데이트 <small>더보기</small></h1>
	<hr>
<div class="row">
<c:forEach items="${list }" var="dateBoard" begin="0" end="5">
	<div class="col-sm-5 col-md-2">
<c:if test="${dateBoard.dateCate eq 1 }">
<%-- 	<a href="./view?reviewno=<%=reviewList.get(i).getReviewno() %>"> --%>
		<div class="thumbnail">
<%-- 			<img alt="포스터" src="/resources/img/mc/<%=reviewList.get(i).getMcimg() %>" --%>
<!-- 				onerror="this.src='/resources/img/mc/noImg.jpg'"> -->
			<div class="caption">
				<h3>${dateBoard.title }</h3>
				<p>
				<fmt:formatDate value="${dateBoard.writeDate }" pattern="yy-MM-dd"/>
				</p>
			</div>
		</div>
</c:if>
<!-- 	</a> -->
	</div>
</c:forEach>
</div>
</div><!-- OPEN NEWS! END -->


</div><!-- 메인 END -->

<hr>
<h1>푸터부분</h1>
</body>
</html>