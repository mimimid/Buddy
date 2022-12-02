<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${empty id }">
		<p style="color: red;">아이디가 존재하지 않습니다</p>
	</c:when>
	<c:otherwise>
		<p style="color: blue;">아이디는 "${id }" 입니다.</p>
	</c:otherwise>
</c:choose>