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
	
	// cate_ani button click
	$(".btn-animal").click(function() {
		
		$("#searchType").prop("selected",false);
		
		var animal = $(this).attr("name")
		console.log(animal)
		
		if ( ${not empty category } ) {
			var category = "${category }"
			location.href = "/comm/list?animal="+animal+"&category="+category
			
		} else {
			location.href = "/comm/list?animal="+animal
		}
		
	})
	
	// cate_con button click
	$(".btn-category").click(function() {
		
		$("#searchType").prop("selected",false);
		
		var category = $(this).attr("name")
		console.log(category)
		
		if ( ${not empty animal } ) {
			var animal = "${animal }"
			location.href = "/comm/list?animal="+animal+"&category="+category
			
		} else {
			location.href = "/comm/list?category="+category
		}
		
	})
	
	// cate_ani color css
	if( "${viewBoard.cateAnimal }" == "dog" ) {
		$("#btnAniDog").css({"color": "#fff", "background-color": "#FF7A85"})
		
	} else if ( "${viewBoard.cateAnimal }" == "cat" ) {
		$("#btnAniCat").css({"color": "#fff", "background-color": "#FF7A85"})
		
	}
	
	// cate_con color css
	if ( "${viewBoard.cateContent }" == "daily" ) {
		$("#btnConDaily").css("color", "#FF7A85")
		
	} else if ( "${viewBoard.cateContent }" == "info" ) {
		$("#btnConInfo").css("color", "#FF7A85")
	
	} else if ( "${viewBoard.cateContent }" == "ask" ) {
		$("#btnConAsk").css("color", "#FF7A85")
			
	} else if ( "${viewBoard.cateContent }" == "etc" ) {
		$("#btnConEtc").css("color", "#FF7A85")
		
	} else {
		$("#btnConAll").css("color", "#FF7A85")
		
	}
})
</script>

