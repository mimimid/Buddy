<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
	margin: 10px;
}

img{
	height: 150px;
	width: 150px;
}
</style>

<div class="container">
<img src="/resources/img/main/slider01.png" alt="slide01" style="width:100%; height: 400px;">


<table>
<c:forEach items="${list }" var="product" begin="0" end="4">
	<tr>
		<td><a href="/shopping/view?productno=${product.productno }"><img alt="임시" src="<%=request.getContextPath() %>/upload/${product.pimgstored }"></a></td>
		<th><a href="/shopping/view?productno=${product.productno }">${product.productname }</a></th>
		<td style="color: red;">(${product.reviewcount })</td>
		<td><fmt:formatNumber value="${product.price }" pattern="###,###.###원"/></td>
	</tr>
</c:forEach>
</table>
<table>
<c:forEach items="${list }" var="product" begin="5" end="10">
	<tr>
		<td><a href="/shopping/view?productno=${product.productno }"><img alt="임시" src="<%=request.getContextPath() %>/upload/${product.pimgstored }"></a></td>
		<th><a href="/shopping/view?productno=${product.productno }">${product.productname }</a></th>
		<td style="color: red;">(${product.reviewcount })</td>
		<td><fmt:formatNumber value="${product.price }" pattern="###,###.###원"/></td>
	</tr>
</c:forEach>
</table>
<div>
<c:if test="${grade eq '관리자' }">
<a href="./input" style="float: right;" ><button type="button" class="btn btn-success">상품 입력</button></a>
</c:if>
</div>

<c:import url="/WEB-INF/views/layout/shopPaging.jsp" />
</div>

<c:import url="../layout/footer.jsp" />
