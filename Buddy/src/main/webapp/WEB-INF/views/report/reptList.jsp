<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp" />

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
 #panel{
	width:100%;
	height: 400px;
	margin-bottom: 40px;
}
#panel_img{
	width:100%;
	height: 100%;
}
.container{
	padding-top: 0px;
}
</style>


<div class="container">

<div id="panel">
<img id="panel_img" src="/resources/img/sample_adopt/sample1.jpg" alt="panel">
</div>

<h3 style="margin-bottom: 45px;">회계 보고</h3>
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


<c:import url="../layout/footer.jsp" />