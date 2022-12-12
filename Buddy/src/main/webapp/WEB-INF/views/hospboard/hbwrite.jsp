<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>



<!-- 스마트 에디터 2 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>


<script type="text/javascript">
$(document).ready(function() {
	
	//작성버튼
	$("#btnWrite").click(function() {
		
		//스마트 에디터에 작성된 내용을 #content에 반영
		updateContents();
		
		$("form").submit();
	})

	
	$("#upload").change(function( e ) {
		console.log("#upload change")
 
		var files = e.target.files;
		
		if( !files[0].type.includes( "image") ) {
		
			return false;
			
		}
		
		//---------------------------
		
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

<style type="text/css">

select option[value=""][disabled] {
	display: none;
}

</style>

</head>
<body>


<div class="container">



<h1>글쓰기</h1>
<hr>



<form action="./hbwrite" method="post" enctype="multipart/form-data" class="form-horizontal">

<div class="form-group">
 	<input type="checkbox" id="hbtop" name="hbtop" value="1">
 	<label for="hbtop"> 이 게시물을 상단에 고정</label>
</div>

<div class="form-group">
 	<label for="userno">작성자</label>
 	<input type="text" name="userno" value="${userno }" class="form-control" readonly="readonly">
</div>

<div class="form-group">
 	<label for="hbtitle">제목</label>
 	<input type="text" id="hbtitle" name="hbtitle" class="form-control">
</div>

<div class="form-group">
 	<label for="hbcategory">카테고리</label>
 	<select id="hbcategory" name="hbcategory"  class="form-control">
 		<option value="" selected disabled>카테고리를 선택해주세요</option>
 		<option>동병QnA</option>
 		<option>건강검진</option>
 		<option>약처방</option>
 		<option>진료비</option>
 		<option>수의사 정보</option>
 	</select>
</div>

<div class="form-group">
 	<label for="animal">반려동물</label>
 	<label><input type="radio" name="animal" value="강아지" checked>강아지</label>
 	<label><input type="radio" name="animal" value="고양이">고양이</label>
 	
</div>



<div class="form-group">
 	<label for="hbcontent">본문</label>
 	<textarea id="hbcontent" name="hbcontent" rows="10" style="width: 100%;"></textarea>
</div>

<div class="form-group">
 	<label for="file">첨부파일</label>
 	<input type="file" id="upload" name="file">
 	<div id="preview"></div>
</div>

<div class="text-center">
	<button type="button" id="btnWrite" class="btn btn-primary">작성</button>
	<button type="button" onclick="history.back()" class="btn btn-danger" > 취소</button>
</div>


</form>




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

</body>
</html>