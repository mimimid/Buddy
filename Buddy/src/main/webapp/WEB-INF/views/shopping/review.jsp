<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
$(document).ready(function(){
	
	$(".delete").click(function(){
		console.log("#ajax click")

	
		$.ajax({
			type:"get" //응답메소드방식
			, url:"/shopping/deleteReview" //응답페이지
			, data:{
				reviewno: $("#reviewNo").val(),
				productno: $("#productNo").val(),
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


<style type="text/css">
#reviewNick{
	width: 20%;
	text-align: center;
}

#reviewContent{
	width: 60%;
}

#reviewDate{
	width: 20%;
}
#reviewHead{
	background-color: #FF7A85; 
 	color: white;
 	text-align: center;
}
</style>


<table class="table table-bordered">
<tr>
	<td colspan="4" id="review">상품 리뷰</td>
</tr>
<tr id="reviewHead">
	<td>닉네임</td>
	<td>리뷰 내용</td>
	<td>작성일</td>
</tr>
<c:forEach items="${review }" var="review">
		<c:choose>
			<c:when test="${!empty review }">
				<tr>
					<td id="reviewNick">${review.usernick }</td>
					<td id="reviewContent">
						${review.reviewcontent }
						<c:if test="${userno eq review.userno}">
						<a class="delete" style="float: right;">삭제</a>
						<input type="hidden" id="reviewNo" value="${review.reviewno }">
						<input type="hidden" id="productNo" value="${review.productno }">
						</c:if>
					</td>
					<td id="reviewDate">
						<fmt:formatDate value="${review.insertdate }" pattern="yyyy-MM-dd"/>
					</td>
				</tr>
			</c:when>
		</c:choose>
	</c:forEach>
	
</table>