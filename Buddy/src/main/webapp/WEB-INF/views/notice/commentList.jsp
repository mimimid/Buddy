<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <link rel="stylesheet" href="${path}/resources/css/reset.css">
  <link rel="stylesheet" href="${path}/resources/css/index.css">
  <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
  

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

  <title>Postype</title>
</head>
<body>
<p class="num">총 ${size }개의 댓글</p>
  <!-- 댓글창 -->
  <c:forEach items="${list }" var="i">
        <!-- ------------------------------------------------------------------- -->
         <div class="comment2 comm">
        <input class="commentno" value="${i.NCMT_NO} " style="display:none;">
          <div class="profil_img">
            <i class="xi-profile xi-3x"></i>
          </div>
          <div class="comment_txt">
            <div class="top">
              <div class="user_id">${i.WRITER } </div>
              <div class="day">${i.W_DATE }  <button onclick="md(this)">수정</button><button onclick="dl(this)">삭제</button></div>
            </div>
            <div class="mid">
            ${i.NCMT_CONTENT }
            </div>
            <div class="bottom">
            
             <a onclick="heratadd(this)"> 
         <c:set var="isnone" value="false" />
          <c:forEach items="${likedCmtNoList }" var="j">
           <c:set var="ncmtno" value="${i.NCMT_NO}" />
           <c:if test="${j['NCMT_NO'] eq ncmtno }">
           <c:set var="isnone" value="true" />               
           </c:if>
          </c:forEach>
          <c:if test="${isnone}">
                <i class="card xi-heart"><span style="font-size: 13px; color:red;">${i.LIKECOUNT }</span></i>
          </c:if>
          <c:if test="${not isnone}">
                <i class="card xi-heart-o"><span style="font-size: 13px; color:red;">${i.LIKECOUNT }</span></i>
          </c:if>
           </a>
           
            </div>
          </div>
        </div> 
        <!-- ------------------------------------------------------------------- -->

</c:forEach>




</body>
</html>