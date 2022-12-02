<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp" />


<!--  -->
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

<style type="text/css">
#findForm {
	width: 450px;
	
	margin: 0 auto;

}

</style>

<div class="container">
<h1 style="text-align: center;">비밀번호 찾기</h1>
<hr>

<form action="./idFind" method="post">
	<div id="findForm">
		<div class="form-group">
			<label for="userid">아이디</label>
			<input type="text" name="userid" id="userid" class="form-control">
		</div>
		<div class="form-group">
			<label for="username">이름</label>
			<input type="text" name="username" id="username" class="form-control">
		</div>
		<div class="form-group">
			<label for="phone">전화번호</label>
			<input type="text" name="phone" id="phone" class="form-control">
		</div>
		
		<div id="result"></div>

<button type="button" class="btn" id="btnFind">비밀번호 찾기</button>
<a href="./login"><button type="button" class="btn">로그인으로</button></a>

</div>
</form>


</div>


<c:import url="../layout/footer.jsp" />