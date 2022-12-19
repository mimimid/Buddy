<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp" />

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
#att_zone:empty:before {
	content : attr(data-placeholder);
	color : #999;
	font-size:.9em;
}
#imgIdWrap {
	display: inline-block;
	width: 172px;
	height: 120px;
	margin: 5px;
}
#View {
	width: 100%;
	height: 100%;
	border-radius: 0.5em;
}
</style>
<script type="text/javascript">
function event_click(){

	if(document.getElementById("answer1").value==''){
		alert("성명을 입력해주십시오.");
		document.getElementById("answer1").focus();
		return false;
	}
	if(document.getElementById("answer2b").value=='' || document.getElementById("answer2c").value==''){
		alert("연락처를 입력해주십시오.");
		document.getElementById("answer2b").focus();
		return false;
	}
	if(document.getElementById("answer3").value==''){
		alert("입양 동물 이름을 입력해주십시오.");
		document.getElementById("answer3").focus();
		return false;
	}
	if(document.getElementById("answer4").value==''){
		alert("입양 이유를 입력해주십시오.");
		document.getElementById("answer4").focus();
		return false;
	}
	if(!$("input:radio[name='answer5']").is(":checked")){
		alert("동의하지 않은 문항이 있습니다.");
		$("#answer5agree").attr("tabindex", -1).focus();
		return false;
	}	
	if(!$("input:radio[name='answer7']").is(":checked")){
		alert("동의하지 않은 문항이 있습니다.");
		$("#answer7agree").attr("tabindex", -1).focus();
		return false;
	}	
	if(document.getElementById("answer8").value==''){
		alert("반려동물과 함께 할 수 있는 시간을 입력해주십시오.");
		document.getElementById("answer8").focus();
		return false;
	}
    var fileCheck = document.getElementById("imgId").value;
    if(!fileCheck){
        alert("신분증을 첨부해 주세요");
        return false;
    }
	var fileCheck2 = document.getElementById("btnAtt").value;
    if(!fileCheck2){
        alert("아이가 지내게 될 곳을 첨부해 주세요");
        return false;
    }
	var chk = confirm("정말 입양을 원하시나요? \n신청하시면 다시 수정할 수 없습니다.");
	 if (chk == true){  
		 alert(document.getElementById("answer1").value + "님의 신청서 작성이 완료되었습니다.\n신청서 확인 후 일주일내에 연락드리겠습니다.\n감사합니다:)");
	 }else if(chk == false){
	     return false;
	 }

}

</script>



<div class="container">

<div>
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



<form id="frm" name="frm" onsubmit ="return event_click()" action="/adopt/research" method="post" enctype="multipart/form-data" >
  <div class="form-group">
  	<label for="answer1">성명
		<span class="must">*</span>
	</label>
    <input type="text" class="form-control" id="answer1" name="answer1" >
  </div>
  <div class="form-group">
    <label for="answer2">연락처(휴대폰)
    	<span class="must">*</span>
    </label>
    <div class="form-inline">
	<select class="form-control" name="answer2">
	  <option value="010" selected>010</option>
	  <option value="011">011</option>
	  <option value="02">02</option>
	</select> 
		<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
    <input type="text" class="form-control" id="answer2b" name="answer2">
		<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
    <input type="text" class="form-control" id="answer2c" name="answer2">
    </div>
  </div>
  <div class="form-group">
    <label for="answer3">희망하는 입양 동물 이름
    	<span class="must">*</span>
    </label>
    <input type="text" class="form-control" id="answer3" name="answer3">
  </div>
  <div class="form-group">
    <label for="answer4">입양 이유
    	<span class="must">*</span>
    </label>
    <input type="text" class="form-control" id="answer4" name="answer4">
  </div>
  <div class="form-group" id="answer5agree">
    <label for="answer5">입양에 대해 가족 구성원 모두의 동의를 얻었나요?
    	<span class="must">*</span>
    </label>
	<div class="radio">
		<label>
		<input type="radio" name="answer5" id="answer5Y" value="Y">네
		</label>
	</div>
	<div class="radio">
		<label>
		<input type="radio" name="answer5" id="answer5N" value="N">아니요
		</label>
	</div>
  </div>
  <div class="form-group">
    <label for="answer6">가족 구성원 중 동물 알레르기 증상이 있는 분이 있습니까? 
    만약 있다면 어떻게 대처하시겠어요?</label>
    <textarea class="form-control" rows="3" id="answer6" name="answer6"></textarea>
  </div>
  <div class="form-group" id="answer7agree">
    <label for="answer7">입양 후, 1년 동안은 일주일에 1번 씩 의무적으로 아이 소식을 전해주셔야 하며 그
     이후, 6개월에 한 번씩, 입양한 동물에 대한 상황을 알 수 있게 본인의 SNS나 
    	Buddy에 소식을 알려주어야 합니다. 동의하시나요?
    	<span class="must">*</span>	
    </label>
   	<div class="radio">
		<label>
		<input type="radio" name="answer7" id="answer7Y" value="Y">네
		</label>
	</div>
	<div class="radio">
		<label>
		<input type="radio" name="answer7" id="answer7N" value="N">아니요
		</label>
	</div>
  </div>
  <div class="form-group">
    <label for="answer8">반려동물과 함께 할 수 있는 시간에 대해서 알려주세요.
    (반려동물이 집에 혼자 있는 시간, 반려동물과 함께 할 수 있는 시간)
    	<span class="must">*</span>	
    </label>
    <textarea class="form-control" rows="3" id="answer8" name="answer8"></textarea>
  </div>
  <div class="form-group">
    <label for="file">[신분증] 신원을 확인하기 위해 신분증을 올려주세요.
    	<span class="must">*</span>	
    </label>
    <input type="file" id="imgId" name="fileList" accept="image/*">
    <p class="help-block">최대 1장의 이미지파일</p>
    <div class="zone">
    <div id="imgIdWrap">
 	   <img id="View" src="#" alt="신분증" style="visibility: hidden;"></div>
    </div>
  </div>
