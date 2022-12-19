<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp" />

<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>
<style>
.btnUp{
	background-color: cornflowerblue;
    color: white;
}

.btnDel{
	background-color: #FF7A85;
    color: white;
}
#img_wrap{
	display:inline-block;
	position:relative;
	width:335px;
	height:430px
	;margin:5px;
	z-index:1;
    border-radius: 0.3em;
    border: 3px solid #FF7A85;
}
.img_style{
	width:100%;
	height:100%;
	border-radius:0.3em;
	z-index:none;
}
label{
   font-size: 20px;
   font-weight: bold;
   margin-bottom: 40px;
}
.btn-upload {
	width: 335px;
    height: 50px;
    background: antiquewhite;
    border: 3px solid #FF7A85;
    border-radius: 20px;
    font-weight: bolder;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 10px 3px;
    font-size: 20px;
    color: #FF7A85;
}
.btn-upload:hover {
	border: 3px solid antiquewhite;
    background: #FF7A85;
    color: antiquewhite;
}
#att_zone {
	width: 100%;
	min-height:153px;
	padding:10px;
	border: 1px dotted darkgray;
    border-radius: 0.5em;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	
	$("#btnUpdate").click(function() {
		//스마트에디터에 작성된 내용을 #content에 반영
		updateContents();
		$("#frm").submit();
	})
	$("#btnCancel").click(function() {
		location.href = "/adopt/proView?aniNo="+${adoptPro.aniNo}
	})
})

function updateContents() {
	//스마트 에디터에 작성된 내용을 #content에 반영한다
	oEditors.getById["aniContent"].exec("UPDATE_CONTENTS_FIELD", [])
}

function event_click(){

	if(document.getElementById("aniName").value==''){
		alert("이름을 입력해주십시오.");
		document.getElementById("aniName").focus();
		return false;
	}
	if(document.getElementById("aniAge").value==''){
		alert("나이를 입력해주십시오.");
		document.getElementById("aniName").focus();
		return false;
	}
	if(!$("input:radio[name='aniGender']").is(":checked")){
		alert("체크하지 않은 문항이 있습니다.");
		$("#gender").attr("tabindex", -1).focus();
		return false;
	}	
	if(!$("input:radio[name='aniNeutral']").is(":checked")){
		alert("체크하지 않은 문항이 있습니다.");
		$("#neutral").attr("tabindex", -1).focus();
		return false;
	}	
	if(document.getElementById("aniWeight").value==''){
		alert("몸무게를 입력해주십시오.");
		document.getElementById("aniName").focus();
		return false;
	}
//     var fileCheck = document.getElementById("profile").value;
//     if(!fileCheck){
//         alert("프로필을 첨부해주십시오.");
//         return false;
//     }
}

function checkInputNum(){
    if ((event.keyCode < 48) || (event.keyCode > 57)){
    	alert("숫자만 입력해주십시오.")
        event.returnValue = false;
    }
}

</script>


<div class="container">

<div  class="clearfix" style="margin-bottom: 20px;">
	<div style="width:100%;height:70px;margin-bottom:5px;" class="pull-right">
	<h3 style="margin-bottom: 20px;">입양프로필 수정</h3>
	
	<a href="/" style="text-decoration: none; color: black;"><span class="glyphicon glyphicon-home" aria-hidden="true">Home</span></a>
	<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
	<a href="/adopt/pro" style="text-decoration: none; color: black;">입양</a>
	<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
	<a href="/adopt/proUpdate" style="text-decoration: none; color: black;">
			입양프로필 수정</a>
	</div>
</div>
<form id="frm" action="/adopt/proUpdate?aniNo=${adoptPro.aniNo}" method="post" enctype="multipart/form-data" onsubmit ="return event_click()" >
<div class = "row">
	<div class="col-md-4">
		<div id="img_wrap" >
			<img src="#" alt="입양프로필" id="View" class="img_style" style="display: none;">
			<img src="/adopt/adoptDown?anifileNo=${adoptFile[0].anifileNo}" alt="입양프로필"  id="preView" class="img_style" 
				onerror="this.src='/resources/img/sample_adopt/noImg.jpg'" style="display: inline;">
		</div>
		
    <label for="profile">
    	<div class="btn-upload">프로필 업로드하기</div>
    </label>
    <input type="file" id="profile" name="fileList" accept="image/*" style="display:none;">
	</div>

