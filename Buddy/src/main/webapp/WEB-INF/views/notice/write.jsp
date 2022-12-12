<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>글쓰기</title>

<style type="text/css">
html {
	font-family:'IBMPlexSanKR-Regular';
	src : urt('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07/IBMPlexSansKR-Regular.woff') format('woff');
	font-weight: normal;
	font-style: normal;
}

.myimage-wrapper {
	align-items: center;
	justify-content: center;
	display: flex;
	flex-direction: row;
	margin-top: 5rem;
}
.myimage-text{
	margin-left: 8rem;
	font-size:1.5rem;
}
.input-image {
	margin-left: 2rem;
}
.form-wrapper {
	display: flex;
	flex-direction: column;
	font-size: 1.5rem;
	font-weight: bold;
	justify-content: center;
	text-align: center;
	height: 25%;
}
.submit_btn {
	display: flex;
	text-align: center;
	width: 100px;
	height: 30px;
	margin: 4rem auto;
	border: 2px solid rgb(141, 141, 141);
	background-color: white;
	border-radius: 2rem;
	align-items:center;
	justify-content: center;
}
.submit_btn:hover {
	cursor: pointer;
	color:white;
	background-color: rgb(141, 141, 141);
}
.submit_btn:focus {
	outline: none;
}
#id_title {
	border: 2px solid rgb(141, 141, 141);
	border-radius: 2rem;
	height: 25px;
	padding: 12 10;
}
#id_content {
	border: 2px solid rgb(141, 141, 141);
	border-radius: 1rem;
	width: 500px;
	height: 400px;
	padding: 12 10;
}
.form-wrapper .input-box input:focus {
	outline: none;
	background-color: rgb(255,250,245);
}
.form-wrapper .input-box textarea:focus {
	outline: none;
	background-color: rgb(255,250,245);
}
.
#id_content: focus {
	outline: none;
	background-color: rgb(255,250,245);

}

</style>

<script>

</script>

</head>
<body>

<form action="/notice/admin/write" method="POST" enctype="multipart/form-data" autocomplete="off"> 

<div class="form-wrapper">
	<div class="title margin">제목</div>
	<div class="input-box margin">
	<input id="id_title" name="title">
	</div>
</div>	

	<div class="form-wrapper">
	<div class="content margin">내용</div>
	<div class="input-box margin"> 
	<textarea id="id_content" name="content"></textarea>
	</div>
</div>


<div class="myimage-wrapper">
	<div class="myimage ">그림 첨부</div>
	<div class="input-image">
	<input class="center" type="file" name="itemImgList[]" multiple>
	</div>
</div>
<input name="writer" type="hidden" value="admin">
<input type="submit" value="작성완료" class="submit_btn">
</form>
</body>
</html>