<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {

	$("#kakao").click(function(){
		
	$.ajax({
		 url:"/shopping/kakao" //응답페이지
		, dataType:"json" //응답 타입
		,success: function(data){ 
			
			var box = data.next_redirect_pc_url;
			window.open(box);
		
			
		}
		, error:function(){
			console.log("AJAX 실패")
		}
	})
})
	
})
</script>

<div class="container">

<h1 style="text-align: center;">결제하기</h1>
<hr>

<button type="button" id="kakao">카카오</button>

</div><!-- .container end -->

<c:import url="../layout/footer.jsp" />