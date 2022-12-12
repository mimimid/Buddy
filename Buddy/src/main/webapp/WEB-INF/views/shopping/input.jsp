<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 스마트에디터 2 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	
	//작성버튼
	$("#btnWrite").click(function() {
		console.log("작성")
		//작성된 내용을 textarea에 적용
		updateContents()

		$("form").submit();
	})
	
	//취소버튼
	$("#btnCancel").click(function() {
		console.log("취소")
		history.go(-1)
	})
	
	
	
function updateContents() {
		
		//스마트 에디터에 작성된 내용을 #content에 반영
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [])
		
	}
})


</script>

<style type="text/css">
label{
	display: inline-block;
}
.form-group{
	margin: 10px auto;
}


</style>

<c:import url="../layout/header.jsp" />

<div class="container">
<h1 style="text-align: center;">Input Product</h1>
<hr>

<form action="./input" method="post" enctype="multipart/form-data">
<div class="form-group">
	<label for="kind">1차 분류</label>
	<select name="kind" id="kind">
		<option value="" disabled selected>종을 선택하세요.</option>
		<option value="dog">개</option>
		<option value="cat">고양이</option>
	</select>
</div>
<div class="form-group">
	<label for="category">2차 분류</label>
	<select name="category" id="category">
		<option value="" disabled selected>물품을 선택하세요.</option>
		<option>사료</option>
		<option>간식</option>
		<option>용품</option>
	</select>
</div>
<div class="form-group">
	<label for="productname">상품명</label>
	<input type="text" name="productname" id="productname">
</div>

<div class="form-group">
	<label for="price">상품가격</label>
	<input type="number" name="price" id="price">
</div>

<div class="form-group">
	<label for="amount">상품수량</label>
	<input type="number" name="amount" id="amount">
</div>

<div class="form-group">
	<label>상품소개</label>
	<textarea name="content" id="content" style="width: 100%;"></textarea>
</div>

<div class="form-group">
	<label>이미지</label>
	<input type="file" name="img" id="img">
</div>

</form>
<div class="text-center">
	<button id="btnWrite" class="btn btn-primary">작성</button>
	<button id="btnCancel" class="btn btn-danger">취소</button>
</div>


</div>


<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({ 
	oAppRef: oEditors,
 	elPlaceHolder: "content", //에디터가 적용될 <textarea>의 id 적기 
 	sSkinURI: "/resources/se2/SmartEditor2Skin.html",
 	fCreator: "createSEditor2" 
}) 
</script>

<c:import url="../layout/footer.jsp" />