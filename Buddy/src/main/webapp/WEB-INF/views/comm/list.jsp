<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	
	// 글쓰기 버튼
	$("#btnWrite").click(function() {
		
		if( ${empty login } ) {
			alert("로그인이 필요합니다")
			location.href = "/user/login"
			
		} else {
			location.href = "/comm/write"
		}
		
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
	if( "${animal }" == "dog" ) {
		$("#btnAniDog").css({"color": "#fff", "background-color": "#8EC0E4"})
		
	} else if ( "${animal }" == "cat" ) {
		$("#btnAniCat").css({"color": "#fff", "background-color": "#8EC0E4"})
		
	}
	
	// cate_con color css
	if ( "${category }" == "daily" ) {
		$("#btnConDaily").css("color", "#8EC0E4")
		
	} else if ( "${category }" == "info" ) {
		$("#btnConInfo").css("color", "#8EC0E4")
	
	} else if ( "${category }" == "ask" ) {
		$("#btnConAsk").css("color", "#8EC0E4")
			
	} else if ( "${category }" == "etc" ) {
		$("#btnConEtc").css("color", "#8EC0E4")
		
	} else {
		$("#btnConAll").css("color", "#8EC0E4")
		
	}
	
})
</script>


<!-- 검색 -->
<script type="text/javascript">
$(document).ready(function() {
		
	// 검색 버튼
	$("#btnSearch").click(function() {
		
		if( $("#keyword").val() == "" ) {
			alert('검색어를 입력해주세요!')
 
			$("#keyword").focus()
			
		} else {
			$("form").submit()
		}
		
	})
	
	$("#searchType").val("${searchType }").prop("selected",true);
	$("#hcateAnimal").val("${animal }")
	$("#hcateContent").val("${category }")
	
})
</script>


<style type="text/css">
span {
	display: table-cell;
	vertical-align: middle;
}

button:focus, button:active { 	
    outline:none !important;
    box-shadow:none !important;
}

/* --------------------------------------- */

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

#category {
	line-height: 34px;
}

#btnSearch {
	background-color:#8EC0E4; 
	color: #fff;
}

/* --------------------------------------- */

table {
	table-layout: fixed;
}

/* --------------------------------------- */

#btnWrite {
	background-color: #8EC0E4;
	color: #fff;
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

	<div class="comm_top">
		<div class="pull-left">
			<span id="category">
			<c:if test="${not empty category }">
				<c:choose>
					<c:when test="${category eq 'daily' }">일상 </c:when>
					<c:when test="${category eq 'info' }">정보 </c:when>
					<c:when test="${category eq 'ask' }">질문 </c:when>
					<c:when test="${category eq 'etc' }">기타 </c:when>
				</c:choose>
				카테고리( ${paging.totalCount } )
			</c:if>
			</span>
		</div>
		
		<div class="pull-right">
			<form action="./list" method="get" class="form-inline">
				
				<input type="hidden" id="hcateAnimal" name="animal">
				<input type="hidden" id="hcateContent" name="category">
				
				<select class="form-control" id="searchType" name="searchType">
				    <option value="">전체</option>
				    <option value="commTitle">제목</option>
				    <option value="commWriterNick">작성자</option>
				</select>
				
				<input type="text" name="keyword" class="form-control" id="keyword" value="${param.keyword }">
				
				<button type="button" class="btn" id="btnSearch"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
				
			</form>
		</div>
	</div>

	<div class="clearfix" style="padding-bottom: 10px;"></div>



<!-- css 정리 필요 -->


<table class="table">
<c:forEach items="${list }" var="commBoard">
	<tr>
		<td rowspan="2">
			<c:choose>
				<c:when test="${commBoard.cateContent eq 'daily' }">#일상</c:when>
				<c:when test="${commBoard.cateContent eq 'info' }">#정보</c:when>
				<c:when test="${commBoard.cateContent eq 'ask' }">#질문</c:when>
				<c:when test="${commBoard.cateContent eq 'etc' }">#기타</c:when>
			</c:choose>
		</td>
		<td colspan="8"><a href="/comm/view?commNo=${commBoard.commNo }">${commBoard.commTitle }</a></td>
		<td><span class="material-icons-outlined">chat_bubble_outline</span>&nbsp;&nbsp;${commBoard.commCmtCnt }</td>
	</tr>
		
	<tr>
		<td>${commBoard.commWriterNick }</td>
		<td><fmt:formatDate value="${commBoard.commWritedate }" pattern="yyyy-MM-dd"/></td>
		<td colspan="6"><span class="material-icons-outlined">favorite</span>&nbsp;&nbsp;${commBoard.commLikeCnt }</td>
		<td><span class="material-icons-outlined">visibility</span>&nbsp;&nbsp;${commBoard.commHit }</td>
	</tr>
</c:forEach>
</table>

<button id="btnWrite" class="btn btn-write pull-right">글쓰기</button>

<div class="clearfix"></div>

<c:import url="/WEB-INF/views/comm/paging.jsp" />

</div><!-- .container -->

<c:import url="../layout/footer.jsp" />