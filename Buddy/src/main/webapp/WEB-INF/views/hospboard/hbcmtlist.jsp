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
		
		var hbCmtBundle = $(btnid).prev().val();
		console.log("모댓글 번호"+hbCmtBundle);
		
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
				
				var hbCmtContent = $("#recmtcomment").val(); 
				var hbno = ${param.hbno };
				//var hbCmtBundle = hbCmtBundle;
				
				
				var param={ "hbCmtContent": hbCmtContent, "hbno": hbno, "hbCmtBundle": hbCmtBundle};
			
				$.ajax({
					type: "post"	//요청 메소드
					, url: "/hospboard/hbcmtwrite"	//요청 URL
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


<style>

tr {
	border: 1px solid #ccc;
}
</style>


<div style="width: 800px;" >
<table class="table">
<c:forEach items="${cmtList }" var="cmtList" varStatus="status">
	
	<tr>
		<td rowspan="4"><span style="background-color:#fad703">${cmtList.userid }</span></td>
	</tr>
	<tr class="replyContextBox" >
		<td><fmt:formatDate value="${cmtList.hbCmtWritedate }" pattern="yy-MM-dd HH:mm:ss"/></td>
		<td> 
		<a class="cmtUpdate"  style="color: #d9534f"href=#>수정</a>
		| <a class="cmtdel" style="color: red" href="/hospboard/hbcmtdelete?hbCmtNo=${cmtList.hbCmtNo }&hbno=${cmtList.hbno }">삭제</a>
		</td>
	</tr>
	<tr class="replyContextBox">
		<td  colspan="4">${cmtList.hbCmtContent }<br>댓번 : ${cmtList.hbCmtNo }&nbsp;번들: ${cmtList.hbCmtBundle }</td>
	</tr>
	<tr class="replyContextBox" >
		<td  colspan="4">
		<input type="hidden" value="${cmtList.hbCmtNo }">
		<button type="button"  id="rereplyWriteBtn${cmtList.hbCmtNo }" onclick="rereplyWrite(${cmtList.hbCmtNo })" >답글</button>
		</td>
	</tr>
	<tr class="replyupdateBox" style="display: none;">
		<td><input type="text" value="${cmtList.hbCmtContent }"></td>
		<td><button id="updateWriteBtn${cmtList.hbCmtNo }" onclick="replyUpdate(${cmtList.hbCmtNo })">수정</button></td>
		<td><button id="updateCancleBtn">취소</button></td>
	</tr>
	
</c:forEach>	
</table>
</div>
<br><br>