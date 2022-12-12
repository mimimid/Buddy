<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


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
	
	
	var likeval = ${like};
	
	let hospNo = ${viewHospital.hospNo};
	
	if( likeval == 0 ){ $('#bookmarkBtn').css('color', '#acacac',  'background-color', 'white','border', '1px solid #959595'); }
		
	$('#bookmarkBtn').click(function() {
		
		if( likeval >0 ){
			$.ajax({
				type :"POST"
				, url : '<c:url value ="/hospital/hospview/likedown"/>'
				, data : {"hospNo" : hospNo}		
				,success : function(data) {
					$('#bookmarkBtn').css('color', '#acacac',  'background-color', 'white','border', '1px solid #959595');
					likeval = 0;
				 console.log(likeval);
				}
				, error: function() {
					console.log("취소 실패")
				}
			})
			
		}else {
			
			$.ajax({
				type :"POST"
				, url : '<c:url value ="/hospital/hospview/likeup"/>'
				,data : {"hospNo" : hospNo}		
				,success : function(data) {
					$('#bookmarkBtn').css('color', 'red');
					likeval = 1;
				}, error: function() {
					console.log("실패")
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
			var hospStarrating	= $('input[name="rating"]:checked').val();
			var animal	= $('input[name="animal"]:checked').val();
			var hospNo = ${viewHospital.hospNo}; 
			
			console.log(hospStarrating);
			console.log(animal);
				
			var param={ "hospReviewContent": hospReviewContent, "hospStarrating": hospStarrating, "animal" : animal, "hospNo" : hospNo };

			$.ajax({
				type: "post"	
				, url: "/hospital/reviewwrite"	
				, data: param
				, dataType: "html"	
				, success: function( data ) {
					console.log("AJAX 성공")
					$("#listReview").html( data )
					
					$('input[name="rating"]').removeAttr('checked');
					$('input[name="animal"]').removeAttr('checked');
					$("#reviewcomment").val("")
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
    position: absolute;
    top: 0;
    left: 0;
    transform: translate(50, 50);
    width: 100%;
    height: 100%;
    object-fit: cover;
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
		<span>${viewHospital.hospReviewCnt }개의 리뷰</span>
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
			<div class="animalchk">
				<span>진료받은 동물</span>
				<div>
			 		<label><input type="radio" name="animal" value="강아지">강아지</label>
			 		<label><input type="radio" name="animal" value="고양이">고양이</label>
				</div>
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

<script type="text/javascript">

$(document).ready(function(){	
		var sort = 0;
		if(${empty param.sort}) {
			sort = null;
		}else {
			sort = 1
		}
	    $.ajax({
	    	
	        type: "get" 
	        , url: "/hospital/reviews"	
			, data:  {"hospNo" : ${viewHospital.hospNo}, "sort" : sort }
			, dataType: "html"	
	        , success: function(result){ 
	            $("#listReview").html(result);
	        }
	    });
 
})
</script>


<br>


<!-- 지도 표시 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1535da80f4e7ad62353326cdefd07c10&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('${viewHospital.hospAddress}', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${viewHospital.hospName}</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>



<br><br>



</div><!-- content main 끝 -->
</div><!-- container 끝 -->
</body>
</html>