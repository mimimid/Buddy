<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	$("#btnWrite").click(function() {
		location.href = "/comm/write"
	})
})
</script>

<style type="text/css">
.ani-cate {
	text-align: center;
	padding: 10px;
}

.nav-pills > li > a {
	font-size: 15px;
}

/* --------------------------------------- */

.con-cate {
	text-align: center;
	padding: 10px;
}

.nav-pills > .active {
	background: #FF7A85;
}

.nav-pills > li > a {
	font-size: 15px;
	color: #FF7A85;
}

/* --------------------------------------- */

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

<div class="container">

<div class="ani-cate">
	<ul class="nav nav-pills">
	  <li role="presentation" class="active"><a href="/comm/cat">고양이</a></li>
	  <li role="presentation"><a href="/comm/dog">강아지</a></li>
	</ul>
</div>

<div class="con-cate">
</div>

<table class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th style="width: 10%;">글번호</th>
		<th style="width: 45%;">제목</th>
		<th style="width: 20%;">작성자</th>
		<th style="width: 10%;">조회수</th>
		<th style="width: 15%;">작성일</th>
	</tr>
</thead>

<tbody>
<c:forEach items="${list }" var="commBoard">
	<tr>
		<td>${commBoard.commNo }</td>
		<td><a href="/comm/view?commNo=${commBoard.commNo }">${commBoard.commTitle }</a></td>
		<td>${board.writerNick }</td>
		<td>${commBoard.commHit }</td>
		<td><fmt:formatDate value="${commBoard.commWritedate }" pattern="yy-MM-dd HH:mm:ss"/></td>
	</tr>
</c:forEach>
</tbody>
</table>

<button id="btnWrite" class="btn btn-primary pull-left">글쓰기</button>
<span class="pull-right">total : ${paging.totalCount }</span>
<div class="clearfix"></div>

<c:import url="/WEB-INF/views/comm/paging.jsp" />

</div><!-- .container -->

<c:import url="../layout/footer.jsp" />