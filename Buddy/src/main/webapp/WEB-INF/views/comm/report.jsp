<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
$(document).ready(function() {
	
	$("#btnReport").click(function() {
		$("form").submit();
	})
	
	$("#btnCancel").click(function() {
		close();
	})
	
})
</script>

</head>
<body>

<h1>신고</h1>

<form action="./report" method="post">

<input type="hidden" name="commNo" value="${commNo }">

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