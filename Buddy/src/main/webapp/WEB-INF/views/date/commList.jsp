<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
#user_comm {
    margin-top: 0px;
    padding: 10px;
    border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}

#user_name {
	display: inline-block;
}

</style>

<!-- 댓글 목록 -->
<c:forEach items="${commList }" var="cm">
<div id="user_comm" class="media">
<div class="media-left">
<a href="/mypage/main">
	<img class="media-object img-circle" src="/resources/img/date/userImg.png" alt="userImg" style="width: 55px; height: 55px;margin-top: 10px;">
</a>
</div>

<div id="user_media" class="media-body">
	<input type="hidden" id="cmNo" name="cmNo" value="${cm.cmNo }">
	<div class="media-heading">
		<h4 id="user_name">${cm.usernick } <small><fmt:formatDate value="${cm.writeDate }" pattern="yy-MM-dd HH:mm:ss"/></small></h4>
		<div id="btn_${cm.cmNo }" style="display: inline-block;margin-left: 5px;">
		<c:if test="${id eq cm.userid }">
			<button class="btn btn-xs edit1" id="${cm.cmNo }" onclick="commUpdate(${cm.cmNo })" style="background: #FF7A85;border: none; color: #fff;">수정</button>
			<button class="btn btn-xs cmDelete" onclick="commDelete(${cm.cmNo },${cm.dateNo })" id="cmDelete">삭제</button>
		</c:if>
		</div>
	</div>
	<div class="media-body">
		<div id="cmContent_${cm.cmNo }"><h5 style="margin-top: 3px;">${cm.cmContent }</h5></div>
	</div>
</div>
</div>
</c:forEach><!-- 댓글창 끝 -->

<script type="text/javascript">

//댓글 수정
function commUpdate(cmNo) {
		console.log("수정클릭", cmNo)
		
		var txt = $('#cmContent_'+cmNo).text(); //댓글작성창
		
		$('#cmContent_'+cmNo).html("<textarea placeholder='댓글을 입력해주세요.' style='resize:none;' rows='3' cols='132' name = 'cmContent' id='tt_"+cmNo+"'>"+txt
		+"</textarea>");
		$('#btn_'+cmNo).html(
			"<input type='button' value='수정하기' style='background: #FF7A85;border: none; color: #fff;' onclick='up("+cmNo+")'> "
	 		  +"<input type='button' value='취소' style='background: #ed2e3e;border: none; color: #fff;' onclick='lst()'>");
		
}

//댓글 수정
function up(cmNo) {
	var cmContent = $('#tt_'+cmNo).val();
	
	if(confirm("수정 하시겠습니까?")) {
		
		if( cmContent === "" ) {
			alert("수정할 댓글내용을 적어주세요.")
		} else {
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
	}
}

function lst() {
	console.log("취소클릭")
	

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

