<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:import url="../layout/header.jsp" />

<style type="text/css">
a {
	color : black;
}


</style>
</head>
<body>



<div class="container">


<h1><a href="/hospboard/hblist">병원 질문 게시판</a></h1>
<br>



<div class="pull-right">
		 <form action="./hblist" method="get" class="form-inline">
<!-- 			<select class="form-control"  name="searchType" id="searchType">
				<option>강아지</option>
				<option>고양이</option>
			</select> -->
		 <input type="text" name="keyWord" class="form-control" id="keyWord" value="${param.keyWord}">
		 <button id="btnSearch"type="button" class="btn" style="background-color:#fad703" >검색</button>
		 </form>
 </div>
<br>
<div class="pull-left animalselect">

<button id="btnAnimalAll" class="btn btnAnimal" name="">전체</button>
<button id="btnAnimalDog" class="btn btnAnimal" name="강아지">강아지</button>
<button id="btnAnimalCat" class="btn btnAnimal" name="고양이">고양이</button>
</div>
<br><br>
<div class="pull-left">
	<c:if test="${not empty param.keyWord }">
	<div>[${param.keyWord }] 을/를 포함하는 글입니다.</div> 
	</c:if>
</div>
<br>
<table  class="table table-striped table-hover table-condensed">
<thead>
<tr>
	<th>글번호</th>
	<th>
		<div class="btn-group">
		  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
		    말머리 <span class="caret"></span>
		  </button>
		  <ul class="dropdown-menu" role="menu">
		    <li><a href="javascript:categoryLink('');" >전체보기</a></li>
		    <li><a href="javascript:categoryLink('동병QnA');" >동병QnA</a></li>
		    <li><a href="javascript:categoryLink('건강검진');" >건강검진</a></li>
		    <li><a href="javascript:categoryLink('약처방');" >약처방</a></li>
		    <li><a href="javascript:categoryLink('진료비');" >진료비</a></li>
		    <li><a href="javascript:categoryLink('수의사정보');">수의사정보</a></li>
		  </ul>
		</div>
	</th>
	<th>동물</th>
	<th>제목</th>
	<th>작성자no</th>
	<th>작성일</th>
	<th>조회수</th>
	<th>좋아요</th>
</tr>
</thead>
<tbody>
<c:forEach items="${hbList }" var="hbList">
<tr>
	<td  style="width: 10%;">${hbList.hbno }</td>
	<td  style="width: 15%;">${hbList.hbcategory }</td>
	<td  style="width: 10%;">${hbList.animal }</td>
	<td  style="width: 30%;">
	<c:if test="${hbList.hbtop == 1 }">
	  	<span class="label label-success" style="font-size: 11px;">공지</span>
	 </c:if>
	<a href="./hbview?hbno=${hbList.hbno }">${hbList.hbtitle }</a>
	<c:if test="${hbList.hbcmtcnt !=0 }">
	  	&nbsp&nbsp<span style="color:#69a155">[${hbList.hbcmtcnt }]</span>
	</c:if>
	</td>
	<td style="width: 10%;">${hbList.userno }</td>
	<td style="width: 10%;"><fmt:formatDate value="${hbList.hbwritedate }" pattern="yy-MM-dd"/></td>
	<td style="width: 10%;">${hbList.hbhit }</td>
	<td style="width: 5%;">${hbList.hblike }</td>
</tr>
</c:forEach>
</tbody>
</table>

<button id="btnWrite" class="btn btn-primary pull-left">글쓰기</button>
<span class="pull-right">total : ${paging.totalCount }</span>

<div class="clearfix"></div>

<c:import url="/WEB-INF/views/hospboard/paging.jsp" />

</div><!-- .container -->

<script type="text/javascript">
$(document).ready(function() {
	

	$("#btnWrite").click(function() {
		location.href = "/hospboard/hbwrite"
	})

	$("#btnSearch").click(function() {
		
		if( $("#keyWord").val() == "" ) {
			alert('검색어를 입력해주세요!');
 
			$("input").eq(0).focus()
			
		} else {
			$("form").submit();
		}
	})

	
})
</script>

<script type="text/javascript">
$(document).ready(function(){
	
	animalButtonColor();
	
	console.log((${not empty param.animal } && ${not empty param.keyWord}));
	console.log(${not empty param.category } && ${not empty param.keyWord});
	
	$(".btnAnimal").click(function() {
		
			var animal = $(this).attr("name");
			console.log(animal);
			
			if(${not empty param.category } && ${not empty param.keyWord}) {
				var category = "${param.category}"
				var keyWord = "${param.keyWord}"
				location.href = "/hospboard/hblist?keyWord="+keyWord+"&animal="+animal+"&category="+category
						
			}else if( ${not empty param.category } ) {
				var category = "${param.category}"
				location.href = "/hospboard/hblist?animal="+animal+"&category="+category
						
			} else if(${not empty param.keyWord }) {
				var keyWord= "${param.keyWord}"
				location.href = "/hospboard/hblist?keyWord="+keyWord+"&animal="+animal
				
			} else {
				location.href = "/hospboard/hblist?animal="+animal;
			}
	})
	
function animalButtonColor() {
	
	var dog = '강아지';
	var cat = '고양이';
	var selectAnimal = '${param.animal}';
	
	if(dog == selectAnimal) {
		$('#btnAnimalDog').css("background-color","#fad703");
	} else if(cat == selectAnimal) {
		$('#btnAnimalCat').css("background-color","#fad703");
	} else {
		$('#btnAnimalAll').css("background-color","#fad703");
	}
}



 
})

function categoryLink(category) {
	console.log(category);
	
	if(${not empty param.animal } && ${not empty param.keyWord}) {
		var animal = "${param.animal}"
		var keyWord = "${param.keyWord}"
		location.href = "/hospboard/hblist?keyWord="+keyWord+"&animal="+animal+"&category="+category
				
	} else if( ${not empty param.animal } ) {
		var animal = "${param.animal}"
		location.href = "/hospboard/hblist?animal="+animal+"&category="+category
				
	} else if(${not empty param.keyWord }) {
		var keyWord = "${param.keyWord}"
		location.href = "/hospboard/hblist?keyWord="+keyWord+"&category="+category
			
	}else {
		location.href = "/hospboard/hblist?category="+category;
	}
}

</script>


<c:import url="../layout/footer.jsp" />