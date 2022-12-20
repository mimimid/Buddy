<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp" />


<!-- 아이디 찾기 ajax 요청 -->
<script type="text/javascript">
$(document).ready(function(){
	$("#btnFind").click(function(){
		console.log("#ajax click")

	
	$.ajax({
		type:"post" //응답메소드방식
		, url:"/user/idFindProc" //응답페이지
		, data:{
			username: $("#username").val(),
			phone: $("#phone").val()
		} //보낼 데이터
		, dataType:"html" //응답 타입
		,success: function(data){ 
			console.log("AJAX 성공") 
			
			//응답데이터 출력
			console.log(data)
			
			$("#result").html(data) // 계속 갱신
			
		}
		, error:function(){
			console.log("AJAX 실패")
		}
	})
})
	
})

</script>

<script type="text/javascript">
$(document).ready(function() {
	$("#username").focus()
})
</script>

<style type="text/css">
#findForm {
	width: 350px;
	
	margin: 0 auto;
}

#btnFind{
	background-color: #FF7A85;
	color: white;
}
#btnLogin{
	background-color: #FF7A85;
	color: white;
}

</style>

<div class="container">
<h1 style="text-align: center;">아이디 찾기</h1>
<hr>

<form action="./idFind" method="post" class="form-horizontal">
	<div id="findForm">
		<div class="form-group">
			<input type="text" name="username" id="username" class="form-control" placeholder="이름을 입력하세요.">
		</div>
		<div class="form-group">
			<input type="text" name="phone" id="phone" class="form-control" placeholder="전화번호를 입력하세요.">
		</div>
		
		<div id="result"></div>
<div style="text-align: center;">
<button type="button" class="btn" id="btnFind">아이디 찾기</button>
<a href="./login" style="color: white;"><button type="button" class="btn" id="btnLogin">로그인으로</button></a>
</div>
</div>
</form>


</div>


<c:import url="../layout/footer.jsp" />