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

/* --------회원탈퇴 모달 CSS ------------ */
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
			<a id="like_buddy" href="/mypage/like_buddy" class="text-gray-dark _fade_link">찜한 아이</a>
		</li>
		<li class="on">
			<a id="qna" href="/mypage/qna" class="text-gray-dark _fade_link">1:1 문의</a>
		</li>
		<li class="on">
			<a href="javascript:;" onclick="userUpdate()" class="text-gray-dark _fade_link">정보 수정</a>
		</li>
		<li class="on">
			<a id="deleteBtn" href="javascript:" class="text-gray-dark _fade_link">회원탈퇴</a>
		</li>
	</ul>
</div><!-- 마이페이지 메뉴바 END -->

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
				<a class="btn" id="modalY" href="javascript:" onclick="userDelete()">예</a>
				<button id="btnNo" class="btn" type="button" data-dismiss="modal">아니요</button>
			</div>
		</div>
	</div>
</div>

<!-- 정보수정함수 -->
<script type="text/javascript">
function userUpdate() {
	console.log("정보수정클릭")
	
}
</script>

<!-- 회원탈퇴함수 -->
<script type="text/javascript">
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
<a href="#">
	<img class="media-object img-circle" src="/resources/img/date/userImg.png" alt="userImg" style="width: 85px; height: 85px;">
</a>
</div>
<div id="user_media" class="media-body">
<h3 id="user_name" class="media-heading">${name }님 안녕하세요.</h3>
<div>
<span>봉사 : </span>
<span>후원 : </span>
</div>
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