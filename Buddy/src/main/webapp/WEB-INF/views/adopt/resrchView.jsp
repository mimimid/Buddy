<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Buddy</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style type="text/css">
.text-center {
	margin: 80px 0px;
}
.must {
	color: red;
}

.zone {
	width: 100%;
	min-height:153px;
	padding:10px;
	border: 1px dotted darkgray;
    border-radius: 0.5em;
}

.imgIdWrap {
	display: inline-block;
	width: 172px;
	height: 120px;
	margin: 5px;
}
.View {
	width: 100%;
	height: 100%;
	border-radius: 0.5em;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#exit").click(function() {
		location.href = "/adopt/resrchList"
	})
	
	$("#checking1").click(function() {
		location.href = "/adopt/resrchUpdate?adoptNo=${viewResearch.adoptNo }&&checking=입양대기"
	})
	$("#checking2").click(function() {
		location.href = "/adopt/resrchUpdate?adoptNo=${viewResearch.adoptNo }&&checking=입양완료"
	})
	$("#checking3").click(function() {
		location.href = "/adopt/resrchUpdate?adoptNo=${viewResearch.adoptNo }&&checking=입양보류"
	})
	
})



</script>


</head>
<body>

<div class="container">

<div id="wrap">
<h3>아무나 입양할 수 없도록 입양 신청서가 까다롭게 기재되어 있습니다.</h3><br>
<h5>10년을 키우고 버리는 사람도 있습니다. 자신의 아이가 생겨서 버리기도 하고,</h5> 
<h5>개/고양이가 병에 걸려 치료비가 부담돼 버리기도 합니다.</h5> 
<h5>입양 결정에 확신이 서신다면 다음 내용을 읽어주세요.</h5><br>

<h5 style="font-weight: bold;">[신청 불가 조건]</h5>
<h5>1. 미성년자/대학생/무직/군미필자/70대 이상</h5>
<h5>2. 경제활동 중이지만, 혼자 살기 빠듯한 사람</h5>
<h5>3. 입양 후에도 모니터링 기간이(한 달 한번 이상 소식 전하기) 불편하거나 귀찮다고 느끼는 사람</h5><br>

 

<h5 style="font-weight: bold;">[입양하고자 한다면, 꼭 읽어주세요]</h5>
<h5>1. 평생 가족으로 함께 살아갈 분만 신청해주세요.</h5>
<h5>2. 입양 후에도 Buddy와 꾸준히 소통이 가능하신 분만 신청해주세요.</h5>
<h5>3. 암이나 식물인간 등 반려가 불가능한 상태가 아닌 이상, 어떤 이유로도 파양은 정당화될 수 없습니다.</h5>
<h5>4. 파양 시, 재입양/유기 안되며, 꼭 Buddy에게 돌려보내셔야 합니다.</h5>
<h5>5. 고의 유기, 동물학대 시 입양 동물의 구조 후 Buddy가 부담한 병원 치료 및 사육비 10배를 배상해야합니다. </h5>
<h5>6. 입양 책임 후원금은 20만 원 입니다. 이는 아이들 중성화, 병원비에 사용 되며, 반환되지 않습니다.</h5>
<h5>7. 입양 신청서는 입양 확정이 되면, 계약서로서 법적 효력을 갖습니다.</h5><br><br>
</div>



