<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	$("#btnList").click(function() {
		location.href = "/comm/list"
	})
	
	$("#btnUpdate").click(function() {
		location.href = "/comm/update?commNo=${viewBoard.commNo }"
	})
	
	$("#btnDelete").click(function() {
		location.href = "/comm/delete?commNo=${viewBoard.commNo }"
	})
})
</script>

<!-- 좋아요 -->
<script type="text/javascript">
$(document).ready(function() {
	
	if( ${empty login } ) {
		
		$("#likeicon").attr("class", "glyphicon glyphicon-heart-empty")
		
		$(".btn-heart").click(function() {
			alert('로그인이 필요합니다')
			location.href = "/user/login"
		})
		
	} else {
		
		var likeval = ${like }
		
		if( likeval == 0 ) {
			$("#likeicon").attr("class", "glyphicon glyphicon-heart-empty")
		}
		
		$(".btn-heart").click(function() {
			
			if( likeval > 0 ) {
				
				$.ajax({
					type: "post"
					, url: "/comm/likedown"
					, data: { "commNo": ${viewBoard.commNo } }
					, dataType: "html"
					, success: function(res) {
						console.log("AJAX 성공")
						
						console.log(res)
						
						$("#likeicon").attr("class", "glyphicon glyphicon-heart-empty")
						likeval = 0
						
// 						likecnt();
						location.reload();
						
						console.log(likeval)
						
					}
					, error: function() {
						console.log("AJAX 실패")
					}
				})
				
			} else {
				
				$.ajax({
					type: "post"
					, url: "/comm/likeup"
					, data: { "commNo": ${viewBoard.commNo } }
					, dataType: "html"
					, success: function(res) {
						console.log("AJAX 성공")
						
						$("#likeicon").attr("class", "glyphicon glyphicon-heart")
						likeval = 1
						
// 						likecnt();
						location.reload();
						
						console.log(likeval)
						
					}
					, error: function() {
						console.log("AJAX 실패")
					}
				})
				
			}
			
		})
		
	}
	
})
</script>

<!-- 신고하기 -->
<script type="text/javascript">
$(document).ready(function(){
	
	$("#btnReport").click(function() {
		
		$.ajax({
			type: "post"
			, url: "/comm/report"
			, data: { "commNo": "${viewBoard.commNo }" }
			, dataType: "html"
			, success: function(res) {
				console.log("AJAX 성공")
				
				window.open("./report")
				
			}
			, error: function() {
				console.log("AJAX 실패")
			}
		})
		
	})
		
})
</script>

<!-- 댓글 -->
<script type="text/javascript">
$(document).ready(function(){
	
	$("#btnReply").click(function() {
				
		if( $("#comment").val() == "" ) {
			
			alert('댓글을 입력해주세요!')
			$("#comment").focus()
			
		} else if ( ${empty login } ) {
			
			alert('로그인이 필요합니다!')
			$("#comment").focus()			
			
		} else {
			
			$("form").submit();
			
		}
		
	})
	
	$.ajax({
	    	
		type: "get" 
		, url: "/comm/cmtlist"
		, data:  { "commNo": ${viewBoard.commNo } }
		, dataType: "html"
		, success: function(res){ 
			$("#listReply").html( res )
		}
		, error: function() {
			console.log("AJAX 실패")
		}
	})
	
})
</script>


<style type="text/css">
table {
	table-layout: fixed;
}

img{
	height: 100px;
	width: 100px;
}
</style>

<div class="container">

<table class="table table-bordered">
<tr>
	<td class="info">제목</td><td colspan="5">${viewBoard.commTitle }</td>
</tr>
<tr>
	<td class="info">닉네임</td><td>${viewBoard.commWriterNick }</td>
	<td class="info">작성일</td><td><fmt:formatDate value="${viewBoard.commWritedate }" pattern="yy-MM-dd HH:mm:ss" /></td>
	<td class="info">조회수</td><td>${viewBoard.commHit }</td>
</tr>
<tr>
	<td class="info" colspan="6">본문</td>
</tr>
<tr>
	<td colspan="6">${viewBoard.commContent }</td>
</tr>

<tr>
	<td class="info">첨부파일</td>
	<td>
		<img alt="preview" src="<%=request.getContextPath() %>/upload/${commFile.commFileStoredname }">
	</td>
	<td>
		<a href="/comm/download?commFileNo=${commFile.commFileNo }">${commFile.commFileOriginname }</a>
	</td>
</tr>
	
<tr>
	<td class="info">댓글</td><td>${viewBoard.commCmtCnt }</td>
	<td class="info">좋아요</td>
	<td>
		<a class="btn btn-heart">
			<span class="glyphicon glyphicon-heart" aria-hidden="true" id="likeicon"></span>
		</a>
		<a id="likecnt">${viewBoard.commLikeCnt }</a>
	</td>
</tr>

</table>

<div class="clearfix"></div>

<form action="./cmtwrite" method="post">
	<div class="form-grop">
		<input type="hidden" name="commNo" value="${viewBoard.commNo }">
		<textarea class="form-control" id="comment" name="commCmtContent" style="resize: none; margin-right: 12px;" cols="80" placeholder="댓글을 작성해주세요"></textarea>
		<button type="button" id="btnReply" style="background-color:#104138; color: white;">댓글쓰기</button>
	</div>
</form>

<br>

<div id="listReply"></div>

<div class="text-center">
	<button id="btnList" class="btn btn-default">목록</button>
	<button id="btnReport" class="btn btn-danger">신고</button>
	
	<c:if test="${userno eq viewBoard.userno }">
		<button id="btnUpdate" class="btn btn-primary">수정</button>
		<button id="btnDelete" class="btn btn-danger">삭제</button>
	</c:if>
</div>

<br>

</div><!-- .container end -->

<c:import url="../layout/footer.jsp" />
