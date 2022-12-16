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
	
	// 검색 버튼
	$("#btnSearch").click(function() {
		
		var keyword = $(this).attr("name")
		console.log(keyword)
		
		if( ${not empty animal } && ${not empty category } ) {
			var animal = "${animal }"
			var category = "${category }"
			location.href = "/comm/list?keyword="+keyword+"&animal="+animal+"&category="+category
					
		} else if ( ${not empty animal } ) {
			var animal = "${animal }"
			location.href = "/comm/list?keyword="+keyword+"&animal="+animal
					
		} else if ( ${not empty category } ) {
			var category= "${category }"
			location.href = "/comm/list?keyword="+keyword+"&category="+category
			
		} else {
			location.href = "/comm/list?keyword="+keyword
		}
		
	})
	
	// cate_ani button click
	$(".btn-animal").click(function() {
		
		var animal = $(this).attr("name")
		console.log(animal)
		
		if( ${not empty category } && ${not empty keyword } ) {
			var category = "${category }"
			var keyword = "${keyword }"
			location.href = "/comm/list?keyword="+keyword+"&animal="+animal+"&category="+category
					
		} else if ( ${not empty category } ) {
			var category = "${category }"
			location.href = "/comm/list?animal="+animal+"&category="+category
					
		} else if ( ${not empty keyword } ) {
			var keyword= "${keyword }"
			location.href = "/comm/list?keyword="+keyword+"&animal="+animal
			
		} else {
			location.href = "/comm/list?animal="+animal
		}
		
	})
	
	// cate_con button click
	$(".btn-category").click(function() {
		
		var category = $(this).attr("name")
		console.log(category)
		
		if( ${not empty animal } && ${not empty keyword } ) {
			var animal = "${animal }"
			var keyword = "${keyword }"
			location.href = "/comm/list?keyword="+keyword+"&animal="+animal+"&category="+category
					
		} else if ( ${not empty animal } ) {
			var animal = "${animal }"
			location.href = "/comm/list?animal="+animal+"&category="+category
					
		} else if ( ${not empty keyword } ) {
			var keyword= "${keyword }"
			location.href = "/comm/list?keyword="+keyword+"&category="+category
			
		} else {
			location.href = "/comm/list?category="+category
		}
		
	})
	
	// cate_ani color css
	if( "${animal }" == "dog" ) {
		$("#btnAniDog").css({"color" : "#fff", "background-color" : "#FF7A85"})
		
	} else if ( "${animal }" == "cat" ) {
		$("#btnAniCat").css({"color" : "#fff", "background-color" : "#FF7A85"})
		
	} else {
		$("#btnAniAll").css({"color" : "#fff", "background-color" : "#FF7A85"})
		
	}
	
	// cate_con color css
	if ( "${category }" == "daily" ) {
		$("#btnConDaily").css("color","#FF7A85")
		
	} else if ( "${category }" == "ask" ) {
		$("#btnConAsk").css("color","#FF7A85")
		
	} else if ( "${category }" == "info" ) {
		$("#btnConInfo").css("color","#FF7A85")
		
	} else if ( "${category }" == "etc" ) {
		$("#btnConEtc").css("color","#FF7A85")
		
	} else {
		$("#btnConAll").css("color","#FF7A85")
		
	}
	
})
</script>

<style type="text/css">
.cate-animal, .cate-content {
	text-align: center;
	padding: 10px;
}

.btn-animal, .btn-category {
	background-color: #fff;
	width: 80px;
}

/* --------------------------------------- */

table {
	table-layout: fixed;
}

table, th {
	text-align: center;
}

td:nth-child(2) {
	text-align: left;
}

/* --------------------------------------- */
.btn-write {
	background-color: #FF7A85;
	color: #fff;
}
</style>

<div class="container">

<div class="cate-animal">
	<button id="btnAniAll" class="btn btn-animal" name="">전체</button>
	<button id="btnAniCat" class="btn btn-animal" name="cat">고양이</button>
	<button id="btnAniDog" class="btn btn-animal" name="dog">강아지</button>
</div>

<div class="cate-content">
	<button id="btnConAll" class="btn btn-category" name="">전체</button>
	<button id="btnConDaily" class="btn btn-category" name="daily">일상</button>
	<button id="btnConAsk" class="btn btn-category" name="ask">질문</button>
	<button id="btnConInfo" class="btn btn-category" name="info">정보</button>
	<button id="btnConEtc" class="btn btn-category" name="etc">기타</button>
</div>

<hr>

<span class="pull-left">${category } 카테고리( ${paging.totalCount } )</span>

<div class="pull-right">
	<form action="./list" method="get" class="form-inline">
	<select class="form-control" id="sort" name="sort">
	    <option value="">전체</option>
	    <option value="commTitle">제목</option>
	    <option value="userno">작성자</option>
	    <option value="commContent">내용</option>
	</select>
	<input type="text" name="keyword" class="form-control" id="keyword" value="${keyword }">
	<button id="btnSearch" type="button" class="btn" style="background-color:#FF7A85; color: #fff;">검색</button>
	</form>
</div>

<div class="clearfix"></div>

<br>

<table class="table">
<c:forEach items="${list }" var="commBoard">
	<tr>
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