<form id="frm" name="frm" onsubmit ="return event_click()" action="/adopt/resrchView" method="post" >
  <div class="form-group">
  	<label for="answer1">성명
		<span class="must">*</span>
	</label>
    <input type="text" class="form-control" id="answer1" name="answer1" value="${viewResearch.answer1 }" readonly>
  </div>
  <div class="form-group">
    <label for="answer2">연락처(휴대폰)
    	<span class="must">*</span>
    </label>
    <div class="form-inline">
	    <input type="text" class="form-control" style="width:120px" id="answer2a" value=${fn:split(viewResearch.answer2 ,',')[0]} name="answer2" readonly>
		<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
   		<input type="text" class="form-control" id="answer2b" value=${fn:split(viewResearch.answer2 ,',')[1]} name="answer2" readonly>
		<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
    	<input type="text" class="form-control" id="answer2c" value=${fn:split(viewResearch.answer2 ,',')[2]} name="answer2" readonly>
    </div>
  </div>
  <div class="form-group">
    <label for="answer3">희망하는 입양 동물 이름
    	<span class="must">*</span>
    </label>
    <input type="text" class="form-control" id="answer3" name="answer3" value="${viewResearch.answer3 }" readonly>
  </div>
  <div class="form-group">
    <label for="answer4">입양 이유
    	<span class="must">*</span>
    </label>
    <input type="text" class="form-control" id="answer4" name="answer4" value="${viewResearch.answer4 }" readonly>
  </div>
  <div class="form-group" id="answer5agree">
    <label for="answer5">입양에 대해 가족 구성원 모두의 동의를 얻었나요?
    	<span class="must">*</span>
    </label>

	<div class="radio">
		<label>
		<input type="radio" name="answer5" id="answer5Y" value="Y" disabled <c:if test="${viewResearch.answer5 eq 'Y'}">checked</c:if>>네
		</label>
	</div>
	<div class="radio">
		<label>
		<input type="radio" name="answer5" id="answer5N" value="N" disabled <c:if test="${viewResearch.answer5 eq 'N'}">checked</c:if>>아니요
		</label>
	</div>
  </div>
  <div class="form-group">
    <label for="answer6">가족 구성원 중 동물 알레르기 증상이 있는 분이 있습니까? 
    만약 있다면 어떻게 대처하시겠어요?</label>
    <textarea class="form-control" rows="3" id="answer6" name="answer6" readonly>${viewResearch.answer6 }</textarea>
  </div>
  <div class="form-group" id="answer7agree">
    <label for="answer7">입양 후, 1년 동안은 일주일에 1번 씩 의무적으로 아이 소식을 전해주셔야 하며 그
     이후, 6개월에 한 번씩, 입양한 동물에 대한 상황을 알 수 있게 본인의 SNS나 
    	Buddy에 소식을 알려주어야 합니다. 동의하시나요?
    	<span class="must">*</span>	
    </label>
   	<div class="radio">
		<label>
		<input type="radio" name="answer7" id="answer7Y" value="Y" disabled <c:if test="${viewResearch.answer7 eq 'Y'}">checked</c:if>>네
		</label>
	</div>
	<div class="radio">
		<label>
		<input type="radio" name="answer7" id="answer7N" value="N" disabled <c:if test="${viewResearch.answer7 eq 'N'}">checked</c:if>>아니요
		</label>
	</div>
  </div>
  <div class="form-group">
    <label for="answer8">반려동물과 함께 할 수 있는 시간에 대해서 알려주세요.
    (반려동물이 집에 혼자 있는 시간, 반려동물과 함께 할 수 있는 시간)
    	<span class="must">*</span>	
    </label>
    <textarea class="form-control" rows="3" id="answer8" name="answer8" readonly>${viewResearch.answer8 }</textarea>
  </div>
  <div class="form-group">
    <label for="file">[신분증] 신원을 확인하기 위해 신분증을 올려주세요.
    	<span class="must">*</span>	
    </label>
    <div class="zone">
	    <div class="imgIdWrap">
	 	   <img class="View" src="/adopt/resrchDown?resrchfileNo=${resrchFile[0].resrchfileNo }" alt="신분증" >
	 	</div>
    </div>
  </div>

  <div class="form-group" id="image_preview">
   <label for="file">아이가 지내게 될 곳을 사진 찍어 첨부해주세요.
   	<span class="must">*</span>	
   </label>
    <div id="att_zone" class="zone">
<c:forEach items="${resrchFile }" var="file" begin="1">
    <div class="imgIdWrap">
 	   <img class="View" src="/adopt/resrchDown?resrchfileNo=${file.resrchfileNo }" alt="집" >
    </div>
</c:forEach>
    </div>
  </div>


<div class="btn-group btn-group-justified text-center" role="group" >
  <div class="btn-group" role="group">
    <button type="button" id="checking1" class="btn btn-default  <c:if test="${viewResearch.checking eq '입양대기'}">btn-primary</c:if>">입양대기</button>
  </div>
  <div class="btn-group" role="group">
    <button type="button" id="checking2" class="btn btn-default  <c:if test="${viewResearch.checking eq '입양완료'}">btn-primary</c:if>">입양완료</button>
  </div>
  <div class="btn-group" role="group">
    <button type="button" id="checking3" class="btn btn-default  <c:if test="${viewResearch.checking eq '입양보류'}">btn-primary</c:if>">입양보류</button>
  </div>
</div>
</form>

<div class="text-center">
<button type="button" id="exit" class="btn btn-default">목록</button>
</div>







</div>

</body>
</html>