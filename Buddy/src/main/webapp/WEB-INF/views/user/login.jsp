<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp" />


<script type="text/javascript">
$(document).ready(function() {
	$("#cancel").click(function() {
		history.go(-1);
	})
	
	$("#id").focus()
})
</script>


<style type="text/css">
a {
	text-decoration: none;
	color: gray;
}
</style>

<div class="container">

<h1 style="text-align: center;">Login</h1>
<hr>

<div>
<form action="./login" method="post" class="form-horizontal">

<div class="form-group">
	<label for="userid" class="col-sm-4 control-label">아이디</label>
	<div class="col-sm-5">
		<input type="text" class="form-control" id="userid" name="userid" placeholder="아이디 입력">
	</div>
</div>

<div class="form-group">
	<label for="userpw" class="col-sm-4 control-label">패스워드</label>
	<div class="col-sm-5">
		<input type="password" class="form-control" id="userpw" name="userpw" placeholder="패스워드 입력">
	</div>
</div>

<div class="form-group">
	<div class="col-sm-offset-5">
		<button class="btn btn-primary">로그인</button>
		<input type="reset" id="cancel" class="btn btn-danger" value="취소" />
	</div>
</div>

</form>

<div style="text-align: center;">
	<a href="./idFind">아이디 찾기</a> |
	<a href="./pwFind">비밀번호 찾기</a> |
	<a href="./join">회원가입</a>
</div> 

</div>

</div><!-- .container end -->

<c:import url="../layout/footer.jsp" />
