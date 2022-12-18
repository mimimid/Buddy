<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
 
$(document).ready(function() {
	
	$("#rereplyWriteBtn").click(function() {
		$("#rereplyWriteBtn").css("display", "none")
		$("#rereplyWrite").css("display", "")
	})
	
	$("#btnReplyCancel").click(function() {
		$("#rereplyWriteBtn").css("display", "")
		$("#rereplyWrite").css("display", "none")		
	})
	
	$("#btnReReply").click(function() {
				
		if( $("#recomment").val() == "" ) {
			
			alert('댓글을 입력해주세요!')
			$("#recomment").focus()
			
		} else if ( ${empty login } ) {
			
			alert('로그인이 필요합니다!')
			$("#recomment").focus()			
			
		} else {
			
			$("form").submit();
			
		}
		
	})
	
})
</script>

<style type="text/css">
tr {
	border: 1px solid #ccc;
}
</style>

<table class="table">
<c:forEach items="${cmtList }" var="cmtList">

<tr>
	<td rowspan="4"><span style="background-color:#fad703">${cmtList.commCmtWriterNick }</span></td>
</tr>

<tr class="replyContextBox" >
	<td><fmt:formatDate value="${cmtList.commCmtWritedate }" pattern="yy-MM-dd HH:mm:ss"/></td>
	<td> 
	<c:if test="${userno eq cmtList.userno }">
		<a class="cmtUpdate" style="color: #d9534f" href="/comm/cmtupdate?commCmtNo=${cmtList.commCmtNo }&commNo=${cmtList.commNo }">수정</a>
		| <a class="cmtDelete" style="color: red" href="/comm/cmtdelete?commCmtNo=${cmtList.commCmtNo }&commNo=${cmtList.commNo }">삭제</a>
	</c:if>
	</td>
</tr>

<tr class="replyContextBox">
	<td  colspan="4">${cmtList.commCmtContent }<br>댓번 : ${cmtList.commCmtNo }&nbsp;번들: ${cmtList.commCmtBundle }</td>
</tr>

<tr class="replyContextBox" >
	<td colspan="4">
	<input type="hidden" value="${cmtList.commCmtNo }">
	<button type="button" id="rereplyWriteBtn" onclick="rereplyWrite(${cmtList.commCmtNo })" >답글</button>
	
	<div class="reply"></div>
	
	<div id="rereplyWrite" style="display: none">
		<form action="./cmtwrite" method="post">
		<div class="form-grop">
			<input type="hidden" name="commNo" value="${cmtList.commNo }">
			<input type="hidden" name="commCmtBundle" value="${cmtList.commCmtBundle }">
			<textarea class="form-control" id="recomment" name="commCmtContent" style="resize: none; margin-right: 12px;" cols="80" placeholder="댓글을 작성해주세요"></textarea>
			<button type="button" id="btnReReply" style="background-color:#104138; color: white;">댓글쓰기</button>
			<button type="button" id="btnReplyCancel" style="background-color:#104138; color: white;">취소</button>
		</div>
		</form>
	</div>
	
	</td>
</tr>

<tr class="replyupdateBox" style="display: none;">
	<td><input type="text" value="${cmtList.commCmtContent }"></td>
	<td><button id="updateWriteBtn${cmtList.commCmtNo }" onclick="replyUpdate(${cmtList.commCmtNo })">수정</button></td>
	<td><button id="updateCancleBtn">취소</button></td>
</tr>

</c:forEach>
</table>
