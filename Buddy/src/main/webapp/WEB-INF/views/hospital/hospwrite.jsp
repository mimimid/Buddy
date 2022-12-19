<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:import url="../layout/header.jsp" />

<!-- 스마트 에디터 2 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

<!--  다음 주소찾기 로드 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<div class="container">



<h1>글쓰기</h1>
<hr>


<form action="./hospwrite" method="post" enctype="multipart/form-data" class="form-horizontal">


<div class="form-group">
 	<label for="hospName">병원 이름</label>
 	<input type="text" name="hospName" class="form-control" >
</div>

<div class="form-group">
	<label>주소입력</label><br>
	<input type="text" id="hospPostNo" name="hospPostNo" placeholder="우편번호">
	<input class="btn" type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기"><br>
	<input type="text" id="top_address" placeholder="도로명 주소" class="form-control">
	<input type="text" id="detailAddress" placeholder="상세주소" class="form-control" onkeyup="addAddress()">
	<input type="text" id="hospAddress"  name="hospAddress" placeholder="전체 주소" class="form-control" value="">
</div>

<div class="form-group">
 	<label for="hospTel">전화번호</label>
 	<input type="tel" id="hospTel" name="hospTel" class="form-control">
</div>


<div class="form-group">
 	<input type="checkbox" id="hosp24" name="hosp24" value="1">
 	<label for="hosp24">24시간 진료</label>
</div>

<div class="form-group">
	<label>평일 진료시간</label>
 	<input type="time" id="hosp_weekday_open">
 	<input type="time" id="hosp_weekday_close" onchange="timeadd()">
 	<input type="text" id="hosp_weekday" name="hospWeekday" value=""><br>
	<label>토요일</label>
 	<input type="time" id="hosp_sat_open" >
 	<input type="time" id="hosp_sat_close" onchange="timeadd()">
 	<input type="text" id="hosp_sat" name="hospSat" value=""><br>
	<label>일요일</label>
 	<input type="time" id="hosp_sun_open">
 	<input type="time" id="hosp_sun_close" onchange="timeadd()">
 	<input type="text" id="hosp_sun" name="hospSun" value=""><br>
	<label>점심시간</label>
 	<input type="time" id="hosp_lunchhour_open">
 	<input type="time" id="hosp_lunchhour_close"onchange="timeadd()">
 	<input type="text" id="hosp_lunchhour" name="hospLunchhour" value=""><br>
 	
</div>

<div class="form-group">
 	<label for="hospContent">병원 소개 글</label>
 	<textarea id="hospContent" name="hospContent" rows="10" style="width: 100%;"></textarea>
</div>




<div class="form-group">
 	<label for="hospMgtno">등록번호</label>
 	<input type="text" name="hospMgtno" class="form-control" >
</div>


<div class="form-group">
 	<label for="file">첨부파일</label>
 	<input type="file" id="upload" name="file">
 	<div id="preview"></div>
</div>

<div class="form-group" style="display:hidden;">
 	<label for="adminno">관리자 No.</label>
 	<input type="text" name="adminno" value="${userno }" class="form-control" readonly="readonly">
 	<label for="adminid">작성자</label>
 	<input type="text" name="adminid" value="${userid}" class="form-control" readonly="readonly">
</div>

<div class="text-center">
	<button type="button" id="btnWrite" class="btn btn-primary">작성</button>
	<button type="button" onclick="history.back()" class="btn btn-danger" > 취소</button>
</div>



</form>



<script type="text/javascript">
$(document).ready(function() {

	$("#btnWrite").click(function() {	
		updateContents();	
		$("form").submit();
	})

	
	$("#upload").change(function( e ) {
		console.log("#upload change")
		var files = e.target.files;
		
		if( !files[0].type.includes( "image") ) {

			return false;
			
		}
		
		//---------------------------
		
		//FileReader 객체 생성
		var reader = new FileReader();
		

		reader.onload = function( ev ) {
			console.log( ev.target.result )
			console.log( this.result ) //ev.target.result와 같은 식		
			$("#preview").html(
				$("<img>").attr( {
					"src": ev.target.result
					,"width" : 200
				})
			)
		}
		
		//선택된 파일을 DataURL 형식으로 읽어들이기
		reader.readAsDataURL( files[0])
		
	})	
	
	
})


//스마트 에디터에 작성된 내용을 #content에 반영한다
function updateContents() {
	oEditors.getById["hospContent"].exec("UPDATE_CONTENTS_FIELD", [])
}

function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {

            var addr = ''; 
            var extraAddr = ''; 


            if (data.userSelectedType === 'R') { 
                addr = data.roadAddress;
            } else { 
                addr = data.jibunAddress;
            }

            document.getElementById('hospPostNo').value = data.zonecode;
            document.getElementById("top_address").value = addr;
           	document.getElementById("hospAddress").value = addr;

            document.getElementById("detailAddress").focus();
        }
    }).open();
}
    
function addAddress()  {
 	
  var topAddress = document.getElementById("top_address").value
  var detailAddress = document.getElementById('detailAddress').value;

  var all = topAddress + ' ' + detailAddress;
 $('#hospAddress').val(all);
} 


</script>


<!-- 스마트 에디터 스킨 적용 -->
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
oAppRef: oEditors,
elPlaceHolder: "hospContent", //에디터가 적용될 <textarea>의 id 적기
sSkinURI: "/resources/se2/SmartEditor2Skin.html",
fCreator: "createSEditor2"
})
</script>


</div><!-- container -->



<c:import url="../layout/footer.jsp" />