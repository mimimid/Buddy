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

<script type="text/javascript">
$(document).ready(function() {

		var reptTitle = $("#keyword").val();
		console.log(reptTitle);
	
			$.ajax({
			type: "get"
			, url: "/report/reptList_ajax?reptTitle=${param.reptTitle }&&curPage=${param.curPage }"
			, data: {}
			, dataType: "html"
			, success: function( reptTitle ) {
				console.log("AJAX 성공")
				
				console.log( reptTitle )
				
				$("#result").html( reptTitle )
				
			}
			, error: function() {
				console.log("AJAX 실패")
			}
		})
	
		$("#keyword").keyup(function () {
		
		var reptTitle = $("#keyword").val();
		console.log(reptTitle);
	
			$.ajax({
			type: "get"
			, url: "/report/reptList_ajax?reptTitle="+ reptTitle + "&&curPage=${param.curPage }"
			, data: {}
			, dataType: "html"
			, success: function( reptTitle ) {
				console.log("AJAX 성공")
				
				console.log( reptTitle )
				
				$("#result").html( reptTitle )
				
			}
			, error: function() {
				console.log("AJAX 실패")
			}
			})
		})
		
		$("#reptWrite").click(function() {
			location.href = "/report/reptWrite"
		})
})

</script>


<style type="text/css">
thead {
    height: 51px;
    border-top: 2px solid darkgrey;
}
td:nth-child(2) { 
	text-align: left;
 }
td {
	height: 51px;
 }
 
 #total {
	display: inline-block;
    padding: 10px 10px 0px 10px;
    margin-left: 5px;
    border-bottom-style: inset;
 }
</style>
</head>
<body>

<div class="container">

<h3>회계 보고</h3>
<hr>
<div>
<button id="reptWrite" class="btn pull-left">글쓰기</button>
<div id="total">
<span>total : ${total } </span>
</div>

      <!-- 검색창 -->
      <form class="navbar-form navbar-right" role="search" method="post">
        <div class="form-group">
          <input id="keyword" name="reptTitle"  type="text" class="form-control" placeholder="">
        </div>
        
        <!-- 검색 버튼 -->
        <button type="button" class="btn">
         	<a href="/report/reptList"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a> 
        </button>
      </form>
</div>


<div id="result"></div>




</div><!-- .container -->


</body>
</html>