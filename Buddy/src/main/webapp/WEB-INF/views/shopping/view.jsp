<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="../layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function(){
	
	$("#amount").ready(function(){
		var total = ${product.price } * $("#amount").val()
		
		var result = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		$("#totalPrice").text(result+"원")
	})
	
	$("#amount").change(function(){
		var total = ${product.price } * $("#amount").val()
		var result = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		
		
		$("#totalPrice").text(result+"원")
	})
})
</script>


<script type="text/javascript"> 
$(document).ready(function(){
	
	$.ajax({
		type:"get" //응답메소드방식
		, url:"/shopping/review" //응답페이지
		, data:{
			productno: $("#productno").val()
		} //보낼 데이터
		, dataType:"html" //응답 타입
		,success: function(data){ 
			console.log("AJAX 성공") 
			
			$("#result").html(data)
			
		}
		, error:function(){
			console.log("AJAX 실패")
		}
	})
	
	
	
	$("#btnReview").click(function(){
		console.log("#ajax click")

	
	$.ajax({
		type:"post" //응답메소드방식
		, url:"/shopping/review" //응답페이지
		, data:{
			reviewcontent: $("#reviewcontent").val(),
			productno: $("#productno").val(),
			userno: $("#userno").val()
		} //보낼 데이터
		,success: function(data){ 
			console.log("AJAX 성공") 
			
			location.reload();
			
		}
		, error:function(){
			console.log("AJAX 실패")
		}
	})
})
	
})

 </script>
 
 
 
 <script type="text/javascript">
 $(document).ready(function(){
	 $('#btnOrder').click(function(){
		 
		var amount = $('#amount').val();
		var price = $('#price').val();
		var productno = $('#productno').val();
		var userno = $('#userno').val();
		 
		 location.href = 'order?productno='+productno+'&price='+price+'&amount='+amount+'&userno='+userno;
	 })
	 
 })
 
 </script>


<style type="text/css">
 #productImg{
 	height: auto;
 	width: 100%;
 }
 
 
 table, th, td{
 	font-weight: bold;
 }
 
 #btnOrder{
 	width:100; 
 	color: white; 
 	background-color: #FF7A85;
 }
 #productInfo{
 	text-align: center; 
 	background-color: #FF7A85; 
 	color: white;
 }
 
 #reviewcontent{
  
 	height: 80px;
 }
 
 #review{
 	text-align: center;
 	background-color: #FF7A85; 
 	color: white;
 	
 }
 #btnReview{
 	float: right;
 	background-color: #FF7A85; 
 	color: white;
 }
 
 #deleteBtn{
 	background-color: #FF7A85; 
 	color: white;
 }
#addcart{
	background-color: #FF7A85; 
 	color: white;
}
</style>

<div class="container">
<h1 style="text-align: center;">Product</h1>

<table class="table table-bordered">
	<tr>
		<td rowspan="6" colspan="2" style="width: 150px;"><img alt="임시" src="<%=request.getContextPath() %>/upload/${product.pimgstored }" id="productImg"></td>
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
		<td ><fmt:formatNumber value="${product.price }" pattern="###,###.###원" /></td>
	</tr>
	<tr>
		<td>수량 : </td>
		<td><input type="number" value="1" id="amount" name="amount" min="1"></td>
	</tr>
	<tr>
		<td>총 상품 금액 : </td>
		<td><div id="totalPrice" name="totalPrice"></div></td>
	</tr>
	<tr>
		<td colspan="2" style="text-align: center; ">
			<button type="button" class="btn" id="btnOrder" >주문하기</button>
<!-- 			<button type="button" class="btn" id="addcart">장바구니</button> -->
			<c:if test="${userno eq 1 }">
			<a href="./delete?productno=${product.productno }"><button type="button" class="btn" id="deleteBtn">상품삭제</button></a>
			</c:if>
		</td>
	</tr>
	<tr>
		<td colspan="4"><div></div></td>
	</tr>
	<tr>
		<td colspan="4" id="productInfo">상품 정보</td>
	</tr>
	<tr>
		<td colspan="4" style="height: 300px;">${product.content }</td>
	</tr>
	
</table>
	<input type="hidden" id="productno" value="${product.productno }">
	<input type="hidden" id="price" value="${product.price }">
	<input type="hidden" id="price" value="${userno }">

<div id="result"></div>
<table class="table">
	<tr>
		<td>
			
			<input type="text" name="reviewcontent"  id="reviewcontent" placeholder="리뷰를 작성해주세요." class="form-control">
			<input type="hidden" value="${product.productno }" id="productno" name="productno">
			<input type="hidden" value="${userno }" id="userno" name="userno">
			<button id="btnReview" class="btn">리뷰 등록</button>
			
		</td>
	</tr>
</table>

</div>




<c:import url="../layout/footer.jsp" />