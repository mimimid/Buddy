<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>





<style type="text/css">
#userNick{
	font-size: 20px;
	font-weight: bold;

}
#reviewOutline{
	border-top: 1px solid #FF7A85;
	margin: 10px;
	padding: 10px;
}
#con{
	font-size: 18px;
}
#reviewList{
	font-weight: bold;
	font-size: 20px;
}

</style>


<div id="container">
<div id="reviewList">&nbsp;&nbsp;Review list</div>

<c:forEach items="${review }" var="review">
	<c:choose>
		<c:when test="${!empty review }">
			<div id="reviewOutline">
				<div id="reivewfirst">
<%-- 					<img alt="임시" src="<%=request.getContextPath() %>/upload/${img }"> --%>
					<span id="userNick">${review.usernick }</span>
					<c:if test="${userno eq review.userno}">
						<span>
<!-- 							<a class="update" style="float: right;">수정</a> -->
							<a href="./deleteReview?reviewno=${review.reviewno }&productno=${review.productno}" style="float: right;">삭제&nbsp;</a>
						</span>
					</c:if>
				</div>
				<div>
					<span id="con">
						${review.reviewcontent }
<!-- 						<input type="hidden" id="updateContent" class="updateContent" placeholder="수정할 리뷰를 작성해 주세요."> -->
					</span>
					<span style="float: right;"><fmt:formatDate value="${review.insertdate }" pattern="yyyy-MM-dd"/></span>
				</div>
					
			</div>
		</c:when>
	</c:choose>
</c:forEach>
	
</div>