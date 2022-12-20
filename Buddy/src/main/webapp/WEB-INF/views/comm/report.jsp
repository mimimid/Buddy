<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BUDDY</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	$("#userno").val(opener.document.getElementById("userno").value)
	
	$("#btnReport").click(function() {
		$("form").submit();
	})
	
	$("#btnCancel").click(function() {
		window.close();
	})
	
})
</script>

</head>
<body>

<h1>신고</h1>

<form action="./report" method="post">

<input type="hidden" name="commNo" value="${commBoard.commNo }">
<input type="hidden" id="userno" name="userno" value="${userno }">

<div class="form-group">
	<label for="content">본문</label>
	<textarea rows="10" style="width: 100%;" id="content" name="commReportContent"></textarea>
</div>

</form>

<div class="text-center">
	<button class="btn btn-primary" id="btnReport">작성</button>
	<button class="btn btn-danger" id="btnCancel">취소</button>
</div>

</body>
</html>