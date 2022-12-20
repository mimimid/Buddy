<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<!-- 웹글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<!-- CSS -->
<link rel="stylesheet" href="/resources/css/dateList.css">

<!-- 아이콘 CSS -->
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-bold-rounded/css/uicons-bold-rounded.css'>
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-straight/css/uicons-regular-straight.css'>
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-solid-rounded/css/uicons-solid-rounded.css'>
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css'>

<script type="text/javascript">
$(document).ready(function () {
	var dateNo = ${viewDate.dateNo }
	console.log(dateNo)
	
	//데이트게시판 목록으로 이동
	$("#btnList").click(function() {
		$(location).attr('href', '/date/list?category=${viewDate.dateCate}')
	})
	
	//댓글목록 불러오기
	cmList()
	
	//댓글 등록
	$("#btnCommentWrite").click(function() {
		console.log("클릭")
		
		if( ${empty sessionScope.login } ) {
			alert("로그인 후 댓글을 달아주세요.");
		} else {
			//댓글등록ajax
			fn_comment();
				
			alert("댓글이 등록되었습니다.");
			
			location.reload();
				
		}
	})
	
	//좋아요
	if( ${empty login} ) {
		
		$("#like").css("display", "none");
		$("#disLike").css("display", "");
		
		$(".btn-like").click(function() {
			console.log("하트클릭")
			alert('로그인 후 이용가능합니다.')
			
		})
		
	} else {
		
		var like = ${like}
		console.log(like)
		
		if( like == 0 ) {
			$("#like").css("display", "none");
			$("#disLike").css("display", "");
		}
		
		$(".btn-like").click(function() {
			console.log("논하트 클릭")
			
			//좋아요 되어있을 때
			if( like > 0 ) {
				
				$.ajax({
					type: "post"
					, url: "/date/hate"
					, data: { "dateNo": ${viewDate.dateNo } }
					, dateType: "html"
					, success: function(res) {
						console.log("AJAX 성공")
						console.log(res)
						console.log(dateNo)
						
						$("#like").css("display", "none");
						$("#disLike").css("display", "");
						like = 0
						
						$("#likeCnt").css("display", "none");
						$("#likeCntAfter").html(res)
						
						console.log(like);
						
					}
					, error: function() {
						console.log("AJAX 실패")
					}
				})
				
				//좋아요 없을 때
			} else {
				
				$.ajax({
					type: "post"
					, url: "/date/like"
					, data: { "dateNo": ${viewDate.dateNo } }
					, dataType: "html"
					, success: function(res) {
						console.log("AJAX 성공")
						
						$("#like").css("display", "");
						$("#disLike").css("display", "none");
						like = 1
						
						$("#likeCnt").css("display", "none");
						$("#likeCntAfter").html(res)
						console.log(like)
						
					}
					, error: function() {
						console.log("AJAX 실패")
					}
				})
				
			}
		})// 좋아요 클릭 함수 END
		
	}// 로그인 되어있을 때 END
	
})

//댓글목록
function cmList() {
	$.ajax({
		type: "get"
		, url: "${path}/date/commList?dateNo=${viewDate.dateNo}"
		, data: {}
		, dataType: "html"
		, success: function(comm) {
			console.log("AJAX 성공")
// 			console.log(comm)
			
			$("#commList").html(comm)
			
		}
		, error: function() {
			console.log("AJAX 실패")
		}
	})
}


//댓글등록
function fn_comment() {
	
	var cmContent = $("#cmContent").val();
	
	$.ajax({
		type: "post"
		, url: "${path}/date/commList?dateNo=${viewDate.dateNo}"
		, data: {
			"cmContent" : cmContent	
		}
		, success: function(result) {
			console.log("AJAX 성공")
			$("#cmContent").val('')
			cmList();
			
		}
		, error: function() {
			console.log("AJAX 실패")
			alert("등록 실패")
		}
	})
	
}

</script>

<style type="text/css">

#dateReportContent {

	min-height: 181px;
	min-width: 559px;
	max-width: 559px;

}

</style>

<!-- 데이트게시판 메인 시작 -->
<div class="container">
<div class="black_bg"></div>
<div class="row container-fluid">
	<div class="text-center">
		<a href="/date/main" class="thumbnail">
			<img src="https://cdn.imweb.me/thumbnail/20220422/0be5230e57bb5.png" alt="..." style="width:100%;">
		</a>
	</div>
<div class="text-center">
	<a href="/date/list?category=1"><button type="button" id="cafe" class="btn btn-default">카페</button></a>
	<a href="/date/list?category=2"><button type="button" id="hotel" class="btn btn-default">호텔</button></a>
	<a href="/date/list?category=3"><button type="button" id="training" class="btn btn-default">훈련소</button></a>
	<a href="/date/list?category=4"><button type="button" id="trip" class="btn btn-default">여행지</button></a>
</div>
</div>
<hr>

