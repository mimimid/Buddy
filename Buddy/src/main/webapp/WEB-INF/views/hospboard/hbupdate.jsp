<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:import url="../layout/header.jsp" />


<!-- 스마트 에디터 2 로드 -->
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

</style>



<div class="container">



<h1>글쓰기</h1>
<hr>



<form action="./hbupdate" method="post" enctype="multipart/form-data" class="form-horizontal">


<input type="hidden" name="hbno" value="${param.hbno}">

<div class="form-group">
 	<input type="checkbox" id="hbtop" name="hbtop" value="1">
 	<label for="hbtop"> 이 게시물을 상단에 고정</label>
</div>

<div class="form-group">
 	<label for="userno">작성자 번호</label>
 	<input type="text" name="userno" value="${userno }" class="form-control" readonly="readonly">
</div>

<div class="form-group">
 	<label for="hbtitle">제목</label>
 	<input type="text" id="hbtitle" name="hbtitle" class="form-control" value="${updateBoard.hbtitle}">
</div>

<div class="form-group">
 	<label for="hbcategory">카테고리</label>
 	<select id="hbcategory" name="hbcategory" id="hbcategory" class="form-control">
 		<!-- <option value="0" selected>카테고리를 선택해주세요</option> -->
 		<option value="동병QnA">동병QnA</option>
 		<option value="건강검진">건강검진</option>
 		<option value="약처방" >약처방</option>
 		<option value="진료비">진료비</option>
 		<option value="수의사 정보">수의사 정보</option>
 	</select>
</div>

<div class="form-group">
 	<label for="animal">반려동물</label>
 	<label><input type="radio" name="animal" value="강아지">강아지</label>
 	<label><input type="radio" name="animal" value="고양이">고양이</label>
</div>



<div class="form-group">
 	<label for="hbcontent">본문</label>
 	<textarea id="hbcontent" name="hbcontent" rows="10" style="width: 100%;">${updateBoard.hbcontent}</textarea>
 	
</div>

<div class="form-group">
	<div id="fileBox">
		<div id="originFile">
			<a href="/board/downHospBoard?hbfileno=${boardFile.hbfileno }">${boardFile.hbfileoriginname }</a>		
			<span id="deleteFile">X</span>
		</div>
		<div id="newFile">
		 	<label for="file">새로운 첨부파일</label>
		 	<input type="file" id="upload" name="file">
		 	<div id="preview"></div>
		</div>
 	</div>
</div>

<div class="text-center">
	<button id="btnUpdate" class="btn btn-primary">수정</button>
	<button type="button" onclick="history.back()" class="btn btn-danger" > 취소</button>
</div>


</form>


<script type="text/javascript">
$(document).ready(function() {
	
	var dog = '강아지';
	var animal = '${updateBoard.animal}';
	
	if(dog == animal) {
		console.log("'강아지가 맞음'");
		$('input:radio[name=animal]:input[value="강아지"]').attr("checked", true);
	} else {
		$('input:radio[name=animal]:input[value="고양이"]').attr("checked", true);
	}
	
	
	if(${updateBoard.hbtop} == 1) {
		$("#hbtop").attr("checked", "on")
	}
	
	
	console.log('기존 카테고리 : ${updateBoard.hbcategory}');
	$("#hbcategory").val("${updateBoard.hbcategory}").prop("selected", true);
	
	
	
	//작성버튼
	$("#btnUpdate").click(function() {
		
		//스마트 에디터에 작성된 내용을 #content에 반영
		updateContents();
		
		$("form").submit();
	})
	
	
	if( ${empty boardFile} ) {
		$("#newFile").show()
	}else {
		$("#originFile").show()
	}
	

	$("#deleteFile").click(function() {
		$("#newFile").toggle()

		$("#originFile").toggleClass("through")
	}) 	
	
	
	$("#upload").change(function( e ) {
		console.log("#upload change")
 
		var files = e.target.files;
		
	
		if( !files[0].type.includes( "image") ) {
		
		
			return false;
			
		}
		
		//---------------------------
		
		//FileReader 객체 생성
		var reader = new FileReader();
		
		reader.onload = function( ev ) {
			console.log( ev.target.result )
			console.log( this.result ) //ev.target.result와 같은 식
		
			$("#preview").html(
				$("<img>").attr( {
					"src": ev.target.result
					,"width" : 200
				})
			)
		}
		
		//선택된 파일을 DataURL 형식으로 읽어들이기
		reader.readAsDataURL( files[0])
		
	})	
	
	
	
})


function updateContents() {
	//스마트 에디터에 작성된 내용을 #content에 반영한다
	oEditors.getById["hbcontent"].exec("UPDATE_CONTENTS_FIELD", [])
}
</script>




<!-- 스마트 에디터 스킨 적용 -->
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
oAppRef: oEditors,
elPlaceHolder: "hbcontent", //에디터가 적용될 <textarea>의 id 적기
sSkinURI: "/resources/se2/SmartEditor2Skin.html",
fCreator: "createSEditor2"
})
</script>





</div><!-- .container end --> 


<c:import url="../layout/footer.jsp" />