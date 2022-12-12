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

<!-- CSS -->
<link rel="stylesheet" href="/resources/css/dateList.css">

<!-- 아이콘 CSS -->
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-bold-rounded/css/uicons-bold-rounded.css'>

<script type="text/javascript">
$(document).ready(function () {
	
	
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
<hr>

<div class="container">

<div class="page-header" style="margin-top: 0;">
	<small>${viewDate.dateCateName } 데이트</small>
	<h3>${viewDate.title }</h3>
	<div class="media">
		<div class="media-left media-middle">
			<a href="#">
			<img class="media-object" src="/resources/img/date/user.png" alt="..." style="width: 40px; height: 40px;">
			</a>
		</div>
		<div class="media-body" style="font-color: #ccc;">
			<h4 class="media-heading">관리자</h4>
			<fmt:formatDate value="${viewDate.writeDate }" pattern="yy-MM-dd"/> 조회수 ${viewDate.hit } <b>신고</b>
		</div>
	</div>
</div>


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


</div><!-- .container END -->

<hr>
<h1>푸터부분</h1>

</body>
</html>