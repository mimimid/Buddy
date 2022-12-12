<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%ServletContext context; %>
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
#logoPro {
	width: 55px;
	height: 55px;
	margin: 5px 0px 0px 10px;
}
p {
	display: inline-block;
	
	}
.link-icon { 
	position: relative; 
	display: inline-block; 
	width: auto;    
	font-size: 14px; 
	font-weight: 500; 
	color: #333; 
	margin-right: 10px; 
	padding-top: 50px; 
}
.link-icon.twitter { 
	background-image: url(/resources/img/icon/icon-twitter.png); 
	background-repeat: no-repeat; 
}
.link-icon.facebook { 
	background-image: url(/resources/img/icon/icon-facebook.png); 
	background-repeat: no-repeat; 
} 
.link-icon.kakao { 
	background-image: url(/resources/img/icon/icon-kakao.png); 
	background-repeat: no-repeat; 
}


</style>

<script type="text/javascript">
$(document).ready(function() {
	$("#reptList").click(function() {
		location.href = "/report/reptList"
	})
	
	$("#reptUpdate").click(function() {
		location.href = "/report/reptUpdate?reptNo=${reptView.reptNo }"
	})
	
	$("#reptDelete").click(function() {
		location.href = "/report/reptDelete?reptNo=${reptView.reptNo }"
	})
})
</script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- 공유하기 -->
<script type="text/javascript">
	function shareTwitter() {
    var sendText = "Buddy"; // 전달할 텍스트
    var sendUrl = "localhost:8888/report/reptView?reptNo="+${reptView.reptNo}; // 전달할 URL
    window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
	}
	function shareFacebook() {
	    var sendUrl = "localhost:8888/report/reptView?reptNo="+${reptView.reptNo}; // 전달할 URL
	    window.open("http://www.facebook.com/sharer/sharer.php?u=" + sendUrl);
	}
	function shareKakao() {
		 
		  // 사용할 앱의 JavaScript 키 설정
		  Kakao.init('9868cf00cade30b8dbb71b78ee520636');
		 
		  // 카카오링크 버튼 생성
		  Kakao.Link.createDefaultButton({
		    container: '#btnKakao', // 카카오공유버튼ID
		    objectType: 'feed',
		    content: {
		      title: "Buddy", // 보여질 제목
		      description: "Buddy 회계보고", // 보여질 설명
		      imageUrl: "localhost:8888/report/reptView?reptNo="+${reptView.reptNo}, // 콘텐츠 URL
		      link: {
		         mobileWebUrl: "localhost:8888/report/reptView?reptNo="+${reptView.reptNo},
		         webUrl: "localhost:8888/report/reptView?reptNo="+${reptView.reptNo}
		      }
		    }
		  });
		}
	function CopyUrlToClipboard(){
		var obShareUrl = document.getElementById("ShareUrl");
		obShareUrl.value = "localhost:8888/reptView?reptNo="+ ${reptView.reptNo};
		obShareUrl.select();
		document.execCommand("copy"); 
		obShareUrl.blur(); 
		alert("URL이 클립보드에 복사되었습니다"); 
	}
</script>
</head>
<body>
<div class="container">
<h3>${reptView.reptTitle}</h3>
<div  class="clearfix">
	<div style="float:left; margin-right:10px; width:70px">
	<img id="logoPro" alt="logo" src="/resources/img/sample_adopt/noImg.jpg"></div>
	<div style="float:left; width: 1060px; height: 70px; ">
	<div style="margin: 15px 0px 5px 0px;"><span>Buddy</span></div>
	<span>${reptView.adminid}아이디</span>
	<div class="pull-right">
	<a href="/" style="text-decoration: none; color: black;"><span class="glyphicon glyphicon-home" aria-hidden="true">Home</span></a>
	<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
	<a href="/report/reptList" style="text-decoration: none; color: black;">회계보고</a>
	<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
	<a href="/report/reptView?reptNo=${reptView.reptNo }" style="text-decoration: none; color: black;">
			${reptView.reptTitle }</a>
</div>
	</div>
</div><br>
<hr style="margin-top: 0px;">
<%-- 	<c:if test="${id eq viewBoard.writerId }"> --%>
		<div class="pull-right">
		<button id="reptUpdate" class="btn btn-primary">수정</button>
		<button id="reptDelete" class="btn btn-danger" >삭제</button>
		</div><br>
<%-- 	</c:if> --%>
<div id="reptContent" style="width: 100%; margin: 80px 0px;">
	${reptView.reptContent}
</div>
	<!-- 공유 모달 -->
<button type="button" class="btn pull-right" data-toggle="modal" data-target=".bs-example-modal-sm" style="background-color: white;">
	<span class="glyphicon glyphicon-share" aria-hidden="true"></span>
</button>

<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">공유하기</h4>
      </div>
      <div class="modal-body">
		<a id="btnKakao" class="link-icon kakao" href="javascript:shareKakao();">카카오톡</a>    
		<a id="btnFacebook" class="link-icon facebook" href="javascript:shareFacebook();">페이스북</a>    
		<a id="btnTwitter" class="link-icon twitter" href="javascript:shareTwitter();">트위터</a>
      </div>
      <div class="modal-footer">
      <input type="text" style="width: 188px;" id="ShareUrl" value="localhost:8888/reptView?reptNo="+ ${reptView.reptNo}>
      <span class="btn-type1"><button onclick="javascript:CopyUrlToClipboard();">URL 복사</button></span>
      </div>
    </div><!-- /.modal-content -->
  </div>
</div><br>

<hr>

<div>
<fmt:formatDate value="${reptView.reptDate}" pattern="yy-MM-dd HH:mm:ss"/><br>
<!-- 파일 다운 -->
<c:if test="${not empty reptFile.rfileNo }">
	<a href="/report/reptDown?rfileNo=${reptFile.rfileNo }" style="color: black;">
		<span class="glyphicon glyphicon-download-alt" style="color: black;" aria-hidden="true"></span>
		${reptFile.rfileOrigin }
	</a>
</c:if>
</div>


<div class="text-center" style="margin: 40px;">
	<button id="reptList" class="btn btn-default">목록</button>
	
</div>
</div>
</body>
</html>