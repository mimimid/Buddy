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
		$("#btnAniDog").css({"color": "#fff", "background-color": "#FF7A85"})
		
	} else if ( "${animal }" == "cat" ) {
		$("#btnAniCat").css({"color": "#fff", "background-color": "#FF7A85"})
		
	}
	
	// cate_con color css
	if ( "${category }" == "daily" ) {
		$("#btnConDaily").css("color", "#FF7A85")
		
	} else if ( "${category }" == "info" ) {
		$("#btnConInfo").css("color", "#FF7A85")
	
	} else if ( "${category }" == "ask" ) {
		$("#btnConAsk").css("color", "#FF7A85")
			
	} else if ( "${category }" == "etc" ) {
		$("#btnConEtc").css("color", "#FF7A85")
		
	} else {
		$("#btnConAll").css("color", "#FF7A85")
		
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

table {
	table-layout: fixed;
	padding-top: 10px;
}

/* --------------------------------------- */

#btnSearch {
	background-color:#FF7A85; 
	color: #fff;
}

/* --------------------------------------- */
.btn-write {
	background-color: #FF7A85;
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

<div class="pull-left">
	<span>
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
		
		<button type="button" class="btn" id="btnSearch">검색</button>
		
	</form>
</div>

<div class="clearfix" style="padding-bottom: 20px;"></div>

<table class="table">
<c:forEach items="${list }" var="commBoard">
	<tr>
		<td>
			<c:choose>
				<c:when test="${commBoard.cateContent eq 'daily' }">[일상]</c:when>
				<c:when test="${commBoard.cateContent eq 'info' }">[정보]</c:when>
				<c:when test="${commBoard.cateContent eq 'ask' }">[질문]</c:when>
				<c:when test="${commBoard.cateContent eq 'etc' }">[기타]</c:when>
			</c:choose>
		</td>
		<td><a href="/comm/view?commNo=${commBoard.commNo }">${commBoard.commTitle }</a></td>
		<td>${commBoard.commWriterNick }</td>
		<td><fmt:formatDate value="${commBoard.commWritedate }" pattern="yy-MM-dd HH:mm:ss"/></td>
		<td>${commBoard.commHit }</td>
		<td>${commBoard.commLikeCnt }</td>
		<td>${commBoard.commCmtCnt }</td>
	</tr>
</c:forEach>
</table>

<button id="btnWrite" class="btn btn-write pull-right">글쓰기</button>

<div class="clearfix"></div>

<c:import url="/WEB-INF/views/comm/paging.jsp" />

</div><!-- .container -->

<c:import url="../layout/footer.jsp" />