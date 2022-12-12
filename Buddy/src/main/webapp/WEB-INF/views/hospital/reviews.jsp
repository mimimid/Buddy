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

<script type="text/javascript">
$(document).ready(function() { 
	
	$(".reviewdel").click(function() {
		$("#listReview").load( $(this).attr("href") )
		return false; 
	})
	
	$(".reviewSort").click(function() {
		$("#listReview").load( $(this).attr("href") )
		return false; 
	})
	
	
	
})
</script>



<style type="text/css">


.flexdiv {
display: flex;
    overflow-x: auto;

}

.reviewList {border-bottom: 1px solid #ccc}

.hospReviewContent {padding-left: 41px;}


.staricon {font-size: 15px; /* 이모지 크기 */ }
.staricongrey {font-size: 15px; /* 이모지 크기 */ 
				color: transparent; /* 기존 이모지 컬러 제거 */ 
				text-shadow: 0 0 0 #e6e5e5; /* 새 이모지 색상 부여 */}


</style>

<div class="reviewSort">
	<a class="reviewSort" href="/hospital/hospview?hospNo=${param.hospNo }">최신순</a>
	<a class="reviewSort" href="/hospital/hospview?hospNo=${param.hospNo }&sort=1">좋아요순</a>
</div>
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
			<div>
			<c:forEach begin="1" end="${reviewList.hospStarrating }" step="1">
				<span class="staricon">⭐</span>
			</c:forEach>
			<c:forEach begin="1" end="${5-reviewList.hospStarrating }" step="1">
					<span class="staricongrey">⭐</span>
			</c:forEach>
			</div>
		</div>
	</div>
	
	<div class="hospReviewContent">
	${reviewList.hospReviewContent 	 }
	</div>
	<div>
		<div>
   		<c:set var="check" value="0"/>
	
		<c:forEach var="rlike" items="${ reviewLikeList }">
			<c:if test="${ userno eq rlike.userno && reviewList.hospReviewNo eq rlike.hospReviewNo }">
<%-- 				<img id="cancelRLike" class="likeBtn${ r.rid }" src="../resources/images/feed/likeblack-icon.png" onclick="insertRLike(${r.rid})"> --%>				
					<a><span class="glyphicon glyphicon-heart" aria-hidden="true" 
						id="reviewlikeicon${reviewList.hospReviewNo }"
						onclick="insertRLike(${reviewList.hospReviewNo })"></span></a>
						
				<c:set var="check" value="1"/>
			</c:if>
		</c:forEach>
		
		<c:if test="${ check eq 0 }">
			<%-- <img id="insertRLike" class="likeBtn${ r.rid }" src="../resources/images/feed/like-icon.png" onclick="insertRLike(${r.rid})"> --%>
			<a><span class="glyphicon glyphicon-heart-empty" aria-hidden="true" 
						id="reviewlikeicon${reviewList.hospReviewNo }"
						onclick="insertRLike(${reviewList.hospReviewNo })"></span></a>
		</c:if>                                  
		<span id="likeRCount${reviewList.hospReviewNo }">${ reviewList.hospReviewLikecnt }</span>
   		
   		
   		
   		
		</div>
		<p><a class="reviewdel" style="color: red" href="/hospital/reviewdelete?hospReviewNo=${reviewList.hospReviewNo }&hospNo=${reviewList.hospNo }">삭제</a></p>
	</div>
</div>
</c:forEach>

 
<script type="text/javascript">

function insertRLike(no){
		console.log("클릭")
    	// var data;
    	 var hospNo = ${param.hospNo}
    	 var hospReviewNo = no
    	 var iconid = '#reviewlikeicon'+hospReviewNo
    	 console.log(hospNo,hospReviewNo,iconid)
    	 
    	 if($(iconid).attr('class') == "glyphicon glyphicon-heart-empty"){
  	 
    		 $.ajax({
					type :"POST"
					, url : '<c:url value ="/hospital/review/likeup"/>'
					, data : {"hospNo" : hospNo, "hospReviewNo" : hospReviewNo}		
					,success : function(data) {
						$(iconid).attr('class', 'glyphicon glyphicon-heart');
						likeRCount(hospReviewNo)
					}
					, error: function() {
						console.log("실패")
					}
				})   		  
    	 } else{
    		 
    		 $.ajax({
					type :"POST"
					, url : '<c:url value ="/hospital/review/likedown"/>'
					,data : {"hospNo" : hospNo, "hospReviewNo" : hospReviewNo}	
					,success : function(data) {
						$(iconid).attr('class', 'glyphicon glyphicon-heart-empty');
						likeRCount(hospReviewNo)
					}, error: function() {
						console.log("취소 실패")
					}
				})    		     		 
    	 }
    	 
 	    // callAjaxWish(url, data, img, rid);
}
     
  
function likeRCount(hospReviewNo){
 		
	var hospReviewNo = hospReviewNo;
	
	$.ajax({
		type : "POST"
		,url: '<c:url value ="/hospital/reviews/likeCnt"/>'
		,data : JSON.stringify ({"hospReviewNo" : hospReviewNo})
		,dataType : "json"
		,contentType: 'application/json'
		,success : function(data){
			console.log(data.rlcnt);
			
			document.getElementById("likeRCount"+hospReviewNo).innerHTML = data.rlcnt;
			
		}
		, error : function(e){
			alert("카운트 실패");
		}
		
	}); 
	
}

</script>  




