<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:forEach items="${commList }" var="cm">

<div class="media">
	<div class="media-left media-middle">
		<div class="media-object" style="padding: 5px;">
			<span class="glyphicon glyphicon-user" style="font-size: 40px;"></span>
		</div>
	</div>

	<div class="media-body text-left">
		<h4 class="media-heading">${cm.userno } <small><fmt:formatDate value="${cm.writeDate }" pattern="yy-MM-dd HH:mm:ss"/></small></h4>
		${cm.cmContent }
		<div>
			<span>수정</span> /
			<span>삭제</span>
		</div>
	</div>
</div>

</c:forEach><!-- 댓글창 끝 -->

</body>
</html>