<!-- 좋아요 -->
<script type="text/javascript">
$(document).ready(function() {
	
	if( ${empty login } ) {
		
		$("#likeicon").css("display", "none");
		$("#dislikeicon").css("display", "");
		
		$(".btn-heart").click(function() {
			alert('로그인이 필요합니다')
			location.href = "/user/login"
		})
		
	} else {
		
		var likeval = ${like }
		
		if( likeval == 0 ) {
			$("#likeicon").css("display", "none");
			$("#dislikeicon").css("display", "");
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
						
						$("#likeicon").css("display", "none");
						$("#dislikeicon").css("display", "");
						likeval = 0
						
						$("#likeCntFirst").css("display", "none");
						$("#likeCnt").html(res)
						
// 						likecnt();
						
						
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
						
						$("#likeicon").css("display", "");
						$("#dislikeicon").css("display", "none");
						likeval = 1
						
						$("#likeCntFirst").css("display", "none");
						$("#likeCnt").html(res)
						
// 						likecnt();
						
						
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
span {
	display: table-cell;
	vertical-align: middle;
}

.cate-animal  {
	text-align: center;
	padding: 10px;
}

.cate-content {
	text-align: center;
	padding-bottom: 50px;
}

.btn-animal, .btn-category {
	background-color: #fff;
	width: 80px;
}

/* --------------------------------------- */

#preview {
	height: 100px;
	width: 100px;
}

button:focus, button:active { 	
    outline:none !important;
    box-shadow:none !important;
}

a.btn-heart {
	color: black;
}

a.btn-heart:hover {
	text-decoration: none;
	color: #FF7A85;
}

.view-title {
	color: green;
}

.view-nick {
}

.view-hit > span {
	display: inline-block;
}

.view-content {
	min-height: 200px;
}

#likeCntFirst, #likeCnt {
	display: inline-block;
}
</style>

<div class="container">

<div class="cate-animal">
	<button id="btnAniCat" class="btn btn-animal" name="cat">고양이</button>
	<button id="btnAniDog" class="btn btn-animal" name="dog">강아지</button>
</div>

<hr>

<div class="cate-content">
	<button id="btnConAll" class="btn btn-category" name="">#전체</button>
	<button id="btnConDaily" class="btn btn-category" name="daily">#일상</button>
	<button id="btnConInfo" class="btn btn-category" name="info">#정보</button>
	<button id="btnConAsk" class="btn btn-category" name="ask">#질문</button>
	<button id="btnConEtc" class="btn btn-category" name="etc">#기타</button>
</div>

<div class="view">

	<div class="view-title">
		<h3>${viewBoard.commTitle }</h3>
	</div>
	
	<div class="view-nick">
		<span>${viewBoard.commWriterNick }</span>
	</div>
	
	<div class="view-hit">
		<span><fmt:formatDate value="${viewBoard.commWritedate }" pattern="yyyy-MM-dd" /></span>
		<span class="material-icons-outlined">visibility</span>&nbsp;&nbsp;${viewBoard.commHit }
	</div>
	
	<hr>
	
	<div class="view-content">
		<span>${viewBoard.commContent }</span>
	</div>
	
	<div class="view-preview">
		<c:if test="${not empty commFile.commFileStoredname }">
			<img id="preview" alt="preview" src="<%=request.getContextPath() %>/upload/${commFile.commFileStoredname }">
		</c:if>
	</div>
	
	<div class="view-like">
		<span class="material-icons-outlined">chat_bubble_outline</span>&nbsp;&nbsp;${viewBoard.commCmtCnt }
		<a class="btn btn-heart">
			<span class="material-icons-outlined" id="likeicon">favorite</span>
			<span class="material-icons-outlined" id="dislikeicon" style="display: none;">favorite_border</span>
		</a>
			<span id="likeCntFirst">${viewBoard.commLikeCnt }</span>
			<span id="likeCnt"></span>
	</div>

	<hr>

	<div id="listReply"></div>
	
	<form action="./cmtwrite" method="post">
		<div class="form-grop">
			<input type="hidden" name="commNo" value="${viewBoard.commNo }">
			<textarea class="form-control" id="comment" name="commCmtContent" style="resize: none; margin-right: 12px;" cols="80" placeholder="댓글을 작성해주세요"></textarea>
			<button type="button" id="btnReply" style="background-color:#104138; color: white;">댓글쓰기</button>
		</div>
	</form>
	
	<br>
	
	<div class="text-center">
		<button id="btnList" class="btn btn-default">목록</button>
		<button id="btnReport" class="btn btn-danger">신고</button>
		
		<c:if test="${userno eq viewBoard.userno }">
			<button id="btnUpdate" class="btn btn-primary">수정</button>
			<button id="btnDelete" class="btn btn-danger">삭제</button>
		</c:if>
	</div>

</div>

<br>











<!-- <table class="table table-bordered"> -->
<!-- <tr> -->
<%-- 	<td class="info">제목</td><td colspan="5">${viewBoard.commTitle }</td> --%>
<!-- </tr> -->
<!-- <tr> -->
<%-- 	<td class="info">닉네임</td><td>${viewBoard.commWriterNick }</td> --%>
<%-- 	<td class="info">작성일</td><td><fmt:formatDate value="${viewBoard.commWritedate }" pattern="yyyy-MM-dd" /></td> --%>
<%-- 	<td class="info">조회수</td><td>${viewBoard.commHit }</td> --%>
<!-- </tr> -->
<!-- <tr> -->
<!-- 	<td class="info" colspan="6">본문</td> -->
<!-- </tr> -->
<!-- <tr> -->
<%-- 	<td colspan="6">${viewBoard.commContent }</td> --%>
<!-- </tr> -->

<!-- <tr> -->
<!-- 	<td class="info">첨부파일</td> -->
<!-- 	<td> -->
<%-- 		<img alt="preview" src="<%=request.getContextPath() %>/upload/${commFile.commFileStoredname }"> --%>
<!-- 	</td> -->
<!-- 	<td> -->
<%-- 		<a href="/comm/download?commFileNo=${commFile.commFileNo }">${commFile.commFileOriginname }</a> --%>
<!-- 	</td> -->
<!-- </tr> -->
	
<!-- <tr> -->
<%-- 	<td class="info">댓글</td><td>${viewBoard.commCmtCnt }</td> --%>
<!-- 	<td class="info">좋아요</td> -->
<!-- 	<td> -->
<!-- 		<a class="btn btn-heart"> -->
<!-- 			<span class="glyphicon glyphicon-heart" aria-hidden="true" id="likeicon"></span> -->
<!-- 		</a> -->
<%-- 		<a id="likecnt">${viewBoard.commLikeCnt }</a> --%>
<!-- 	</td> -->
<!-- </tr> -->

<!-- </table> -->

<!-- <div class="clearfix"></div> -->

<!-- <form action="./cmtwrite" method="post"> -->
<!-- 	<div class="form-grop"> -->
<%-- 		<input type="hidden" name="commNo" value="${viewBoard.commNo }"> --%>
<!-- 		<textarea class="form-control" id="comment" name="commCmtContent" style="resize: none; margin-right: 12px;" cols="80" placeholder="댓글을 작성해주세요"></textarea> -->
<!-- 		<button type="button" id="btnReply" style="background-color:#104138; color: white;">댓글쓰기</button> -->
<!-- 	</div> -->
<!-- </form> -->

<!-- <br> -->

<!-- <div id="listReply"></div> -->

<!-- <div class="text-center"> -->
<!-- 	<button id="btnList" class="btn btn-default">목록</button> -->
<!-- 	<button id="btnReport" class="btn btn-danger">신고</button> -->
	
<%-- 	<c:if test="${userno eq viewBoard.userno }"> --%>
<!-- 		<button id="btnUpdate" class="btn btn-primary">수정</button> -->
<!-- 		<button id="btnDelete" class="btn btn-danger">삭제</button> -->
<%-- 	</c:if> --%>
<!-- </div> -->

<!-- <br> -->

</div><!-- .container end -->

<c:import url="../layout/footer.jsp" />
