<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${empty pw }">
		<p style="color: red;">입력 정보와 일치하는 비밀번호가 존재하지 않습니다.</p>
	</c:when>
	<c:otherwise>
		<p style="color: blue;">비밀번호는 "${pw }" 입니다.</p>
	</c:otherwise>
</c:choose>