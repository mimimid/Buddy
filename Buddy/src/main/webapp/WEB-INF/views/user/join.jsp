<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp" />

<!-- 아이디 중복검사 -->
<script type="text/javascript">
$(document).ready(function(){
	$("#idCheck").click(function(){
		console.log("#ajax click")

	
	$.ajax({
		type:"get" //응답메소드방식
		, url:"/user/idCheck" //응답페이지
		, data:{
			userid: $("#userid").val()
		} //보낼 데이터
		, dataType:"html" //응답 타입
		,success: function(data){ 
			console.log("AJAX 성공") 
			
			//응답데이터 출력
			console.log(data)
			
			$("#result").html(data) // 계속 갱신
		}
		, error:function(){
			console.log("AJAX 실패")
		}
	})
})
	
})

</script>

<!-- 다음 우편번호 서비스 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	$("#btnDaumPost").click(function DaumPostcode() {
		new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수

	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	            	// 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraAddr !== ''){
	                    extraAddr = ' (' + extraAddr + ')';
	                }
	                
	                addr = data.roadAddress + extraAddr;
	                
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }


	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById("postno").value = data.zonecode;
	            document.getElementById("address").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("detailaddress").focus();
	        }
	    }).open();
	})
	
})
</script>


<script type="text/javascript">
	$(function(){
		$("#pwchSuccess").hide();
		$("#pwchFaild").hide();
		
		$("#userpwch").keyup(function(){
			var pw = $("#userpw").val();
			var pwch = $("#userpwch").val();
			
			console.log(pw);
			console.log(pwch);
			
			if(pw != "" || pwch != ""){
				if(pw == pwch){
					$("#pwchSuccess").show();
					$("#pwchFaild").hide();
				} else{
					$("#pwchSuccess").hide();
					$("#pwchFaild").show();
					
				}
			}
		})
	})
</script>




<!-- 프로필 이미지 미리보기 -->
<script type="text/javascript">
$(document).ready(function() {
	
	$("#img").change(function( e ) {

		
		var files = e.target.files;
		
		// 이미지만 처리할 수 있도록 적용
		if( !files[0].type.includes( "image" ) ) {
			
			// 선택한 파일 해제하기
			e.target.value = null;
			
			// 이벤트 처리 중단시키기
			return false;
			
		}
		
		//---------------------------------------------------
		
		// FileReader 객체 생성
		var reader = new FileReader();
		
		// FileReader가 파일의 내용을 전부 읽어들여
		// 메모리에 로드 되었을 때 발생하는 이벤트 처리
		reader.onload = function( ev ) {
			
			// 이미지를 새롭게 선택할 때마다 #preview의 이전 이미지를 지우고
			// 한 장만 유지되도록 한다
			$("#preview").html(
					$("<img>").attr({
						"src": ev.target.result
						, "width": 150
						, "height": 150
					})
			)
		}

		// 선택된 파일을 DataURL 형식으로 읽어들이기
		reader.readAsDataURL( files[0] );
			
	})

})
</script>




<!-- 유효성 검사 -->
 <script type="text/javascript">
    function checks(){
    	
	  var getPhone = RegExp(/^(?:(010-\d{4})|(01[1|6|7|8|9]-\d{3,4}))-(\d{4})$/);
      var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
      var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
      var getName= RegExp(/^[가-힣]+$/);
      var fmt = RegExp(/^\d{6}[1234]\d{6}$/); //형식 설정

      //아이디 공백 확인
      if($("#userid").val() === ""){
        alert("아이디 입력바랍니다.");
        $("#userid").focus();
        return false;
      }
           
      //아이디 유효성검사
      if(!getCheck.test($("#userid").val())){
        alert("형식에 맞게 입력해주세요(4~12자의 영문 대소문자와 숫자)");
        $("#userid").val("");
        $("#userid").focus();
        return false;
      }

      //비밀번호 공백 확인
      if($("#userpw").val() === ""){
        alert("패스워드 입력바랍니다.");
        $("#userpw").focus();
        return false;
      }
           

      //아이디 비밀번호 같음 확인
      if($("#userid").val() === $("#userpw").val()){
        alert("아이디와 비밀번호가 같습니다");
        $("#userpw").val("");
        $("#userpw").focus();
        return false;
      }
      
      //비밀번호 유효성검사
      if(!getCheck.test($("#userpw").val())){
        alert("형식에 맞게 입력해주세요.");
        $("#userpw").val("");
        $("#userpw").focus();
        return false;
      }
           
      //비밀번호 확인란 공백 확인
      if($("#userpwch").val() === ""){
        alert("패스워드 확인란을 입력해주세요");
        $("#uerpwch").focus();
        return false;
      }
           
   
          
      //이메일 공백 확인
      if($("#email").val() === ""){
        alert("이메일을 입력해주세요");
        $("#email").focus();
        return false;
      }
           
      //이메일 유효성 검사
      if(!getMail.test($("#email").val())){
        alert("이메일형식에 맞게 입력해주세요")
        $("#email").val("");
        $("#email").focus();
        return false;
      }
           
      //이름 공백 검사
      if($("#username").val() === ""){
        alert("이름을 입력해주세요");
        $("#username").focus();
        return false;
      }

      //이름 유효성 검사
      if(!getName.test($("#username").val())){
        alert("이름형식에 맞게 입력해주세요")
        $("#username").val("");
        $("#username").focus();
        return false;
      }
           
      //휴대폰 공백 확인
      if($("#phone").val() === ""){
        alert("전화번호 입력바람");
        $("#phone").focus();
        return false;
      }
           
      //휴대폰 유효성검사
      if(!getPhone.test($("#phone").val())){
        alert("형식에 맞게 입력해주세요");
        $("#phone").val("");
        $("#phone").focus();
        return false;
      }

        return true;
    }

 
  
    </script>


