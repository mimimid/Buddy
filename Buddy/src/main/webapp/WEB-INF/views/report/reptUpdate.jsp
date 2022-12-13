<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp" />

<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>
<style type="text/css">

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
.btnUp{
	background-color: cornflowerblue;
    color: white;
}

.btnDel{
	background-color: #FF7A85;
    color: white;
}

</style>

<script type="text/javascript">
$(document).ready(function() {
	
	$("#btnUpdate").click(function() {
		//스마트에디터에 작성된 내용을 #content에 반영
		updateContents();
		$("#frm").submit();
	})
	$("#btnCancel").click(function() {
		history.back();
	})
	if( ${empty reptFile} ) {
		$("#newFile").show()
	} else {
		$("#originFile").show()
	}
	
	$("#deleteFile").click(function() {
		$("#newFile").toggle()
		$("#originFile").toggleClass("through")
	})
})

function updateContents() {
	//스마트 에디터에 작성된 내용을 #content에 반영한다
	oEditors.getById["reptContent"].exec("UPDATE_CONTENTS_FIELD", [])
}
</script>


<div class="container">

<h3>회계보고 수정</h3>
<div class="pull-right">
	<a href="/" style="text-decoration: none; color: black;"><span class="glyphicon glyphicon-home" aria-hidden="true">Home</span></a>
	<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
	<a href="/report/reptList" style="text-decoration: none; color: black;">회계보고</a>
	<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
	<a href="/report/reptUpdate" style="text-decoration: none; color: black;">수정</a>
</div><br>
<hr>

<form id="frm" action="/report/reptUpdate" method="post" enctype="multipart/form-data">
<input type="hidden" name="reptNo" value="${param.reptNo }">
<div class="form-group">
	<label for="adminid">작성자</label>
	<input type="text" id="adminid" value="${nick }" class="form-control" readonly="readonly">
</div>

<div class="form-group">
	<label for="reptTitle">제목</label>
	<input type="text" id="title" name="reptTitle" class="form-control" value="${reptView.reptTitle }">
</div>

<div class="form-group">
	<label for="reptContent">본문</label>
	<textarea rows="10" style="width: 100%;" id="reptContent" name="reptContent">${reptView.reptContent }</textarea>
</div>

<div class="form-group">

	<div id="fileBox">

		<div id="originFile">
			<a href="/report/reptDown?rfileNo=${reptFile.rfileNo }">${reptFile.rfileOrigin }</a>
			<span id="deleteFile">X</span>
		</div>

		<div id="newFile">
			<label for="file">새로운 첨부파일</label>
			<input type="file" id="file" name="file">
		</div>

	</div>

</div>
</form>

<div class="text-center" style="margin: 40px 0px;">
	<button class="btn btnUp" id="btnUpdate">수정</button>
	<button class="btn btnDel" id="btnCancel">취소</button>
</div>

<!-- 스마트 에디터 스킨 적용 -->
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "reptContent",
	sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
})
</script>

</div><!-- .container end -->
<c:import url="../layout/footer.jsp" />