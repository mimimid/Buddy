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

<!-- 웹글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<!-- 아이콘 CSS -->
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-bold-rounded/css/uicons-bold-rounded.css'>

<!-- CSS -->
<link rel="stylesheet" href="/resources/css/dateList.css">

<script type="text/javascript">
$(document).ready(function () {
	$("#inputSearch").click(function() {
		
	})
	
	$("#btnSearch").click(function() {
		location.href="/date/listSearch?keywoard=" + $('#inputSearch').val()
	})
})
</script>

</head>
<body>

<h1>헤더부분</h1>
<hr>

<i class="fi fi-br-a"></i>

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
<hr>

<div class="container">

<!-- 검색 -->
<div class="row">
	<!-- 검색방식 -->
	<div class="col-sm-3 col-md-offset-9">
		<div class="input-group">
		<input type="text" id="inputSearch" class="form-control" name="keywoard" placeholder="찾을 장소를 입력하세요.">
		<span class="input-group-btn">
			<button id="btnSearch" class="btn btn-default" type="button"><i class="fi fi-br-search"></i></button>
		</span>
		</div><!-- /input-group -->
	</div><!-- /.col-lg-6 -->
</div><!-- /.row -->

<hr style="display: table; margin-bottom: 0px;">

<div class="row">
<c:forEach items="${list }" var="cafe">
	<div class="col-sm-2 col-md-3">
	<a href="./view?dateNo=${cafe.dateNo }">
		<div class="thumbnail">
<%-- 			<img alt="포스터" src="/resources/img/mc/<%=reviewList.get(i).getMcimg() %>" --%>
<!-- 				onerror="this.src='/resources/img/mc/noImg.jpg'"> -->
			<div class="caption">
				<h3>${cafe.title }</h3>
				<p>
				</p>
			</div>
		</div>
	</a>
	</div>
</c:forEach>
</div>
</div>

<!-- 페이징 -->
<div class="text-center">
	<ul class="pagination pagination-sm">

	<%-- 첫 페이지로 이동 --%>
<%-- 	<c:if test="${paging.curPage ne 1 }"> --%>
<%-- 		<li><a href="/date/listSearch?keywoard=${keywoard }">&larr; 처음</a></li>	 --%>
<%-- 	</c:if> --%>
	
	<%-- 이전 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.startPage ne 1 }">
		<li><a href="/date/listSearch?keywoard=${keywoard }&curPage=${paging.startPage - paging.pageCount }"><i class="fi fi-br-angle-double-left"></i></a></li>
	</c:when>
	<c:when test="${paging.startPage eq 1 }">
		<li class="disabled"><a><i class="fi fi-br-angle-double-left"></i></a></li>
	</c:when>
	</c:choose>
	
	<%-- 이전 페이지로 가기 --%>
	<c:if test="${paging.curPage > 1 }">
		<li><a href="/date/listSearch?keywoard=${keywoard }&curPage=${paging.curPage - 1 }"><i class="fi fi-br-angle-left"></i></a></li>
	</c:if>
	
	
	
	<%-- 페이징 리스트 --%>
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
	<c:if test="${paging.curPage eq i }">
		<li class="active juaFont"><a href="/date/listSearch?keywoard=${keywoard }&curPage=${i }">${i }</a></li>
	</c:if>
	<c:if test="${paging.curPage ne i }">
		<li class="juaFont"><a href="/date/listSearch?keywoard=${keywoard }&curPage=${i }">${i }</a></li>
	</c:if>
	</c:forEach>

	
	
	<%-- 다음 페이지로 가기 --%>
	<c:if test="${paging.curPage < paging.totalPage }">
		<li><a href="/date/listSearch?keywoard=${keywoard }&curPage=${paging.curPage + 1 }"><i class="fi fi-br-angle-right"></i></a></li>
	</c:if>
	
	<%-- 다음 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.endPage ne paging.totalPage }">
		<li><a href="/date/listSearch?keywoard=${keywoard }&curPage=${paging.startPage + paging.pageCount }"><i class="fi fi-br-angle-double-right"></i></a></li>
	</c:when>
	<c:when test="${paging.endPage eq paging.totalPage }">
		<li class="disabled"><a><i class="fi fi-br-angle-double-right"></i></a></li>
	</c:when>
	</c:choose>

	<%-- 끝 페이지로 이동 --%>
<%-- 	<c:if test="${paging.curPage ne paging.totalPage }"> --%>
<%-- 		<li><a href="/date/listSearch?keywoard=${keywoard }&curPage=${paging.totalPage }">끝 &rarr;</a></li>	 --%>
<%-- 	</c:if> --%>
	
	</ul>
</div>

</div><!-- .container END -->

<hr>
<h1>푸터부분</h1>

</body>
</html>