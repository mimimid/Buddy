<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<c:import url="../layout/header.jsp" />

<!-- 웹글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<!-- CSS -->
<link rel="stylesheet" href="/resources/css/dateList.css">

<!-- 아이콘 CSS -->
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-bold-rounded/css/uicons-bold-rounded.css'>
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css'>
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-solid-rounded/css/uicons-solid-rounded.css'>
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-straight/css/uicons-regular-straight.css'>

<script type="text/javascript">
$(document).ready(function () {
	$("#btnSearch").click(function() {
		if( $("#inputSearch").val() == "" ) {
			alert("찾을 장소를 입력해주세요.")
		} else {
			location.href="/date/listSearch?keywoard=" + $('#inputSearch').val()
		}
	})
	
	//카테고리버튼CSS
	if( ${category eq 1} ) {
		console.log("카페")
		$("#cafe").css({"color": "#fff", "background-color": "#ff7a85"})
	} else if ( ${category eq 2} ) {
		console.log("호텔")
		$("#hotel").css({"color": "#fff", "background-color": "#ff7a85"})
	}  else if ( ${category eq 3} ) {
		console.log("훈련소")
		$("#training").css({"color": "#fff", "background-color": "#ff7a85"})
	} else {
		console.log("여행")
		$("#trip").css({"color": "#fff", "background-color": "#ff7a85"})		
	}
	
})

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

div#categoryBtn>a>button, span.searchBtn>button {
    background-color: #f0f0f0;
    color: #000;
}

div#categoryBtn>a>button:hover, div#arrayBtn>button, span.searchBtn>button:hover {
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

#dateListContent {
	padding-top: 12px;
}

table>thead>tr>th {
	text-align: center;
}

table>tbody>tr>td {
	text-align: center;
	vertical-align: middle;
}

</style>

<!-- 데이트게시판 메인 시작 -->
<div class="container">

<div class="row">
	<div class="text-center">
		<a href="/date/main" class="thumbnail">
			<img src="/resources/img/main/slider01.png" alt="...">
		</a>
	</div>
<div id="categoryBtn" class="text-center">
	<a href="/date/list?category=1"><button type="button" id="cafe" class="btn">카페</button></a>
	<a href="/date/list?category=2"><button type="button" id="hotel" class="btn">호텔</button></a>
	<a href="/date/list?category=3"><button type="button" id="training" class="btn">훈련소</button></a>
	<a href="/date/list?category=4"><button type="button" id="trip" class="btn">여행지</button></a>
</div>
</div>
<hr>

<div class="container">

<!-- 정렬, 검색 -->
<div class="row">
	<!-- 정렬방식 -->
	<div class="col-sm-2">
	<div id="arrayBtn" class="btn-group">
		<button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
		정렬방식 <span class="caret"></span>
		</button>
		<ul class="dropdown-menu" role="menu">
		<li><a href="/date/list?category=${category }&sort=READ">조회순</a></li>
		<li><a href="/date/list?category=${category }&sort=TIME">등록순</a></li>
		<li><a href="/date/list?category=${category }&sort=COMMENT">댓글순</a></li>
		<li><a href="/date/list?category=${category }&sort=LIKE">좋아요순</a></li>
		</ul>
	</div>
	</div><!-- 정렬방식 END -->

	<!-- 검색방식 -->
	<div class="col-sm-3 col-md-offset-7">
		<div class="input-group">
		<input type="text" id="inputSearch" class="form-control" name="keywoard" placeholder="찾을 장소를 입력하세요.">
		<span class="input-group-btn searchBtn">
			<button id="btnSearch" class="btn" type="button"><i class="fi fi-br-search"></i></button>
		</span>
		</div><!-- /input-group -->
	</div><!-- 검색방식 END -->
</div><!-- /.row -->

<!-- 컨텐트 -->
<div id="dateListContent" class="container-fluid">
<table class="table text-center table-condensed">
<thead>
	<tr>
		<th style="width: 6%;">글번호</th>
		<th style="width: 45%;">제목</th>
		<th style="width: 10%;">작성자</th>
		<th style="width: 6%;">조회수</th>
		<th style="width: 6%;">좋아요</th>
		<th style="width: 5%;">작성일</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="cafe">
	<tr>
		<td rowspan="2" style="vertical-align: middle;">${cafe.dateNo }</td>
		<td class="text-left"><small><i class="fi fi-rs-marker"></i>${cafe.loc }</small></td>
		<td rowspan="2" style="vertical-align: middle;">BUDDY</td>
		<td rowspan="2" style="vertical-align: middle;">${cafe.hit }</td>
		<td rowspan="2" style="vertical-align: middle;">${cafe.likeCount }</td>
		<td rowspan="2" style="vertical-align: middle;"><fmt:formatDate value="${cafe.writeDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
	</tr>
	<tr>
		<td class="text-left" style="border-top: none;"><a href="/date/view?dateNo=${cafe.dateNo }">${cafe.title }(${cafe.commCount })</a></td>
	</tr>
</c:forEach>
</tbody>
</table>

</div><!-- 컨텐트 END -->

</div><!-- container END -->

<!-- 페이징 -->
<div class="text-center">
	<ul class="pagination pagination-sm">
	
	<%-- 이전 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.startPage ne 1 }">
		<li><a href="/date/list?category=${category }&curPage=${paging.startPage - paging.pageCount }"><i class="fi fi-br-angle-double-left"></i></a></li>
	</c:when>
	<c:when test="${paging.startPage eq 1 }">
		<li class="disabled"><a><i class="fi fi-br-angle-double-left"></i></a></li>
	</c:when>
	</c:choose>
	
	<%-- 이전 페이지로 가기 --%>
	<c:if test="${paging.curPage > 1 }">
		<li><a href="/date/list?category=${category }&curPage=${paging.curPage - 1 }"><i class="fi fi-br-angle-left"></i></a></li>
	</c:if>
	
	
	
	<%-- 페이징 리스트 --%>
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
	<c:if test="${paging.curPage eq i }">
		<li class="active juaFont"><a href="/date/list?category=${category }&curPage=${i }">${i }</a></li>
	</c:if>
	<c:if test="${paging.curPage ne i }">
		<li class="juaFont"><a href="/date/list?category=${category }&curPage=${i }">${i }</a></li>
	</c:if>
	</c:forEach>

	
	
	<%-- 다음 페이지로 가기 --%>
	<c:if test="${paging.curPage < paging.totalPage }">
		<li><a href="/date/list?category=${category }&curPage=${paging.curPage + 1 }"><i class="fi fi-br-angle-right"></i></a></li>
	</c:if>
	
	<%-- 다음 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.endPage ne paging.totalPage }">
		<li><a href="/date/list?category=${category }&curPage=${paging.startPage + paging.pageCount }"><i class="fi fi-br-angle-double-right"></i></a></li>
	</c:when>
	<c:when test="${paging.endPage eq paging.totalPage }">
		<li class="disabled"><a><i class="fi fi-br-angle-double-right"></i></a></li>
	</c:when>
	</c:choose>

	</ul>
</div>

</div><!-- .container END -->

<c:import url="../layout/footer.jsp" />