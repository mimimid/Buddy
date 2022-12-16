<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
 
$(document).ready(function() {
	
	$(".cmtdel").click(function() {
		console.log("댓글 삭제 클릭")
		
		$("#listReply").load( $(this).attr("href") )	

		return false; 
	})
 	
	function rereplyWrite(reNum){
		console.log(reNum)
		
		var btnid = '#rereplyWriteBtn'+ reNum
		console.log(btnid)
		
		$(btnid).hide();
		
		var commCmtBundle = $(btnid).prev().val();
		console.log("모댓글 번호" + commCmtBundle);
		
		var html = '';
		
		html += '<div class="form-inline replyWriteBox">';
		html += '	<textarea class="form-control" id="recmtcomment" style="resize: none;" cols="50" placeholder="댓글을 작성해주세요"></textarea>';
		html += '	<button class="btn" type="button" id="btnrereplySend" style="background-color:#104138; color:white;">댓글쓰기</button>';
		html += '	<button class="btn" type="button" id="btnrereplyCancle" >취소</button>';
		html += '</div>';
		
		$(btnid).after(html);
		
		$("#btnrereplyCancle").click(function() {
			$(".replyWriteBox").hide();
			$(btnid).show();
			
		})
		
		$("#btnrereplySend").click(function() {
	 		
	 		if( $("#recmtcomment").val() == "" ) {
				alert('댓글을 입력해주세요!');

				$("input").eq(0).focus();
				
			}  else {
				
				var commCmtContent = $("#recmtcomment").val(); 
				var commNo = ${param.commNo };
				
				
				var param={ "commCmtContent": commCmtContent, "commNo": commNo, "commCmtBundle": commCmtBundle};
			
				$.ajax({
					type: "post"	//요청 메소드
					, url: "/comm/cmtwrite"	//요청 URL
					, data: param
					, dataType: "html"	
					, success: function( data ) {
						console.log("AJAX 성공")
						
						$("#listReply").html( data )
					//	$("#listReply").load( $(this).attr("href") )
						
					}
					, error: function() {
						console.log("AJAX 실패")
					}
				})
			}	//else 끝	
	 		
	 		
		}) 	
		
	}				
	
})
</script>

<style type="text/css">
tr {
	border: 1px solid #ccc;
}
</style>

<table class="table">
<c:forEach items="${cmtList }" var="cmtList" varStatus="status">

<tr>
	<td rowspan="4"><span style="background-color:#fad703">${cmtList.commCmtWriterNick }</span></td>
</tr>
<tr class="replyContextBox" >
	<td><fmt:formatDate value="${cmtList.commCmtWritedate }" pattern="yy-MM-dd HH:mm:ss"/></td>
	<td> 
	<a class="cmtUpdate" style="color: #d9534f" href="#">수정</a>
	| <a class="cmtdel" style="color: red" href="/comm/cmtdelete?commCmtNo=${cmtList.commCmtNo }&hbno=${cmtList.commNo }">삭제</a>
	</td>
</tr>
<tr class="replyContextBox">
	<td  colspan="4">${cmtList.commCmtContent }<br>댓번 : ${cmtList.commCmtNo }&nbsp;번들: ${cmtList.commCmtBundle }</td>
</tr>
<tr class="replyContextBox" >
	<td  colspan="4">
	<input type="hidden" value="${cmtList.commCmtNo }">
	<button type="button"  id="rereplyWriteBtn${cmtList.commCmtNo }" onclick="rereplyWrite(${cmtList.commCmtNo })" >답글</button>
	</td>
</tr>
<tr class="replyupdateBox" style="display: none;">
	<td><input type="text" value="${cmtList.commCmtContent }"></td>
	<td><button id="updateWriteBtn${cmtList.commCmtNo }" onclick="replyUpdate(${cmtList.commCmtNo })">수정</button></td>
	<td><button id="updateCancleBtn">취소</button></td>
</tr>
</c:forEach>
</table>

