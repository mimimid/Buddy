<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="text-center">
	<ul class="pagination pagination-sm">
	
	<%-- 이전 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.startPage ne 1 }">
		<li><a href="/date/view?dateNo=${viewDate.dateNo }&curPage=${paging.startPage - paging.pageCount }"><i class="fi fi-br-angle-double-left"></i></a></li>
	</c:when>
	<c:when test="${paging.startPage eq 1 }">
		<li class="disabled"><a><i class="fi fi-br-angle-double-left"></i></a></li>
	</c:when>
	</c:choose>
	
	<%-- 이전 페이지로 가기 --%>
	<c:if test="${paging.curPage > 1 }">
		<li><a href="/date/view?dateNo=${viewDate.dateNo }&curPage=${paging.curPage - 1 }"><i class="fi fi-br-angle-left"></i></a></li>
	</c:if>
	
	
	
	<%-- 페이징 리스트 --%>
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
	<c:if test="${paging.curPage eq i }">
		<li class="active juaFont"><a href="/date/view?dateNo=${viewDate.dateNo }&curPage=${i }">${i }</a></li>
	</c:if>
	<c:if test="${paging.curPage ne i }">
		<li class="juaFont"><a href="/date/view?dateNo=${viewDate.dateNo }&curPage=${i }">${i }</a></li>
	</c:if>
	</c:forEach>

	
	
	<%-- 다음 페이지로 가기 --%>
	<c:if test="${paging.curPage < paging.totalPage }">
		<li><a href="/date/view?dateNo=${viewDate.dateNo }&curPage=${paging.curPage + 1 }"><i class="fi fi-br-angle-right"></i></a></li>
	</c:if>
	
	<%-- 다음 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.endPage ne paging.totalPage }">
		<li><a href="/date/view?dateNo=${viewDate.dateNo }&curPage=${paging.startPage + paging.pageCount }"><i class="fi fi-br-angle-double-right"></i></a></li>
	</c:when>
	<c:when test="${paging.endPage eq paging.totalPage }">
		<li class="disabled"><a><i class="fi fi-br-angle-double-right"></i></a></li>
	</c:when>
	</c:choose>

	</ul>
</div>