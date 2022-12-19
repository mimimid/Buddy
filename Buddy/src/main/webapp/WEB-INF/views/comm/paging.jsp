<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${not empty searchType }">
<c:set var="typeParam" value="&searchType=${searchType }" />
</c:if>

<c:if test="${not empty keyword }">
<c:set var="searchParam" value="&keyword=${keyword }" />
</c:if>

<c:if test="${not empty animal }">
<c:set var="animalParam" value="&animal=${animal }" />
</c:if>

<c:if test="${not empty category }">
<c:set var="categoryParam" value="&category=${category }" />
</c:if>

<div class="text-center">
	
	<ul class="pagination pagination-sm">

	<%-- 첫 페이지로 이동 --%>
<%-- 	<c:if test="${paging.curPage ne 1 }"> --%>
<%-- 		<li><a href="/comm/list?curPage=1${searchParam }${animalParam }${categoryParam }">&larr; 처음</a></li>	 --%>
<%-- 	</c:if> --%>
	
	<%-- 이전 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.startPage ne 1 }">
		<li><a href="/comm/list?curPage=${paging.startPage - paging.pageCount }${typeParam }${searchParam }${animalParam }${categoryParam }">&laquo;</a></li>
	</c:when>
	<c:when test="${paging.startPage eq 1 }">
		<li class="disabled"><a>&laquo;</a></li>
	</c:when>
	</c:choose>
	
	<%-- 이전 페이지로 가기 --%>
	<c:if test="${paging.curPage > 1 }">
		<li><a href="/comm/list?curPage=${paging.curPage - 1 }${typeParam }${searchParam }${animalParam }${categoryParam }">&lt;</a></li>
	</c:if>
	
	<%-- 페이징 리스트 --%>
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
	<c:if test="${paging.curPage eq i }">
		<li class="active"><a href="/comm/list?curPage=${i }${typeParam }${searchParam }${animalParam }${categoryParam }">${i }</a></li>
	</c:if>
	<c:if test="${paging.curPage ne i }">
		<li><a href="/comm/list?curPage=${i }${searchParam }${typeParam }${animalParam }${categoryParam }">${i }</a></li>
	</c:if>
	</c:forEach>
	
	<%-- 다음 페이지로 가기 --%>
	<c:if test="${paging.curPage < paging.totalPage }">
		<li><a href="/comm/list?curPage=${paging.curPage + 1 }${typeParam }${searchParam }${animalParam }${categoryParam }">&gt;</a></li>
	</c:if>
	
	<%-- 다음 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.endPage ne paging.totalPage }">
		<li><a href="/comm/list?curPage=${paging.startPage + paging.pageCount }${typeParam }${searchParam }${animalParam }${categoryParam }">&raquo;</a></li>
	</c:when>
	<c:when test="${paging.endPage eq paging.totalPage }">
		<li class="disabled"><a>&raquo;</a></li>
	</c:when>
	</c:choose>

	<%-- 끝 페이지로 이동 --%>
<%-- 	<c:if test="${paging.curPage ne paging.totalPage }"> --%>
<%-- 		<li><a href="/comm/list?curPage=${paging.totalPage }${searchParam }${animalParam }${categoryParam }">끝 &rarr;</a></li>	 --%>
<%-- 	</c:if> --%>
	
	</ul>
	
</div>
