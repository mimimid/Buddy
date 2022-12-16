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

<!-- 댓글 -->
<script type="text/javascript">
$(document).ready(function(){
	
	$("#btnReply").click(function() {
		console.log("#btnReply 클릭")
		
		if( $("#comment").val() == "" ) {
				alert('댓글을 입력해주세요!')
 
				$("input").eq(0).focus()
				
			}  else {
				
			var commCmtContent = $("#comment").val() 					
		
			$.ajax({
				type: "post"
				, url: "/comm/cmtwrite"	
				, data: { "commCmtContent": commCmtContent, "commNo": ${viewBoard.commNo } }
				, dataType: "html"
				, success: function( data ) {
					$("#listReply").html( data )
					$("#comment").val("")					
				}
				, error: function() {
					console.log("AJAX 실패")
				}
			})
		}		
	}) 		
	
})
</script>

<script type="text/javascript">
$(document).ready(function(){
		
	    $.ajax({
	    	
	        type: "get" 
	        , url: "/comm/cmtlist"
			, data:  { "commNo": ${viewBoard.commNo } }
			, dataType: "html"
	        , success: function( result ){ 
	            $("#listReply").html( result )
	        }
	    })
 
})
</script>

<style type="text/css">
table {
	table-layout: fixed;
}
</style>

<div class="container">

<h1>커뮤니티 상세보기</h1>
<hr>

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
	<td class="info">댓글</td><td colspan="2">${viewBoard.commCmtCnt }</td>
	<td class="info">좋아요</td><td colspan="2">${viewBoard.commLikeCnt }</td>
</tr>
</table>

<a href="/comm/download?commFileNo=${commFile.commFileNo }">${commFile.commFileOriginname }</a>

<div class="text-center">
	<button id="btnList" class="btn btn-default">목록</button>
	
	<c:if test="${userno eq viewBoard.userno }">
		<button id="btnUpdate" class="btn btn-primary">수정</button>
		<button id="btnDelete" class="btn btn-danger">삭제</button>
	</c:if>
</div>

<div class="form-grop">
	<textarea class="form-control" id="comment" style="resize: none; margin-right: 12px;" cols="80" placeholder="댓글을 작성해주세요"></textarea>
	<button class="btn" type="button" id="btnReply" style="background-color:#104138; color: white;">댓글쓰기</button>
</div>

<div id="listReply"></div>

</div><!-- .container end -->

<c:import url="../layout/footer.jsp" />