<style type="text/css">
#joinform {
	width: 450px;
	
	margin: 0 auto; 
/* 	padding: 30px; */
	
/* 	border:1px solid #104138; */
/* 	border-radius: 10px; */
	
/* 	background: whitesmoke; */
}

#userid{
	display: inline-block;
	width: 350px;
}

#postno{
	display: inline-block;
	width: 300px;
}
#idCheck, #btnDaumPost{
	display: inline-block;
	float: right;
}
.basic{
	background-color: #FF7A85;
	color: white;
}
#join{
	background-color: #FF7A85;
	color: white;
}
#cancelA{
	color: white;
}
#cancel{
	background-color: #FF7A85;
	
}

</style>



<div class="container">

<h1 style="text-align: center;">회원가입</h1>
<hr>

<form action="./join" method="post" enctype="multipart/form-data" onsubmit="return checks()">
	<div id = "joinform" >
	<div class="form-group" style="text-align: center;">
		<label for="img" style="color: blue;" >프로필 사진 추가</label><br>
		<div id="preview"></div>
		<input type="file" name="img" id="img" class="from-conrtol" style="display: none;">
	</div>
	<div class="form-group">
		<label for="userid">아이디</label><br>
		<input type="text" name="userid" id="userid" placeholder="4~12자의 영문 대소문자와 숫자로 입력" class="form-control">
		<button type="button" class="btn basic" id="idCheck">중복확인</button>
		<span id="result"></span>
	</div>
	<div class="form-group">
		<label for="userpw">비밀번호</label>
		<input type="password" name="userpw" id="userpw" placeholder="4~12자의 영문 대소문자와 숫자로 입력" class="form-control">
	</div>
	<div class="form-group">
		<label for="userpwch">비밀번호 확인</label>
		<input type="password" name="userpwch" id="userpwch" placeholder="비밀번호 확인" class="form-control" >
		<div class="pwckSuccess" id="pwchSuccess" style="color: blue;">비밀번호가 일치합니다.</div>
		<div class="pwckFaild" id="pwchFaild" style="color: red;">비밀번호가 일치하지 않습니다.</div>
		
	</div>
	<div class="form-group">
		<label for="username">이름</label>
		<input type="text" name="username" id="username" placeholder="이름을 입력하세요." class="form-control" >
	</div>
	<div class="form-group">
		<label for="usernick">닉네임</label>
		<input type="text" name="usernick" id="usernick" placeholder="닉네임을 입력하세요." class="form-control">
	</div>
	<div class="form-group">
		<label for="phone">전화번호</label>
		<input type="text" name="phone" id="phone" placeholder="전화번호를 입력하세요." class="form-control">
	</div>
	<div class="form-group">
		<label for="email">이메일</label>
		<input type="text" name="email" id="email" placeholder="이메일을 입력하세요." class="form-control">
	</div>
	<div class="form-group">
		<label for="gender">성별</label>
		<select name="gender" class="form-control">
			<option value="" disabled selected>성별을 선택하세요.</option>
			<option value="남">남</option>
			<option value="여">여</option>
		</select>
	</div>
	<div class="form-group">
		<label for="postno">주소</label><br>
		<input type="text" name="postno" id="postno" placeholder="우편번호" class="form-control" required="required">
		<button type="button" class="btn basic" id="btnDaumPost" onclick="btnDaumPost">주소 찾기</button><br><br>
		<input type="text" name="address" id="address" placeholder="주소" class="form-control"><br>
		<input type="text" name="detailaddress" id="detailaddress" placeholder="상세주소" class="form-control"><br>
	</div>
	<div class="form-group">
		<label for="birth">생년월일</label>
		<input type="date" name="birth" id="birth" class="form-control">
	</div>
	<div style="text-align: center;">
	<button class="btn" id="join" name="join" >회원가입</button>
	<a href="./login" id="cancelA"><button type="button" class="btn" id="cancel">취소</button></a>
	</div>
	</div>
</form>



</div><!-- .container end -->




<c:import url="../layout/footer.jsp" />
