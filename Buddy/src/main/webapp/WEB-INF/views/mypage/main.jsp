<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	
})
</script>

<style type="text/css">

.show-gird {
	padding-top: 50px;
}

#mypage_menuBar {
	padding-top: 10px;
    margin-top: 50px;
}

#user_media {
	padding-top: 20px;
    padding-left: 30px;
}

#user_head {
	padding: 30px;
    margin-top: 50px;
    margin-bottom: 30px;
    background: #fff0f0;
    border-radius: 2em;
}

#user_name {
	font-weight: bold;
}

.nav>li>a:focus, .nav>li>a:hover {
    background-color: #ff7a85;
    color: #fff;
}

.nav>li>a {
	color: #ff7a85;
	font-size: 16px;
	font-weight: bolder;
}

#badgeIcon {
	background: #ff7a85
}

#menu_contant {
	color: #878787;
}

/* --------회원수정 모달 CSS -------- */

#update-content {
	width: 370px;
}

#wrap_update {
	width: 100%;
}

#updateUserIcon {
	width: 85px;
    height: 85px;
    margin-bottom: 15px;
}

#bgSize {
	width: 369px;
}

/* --------회원탈퇴 모달 CSS -------- */
#exampleModalLabel {
	font-weight: bold;
	color: #ff7a85
}

#modalY {
	background-color: #f0f0f0;
	color: #000;
}

#btnNo {
    background-color: #ff7a85;
    color: #fff;
}

</style>

<div class="container">

<div class="row show-grid">

<!-- 마이페이지 메뉴바 -->
<div id="mypage_menuBar" class="col-md-2 col-sm-12 hidden-xs hidden-sm left-menu">
	<ul class="nav nav-pills nav-stacked">
		<li class="on">
			<a id="order" href="/mypage/order" class="text-gray-dark _fade_link">주문 <span class="hidden-xs">조회</span></a>
		</li>
		<li class="on">
			<a id="qna" href="/mypage/qna" class="text-gray-dark _fade_link">1:1 문의</a>
		</li>
		<li class="on">
			<a id="updateBtn" href="javascript:;" class="text-gray-dark _fade_link">정보 수정</a>
		</li>
		<li class="on">
			<a id="deleteBtn" href="javascript:" class="text-gray-dark _fade_link">회원탈퇴</a>
		</li>
	</ul>
</div><!-- 마이페이지 메뉴바 END -->

<!-- 정보수정모달 -->
<div class="modal fade" id="userUpdateModal" tabindex="-1">
	<div id="bgSize" class="modal-dialog" role="document">
		<div id="update-content" class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title text-center" id="exampleModalLabel">회원정보수정</h3>
			</div>
				<div id="updateModelContant" class="modal-body">
				<div id="wrap_update" class="container">
					<img id="updateUserIcon" class="center-block img-circle" src="/resources/img/date/userImg.png" alt="userImg">
				
					<div class="form-group">
						<label for="userid">아이디</label><input class="form-control" id="userid" name="userid" type="text" placeholder="${id }" disabled>
					</div>
					
					<div class="form-group">
						<label for="username">이름</label>
						<input type="text" name="username" id="username" placeholder="이름을 입력하세요." class="form-control" required="required" value="${name}">
					</div>
					
					<div class="form-group">
						<label for="usernick">닉네임</label>
						<input type="text" name="usernick" id="usernick" placeholder="닉네임을 입력하세요." class="form-control" value="${nick }">
					</div>
					
					<div class="form-group">
						<label for="phone">전화번호</label>
						<input type="text" name="phone" id="phone" placeholder="전화번호를 입력하세요." class="form-control" value="${phone }">
					</div>
				</div>
				</div>
			<div class="modal-footer">
				<a class="btn" id="modalY" href="javascript:" onclick="userUpdate()">확인</a>
				<button id="btnNo" class="btn" type="button" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>

<!-- 정보수정함수 -->
<script type="text/javascript">
/* 모달창띄우기 */
$('#updateBtn').click(function(e){
	e.preventDefault();
	$('#userUpdateModal').modal("show");
});

function userUpdate() {
	console.log("정보수정클릭")
	
	var username = $("#username").val()
	var usernick = $("#usernick").val()
	var phone = $("#phone").val()
	
	console.log(username, usernick, phone);
	
	$.ajax({
		type: "post"
		, url: "${path}/mypage/userUpdate"
		, data: { 
			"username" : username,
			"usernick" : usernick,
			"phone" : phone }
		, dataType: "html"
		, success: function(result) {
			console.log("AJAX 성공")
			alert("회원 수정이 되었습니다. 다시 로그인해 주세요.")
			$('#userUpdateModal').modal("hide");
			location.href = "/user/login";
			
		}
		, error: function() {
			console.log("AJAX 실패")
			alert("회원 수정이 실패 되었습니다.")
		}
	})
	
}
</script>

<!-- 회원탈퇴모달 -->
<div class="modal fade" id="userDeleteModal" tabindex="-1">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title text-center" id="exampleModalLabel">회원탈퇴</h3>
			</div>
			<div id="deleteModelContant" class="modal-body">
			<p>가입된 회원정보가 모두 삭제됩니다. 작성하신 게시물은 삭제되지 않습니다.</p>
			<p>회원 탈퇴를 진행하시겠습니까?</p>
			</div>
			<div class="modal-footer">
				<a class="btn" id="modalY" href="javascript:" onclick="userDelete()">확인</a>
				<button id="btnNo" class="btn" type="button" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>

<!-- 회원탈퇴함수 -->
<script type="text/javascript">
/* 모달창띄우기 */
$('#deleteBtn').click(function(e){
	e.preventDefault();
	$('#userDeleteModal').modal("show");
});

function userDelete() {
	console.log("탈퇴클릭")
	
	$.ajax({
		type: "post"
		, url: "${path}/mypage/userDelete"
		, data: {}
		, dataType: "html"
		, success: function() {
			console.log("AJAX 성공")
			
			alert("회원탈퇴 되었습니다.")
			$('#userDeleteModal').modal("hide");
			
			location.href = "/";
			
		}
		, error: function() {
			console.log("AJAX 실패")
			alert("회원탈퇴가 실패 되었습니다.")
		}
	})
	
}
</script>

<!-- 마이페이지 내용 -->
<div class="col-md-10 col-sm-12">

<!-- 회원창 -->
<div id="user_head" class="media">
<div class="media-left">
<a href="/mypage/main">
	<img class="media-object img-circle" src="/resources/img/date/userImg.png" alt="userImg" style="width: 85px; height: 85px;">
</a>
</div>
<div id="user_media" class="media-body">
<h3 id="user_name" class="media-heading">${name }님 안녕하세요.</h3>
</div>
</div><!-- 회원창 END -->

<!-- 마이페이지 컨텐츠 -->
<div id="user_body" class="media">


</div><!-- 회원창 END -->

<!-- 메뉴 이름 -->
<div id="menu_name">
	<div class="page-header">
		<h3>주문 조회 <span id="badgeIcon" class="badge bg-secondary">0</span></h3>
	</div>
</div>

<!-- 메뉴 ajax -->
<div class="text-center">
<span id="menu_contant">주문 내역이 없습니다.</span>
</div>

</div><!-- 마이페이지 내용 END -->


</div>
</div><!-- .container end -->

<c:import url="../layout/footer.jsp" />