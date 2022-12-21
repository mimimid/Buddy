<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 댓글 목록 -->
<c:forEach items="${commList }" var="cm">

<div class="media">
	<div class="media-left media-middle">
		<div class="media-object" style="padding: 5px;">
			<span class="glyphicon glyphicon-user" style="font-size: 40px;"></span>
		</div>
	</div>

	<div class="media-body text-left">
	<input type="hidden" id="cmNo" name="cmNo" value="${cm.cmNo }">
		<h4 class="media-heading">${cm.usernick } <small><fmt:formatDate value="${cm.writeDate }" pattern="yy-MM-dd HH:mm:ss"/></small></h4>
		<div id="cmContent_${cm.cmNo }">${cm.cmContent }</div>
		<div id="btn_${cm.cmNo }">
			<c:if test="${id eq cm.userid }">
				<button class="btn btn-xs edit1" id="${cm.cmNo }" onclick="commUpdate(${cm.cmNo })" style="background: #FF7A85;border: none; color: #fff;">수정</button> /
				<button class="btn btn-xs cmDelete" onclick="commDelete(${cm.cmNo },${cm.dateNo })" id="cmDelete">삭제</button>
			</c:if>
		</div>
	</div>
</div>

</c:forEach><!-- 댓글창 끝 -->

<script type="text/javascript">

//댓글 수정
function commUpdate(cmNo) {
		console.log("수정클릭", cmNo)
		
		var txt = $('#cmContent_'+cmNo).text(); //댓글작성창
		
		$('#cmContent_'+cmNo).html("<textarea style='resize:none;' rows='3' cols='132' name = 'cmContent' id='tt_"+cmNo+"'>"+txt
		+"</textarea>");
		$('#btn_'+cmNo).html(
			"<input type='button' value='수정하기' style='background: #FF7A85;border: none; color: #fff;' onclick='up("+cmNo+")'> "
	 		  +"<input type='button' value='취소' style='background: #ed2e3e;border: none; color: #fff;' onclick='lst()'>");
		
}

//댓글 수정
function up(cmNo) {
	var cmContent = $('#tt_'+cmNo).val();
	
	$.ajax({
		type: "post"
		, url: "${path}/date/commUpdate?cmNo=" + cmNo
		, data: {
			"cmNo" : cmNo,
			"cmContent" : cmContent	
		}
		, success: function(result) {
			console.log("AJAX 성공")
			alert("댓글을 수정하였습니다.")
			cmList();
		}
		, error: function() {
			console.log("AJAX 실패")
			alert("수정 실패하였습니다.")
		}
	})
	
}

function lst() {
	console.log("취소클릭")
// 	$('#commList').load('${path}/date/view?dateNo=');
	

}

//댓글 삭제
function commDelete(cmNo,dateNo) {
		console.log("삭제클릭", cmNo, dateNo)
		
		$.ajax({
			type: "get"
			, url: "/date/commDelete?cmNo="+cmNo+"&dateNo="+dateNo
			, data: {}
			, success: function(result) {
				console.log("AJAX 성공")
				alert("댓글을 삭제하였습니다.")
				location.reload();
				
			}
			, error: function() {
				console.log("AJAX 실패")
				alert("삭제 실패하였습니다.")
			}
		})
		
}
	
</script>

