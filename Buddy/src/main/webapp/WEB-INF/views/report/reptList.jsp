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
th {
	background: lightgray;
}

</style>
</head>
<body>

<div class="container">

<h3>회계 보고</h3>
<hr>

      <!-- 검색창 -->
      <form class="navbar-form navbar-right" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="">
        </div>
        
        <!-- 검색 버튼 -->
        <button type="submit" class="btn">
         	<span class="glyphicon glyphicon-search" aria-hidden="true"></span> 
        </button>
      </form>
 


<table style="vertical-align: middle;"class="table table-hover table-condensed text-center">
<thead>
	<tr>
		<th class="text-center" style="width: 10%;">No.</th>
		<th class="text-center" style="width: 70%;">제목</th>
		<th class="text-center" style="width: 20%;">글쓴이</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${reptList }" var="rept">
	<tr>
		<td>${rept.reptNo }</td>
		<td><a style="text-decoration: none;color:black;"
			 href="/report/reptList?reptNo=${rept.reptNo }">
			${rept.reptTitle }</a>
		</td>
		<td>Buddy<br>${rept.adminid }</td>
	</tr>
</c:forEach>
</tbody>
</table>

<button>글쓰기</button>
<span class="pull-right">total : ${paging.totalCount }</span>
<div class="clearfix"></div>

<div class="text-center">
	<ul class="pagination pagination-sm">

	<%-- 첫 페이지로 이동 --%>
	<c:if test="${paging.curPage ne 1 }">
		<li><a href="/report/reptList">&laquo; 처음</a></li>	
	</c:if>
	
	<%-- 이전 페이징 리스트로 이동 --%>
<%-- 	<c:choose> --%>
<%-- 	<c:when test="${paging.startPage ne 1 }"> --%>
<%-- 		<li><a href="/report/reptList?curPage=${paging.startPage - paging.pageCount }">&laquo;</a></li> --%>
<%-- 	</c:when> --%>
<%-- 	<c:when test="${paging.startPage eq 1 }"> --%>
<!-- 		<li class="disabled"><a>&laquo;</a></li> -->
<%-- 	</c:when> --%>
<%-- 	</c:choose> --%>
	
	<%-- 이전 페이지로 가기 --%>
	<c:if test="${paging.curPage > 1 }">
		<li><a href="/report/reptList?curPage=${paging.curPage - 1 }">&lt;</a></li>
	</c:if>
	
	
	
	<%-- 페이징 리스트 --%>
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
	<c:if test="${paging.curPage eq i }">
		<li class="active"><a href="/report/reptList?curPage=${i }">${i }</a></li>
	</c:if>
	<c:if test="${paging.curPage ne i }">
		<li><a href="/report/reptList?curPage=${i }">${i }</a></li>
	</c:if>
	</c:forEach>

	
	
	<%-- 다음 페이지로 가기 --%>
	<c:if test="${paging.curPage < paging.totalPage }">
		<li><a href="/report/reptList?curPage=${paging.curPage + 1 }">&gt;</a></li>
	</c:if>
	
	<%-- 다음 페이징 리스트로 이동 --%>
<%-- 	<c:choose> --%>
<%-- 	<c:when test="${paging.endPage ne paging.totalPage }"> --%>
<%-- 		<li><a href="/report/reptList?curPage=${paging.startPage + paging.pageCount }">&raquo;</a></li> --%>
<%-- 	</c:when> --%>
<%-- 	<c:when test="${paging.endPage eq paging.totalPage }"> --%>
<!-- 		<li class="disabled"><a>&raquo;</a></li> -->
<%-- 	</c:when> --%>
<%-- 	</c:choose> --%>

	<%-- 끝 페이지로 이동 --%>
	<c:if test="${paging.curPage ne paging.totalPage }">
		<li><a href="/report/reptList?curPage=${paging.totalPage }">끝 &raquo;</a></li>	
	</c:if>
	
	</ul>
</div>

</div><!-- .container -->


</body>
</html>