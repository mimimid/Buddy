<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    

<c:import url="../layout/header.jsp" />


<style type="text/css">

.stars fieldset{ display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/ 
				direction: rtl; /* 이모지 순서 반전 */  
				border: 0; /* 필드셋 테두리 제거 */ }
.stars input[type=radio]{ display: none; /* 라디오박스 감춤 */ }
.stars input[type=radio]:checked ~ label{ text-shadow: 0 0 0 #ffd54c; /* 마우스 클릭 체크 */ }
.stars label{ 	font-size: 23px; /* 이모지 크기 */  
				color: transparent; /* 기존 이모지 컬러 제거 */ 
				text-shadow: 0 0 0 #e6e5e5; /* 새 이모지 색상 부여 */ }
.stars label:hover{ text-shadow: 0 0 0 #ffd54c; /* 마우스 호버 */}
.stars label:hover ~ label{ text-shadow: 0 0 0 #ffd54c; /* 마우스 호버 뒤에오는 이모지들 */ }



.img-wrapper {
    position: relative;
    width: 700px;
    height: 300px;
}
.img-wrapper img {
    transform: translate(50, 50);
    width: 100%;
    height: 100%;
    margin: auto;
}

.content-main { max-width: 700px; }

.btn-menu { padding-bottom: 10px; }

#bookmarkBtn { margin-top: 20px;, margin-bottom: 10px; }


</style>


</head>
<body>


<div class="container">



<h1>병원 상세 정보</h1>
<hr>
<br>



<div class="content-main center-block">

<!-- 버튼 -->
<div class="btn-menu"> 
	<button  class="btn" onclick="history.back()" >목록</button>
	<button class="btn" type="button" id="btnUpdate">수정</button>
	<button class="btn btn-danger" type="button" id="btnDelete">삭제</button>
</div>

<!-- 기본 설명 -->
<div class="hosp-top-content">

	<div class="img-wrapper center-block">
		<c:choose>
    		<c:when test="${not empty hospPic.hpicNo }">
    			<img src="/upload/${hospPic.hpicStoredName }" alt="..." class="img-responsive img-rounded">
    		</c:when>
    		<c:when test="${empty hospPic.hpicNo }">
		      <img src="../resources/img/hospPic.PNG" alt="..." class="img-responsive img-rounded">
    		</c:when>
    	</c:choose>
	</div>
	
	<div class="hosp-top-content clearfix">
		  <h2 class="pull-left">${viewHospital.hospName }</h2>
		  
		  <button id="bookmarkBtn" class="btn pull-right" type="button" style="color:red">
			  <span class="glyphicon glyphicon-bookmark" aria-hidden="true"></span>
			  <span>관심</span>
		  </button>
	</div> 
	
	<div class="hosp-top-content hosp-simple-info clearfix">
		<span>별그림</span>
		<span>${viewHospital.hospRate }</span>
		<span class="glyphicon glyphicon-comment" aria-hidden="true"></span>

	</div>

	<div class="hosp-top-content hosp-address clearfix">
		<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
		<span>${viewHospital.hospAddress }</span>
	</div>

</div><!-- hosp-top-content END -->

<hr>


<div class="hosp-info">

  <div>
  
	  <div  class="hosp-info info-detail">
	  	<h3>진료시간
	  	<c:if test="${viewHospital.hosp24 == 1 }">
	  	<span class="label label-danger" style="font-size: 11px;">  24시간</span>
	  	</c:if>
	  	</h3>
	  	<br>
	  	<span>평일 : ${viewHospital.hospWeekday }</span><br>
	  	<span>토요일 : ${viewHospital.hospSat }</span><br>
	  	<span>일요일 : ${viewHospital.hospSun }</span><br>
	  	<br>
	  	<span>점심 시간 : ${viewHospital.hospLunchhour }</span>
	  </div>
	  
	  <div class="hosp-info info-detail">
	  		<h3>병원 소개</h3>
	  		<c:if test="${viewHospital.hospContent.equals('-')}">
	  		<span>소개글이 아직 없습니다.</span>
	  		</c:if>
	  		<span>${viewHospital.hospContent }</span>
	  </div>
	  
	  <div class="hosp-info info-detail">
	  	<h3>전화번호</h3>
	  	<span>${viewHospital.hospTel }</span>
	  </div>
	  
	  <div class="hosp-info info-detail">
	  	<h3>위치</h3>
	  	<span>도로명 주소 : </span>
	  	<span>${viewHospital.hospAddress }</span><br>
		<div id="map" style="width:100%;height:350px;"></div>
	  </div>
	  
  </div>
</div>
<br><br>


<div>

	<div  class="form-inline"> 
	
		<div class="starSelect animalSelect"> 
			<div class = "stars">
				<span>별점을 매겨주세요</span>
				 <fieldset>
			        <input type="radio" name="rating" value="5" id="rate1"><label for="rate1">⭐</label>
			        <input type="radio" name="rating" value="4" id="rate2"><label for="rate2">⭐</label>
			        <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
			        <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
			        <input type="radio" name="rating" value="1" id="rate5"><label for="rate5">⭐</label>
			    </fieldset>
			</div>
		</div>
		
		<div>
			<textarea class="form-control" id="reviewcomment" placeholder="병원 이용 후기를 남겨주세요"></textarea>
		</div>
		
		<div>
		<button class="btn" type="button" id="btnReview" style="background-color:#104138; color: white;">리뷰 작성</button>
		</div>
		
	</div>

<br>


<!-- 리뷰 목록 -->
<div id="listReview"></div>

</div>



<br>


<!-- 지도 표시 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1535da80f4e7ad62353326cdefd07c10&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

var map = new kakao.maps.Map(mapContainer, mapOption); 

var geocoder = new kakao.maps.services.Geocoder();
geocoder.addressSearch('${viewHospital.hospAddress}', function(result, status) {

     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;"></div>'
        });
        infowindow.open(map, marker);

        map.setCenter(coords);
    } 
});    
</script>


<script type="text/javascript">
$(document).ready(function() {

	$("#btnUpdate").click(function() {
		location.href = "/hospital/hospupdate?hospNo=${viewHospital.hospNo }"
	})

	$("#btnDelete").click(function() {
		
		var result = confirm("정말 삭제 하시겠습니까?");
		if (result) {
			location.href = "/hospital/hospdelete?hospNo=${viewHospital.hospNo }"
		   }
		   else {
		     return false
		   }

	})
	
			
	$('#bookmarkBtn').click(function() {
		
		if( true ){
			$.ajax({
				type :"POST"
				, url : '<c:url value ="/hospital/hospview/likedown"/>'
				, data : {"hospNo" : hospNo}		
				,success : function(data) {
					$('#bookmarkBtn').css('color', '#acacac',  'background-color', 'white','border', '1px solid #959595');
	
				}
				, error: function() {
			
				}
			})
			
		}else {
			
			$.ajax({
				type :"POST"
				, url : '<c:url value ="/hospital/hospview/likeup"/>'
				,data : {"hospNo" : hospNo}		
				,success : function(data) {
					$('#bookmarkBtn').css('color', 'red');
					
				}, error: function() {
				
				}
			})
			
		}
	}) 
	

	var isAjaxing = false;
	
	$("#btnReview").click(function() {
		
		if(isAjaxing){
			alert("처리중입니다. 잠시만 기다려주세요")
			return;
		}
		isAjaxing = true;
		
		if( !$('input:radio[name=rating]').is(':checked') ) {
				alert('별점을 매겨주세요');
				$('input[name="rating"]').focus()
				return false;
		}else if(!$('input:radio[name=animal]').is(':checked')) {
			alert('동물을 선택해주세요');
			$('input:radio[name=animal]').focus()
		} else if( $("#reviewcomment").val() == "" ) {
				alert('리뷰 내용을 입력해주세요!');
				$("#reviewcomment").focus()
				
		}else {
				
			var hospReviewContent  = $("#reviewcomment").val(); 

			$.ajax({
				type: "post"	
				, url: "/hospital/reviewwrite"	
				, data: { "hospReviewContent": hospReviewContent}
				, dataType: "html"	
				, success: function( data ) {
					console.log("AJAX 성공")
					$("#listReview").html( data )
			
					setTimeout(function(){ isAjaxing = false;},1000);
				}
				, error: function() {
					console.log("AJAX 실패")
					setTimeout(function(){ isAjaxing = false;},1000);
				}
			})
		}		
	}) 
	
		
	
})
</script>


<br><br>



</div><!-- content main 끝 -->
</div><!-- container 끝 -->



<c:import url="../layout/footer.jsp" />