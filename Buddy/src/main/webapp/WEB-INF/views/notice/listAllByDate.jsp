<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <style>
  /* 웹소설 페이지의 내부 메뉴의 가운데 정렬과 ·제거 */
.in-menu {
   text-align: center;
   list-style-type: none;
   font-weight: bold; 
}

/* 웹소설 페이지의 내부 메뉴의 영역 */
.in-menu1, .in-menu2, .in-menu3, .in-menu4, .in-menu5,
.in-menu6, .in-menu7, .in-menu8, .in-menu9 {
   display: inline-block;
   padding: 5px;
}


/* 탑 배너의 배경 사이즈, 색 */
.top-banner {
   background-color: #bfbfbf;
   background-size: 250px 200px;
   height: 145px;
   width: 1500px;
    margin: auto;
}

/* 탑 배너의 글씨 */
.title{
   font-size: 33px;
   font-weight: 500;
   text-align: center;
    padding : 53px 0px;
}

</style>
</head>
<body>


   <!-- 탑 배너 -->
   <div class="top-banner">
      <div class="title">공지사항</div>
   </div>
   
   
   <!-- 웹소설 페이지의 내부 메뉴 - >외부 메뉴와 동작이 같다 -->
   <div id="menu">
      <div class="in-menu">
         <a class="in-menu1" href="#">공지사항</a>
         <a class="in-menu2" href="#">이벤트</a>
      </div>
   </div>
   
   <br>
   
   
  <!-- 공지사항 글목록 -->
  <c:forEach items="${list}" var="list">
  <section class="contents_footer">
    <div class="inner">
      <a href="#" class="prev top">
        <div class="left">
          <div class="next">1</div>
          <div class="next_tit">
            <p>공지사항입니다</p>
            <p>관리자       작성일      공지사항      조회수</p>
          </div>
        </div>
        <div class="right">
          <div class="next_img"></div>
        </div>
      </a>
    <hr>
    </div>
  </section>
  
    <section class="contents_footer">
    <div class="inner">
      <a href="#" class="prev top">
        <div class="left">
          <div class="next">1</div>
          <div class="next_tit">
            <p>공지사항입니다</p>
            <p>관리자       작성일      공지사항      조회수</p>
          </div>
        </div>
        <div class="right">
          <div class="next_img"></div>
        </div>
      </a>
    <hr>
    </div>
  </section>
  
  
    <section class="contents_footer">
    <div class="inner">
      <a href="#" class="prev top">
        <div class="left">
          <div class="next">1</div>
          <div class="next_tit">
            <p>공지사항입니다</p>
            <p>관리자       작성일      공지사항      조회수</p>
          </div>
        </div>
        <div class="right">
          <div class="next_img"></div>
        </div>
      </a>
    <hr>
    </div>
  </section>
  </c:forEach>
  
  
</body>
</html>