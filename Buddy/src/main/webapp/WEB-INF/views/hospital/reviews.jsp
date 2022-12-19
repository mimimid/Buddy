<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<style type="text/css">


.flexdiv {display: flex;  overflow-x: auto;}
.reviewList {border-bottom: 1px solid #ccc}
.hospReviewContent {padding-left: 41px;}
.staricon {font-size: 15px; }
.staricongrey {font-size: 15px;  color: transparent; text-shadow: 0 0 0 #e6e5e5;}


</style>

<br>

<c:forEach items="${reviewList }" var="reviewList" >
<div class="reviewList">
	<div class="flexdiv">
		<div>
		<img style="width: 40px;height: 40px; object-fit: cover;" alt="..." src="https://www.pngmart.com/files/13/Laughter-Emoji-PNG-Image.png" class="img-rounded">
		</div>
		<div >
			<div class="flexdiv">
			<span>${reviewList.usernick }</span>
			<span><fmt:formatDate value="${reviewList.hospReviewWritedate }" pattern="yy-MM-dd HH:mm:ss"/></span>
			<span>${reviewList.animal	 }</span>
			</div>
		</div>
	</div>
	<div class="hospReviewContent">
	${reviewList.hospReviewContent 	 }
	</div>
</div>
</c:forEach>

<script type="text/javascript">
$(document).ready(function() { 
	
	$(".reviewdel").click(function() {
		$("#listReview").load( $(this).attr("href") )
		return false; 
	})
	
	
	
})
</script>



