<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="../layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function(){
	
	$("#amount").ready(function(){
		var total = ${product.price } * $("#amount").val()
		
		$("#totalPrice").text(total+" 원")
	})
	
	$("#amount").change(function(){
		var total = ${product.price } * $("#amount").val()
		
		console.log(total)
		
		$("#totalPrice").text(total+" 원")
	})
})
</script>


<style type="text/css">
 img{
 	height: 100px;
 	width: 100px;
 }
</style>

<div class="container">
<h1 style="text-align: center;">Product</h1>
<hr>


<table class="table">
	<tr>
		<td rowspan="5"><img alt="임시" src="<%=request.getContextPath() %>/upload/${product.pimgstored }"></td>
		<th colspan="2">${product.productname }</th>
	</tr>
	<tr>
		<td>카테고리 : </td>
		<td>
			<c:choose>
				<c:when test="${product.kind eq 'cat' }">
					고양이
				</c:when>
				<c:when test="${product.kind eq 'dog' }">
					강아지
				</c:when>
			</c:choose> 
			/ ${product.category }
		</td>
	</tr>
	<tr>
		<td>가격 : </td>
		<td><fmt:formatNumber value="${product.price }" pattern="###,###.###원"/></td>
	</tr>
	<tr>
		<td>수량 : </td>
		<td><input type="number" value="1" id="amount" name="amount"></td>
	</tr>
	<tr>
		<td>총 상품 금액 : </td>
		<td><div id="totalPrice" name="totalPrice"></div></td>
	</tr>
	<tr>
		<td colspan="3"></td>
	</tr>
	<tr>
		<td colspan="3" style="text-align: center;">상품 정보</td>
	</tr>
	<tr>
		<td colspan="3">${product.content }</td>
	</tr>
</table>

</div>




<c:import url="../layout/footer.jsp" />