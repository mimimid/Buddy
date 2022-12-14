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
		$("#btnAniDog").css({"color": "#fff", "background-color": "#8EC0E4"})
		
	} else if ( "${viewBoard.cateAnimal }" == "cat" ) {
		$("#btnAniCat").css({"color": "#fff", "background-color": "#8EC0E4"})
		
	}
	
	// cate_con color css
	if ( "${viewBoard.cateContent }" == "daily" ) {
		$("#btnConDaily").css("color", "#8EC0E4")
		
	} else if ( "${viewBoard.cateContent }" == "info" ) {
		$("#btnConInfo").css("color", "#8EC0E4")
	
	} else if ( "${viewBoard.cateContent }" == "ask" ) {
		$("#btnConAsk").css("color", "#8EC0E4")
			
	} else if ( "${viewBoard.cateContent }" == "etc" ) {
		$("#btnConEtc").css("color", "#8EC0E4")
		
	} else {
		$("#btnConAll").css("color", "#8EC0E4")
		
	}
})
</script>

<!-- ????????? -->
<script type="text/javascript">
$(document).ready(function() {
	
	if( ${empty login } ) {
		
		$("#likeicon").css("display", "none");
		$("#dislikeicon").css("display", "");
		
		$(".btn-heart").click(function() {
			alert('???????????? ???????????????')
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
						console.log("AJAX ??????")
						
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
						console.log("AJAX ??????")
					}
				})
				
			} else {
				
				$.ajax({
					type: "post"
					, url: "/comm/likeup"
					, data: { "commNo": ${viewBoard.commNo } }
					, dataType: "html"
					, success: function(res) {
						console.log("AJAX ??????")
						
						$("#likeicon").css("display", "");
						$("#dislikeicon").css("display", "none");
						likeval = 1
						
						$("#likeCntFirst").css("display", "none");
						$("#likeCnt").html(res)
						
// 						likecnt();
						
						
						console.log(likeval)
						
					}
					, error: function() {
						console.log("AJAX ??????")
					}
				})
				
			}
			
		})
		
	}
	
})
</script>

<!-- ???????????? -->
<script type="text/javascript">
$(document).ready(function(){
	
	$("#btnReport").click(function() {
		
		window.open("./report?commNo=${viewBoard.commNo }","????????????","width=800, height=600")
		
	})
		
})
</script>

<!-- ?????? -->
<script type="text/javascript">
$(document).ready(function(){
	
	$("#btnReply").click(function() {
				
		if( $("#comment").val() == "" ) {
			
			alert('????????? ??????????????????!')
			$("#comment").focus()
			
		} else if ( ${empty login } ) {
			
			alert('???????????? ???????????????!')
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
			console.log("AJAX ??????")
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
	color: #FF7A85;
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

#btnList {
	background-color: #969696;
	color: #fff;
}

#btnUpdate {
	background-color: #8EC0E4;
	color: #fff;
}

#btnDelete {
	background-color: #FF7A85;
	color: #fff;
}
</style>

<div class="container">

<div class="cate-animal">
	<button id="btnAniCat" class="btn btn-animal" name="cat">?????????</button>
	<button id="btnAniDog" class="btn btn-animal" name="dog">?????????</button>
</div>

<hr>

<div class="cate-content">
	<button id="btnConAll" class="btn btn-category" name="">#??????</button>
	<button id="btnConDaily" class="btn btn-category" name="daily">#??????</button>
	<button id="btnConInfo" class="btn btn-category" name="info">#??????</button>
	<button id="btnConAsk" class="btn btn-category" name="ask">#??????</button>
	<button id="btnConEtc" class="btn btn-category" name="etc">#??????</button>
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
		<button id="btnReport" class="btn btn-report">??????</button>
		<input type="hidden" id="userno" name="userno" value="${userno }">
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
			<textarea class="form-control" id="comment" name="commCmtContent" style="resize: none; margin-right: 12px;" cols="80" placeholder="????????? ??????????????????"></textarea>
			<button type="button" id="btnReply" style="background-color:#104138; color: white;">????????????</button>
		</div>
	</form>
	
	<br>
	
	<div class="text-center">
		<button id="btnList" class="btn btn-list">??????</button>
		
		<c:if test="${userno eq viewBoard.userno }">
			<button id="btnUpdate" class="btn btn-write">??????</button>
			<button id="btnDelete" class="btn btn-delete">??????</button>
		</c:if>
	</div>

</div>

<br>











<!-- <table class="table table-bordered"> -->
<!-- <tr> -->
<%-- 	<td class="info">??????</td><td colspan="5">${viewBoard.commTitle }</td> --%>
<!-- </tr> -->
<!-- <tr> -->
<%-- 	<td class="info">?????????</td><td>${viewBoard.commWriterNick }</td> --%>
<%-- 	<td class="info">?????????</td><td><fmt:formatDate value="${viewBoard.commWritedate }" pattern="yyyy-MM-dd" /></td> --%>
<%-- 	<td class="info">?????????</td><td>${viewBoard.commHit }</td> --%>
<!-- </tr> -->
<!-- <tr> -->
<!-- 	<td class="info" colspan="6">??????</td> -->
<!-- </tr> -->
<!-- <tr> -->
<%-- 	<td colspan="6">${viewBoard.commContent }</td> --%>
<!-- </tr> -->

<!-- <tr> -->
<!-- 	<td class="info">????????????</td> -->
<!-- 	<td> -->
<%-- 		<img alt="preview" src="<%=request.getContextPath() %>/upload/${commFile.commFileStoredname }"> --%>
<!-- 	</td> -->
<!-- 	<td> -->
<%-- 		<a href="/comm/download?commFileNo=${commFile.commFileNo }">${commFile.commFileOriginname }</a> --%>
<!-- 	</td> -->
<!-- </tr> -->
	
<!-- <tr> -->
<%-- 	<td class="info">??????</td><td>${viewBoard.commCmtCnt }</td> --%>
<!-- 	<td class="info">?????????</td> -->
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
<!-- 		<textarea class="form-control" id="comment" name="commCmtContent" style="resize: none; margin-right: 12px;" cols="80" placeholder="????????? ??????????????????"></textarea> -->
<!-- 		<button type="button" id="btnReply" style="background-color:#104138; color: white;">????????????</button> -->
<!-- 	</div> -->
<!-- </form> -->

<!-- <br> -->

<!-- <div id="listReply"></div> -->

<!-- <div class="text-center"> -->
<!-- 	<button id="btnList" class="btn btn-default">??????</button> -->
<!-- 	<button id="btnReport" class="btn btn-danger">??????</button> -->
	
<%-- 	<c:if test="${userno eq viewBoard.userno }"> --%>
<!-- 		<button id="btnUpdate" class="btn btn-primary">??????</button> -->
<!-- 		<button id="btnDelete" class="btn btn-danger">??????</button> -->
<%-- 	</c:if> --%>
<!-- </div> -->

<!-- <br> -->

</div><!-- .container end -->

<c:import url="../layout/footer.jsp" />
