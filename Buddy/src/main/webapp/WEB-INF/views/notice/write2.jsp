<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>글쓰기</title>

<link rel="icon" href="/TeamPostype/kimsoyeon/image/pavicon.png"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0">

<style type="text/css">

/* CSS */

* {
   box-sizing: border-box;
   padding: 0;
   margin: 0 auto;
}

.headerBox{
	position: fixed;
    top: 20x;
    width: 1900px;
    height: 60px;
    align-items: center;
    background-color: #fff;
    
}


.nav {
    align-items: center;
    

}

/* 아이콘 CSS */
.arrow {
	display: inline-block;
	margin-left: 350px;
	margin-top: 10px;
}
.menu {
	display: inline-block;
	margin-left: 10px;
}
.add {
	display: inline-block;
	margin-left: 15px;
}
.arrow-left {
	display: inline-block;
	margin-left: 15px;
}
.arrow-right {
	display: inline-block;
	margin-left: 15px;
}
.download {
	display: inline-block;
	margin-left: 520px;
}

.delete {
	display: inline-block;
	margin-left: 12px;
}

.horiz {
	display: inline-block;
	margin-left: 12px;
} 

.headerBox{
	width: 1900px;

}


.inner {
	font-size: 50px;
    font-weight: bolder;
    margin-top: 5px;
    margin-left: 370px;
    display: inline;
    float: left;
    line-height: 50px;
}

.center {
	color: #f0efee;
	font-size: 20px;
	font-weight: bolder;
    margin-top: 80px;
    margin-left: 550px;
}

#title {
	color: #f0efee;
	font-size: 30px;
	font-weight: bolder;
    margin-top: 5px;
    margin-left: 550px;
}

#content {
	color: #070807;
	font-size: 15px;
    margin-top: 5px;
    margin-left: 550px;
   

}

hr {
	width:800px;
}


img {
	margin-top: 0;
	margin-left: 20px;
}

    textarea:focus {
        outline: none;
        
    }
    
      textarea {
    width: 100%;
    height: 20em;
    border: none;
    resize: none;
  }
    
#bt{
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 80px;
  font-size: 20px;
  padding: 8px 15px;
  border: var(--border15);
  border-radius: 4px;
}

</style>

    <script>
      function setThumbnail(event) {
        var reader = new FileReader();

        reader.onload = function(event) {
          var img = document.createElement("img");
          img.setAttribute("src", event.target.result);
          document.querySelector("div#image_container").appendChild(img);
        };

        reader.readAsDataURL(event.target.files[0]);
      }
    </script>

</head>
<body>
	
	<br>

<!-- 제목 / 부제목 -->

<br>
<br>
<div class = "headerBox">
<form action="/notice/admin/write" method="post" enctype="multipart/form-data">
	<div>
		<input type="text" id="title" name="title" placeholder="제목을 입력하세요." style="border:none;">
	</div>	
	<br>	
	<br>
	<br>	
	<hr>
<!--	<label for="upfile1">
 <input class="center" type="file" name="file" id="image" accept="image/*" onchange="setThumbnail(event);"/>
        </label>
        	<label for="upfile1">
<input class="center" type="file" name="file" id="image" accept="image/*" onchange="setThumbnail(event);"/>
        </label>	 -->
        <input class="center" onchange="setThumbnail(event);" type="file" name="itemImgList[]" multiple>
           <div class="center"  id="image_container"></div>
        <hr>
	<br>
	<br>
	<br>	
	<!-- 내용 -->
	<div>
		<textarea class="center" id="content" name="content" placeholder="내용을 입력하세요." style="border:none;"></textarea>
	</div>
	<hr>
<!--<input name="writer" value="${writer}" style="display:none;">-->
 <input name="writer" value="admin" style="display:none;"> 
<input name="hit" value=0 style="display:none;">	
	<br>
	<br>
	<br>
	<button id="bt"
          onmouseleave="changeBgNone()"
          onmouseenter="changeBggray()">확인</button>
</form>
</div>
</body>


<script type="text/javascript">

  function changeBggray() {
		 document.getElementById('bt').style.backgroundColor = '#d3d3d3';
	}

	function changeBgNone() {
		document.getElementById('bt').style.background = "none";
		document.getElementById('bt').style.background = "none";
	}	
		
	
</script>
</html>