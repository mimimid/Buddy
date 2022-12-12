<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:choose>
	<c:when test="${chresult }">
		<p style="color: red;">중복 아이디가 존재합니다</p>
	</c:when>
	<c:otherwise>
		<p style="color: blue;">사용가능한 아이디 입니다.</p>
<!-- 		<input type="hidden" id="checkedId" name="checkedId" value="checked"> -->
	</c:otherwise>
</c:choose> 