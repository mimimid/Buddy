<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:choose>
	<c:when test="${chresult }">
		<p style="color: red;">아이디가 존재합니다</p>
	</c:when>
	<c:otherwise>
		<p style="color: blue;">아이디가 없습니다.</p>
	</c:otherwise>
</c:choose>