<script type="text/javascript">
	$(function() {
	    $("#profile").on('change', function(){
	    readURL(this);
	    });
	});
	function readURL(input) {
	    if (input.files && input.files[0]) {
	    	//파일 확장자 검사
	        if(!/\.(jpeg|jpg|png|git|bmp)$/i.test(input.files[0].name)){
	       	 alert("이미지 파일만 가능합니다");
	       	input.value = '';
	       	 return false;
	        }
	        var reader = new FileReader();
	        reader.onload = function (e) {
	        $('#View').attr('src', e.target.result);
	        $('#View').attr('style', 'display: inline;');
	        $('#preView').attr('style', 'display: none;');
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	        $('#View').attr('style', 'display: none;');
	        $('#preView').attr('style', 'display: inline;');
	}
</script>		
	<div class="col-md-8" style="padding: 10px 0px 0px 60px;">
		<div class="form-horizontal">
		<div class="form-group">
		   <label for="aniCate" class="col-sm-2">구분
		   </label>
		   <div class="col-sm-10">
			<select class="form-control" name="aniCate">
			  <option value="임보 중" <c:if test="${adoptPro.aniCate eq '임보 중'}">selected</c:if> >임보 중</option>
			  <option value="입양완료" <c:if test="${adoptPro.aniCate eq '입양완료'}">selected</c:if> >입양완료</option>
			</select> 
			</div>
 		</div>
		<div class="form-group">
			<label for="aniName" class="col-sm-2">
			<span class="glyphicon glyphicon-heart" aria-hidden="true"></span> 이름
			</label>
			<div class="col-sm-10">
			<input type="text" id="aniName" name="aniName" class="form-control" value="${adoptPro.aniName }">
			</div>
		</div>
		<div class="form-group">
			<label for="aniAge" class="col-sm-2">
			<span class="glyphicon glyphicon-baby-formula icons" aria-hidden="true"></span> 나이
			</label>
			<div class="col-sm-10">
			<input type="text" id="aniAge" name="aniAge" class="form-control" onkeyPress="javascript:checkInputNum();" value="${adoptPro.aniAge }">
			</div>
		</div>
		<div class="form-group" id="gender">
		    <div class="form-inline">
		    <label for="aniGender" class="col-sm-2">
		    	<span class="glyphicon glyphicon-sunglasses icons" aria-hidden="true"></span> 성별
		    </label>
		    <div class="col-sm-10">
			<div class="radio">
				<label>
				<input type="radio" name="aniGender" id="aniGenderF" value="남자" <c:if test="${adoptPro.aniGender eq '남자'}">checked</c:if> > 남자
				</label>
			</div>
			<div class="radio" style="margin-left: 20px;">
				<label>
				<input type="radio" name="aniGender" id="aniGenderM" value="여자" <c:if test="${adoptPro.aniGender eq '여자'}">checked</c:if> > 여자
				</label>
			</div>
			</div>
			</div>
  		</div>
		<div class="form-group" id="neutral">
		    <div class="form-inline">
		    <label for="aniNeutral" class="col-sm-2">
		    	<span class="glyphicon glyphicon-sunglasses icons" aria-hidden="true"></span> 중성화
		    </label>
		    <div class="col-sm-10">
			<div class="radio">
				<label>
				<input type="radio" name="aniNeutral" id="aniNeutralY" value="한" <c:if test="${adoptPro.aniNeutral eq '한'}">checked</c:if> > 네
				</label>
			</div>
			<div class="radio" style="margin-left: 20px;">
				<label>
				<input type="radio" name="aniNeutral" id="aniNeutralN" value="하지 않은" <c:if test="${adoptPro.aniNeutral eq '하지 않은'}">checked</c:if> > 아니요
				</label>
			</div>
			</div>
			</div>
  		</div>
		<div class="form-group">
			<label for="aniWeight" class="col-sm-2">
			<span class="glyphicon glyphicon-apple icons" aria-hidden="true"></span> 몸무게
			</label>
			 <div class="col-sm-10">
			<input type="text" id="aniWeight" name="aniWeight" class="form-control" onkeyPress="javascript:checkInputNum();" value="${adoptPro.aniWeight }">
			</div>
		</div>
		</div><!-- .form-horizontal -->
	</div>
</div><!-- row end -->

<div class="form-group">
	<label for="aniContent">하고 싶은 말</label>
	<textarea rows="10" style="width: 100%;" id="aniContent" name="aniContent">${adoptPro.aniContent }</textarea>
</div>
  <div class="form-group" id="image_preview">
   <label for="file">아이의 사진을 더 넣어보세요.
   </label>
	<input type="file" id="btnAtt" name="fileList" multiple="multiple" accept="image/*"/>
	   <p class="help-block">최대 3장의 이미지파일</p>
    <div id="att_zone">
	    <c:forEach items="${adoptFile }" var="file" begin="1">
	    <div class="fileWrap">
	 	   <img class="img_style" src="/adopt/adoptDown?anifileNo=${file.anifileNo}"  alt="본문이미지" >
	    </div>
		</c:forEach>	
    </div>
  </div>

<script>
( /* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
  imageView = function imageView(att_zone, btn){

    var attZone = document.getElementById(att_zone);
    var btnAtt = document.getElementById(btn);
    var sel_files = [];
    
    // 이미지와 체크 박스를 감싸고 있는 div 속성
    var div_style = 'display:inline-block;position:relative;'
                  + 'width:172px;height:120px;margin:5px;z-index:1';
    // 미리보기 이미지 속성
    var img_style = 'width:100%;height:100%;border-radius:0.5em;z-index:none';
    // 이미지안에 표시되는 체크박스의 속성
    var chk_style = 'width:30px;height:30px;position:absolute;margin-bottom:5px;font-size:25px;font-weight:bold;border:none;'
                  + 'right:0px;bottom:88px;border-radius:0.2em;z-index:999;background-color:rgba(255,255,255,0.6);color:#f00';
  
    //attZone안에 파일 있으면 비우기
    btnAtt.onclick = function(){
		if(attZone.firstChild){
	    	attZone.innerHTML='';
	    	sel_files = [];
	    }
    }
    
    btnAtt.onchange = function(e){
     var files = e.target.files;
     var fileArr = Array.prototype.slice.call(files);
     var totalCount = 3;
     
     //파일 확장자 검사
     if(!/\.(jpeg|jpg|png|git|bmp)$/i.test(files[0].name)){
    	 alert("이미지 파일만 가능합니다");
    	 btnAtt.value = '';
    	 return false;
     }	
      
      // 파일 개수 확인 및 제한
      if (fileArr.length > totalCount) {
        alert("파일은 최대 " + totalCount + "개까지 업로드 할 수 있습니다.");
    	btnAtt.value = '';
        return false;
      }
      
      for(f of fileArr){
        imageLoader(f);
      }
    }  
    
    //첨부된 이미지들을 배열에 넣고 미리보기 
    imageLoader = function(file){
      sel_files.push(file);
      var reader = new FileReader();
      reader.onload = function(ee){
        let img = document.createElement('img')
        img.setAttribute('style', img_style)
        img.src = ee.target.result;
        attZone.appendChild(makeDiv(img, file));
      }
      
      reader.readAsDataURL(file);
    }
    
    //첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 
    makeDiv = function(img, file){
      var div = document.createElement('div')
      div.setAttribute('style', div_style)
      
        for(var i=0 ;i<sel_files.length; i++){
            sel_files.splice(i, 1);      
        }
        dt = new DataTransfer();
        for(f in sel_files) {
          var file = sel_files[f];
          dt.items.add(file);
        }
      div.appendChild(img)
      return div;
    }
  }
)('att_zone', 'btnAtt')
</script>

</form>

<div class="text-center" style="margin: 40px 0px;">
	<button class="btn btnUp" id="btnUpdate">수정</button>
	<button class="btn btnDel" id="btnCancel">취소</button>
</div>

<!-- 스마트 에디터 스킨 적용 -->
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "aniContent",
	sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
})
</script>
</div><!-- .container end -->

<c:import url="../layout/footer.jsp" />