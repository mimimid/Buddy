<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="${path}/resources/css/reset.css">
  <link rel="stylesheet" href="${path}/resources/css/index.css">
  <script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<meta charset="UTF-8">
<title>공지리스트 ajax</title>
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

</style>
</head>
<body>
 <c:forEach items="${list }" var="i">
    <div class="inner" style=" cursor: pointer;" onclick="location.href='/notice/detail?noticeno=${i.NOTICE_NO }';">
      <a href="#" class="prev top">
        <div class="left">
          <div class="next">${i.RNUM }</div>
          <div class="next_tit">
            <p>${i.TITLE }</p>
            <p>관리자 ｜ 조회수 ${i.HIT } ｜ 댓글 수 
             <c:if test="${empty i.CNT_COMMENT }">
				0
           </c:if>
           <c:if test="${not empty i.CNT_COMMENT }">
				${i.CNT_COMMENT }
           </c:if>
           </p>
          </div>
        </div>
        <div class="right">
          <div class="next_img"><img alt="image" src="/upload/${i.STOREDNAME }"/></div>
        </div>
      </a>   
    </div>
    </c:forEach>
    
    <c:import url="../layout/paging.jsp" />
</body>
</html>