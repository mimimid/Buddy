<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp" />



<style>
table{
	width: 1000px;
	margin: 0 auto;
}



tr { 
	display: block; 
	float: left; 
	width: 200px;
	height: 300px;
}
th, td { 
	display: block; 
}
</style>

<div class="container">
<h1 style="text-align: center;">Shopping</h1> 
<a href="../user/logout"><button>임시 로그아웃</button></a>
<c:if test="${grade eq '관리자' }">
<a href="./input" style="float: right;" ><button type="button" class="btn btn-success">상품 입력</button></a>
</c:if>
<hr>

<table>
<c:forEach items="${list }" var="product" begin="0" end="4">
	<tr>
		<td><img alt="" src="<%=request.getContextPath() %>/upload/${product.pimgstored }"></td>
		<td>${product.productname }</td>
		<td style="color: red;">(${product.reviewcount })</td>
		<td>${product.price }</td>
	</tr>
</c:forEach>
</table>
<table>
<c:forEach items="${list }" var="product" begin="5" end="10">
	<tr>
		<td><img alt="" src="<%=request.getContextPath() %>/upload/${product.pimgstored }"></td>
		<td>${product.productname }</td>
		<td style="color: red;">(${product.reviewcount })</td>
		<td>${product.price }</td>
	</tr>
</c:forEach>
</table>

<c:import url="/WEB-INF/views/layout/shopPaging.jsp" />
</div>

<c:import url="../layout/footer.jsp" />