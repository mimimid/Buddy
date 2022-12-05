<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp" />


<!-- 비밀번호 찾기 ajax요청 -->
<script type="text/javascript">
$(document).ready(function(){
	$("#btnFind").click(function(){
		console.log("#ajax click")

	
	$.ajax({
		type:"post" //응답메소드방식
		, url:"/user/pwFindProc" //응답페이지
		, data:{
			userid : $("#userid").val(),
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
	$("#userid").focus()
})
</script>

<style type="text/css">
#findForm {
	width: 350px;
	
	margin: 0 auto;

}

</style>

<div class="container">
<h1 style="text-align: center;">PW Find</h1>
<hr>

<form action="./idFind" method="post" class="form-horizontal">
	<div id="findForm">
		<div class="form-group">
			<input type="text" name="userid" id="userid" class="form-control" placeholder="아이디를 입력하세요.">
		</div>
		<div class="form-group">
			<input type="text" name="username" id="username" class="form-control" placeholder="이름을 입력하세요.">
		</div>
		<div class="form-group">
			<input type="text" name="phone" id="phone" class="form-control" placeholder="전화번호를 입력하세요.">
		</div>
		
		<div id="result"></div>
<div style="text-align: center;">
<button type="button" class="btn btn-primary" id="btnFind">비밀번호 찾기</button>
<a href="./login"><button type="button" class="btn btn-success">로그인으로</button></a>
</div>
</div>
</form>


</div>


<c:import url="../layout/footer.jsp" />