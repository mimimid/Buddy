<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Buddy</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
table {
	table-layout: fixed;
}

table, th {
	text-align: center;
}

td:nth-child(2) {
	text-align: left;
}

</style>
<script type="text/javascript">
$(document).ready(function() {
	
	$('.check').each(function() {
	    $(this).html($(this).html().replace(/입양대기/g, '<span style="color:blue">입양대기</span>'));
	    $(this).html($(this).html().replace(/입양완료/g, '<span style="color:black">입양완료</span>'));
	    $(this).html($(this).html().replace(/입양보류/g, '<span style="color:red">입양보류</span>'));
	});

})
	

</script>

</head>
<body>
<div class="container">

<h1>입양신청서</h1>
<hr>

<table class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th style="width: 10%;">신청번호</th>
		<th style="width: 45%;">제목</th>
		<th style="width: 20%;">신청일</th>
		<th style="width: 10%;">신청서류상태</th>
	</tr>
</thead>
<tbody id="tbodys">
<c:forEach items="${list }" var="resrch">
<c:choose>
<c:when test="${resrch.answerHit == 0 }">
	<tr>
		<td>${resrch.adoptNo }</td>
		<td><a style="text-decoration:none;color:black;"href="/adopt/resrchView?adoptNo=${resrch.adoptNo }" >${resrch.answer1 }의 입양신청서
			<span style="color:blue;"id="icon" class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
		</a></td>
		<td><fmt:formatDate value="${resrch.adoptDate }" pattern="yy-MM-dd"/></td>
		<td><span class="check">${resrch.checking }</span></td>
		
</c:when>
<c:otherwise>
	</tr>
		<tr>
		<td>${resrch.adoptNo }</td>
		<td><a style="text-decoration:none;color:black;"href="/adopt/resrchView?adoptNo=${resrch.adoptNo }">${resrch.answer1 }의 입양신청서</a></td>
		<td><fmt:formatDate value="${resrch.adoptDate }" pattern="yy-MM-dd"/></td>
		<td><span class="check">${resrch.checking }</span></td>
	</tr>
</c:otherwise>
</c:choose>
</c:forEach>
</tbody>
</table>

<span class="pull-right">total : ${paging.totalCount }</span>
<div class="clearfix"></div>

<div class="text-center">
	<ul class="pagination pagination-sm">

	<%-- 첫 페이지로 이동 --%>
	<c:if test="${paging.curPage ne 1 }">
		<li><a href="/adopt/resrchList">&laquo;</a></li>	
	</c:if>
	
	<%-- 이전 페이지로 가기 --%>
	<c:if test="${paging.curPage > 1 }">
		<li><a href="/adopt/resrchList?curPage=${paging.curPage - 1 }">&lt;</a></li>
	</c:if>
	
	<%-- 페이징 리스트 --%>
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
	<c:if test="${paging.curPage eq i }">
		<li class="active"><a href="/adopt/resrchList?curPage=${i }">${i }</a></li>
	</c:if>
	<c:if test="${paging.curPage ne i }">
		<li><a href="/adopt/resrchList?curPage=${i }">${i }</a></li>
	</c:if>
	</c:forEach>
	
	<%-- 다음 페이지로 가기 --%>
	<c:if test="${paging.curPage < paging.totalPage }">
		<li><a href="/adopt/resrchList?curPage=${paging.curPage + 1 }">&gt;</a></li>
	</c:if>

	<%-- 끝 페이지로 이동 --%>
	<c:if test="${paging.curPage ne paging.totalPage }">
		<li><a href="/adopt/resrchList?curPage=${paging.totalPage }">&raquo;</a></li>	
	</c:if>
	
	</ul>
</div>

</div><!-- .container -->

</body>
</html>