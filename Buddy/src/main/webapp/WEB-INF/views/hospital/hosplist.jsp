<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<c:import url="../layout/header.jsp" />






<style type="text/css">

.img-wrapper {
    position: relative;
    height: 150px;
}
.img-wrapper a img {
    position: absolute;
    top: 0;
    left: 0;
    transform: translate(50, 50);
    width: 100%;
    height: 100%;
    object-fit: cover;
    margin: auto;
}

.thumbnail {min-height: 305px;}


.search-text { padding-top: 6px; padding-left: 5px; font-size: 17px; }

.well { background-image: linear-gradient(to bottom,#ffffff 0,#f5f5f5 100%); }
</style>


<div class="container">

<h1><a href="/hospital/hosplist">병원 목록</a></h1>
<br>



<hr>
<div>

<div class="collapse" id="collapseExample">
  <div class="well">
    ...
  </div>
</div>
</div>
<hr>
<div>
<input type="checkbox" id="hour24" name="hour24">
<label for="hour24">24시간 진료</label>

</div>
<div class="search-wrapper clearfix">
	<div class="pull-right">
			 <form action="./hosplist" method="get" class="form-inline clearfix">
	 			<select class="form-control"  name="searchType" id="searchType">
					<option>병원이름</option>
					<option>지역</option>
				</select>
			 <input type="text" name="keyWord" class="form-control" id="keyWord" value="${param.keyWord}">
			 <button id="btnSearch"type="button" class="btn" style="background-color:#fad703" >검색</button>
			 </form>
	 </div>
	
	<div class="pull-left search-text">
		<c:if test="${not empty param.keyWord }">
		<span>[${param.searchType }] <mark>'${param.keyWord }'</mark> 검색 결과 입니다.</span> 
		</c:if>
	</div>
</div>
<br>




<div class="hospitalList">
<div class="row">
<c:forEach items="${hospList }" var="hospList">
  <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
   	  <div class="img-wrapper">
    	<a href="./hospview?hospNo=${hospList.hospNo }">
    	<c:choose>
    		<c:when test="${not empty hospList.hospPic.hpicNo }">
    			<img src="/upload/${hospList.hospPic.hpicStoredName }" alt="..." class="img-responsive img-rounded">
    		</c:when>
    		<c:when test="${empty hospList.hospPic.hpicNo }">
		      <img src="../resources/img/hospPic.PNG" alt="..." class="img-responsive img-rounded">
    		</c:when>
    	</c:choose>
    	</a>
   	  </div>
      <div class="caption">
        <h3><a style="color: black;" href="./hospview?hospNo=${hospList.hospNo }">${hospList.hospName }</a></h3>
        
        <p><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> ${hospList.hospAddress }</p>
        <span>평가 ${hospList.hospRate } | </span>
      	<span>리뷰 ${hospList.hospReviewCnt }개</span>
      </div>
    </div>
  </div>
  
</c:forEach>
</div> 

</div> <!-- hospitalList 끝 -->


<button id="btnWrite" class="btn btn-primary pull-left">글쓰기</button>
<span class="pull-right">total : ${paging.totalCount }</span>

<div class="clearfix"></div>

<c:import url="/WEB-INF/views/hospital/hosppaging.jsp" />

</div><!-- .container -->

<script type="text/javascript">
$(document).ready(function() {
	
	$("#btnWrite").click(function() {
		location.href = "/hospital/hospwrite"
	})


	$("#btnSearch").click(function() {
		
		if( $("#keyWord").val() == "" ) {
			alert('검색어를 입력해주세요!');
 
			$("input").eq(0).focus()
			
		} else {
			$("form").submit();
		}
	})


	
})




</script>





</body>
</html>