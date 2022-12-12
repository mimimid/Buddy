<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:if test="${not empty param.hour24 }">
<c:set var="hour24Param" value="&hour24=${param.hour24 }" />
</c:if>

<c:if test="${not empty param.searchType }">
<c:set var="searchParam" value="&searchType=${param.searchType }" />
</c:if>

<c:if test="${not empty param.keyWord }">
<c:set var="keywordParam" value="&keyWord=${param.keyWord }" />
</c:if>



<div class="text-center">
	<ul class="pagination pagination-sm">

	<%-- 첫 페이지로 이동 --%>
	<c:if test="${paging.curPage ne 1 }">
		<li><a href="/hospital/hosplist?curPage=1${hour24Param }${searchParam }${keywordParam }">&larr; 처음</a></li>	
	</c:if>
	
	<%-- 이전 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.startPage ne 1 }">
		<li><a href="/hospital/hosplist?curPage=${paging.startPage - paging.pageCount }${hour24Param }${searchParam }${keywordParam }">&laquo;</a></li>
	</c:when>
	<c:when test="${paging.startPage eq 1 }">
		<li class="disabled"><a>&laquo;</a></li>
	</c:when>
	</c:choose>
	
	<%-- 이전 페이지로 가기 --%>
	<c:if test="${paging.curPage > 1 }">
		<li><a href="/hospital/hosplist?curPage=${paging.curPage - 1 }${hour24Param }${searchParam }${keywordParam }">&lt;</a></li>
	</c:if>
	
	
	
	<%-- 페이징 리스트 --%>
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
	<c:if test="${paging.curPage eq i }">
		<li class="active"><a href="/hospital/hosplist?curPage=${i }${hour24Param }${searchParam }${keywordParam }">${i }</a></li>
	</c:if>
	<c:if test="${paging.curPage ne i }">
		<li><a href="/hospital/hosplist?curPage=${i }${hour24Param }${searchParam }${keywordParam }">${i }</a></li>
	</c:if>
	</c:forEach>

	
	
	<%-- 다음 페이지로 가기 --%>
	<c:if test="${paging.curPage < paging.totalPage }">
		<li><a href="/hospital/hosplist?curPage=${paging.curPage + 1 }${hour24Param }${searchParam }${keywordParam }">&gt;</a></li>
	</c:if>
	
	<%-- 다음 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.endPage ne paging.totalPage }">
		<li><a href="/hospital/hosplist?curPage=${paging.startPage + paging.pageCount }${hour24Param }${searchParam }${keywordParam }">&raquo;</a></li>
	</c:when>
	<c:when test="${paging.endPage eq paging.totalPage }">
		<li class="disabled"><a>&raquo;</a></li>
	</c:when>
	</c:choose>

	<%-- 끝 페이지로 이동 --%>
	<c:if test="${paging.curPage ne paging.totalPage }">
		<li><a href="/hospital/hosplist?curPage=${paging.totalPage }${hour24Param }${searchParam }${keywordParam }">끝 &rarr;</a></li>	
	</c:if>
	
	</ul>
</div>