<script type="text/javascript">
	$(function() {
	    $("#imgId").on('change', function(){
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
	        $('#View').attr('style', 'visibility: visible;');
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	        $('#View').attr('style', 'visibility: hidden;');
	}
</script>
  <div class="form-group" id="image_preview">
   <label for="file">아이가 지내게 될 곳을 사진 찍어 첨부해주세요.
   	<span class="must">*</span>	
   </label>
	<input type="file" id="btnAtt" name="fileList" multiple="multiple" accept="image/*"/>
	   <p class="help-block">최대 5장의 이미지파일</p>
    <div id="att_zone" class="zone"
      data-placeholder='파일을 첨부 하려면 파일 선택 버튼을 클릭하거나 파일을 드래그앤드롭 하세요'></div>
  </div>
  	  <p class="help-block">신청서를 작성해주시면 Buddy에서 확인 후 일주일내에 연락을 드립니다.</p>

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
     var totalCount = 5;
     
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
    
  
    // 탐색기에서 드래그앤 드롭 사용
    attZone.addEventListener('dragenter', function(e){
      e.preventDefault();
      e.stopPropagation();
    }, false)
    
    attZone.addEventListener('dragover', function(e){
      e.preventDefault();
      e.stopPropagation();
      
    }, false)
  
    attZone.addEventListener('drop', function(e){
      var files = {};
      e.preventDefault();
      e.stopPropagation();
      var dt = e.dataTransfer;
      var totalCount = 5;
      files = dt.files;
      
      if(attZone.childElementCount>0){
    	attZone.innerHTML='';
    	sel_files = [];
      }
      //파일 확장자 검사
      if(!/\.(jpeg|jpg|png|git|bmp)$/i.test(files[0].name)){
     	 alert("이미지 파일만 가능합니다");
     	 btnAtt.value = '';
     	 return false;
      }
 	  // 파일 개수 확인 및 제한
      if(files.length > totalCount){
        alert("파일은 최대 " + totalCount + "개까지 업로드 할 수 있습니다.");
      	btnAtt.value = '';
         return false;
      }
      
      for(f of files){
        imageLoader(f);
      }
    }, false)

    
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
      
      var btn = document.createElement('input')
      btn.setAttribute('type', 'button')
      btn.setAttribute('value', 'x')
      btn.setAttribute('delFile', file.name);
      btn.setAttribute('style', chk_style);
      btn.onclick = function(ev){
        var ele = ev.srcElement;
        var delFile = ele.getAttribute('delFile');
        for(var i=0 ;i<sel_files.length; i++){
          if(delFile== sel_files[i].name){
            sel_files.splice(i, 1);      
          }
        }
        
        dt = new DataTransfer();
        for(f in sel_files) {
          var file = sel_files[f];
          dt.items.add(file);
        }
        btnAtt.files = dt.files;
        var p = ele.parentNode;
        attZone.removeChild(p)
      }
      div.appendChild(img)
      div.appendChild(btn)
      return div
    }
  }
)('att_zone', 'btnAtt')

</script>

  <div class="text-center">
  <button type="submit" id="submit" class="btn btn-default">신청</button>
  </div>

</form>
<c:if test="${userno == 1 }">
<a href="/adopt/resrchList">[관리자]신청서보기</a>
</c:if>

</div>

<c:import url="../layout/footer.jsp" />