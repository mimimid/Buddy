<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<script type="text/javascript">
$(document).ready(function() {
	
	
	$("#btnList").click(function() {
		location.href = "/hospboard/hblist"
	})

	
	$("#btnUpdate").click(function() {
		location.href = "/hospboard/hbupdate?hbno=${viewBoard.hbno }"
	})

	
	$("#btnDelete").click(function() {
		var result = confirm("정말 삭제 하시겠습니까?");
		if (result) {
		      location.href = "/hospboard/hbdelete?hbno=${viewBoard.hbno }"
		   }
		   else {
		     return false
		   }
	})
	
 
	
	var likeval = ${like};
	
	let hbno = ${viewBoard.hbno};
		
	if( likeval == 0 ){
		$('#likeicon').attr('class', 'glyphicon glyphicon-heart-empty');
	}
		
		$('.heartbtn').click(function() {
			
			if( likeval >0 ){
				$.ajax({
					type :"POST"
					, url : '<c:url value ="/hospboard//hbview/likedown"/>'
					, data : {"hbno" : hbno}		
					,success : function(data) {
						$('#likeicon').attr('class', 'glyphicon glyphicon-heart-empty');
						likeval = 0;
					 console.log(likeval);
					}
					, error: function() {
						console.log("좋아요 취소 실패")
					}
				})// 아작스 끝
				
			}else {
				
				$.ajax({
					type :"POST"
					, url : '<c:url value ="/hospboard//hbview/likeup"/>'
					,data : {"hbno" : hbno}		
					,success : function(data) {
						$('#likeicon').attr('class', 'glyphicon glyphicon-heart');
						likeval = 1;
					}, error: function() {
						console.log("좋아요 실패")
					}
				})
				
			}
		})
		
		

})
</script>

</head>
<body>


<div class="container">



<h1>게시글 상세보기</h1>
<hr>

<table class="table table-bordered">

<tr>
	<td class="info">글번호</td><td>${viewBoard.hbno}</td>
	<td class="info">아이디</td><td>${viewBoard.userno}</td>
</tr>
<tr>
	<td class="info">카테고리</td><td>${viewBoard.hbcategory}</td>
	<td class="info">동물</td><td>${viewBoard.animal}</td>

</tr>
<tr>
	<td class="info">조회수</td><td>${viewBoard.hbhit}</td>
	<td class="info">작성일</td><td><fmt:formatDate value="${viewBoard.hbwritedate }" pattern="yy-MM-dd HH:mm:ss"/></td>
</tr>
<tr>
	<td class="info">제목</td><td colspan="3">${viewBoard.hbtitle}</td>
</tr>
<tr>
	<td class="info" colspan="4">본문</td>
</tr>
<tr>
	<td colspan="4">${viewBoard.hbcontent}
	<div>
	<c:if test="${not empty boardFile}">
			<img class="img-responsive center-block"  alt="" src="/upload/${boardFile.hbfilestoredname }" width="600px">
	</c:if>
	</div>
	
	</td>
	
</tr>
<tr>
	<td class="info">좋아요</td>
	<td>${viewBoard.hblike}</td>
	<td><a class="btn btn-outline-dark heartbtn">
	<span class="glyphicon glyphicon-heart" aria-hidden="true" id="likeicon"></span>
    </a></td>

	
</tr>
</table>

<div>
<a href="/hospboard/download?hbfileno=${boardFile.hbfileno }">${boardFile.hbfileoriginname }</a>
</div>


<div class="text-center">
	<button id="btnList" class="btn btn-primary">목록</button>
	
<%-- 	<c:if test="${userno eq viewBoard.userno }"> --%>
		<button id="btnUpdate" class="btn btn-primary">수정</button>
		<button id="btnDelete" class="btn btn-danger">삭제</button>
<%-- 	</c:if> --%>
	
</div>
<br>



<!-- 댓글 부분 -->

<div>



<!-- 댓글 작성 -->
<script type="text/javascript">
$(document).ready(function(){
	
	
	$("#btnReply").click(function() {
		console.log("#btnReply 클릭")
		
		if( $("#cmtcomment").val() == "" ) {
				alert('댓글을 입력해주세요!');
 
				$("input").eq(0).focus()
				
			}  else {
				
			var hbCmtContent = $("#cmtcomment").val(); 
			var hbno = ${viewBoard.hbno}; 						
			var param={ "hbCmtContent": hbCmtContent, "hbno": hbno};
		        //var param="ncmtcomment="+ncmtcomment+"&nno="+nno;
		
			$.ajax({
				type: "post"
				, url: "/hospboard/hbcmtwrite"	
				, data: param
				, dataType: "html"
				, success: function( data ) {
					$("#listReply").html( data )
					$("#cmtcomment").val("")					
				}
				, error: function() {
					console.log("AJAX 실패")
				}
			})
		}		
	}) 		
	
})
</script>


<div class="form-inline">

	<textarea class="form-control" id="cmtcomment" 
		style="resize: none; margin-right: 12px;" cols="80"
		placeholder="댓글을 작성해주세요"></textarea>
	<button class="btn" type="button" id="btnReply" style="background-color:#104138; color: white;">댓글쓰기</button>

</div>
<br>


<script type="text/javascript">
$(document).ready(function(){
		
	    $.ajax({
	    	
	        type: "get" 
	        , url: "/hospboard/hbcmtlist"
			, data:  {"hbno" : ${viewBoard.hbno} }
			, dataType: "html"
	        , success: function(result){ 
	            $("#listReply").html(result);
	        }
	    });
 
})
 
</script>

<div id="listReply"></div>

</div>





</div><!-- .container end --> 

</body>
</html>