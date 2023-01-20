<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp" />

<!-- 스마트 에디터 2 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	$("#btnUpdate").click(function() {
		
		//스마트에디터에 작성된 내용을 #content에 반영
		updateContents();
		
		if ( $("#title").val() == "" ) {
			alert("제목을 입력해주세요!")
		
		} else {
			$("form").submit();
		}
		
	})
	
	$("#btnCancel").click(function() {
		location.href = "/comm/list"
	})
	
	if( ${empty commFile} ) {
		$("#newFile").show()
	} else {
		$("#originFile").show()
	}
	
	$("#deleteFile").click(function() {
		$("#newFile").toggle()
		
// 		$("#originFile").toggle()
		$("#originFile").toggleClass("through")
	})
	
})

function updateContents() {
	//스마트 에디터에 작성된 내용을 #content에 반영한다
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [])
}
</script>

<script type="text/javascript">
$(document).ready(function() {
	
	$("#cateAnimal").val("${updateBoard.cateAnimal }").prop("selected",true);
	$("#cateContent").val("${updateBoard.cateContent }").prop("selected",true);
	
})
</script>

<style type="text/css">
button:focus, button:active { 	
    outline:none !important;
    box-shadow:none !important;
}

#btnUpdate {
	background-color: #8EC0E4;
	color: #fff;
}

#btnCancel {
	background-color: #FF7A85;
	color: #fff;
}

#originFile, #newFile {
	display: none;
}

.through {
	text-decoration: line-through;
}

#deleteFile {
	font-weight: bold;
	color: red;
	cursor: pointer;
}
</style>

<div class="container">

<form action="./update" method="post" enctype="multipart/form-data">

<input type="hidden" name="commNo" value="${param.commNo }">

<div class="form-group">
	<label for="cateAnimal">동물</label>
	<select class="form-control" id="cateAnimal" name="cateAnimal">
	    <option value="cat">고양이</option>
	    <option value="dog">강아지</option>
	</select>
</div>

<div class="form-group">
	<label for="cateContent">카테고리</label>
	<select class="form-control" id="cateContent" name="cateContent">
	    <option value="daily">일상</option>
	    <option value="ask">질문</option>
	    <option value="info">정보</option>
	    <option value="etc">기타</option>
	</select>
</div>

<div class="form-group">
	<label for="title">제목</label>
	<input type="text" id="title" name="commTitle" class="form-control" value="${updateBoard.commTitle }">
</div>

<div class="form-group">
	<label for="content">본문</label>
	<textarea rows="10" style="width: 100%;" id="content" name="commContent">${updateBoard.commContent }</textarea>
</div>

<div class="form-group">
	
	<div id="fileBox">
	
		<div id="originFile">
			<a href="/comm/download?commFileNo=${commFile.commFileNo }">${commFile.commFileOriginname }</a>
			<span id="deleteFile">X</span>
		</div>
		
		<div id="newFile">
			<label for="file">새로운 첨부파일</label>
			<input type="file" id="file" name="file">
		</div>
		
	</div>
	
</div>

</form>

<div class="text-center">
	<button class="btn btn-update" id="btnUpdate">수정</button>
	<button class="btn btn-delete" id="btnCancel">취소</button>
</div>

<!-- 스마트 에디터 스킨 적용 -->
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "content",
	sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
})
</script>

</div><!-- .container end -->

<c:import url="../layout/footer.jsp" />
