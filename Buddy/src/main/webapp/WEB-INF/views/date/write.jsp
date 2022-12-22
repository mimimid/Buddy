<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BUDDY</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<!-- 서머노트 -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<!-- 서머노트를 위해 추가해야할 부분 -->
<script src="/resources/summernote/summernote-lite.js"></script>
<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">

<!--  다음 주소찾기 로드 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- 아이콘 -->
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css'>

<script type="text/javascript">
$(document).ready(function() {
	
	$('#summernote').summernote({
		placeholder: '내용을 작성해주세요.',
		'width': '100%',
		height: 500,
		lang: "ko-KR",
		disableResizeEditor: true
	});
	
	//작성버튼 클릭
	$("#btnWrite").click(function() {
		
		var title = $("#title").val()
		var dateCate = $("#dateCate").val()
		var content = $("#summernote").val()
		var dateCateNon = $("#dateCate option:selected").val()
		
		if( title == "" ) {
			alert("제목을 작성해주세요.")
		} else {
			if( dateCateNon == "카테고리" ) {
				alert("카테고리를 선택해주세요.")
			} else {
				
				if( content == "" ) {
					alert("내용을 입력해주세요.")
				} else {
					console.log("작성하기!")
					alert("작성되었습니다.")
					$("form").submit();
				}
				
			}
		}
		
	})

	//취소버튼클릭
	$("#btnCancle").click(function() {
		history.go(-1);
	})
	
})
</script>

<style type="text/css">

.wrap {
	margin: 0 auto;
	width: 100%;
}

#navLogo {
	font-weight: bold;
}

#write {
	margin-top: 50px;
}

div.row>div {
	margin: 5px;
}

#btnWrite {
    background-color: #ff7a85;
    color: #fff;
}

</style>

</head>
<body>
<div class="wrap">

<!-- 상단바 -->
<nav class="navbar bg-light">
	<div class="container-fluid">
		<a id="navLogo" class="navbar-brand" href="/">
			<i class="fi fi-rr-edit" style="color: #ff7a85;"></i>
			BUDDY
		</a>
		<div class="d-flex">
			<button id="btnCancle" class="btn btn-sm" type="button">취소</button>
			<button id="btnWrite" class="btn btn-sm" type="submit">작성</button>
		</div>
	</div>
</nav>

<!-- 작성 -->
<div class="container">


<div id="write" class="container-fluid">
<form action="/date/write" method="post" enctype="multipart/form-data" class="form-horizontal">
<div class="row">
	<div class="form-group col-5">
		<input type="text" class="form-control" placeholder="제목을 입력해주세요." id="title" name="title">
	</div>
	
	<div class="form-group col-2">
		<select class="form-select" aria-label="Default select example" id="dateCate" name="dateCate">
			<option selected>카테고리</option>
			<option value="1">카페</option>
			<option value="2">호텔</option>
			<option value="3">훈련소</option>
			<option value="4">여행지</option>
		</select>
	</div>
	
	<div class="form-group">
		<div class="input-group mb-6">
			<input type="text" id="datePostNo" class="form-control" placeholder="우편번호" aria-label="Recipient's username" aria-describedby="button-addon2">
			<input class="btn btn-outline-secondary" type="button" id="button-addon2" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
			<input type="text" id="top_address" class="form-control" placeholder="도로명 주소">
			<input type="text" id="detailAddress" class="form-control" placeholder="상세주소">
			<input type="text" id="loc"  name="loc" class="form-control" value="" style="display: none;">
		</div>
	</div>

	<div class="form-group col-5">
		<div class="input-group">
			<label class="input-group-text" for="upload">첨부파일</label>
			<input type="file" class="form-control" id="upload" name="file">
		</div>
	</div>
	
</div>

<div class="row">
<div class="form-group">
	<textarea id="summernote" class="form-control" rows="5" name="content"></textarea>
</div>
</div>
</form>
</div>


</div><!-- 작성END -->

<script type="text/javascript">
//스마트 에디터에 작성된 내용을 #content에 반영한다
function updateContents() {
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [])
}
	
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {

            var addr = ''; 
            var extraAddr = ''; 


            if (data.userSelectedType === 'R') { 
                addr = data.roadAddress;
            } else { 
                addr = data.jibunAddress;
            }

            document.getElementById('datePostNo').value = data.zonecode;
            document.getElementById("top_address").value = addr;
           	document.getElementById("loc").value = addr;

            document.getElementById("detailAddress").focus();
        }
    }).open();
}
    
function addAddress()  {
 	
  var topAddress = document.getElementById("top_address").value
  var detailAddress = document.getElementById('detailAddress').value;

  var all = topAddress + ' ' + detailAddress;
 $('#loc').val(all);
}

</script>


</div>
</body>
</html>