<div class="container">
<div class="page-header" style="margin-top: 0;">
	<h5><i class="fi fi-sr-paw" style="color: #FF7A85;"></i> ${viewDate.dateCateName } 데이트</h5>
	<h3>${viewDate.title } <small><i class="fi fi-rs-marker"></i> ${viewDate.loc }</small></h3>
	<div class="media">
		<div class="media-left media-middle">
			<img class="media-object img-circle" src="/resources/img/date/userImg.png" alt="..." style="width: 40px; height: 40px; margin-bottom: 10px;">
		</div>
		<div class="media-body" style="font-color: #ccc;">
			<h4 class="media-heading">관리자</h4>
			<fmt:formatDate value="${viewDate.writeDate }" pattern="yy-MM-dd"/> 조회수 ${viewDate.hit }
			<button id="modal_btn" type="button" class="btn btn-link" style="color: red; font-weight: bold;">신고</button>
		</div>
	</div>
</div>

<!-- 신고창 -->
<div class="modal fade" id="report_model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
	<div class="modal-content">
		<div class="modal-header">
			<h5 class="modal-title" id="exampleModalLabel">신고</h5>
			<button class="close" type="button" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">X</span>
			</button>
		</div>
		
		<div class="modal-body no-padding-top no-padding-bottom">
			<textarea id="dateReportContent" class="form-control" name="dateReportContent" rows="4" placeholder="신고사유(필수)" style="height: 181px; width: 559px;"></textarea>
			<span class="text-gray">신고해주신 내용은 관리자 검토 후 내부 운영정책에 의해 조치가 진행됩니다.</span>
		</div>
		
		<div class="modal-footer">
			<a class="btn" id="modalY" href="#" onclick="report(${viewDate.dateNo})">신고하기</a>
			<button class="btn" type="button" data-dismiss="modal">취소</button>
		</div>
	</div>
	</div>
</div>

<!-- 신고팝업 모달창 -->
<script type="text/javascript">
$('#modal_btn').click(function(e){
	e.preventDefault();
	$('#report_model').modal("show");
});

//신고함수
function report(dateNo) {
	var dateReportContent = $("#dateReportContent").val();
	console.log("신고 클릭", dateNo, dateReportContent)

	if( ${empty login} ) {
		alert('로그인 후 이용가능합니다.')
		$('#report_model').modal("hide");
		
	} else {
		
		if( $("#dateReportContent").val() == "" ) {
			alert("신고 사유를 입력해주세요.")
		} else {
			$.ajax({
				type: "post"
				, url: "${path}/date/report?dateNo=${viewDate.dateNo}"
				, data: { "dateReportContent" : dateReportContent }
				, dataType: "html"
				, success: function(result) {
					console.log("AJAX 성공")
	// 	 			console.log(result)
	
					$("#dateReportContent").val('');
	
					alert("신고 접수가 되었습니다.")
					$('#report_model').modal("hide");
					
				}
				, error: function() {
					console.log("AJAX 실패")
					alert("신고 접수가 실패했습니다.")
				}
			})
		}
	}
		
}//신고함수 END

</script>


<div class="text-center">
<div>
	<span>${viewDate.content }</span>
</div>
</div>

<!-- 하트, 댓글 갯수 표시 -->
<div class="t-icons">
	<a class="btn-like">
		<i class="fi fi-sr-heart" id="like"></i>
		<i class="fi fi-rr-heart" id="disLike" style="display: none;"></i>
	</a>
	<span id="likeCnt">${viewDate.likeCount }</span>
	<span id="likeCntAfter"></span>
	<i class="fi fi-rr-comment-alt-middle"></i>&nbsp;${viewDate.commCount }
</div>

<!-- 목록버튼 -->
<div class="text-center">
	<button id="btnList" class="btn btn-outline">목록으로</button>
	<button id="btnUpdate" class="btn" style="background-color: #8EC0E4;">수정하기</button>
	<button id="btnDelete" class="btn" style="background-color: #ea9999;">삭제하기</button>
</div>

<!-- 댓글입력창 -->
<!-- 후기게시글 댓글 -->
<h4 class="text-left">댓글 <small>로그인 후 댓글 작성 가능</small></h4>

<!-- 댓글 입력하는 폼 -->
<form id="commentForm" name="commentForm" method="post">
<input type="hidden" id="dateNo" name="dateNo" value="${viewDate.dateNo }">
	<table class="table">
		<tr>
			<td style="width: 100%;"><input type="text" style="height:100px; width:100%;" placeholder="댓글을 입력해주세요." name = "cmContent" id="cmContent"></td>
			<td><br><br><button type="button" id="btnCommentWrite" class="btn btn-outline-secondary">댓글작성</button></td>
		</tr>
	</table>
</form>

<!-- 댓글목록 -->
<div id="commList"></div><!-- 댓글목록 끝 -->

</div><!-- 메인 컨테이너 END -->
</div><!-- .container END -->

<c:import url="../layout/footer.jsp" />