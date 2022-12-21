<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<!-- CSS -->
<link rel="stylesheet" href="/resources/css/dateList.css">

<!-- 아이콘 CSS -->
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-bold-rounded/css/uicons-bold-rounded.css'>
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css'>
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-solid-rounded/css/uicons-solid-rounded.css'>
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-straight/css/uicons-regular-straight.css'>

<script type="text/javascript">
$(document).ready(function () {

	
})

function dateView(dateNo) {
	console.log(dateNo,"클릭")
	location.href="/date/view?dateNo="+dateNo
}

</script>

<style type="text/css">
#list_content {
    padding: 5px;
    border-radius: 0.4em;
    border: 2px solid #ccc;
}

div.container-fluid>div:hover {
	cursor: pointer;
}

div#categoryBtn>a>button {
    background-color: #f0f0f0;
    color: #000;
}

div#categoryBtn>a>button:hover {
    background-color: #ff7a85;
    color: #fff;
}

div.page-header>h2 {
	color: #ff7a85;
	font-weight: bolder;
}

div.page-header>hr {
	margin-top: 10px;
	margin-bottom: 15px;
}

#dateList {
	padding-top: 20px;
    padding-bottom: 20px;
}

</style>

<!-- 데이트게시판 메인 시작 -->
<div class="container">

<div class="row">
	<div class="text-center">
		<a href="/date/main" class="thumbnail">
			<img src="https://cdn.imweb.me/thumbnail/20220422/0be5230e57bb5.png" alt="...">
		</a>
	</div>
<div id="categoryBtn" class="text-center btn-category">
	<a href="/date/list?category=1"><button type="button" id="cafe" class="btn">카페</button></a>
	<a href="/date/list?category=2"><button type="button" id="hotel" class="btn">호텔</button></a>
	<a href="/date/list?category=3"><button type="button" id="training" class="btn">훈련소</button></a>
	<a href="/date/list?category=4"><button type="button" id="trip" class="btn">여행지</button></a>
</div>
</div>

<!-- 리스트 목록 -->
<div id="dateList" class="container-fluid">

<div class="page-header col-sm-6">
	<h2>HOT NEWS!</h2>
	<hr>
<div class="row">
<div class="container-fluid">
<c:forEach items="${hitList }" var="dateBoardHit" begin="0" end="4">
	<div id="list_content" class="media" onclick="dateView(${dateBoardHit.dateNo})">
		<div class="media-left media-middle">
			<img class="media-object img-circle" src="/resources/img/date/userImg.png" alt="userImg" style="width: 45px; height: 45px;">
		</div>
		<div id="user_media" class="media-body">
			<h4 id="user_name" class="media-heading">${dateBoardHit.title } <small><i class="fi fi-rs-marker"></i>${dateBoardHit.loc }</small></h4>
			<div>
				<div>Buddy</div>
				<div>
					<span><fmt:formatDate value="${dateBoardHit.writeDate }" pattern="yy-MM-dd"/></span>｜
					<span><i class="fi fi-rr-eye"></i>&nbsp;${dateBoardHit.hit }</span>｜
					<span><i class="fi fi-sr-heart"></i>&nbsp;${dateBoardHit.likeCount }</span>｜
					<span><i class="fi fi-rr-comment-alt-middle"></i>&nbsp;${dateBoardHit.commCount }</span>
				</div>
			</div>
		</div>
	</div>
</c:forEach>
</div>
</div>
</div><!-- HOT NEWS! END -->

<div class="page-header col-sm-6">
	<h2>OPEN NEWS!</h2>
	<hr>
<div class="row">
<div class="container-fluid">
<c:forEach items="${list }" var="dateBoard" begin="0" end="4">
	<div id="list_content" class="media" onclick="dateView(${dateBoard.dateNo})">
		<div class="media-left media-middle">
			<img class="media-object img-circle" src="/resources/img/date/userImg.png" alt="userImg" style="width: 45px; height: 45px;">
		</div>
		<div id="user_media" class="media-body">
			<h4 id="user_name" class="media-heading">${dateBoard.title } <small><i class="fi fi-rs-marker"></i>${dateBoard.loc }</small></h4>
			<div>
				<div>Buddy</div>
				<div>
					<span><fmt:formatDate value="${dateBoard.writeDate }" pattern="yy-MM-dd"/></span>｜
					<span><i class="fi fi-rr-eye"></i>&nbsp;${dateBoard.hit }</span>｜
					<span><i class="fi fi-sr-heart"></i>&nbsp;${dateBoard.likeCount }</span>｜
					<span><i class="fi fi-rr-comment-alt-middle"></i>&nbsp;${dateBoard.commCount }</span>
				</div>
			</div>
		</div>
	</div>
</c:forEach>
</div>
</div>
</div><!-- OPEN NEWS! END -->

</div><!-- 리스트목록 END -->

</div><!-- 메인 END -->

<c:import url="../layout/footer.jsp" />