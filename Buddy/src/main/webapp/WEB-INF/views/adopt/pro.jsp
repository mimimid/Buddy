<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Buddy</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style type="text/css">

.div_style {
 display:inline-block;
 position:relative;
 width:172px;
 height:120px;
 margin:5px;
 z-index:1;
}
.img_style {
width:100%;
height:100%;
border-radius:0.5em;
z-index:none;
}
.chk_style {
width:30px;
height:30px;
position:absolute;
margin-bottom:5px;
font-size:25px;
font-weight:bold;
border:none;
right:0px;
bottom:88px;
border-radius:0.2em;
z-index:999;
background-color:rgba(255,255,255,0.6);
color:#f00';
}

.img_wrap{
width: 180px;
height: 300px;
background-color: yellow;
}

#panel{
width:100%;
height: 200px;
margin: 50px 0px;

}
#panel_img{
width:100%;
height: 100%;
}
</style>
</head>
<body>
<div class="container">

<div id="panel">
<img id="panel_img" src="/resources/img/sample_adopt/sample1.jpg" alt="panel">
</div>

<div class="img_wrap">
<div class="div_style">
<img src="/resources/img/sample_adopt/sample1.jpg" alt="..." class="img_style">
<div class="chk_style"></div>
</div>


</div>



</div>
</body>
</html>