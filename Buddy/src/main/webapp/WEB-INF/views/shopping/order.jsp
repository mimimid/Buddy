<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="../layout/header.jsp" />
<!-- 카카오페이 결제 -->
<script type="text/javascript">
$(document).ready(function() {

	$("#kakao").click(function(){
	if($('#name').val() !== "" && $('#phone').val() !== "" && $('#recipient').val() !== "" && $('#reciphone').val() !== "" && $('#postno').val() !== "" && $('#address').val() !== ""){
		
	$.ajax({
		 url:"/shopping/kakao" //응답페이지
		, data:{
			productname : $('#productname').val()
			,amount : $('#amount').val()
			,price : $('#price').val()
			,name : $('#name').val()
			,phone : $('#phone').val()
			,recipient : $('#recipient').val()
			,reciphone : $('#reciphone').val()
			,postno : $('#postno').val()
			,address : $('#address').val()
			,detailaddress : $('#detailaddress').val()
			
		}
		, dataType:"json" //응답 타입
		,success: function(data){ 
			
			var box = data.next_redirect_pc_url;
			window.open(box);
		
			
		}
		, error:function(){
			console.log("AJAX 실패")
		}
	})
} else{
	
	alert('필수 정보를 입력해주세요.');
}
})
	
})
</script>

<!-- 다음 주소 찾기 -->
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
$(document).ready(function(){
    $("#same").change(function(){
        if($("#same").is(":checked")){
            var name = $('#name').val();
            var phone = $('#phone').val();
            $('#recipient').attr('value',name);
            $('#reciphone').attr('value',phone);
        }else{
            $('#recipient').attr('value','');
            $('#reciphone').attr('value','');
            
        }
    });
});
</script>

<script type="text/javascript">
$(document).ready(function(){
	$('#delMemo').change(function(){
		if($('#delMemo').val() === 'self'){
			
			$('#selfInput').attr('type', 'text');
		} else{
			
			$('#selfInput').attr('type', 'hidden');
			
		}
			
	})
	//취소버튼
	$("#btnCancel").click(function() {
		history.go(-1)
	})
})
</script>


<style type="text/css">
#pimg{
	width: 100px;
	height: 100px;
}

#orderForm{
	width: 400px;
	margin: 0 auto;
}

#kakao{
	background-color: white;
	border: none;
	font-weight: bold;
	font-size: 20px;
}
h4{
	font-weight: bold;
}

#container{
	background-color: black;
}

#productInfo{
	background-color: white;
}

#postno{
	display: inline-block;
	width: 310px;
}
.price{
	font-weight: bold;
}

.pinfo{
	padding-left: 15px;
	font-size: 18px;
}


#delivery{
	font-size: 16px;
	font-weight: bold;
}

#btnDaumPost{
	background-color: #FF7A85;
	color: white;
}
#btnCancel{
	background-color: #FF7A85;
	color: white;
}



</style>

<div class="container">

<h1 style="text-align: center;">결제</h1>
<hr>


<div id="orderForm">

<div id="productInfo">
<h4>주문 상품 정보</h4>
<table>
	<tr>
		<td rowspan="3">
			<img id="pimg" alt="상품이미지가 없습니다." src="<%=request.getContextPath() %>/upload/${product.pimgstored }">
		</td>
		<td class="pinfo">${product.productname }
			<input type="hidden" value="${product.productname }" id="productname" name="productname">
		</td>
	</tr>
	<tr>
		<td class="pinfo">${product.amount } 개
			<input type="hidden" value="${product.amount }" id="amount" name="amount">
		</td>
	</tr>
	<tr>
		<td class="price pinfo">
			<fmt:formatNumber value="${product.price*product.amount }" pattern="###,###.###"/>원
			<input type="hidden" value="${product.price*product.amount }" id="price" name="price">
		</td>
	</tr>
</table>
</div><br><br>

<div id="buyerInfo">
	<h4>주문자 정보</h4>
	<input type="text" placeholder="이름(필수)" id="name" class="form-control"><br>
	<input type="text" placeholder="연락처(필수)" id="phone" class="form-control"><br>
</div>

<div id="deliveryInfo">
	<h4>배송 정보</h4>
	<input type="checkbox" id="same">주문자 정보와 동일<br><br>
	<input type="text" placeholder="수령인(필수)" id="recipient" class="form-control"><br>
	<input type="text" placeholder="연락처(필수)" id="reciphone" class="form-control"><br>
	<input type="text" name="postno" id="postno" placeholder="우편번호(필수)"  required="required" class="form-control">
	<button type="button" class="btn" id="btnDaumPost" onclick="btnDaumPost">주소 찾기</button><br><br>
	<input type="text" name="address" id="address" placeholder="주소(필수)" class="form-control"><br>
	<input type="text" name="detailaddress" id="detailaddress" placeholder="상세주소" class="form-control">
</div><br><br>

<div>
	<h4>배송메모</h4>
	<div id="delivery">
		<select id="delMemo" class="form-control">
			<option>배송메모를 선택해주세요.</option>
			<option>배송 전에 미리 연락주세요.</option>
			<option>부재시 경비실에 맡겨주세요.</option>
			<option>부재시 전화나 문자 남겨주세요.</option>
			<option value="self">직접입력</option>
		</select><br>
		<input id="selfInput" type="hidden" placeholder="배송메모를 입력해주세요." class="form-control">
	</div>
</div><br><br>

<div style="text-align: center;">
<button  type="button" id="kakao"><img src="/resources/img/shopping/kakaopay.png"></button>
<button id="btnCancel" class="btn">주문 취소</button>
</div>
</div>


</div><!-- .container end -->

<c:import url="../layout/footer.jsp" />