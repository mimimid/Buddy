<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="${path}/resources/css/reset.css">
  <link rel="stylesheet" href="${path}/resources/css/index.css">
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<title>Notice List</title>
<style>
.my.pagination > .active > a, 
.my.pagination > .active > span, 
.my.pagination > .active > a:hover, 
.my.pagination > .active > span:hover, 
.my.pagination > .active > a:focus, 
.my.pagination > .active > span:focus {
  background: black;
  border-color: black;
}

#search {
position: relative; left: 40%;
}
#input1 {
    width: 300px;
    height: 50px;
    background-color: white;
    border: 3px solid black;
    border-radius: 5px;
}
#input2 {
    width: 100px;
    height: 55px;
    background-color: grey;
    border: 3px solid black;
    border-radius: 5px;
}
    
</style>
<script type="text/javascript">
	var curPage = ${curPage }
	 $.ajax({
	  	 type: "GET",
	  	 url: "/notice/list?curPage="+curPage, 
	  	 datatype: "html",
	  	 success: function(data) {
	  	 $(".contents_footer").html(data);
	  }
})

 $(document).ready(function() {
	 
     $("#input2").on("click", function() {
        var keyword = $('#input1').val();
        
    	 $.ajax({
	  	 type: "GET",
	  	 url: "/notice/search?keyword="+keyword+"&curPage="+curPage, 
	  	 datatype: "html",
	  	 success: function(data) {
	  	 $(".contents_footer").html(data);
	  }
})//ajax끝   
        
     });  //검색 버튼 클릭 event 끝

	 
	 
 })
</script>
</head>
<body>
<div id="search">
	<input id="input1" type="text" name="keyword" placeholder="검색어를 입력해주세요!" />
    <button id="input2">검색</button>
</div>
  <section class="contents_footer">
 
  </section>


</body>
</html>


	