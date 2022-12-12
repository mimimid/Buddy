<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<table style="vertical-align: middle;"class="table table-hover table-condensed text-center">
<thead>
	<tr>
		<th class="text-center" style="width: 10%; padding: 13px;">No.</th>
		<th class="text-center" style="width: 70%; padding: 13px;">제목</th>
		<th class="text-center" style="width: 10%; padding: 13px;">작성일</th>
		<th class="text-center" style="width: 10%; padding: 13px;">작성자</th>
	</tr>
</thead>
<tbody id="searchTable">

<c:forEach items="${data }" var="rept">

<c:choose>
<c:when test="${not empty rept.RFILE_NO}">
	<tr>
		<td style="padding-top: 15px;">${rept.REPT_NO }</td>
		<td style="padding-top: 15px;"><a style="text-decoration: none; color: black;"
			 href="/report/reptView?reptNo=${rept.REPT_NO }">
			${rept.REPT_TITLE }
			<span id="icon" class="glyphicon glyphicon-paperclip" aria-hidden="true" style="color:skyblue"></span>
			</a>
		</td>
		<td style="padding-top: 15px;"><fmt:formatDate value="${rept.REPT_DATE}" pattern="yy/MM/dd"/></td>
		<td>Buddy<br>${rept.ADMINID }</td>
	</tr>
</c:when>
<c:otherwise>
	<tr>
		<td style="padding-top: 15px;">${rept.REPT_NO}</td>
		<td style="padding-top: 15px;"><a style="text-decoration: none; color: black;"
			 href="/report/reptView?reptNo=${rept.REPT_NO }">
			${rept.REPT_TITLE }</a>
		</td>
		<td style="padding-top: 15px;"><fmt:formatDate value="${rept.REPT_DATE}" pattern="yy/MM/dd"/></td>
		<td>Buddy<br>${rept.ADMINID }</td>
	</tr>
</c:otherwise>
</c:choose>
</c:forEach>

</tbody>
</table>

<div class="text-center">
	<ul class="pagination pagination-sm">

	<c:set var="keyword" value="${param.reptTitle }" />
	
	<%-- 첫 페이지로 이동 --%>
	<c:if test="${paging.curPage ne 1 }">
		<li><a href="/report/reptList?reptTitle=<c:out value="${keyword}" />">&laquo;</a></li>	
	</c:if>
	
	<%-- 이전 페이지로 가기 --%>
	<c:if test="${paging.curPage > 1 }">
		<li><a href="/report/reptList?reptTitle=<c:out value="${keyword}" />&&curPage=${paging.curPage - 1 }">&lt;</a></li>
	</c:if>
	
	<%-- 페이징 리스트 --%>
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
	<c:if test="${paging.curPage eq i }">
		<li class="active"><a href="/report/reptList?reptTitle=<c:out value="${keyword}" />&&curPage=${i }">${i }</a></li>
	</c:if>
	<c:if test="${paging.curPage ne i }">
		<li><a href="/report/reptList?reptTitle=<c:out value="${keyword}" />&&curPage=${i }">${i }</a></li>
	</c:if>
	</c:forEach>
	
	<%-- 다음 페이지로 가기 --%>
	<c:if test="${paging.curPage < paging.totalPage }">
		<li><a href="/report/reptList?reptTitle=<c:out value="${keyword}" />&&curPage=${paging.curPage + 1 }">&gt;</a></li>
	</c:if>

	<%-- 끝 페이지로 이동 --%>
	<c:if test="${paging.curPage ne paging.totalPage }">
		<li><a href="/report/reptList?reptTitle=<c:out value="${keyword}" />&&curPage=${paging.totalPage }">&raquo;</a></li>	
	</c:if>
	
	</ul>
</div>