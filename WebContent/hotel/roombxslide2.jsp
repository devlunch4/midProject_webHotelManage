<%@page import="vo.MemberInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔달고나 홈페이지</title>
 

<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 공통부분 타이틀부분  시작 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="../js/jquery.serializejson.min.js"></script>
<script src="../js/xlogon.js"></script>

<!-- 공통부분 타이틀부분 이어서 스크립트 시작 -->

<script>
	$(function() {
	<%MemberInfoVO vo = (MemberInfoVO) session.getAttribute("result");

String userId;
String userName;
String userEmail;

if (vo != null) {%>
			createLoginAfterPart();
			<%userId = vo.getMem_id();
	userName = vo.getMem_name();
	userEmail = vo.getMem_email();

} else {%>
			createLoginPart();
			<%userId = null;
	userName = null;
	userEmail = null;
}%>

 		userId = "<%=userId%>";
		userName = "<%=userName%>";
		userEmail = "<%=userEmail%>";

		console.log("userId : " + userId);
		console.log("userName : " + userName);
		console.log("userEmail : " + userEmail);

		// 로그인하면 로그인부분에 유저 닉네임하고 이메일 출력해서 보여주는부분
		userNameStr = userName + "님";
		userEmailStr = " 이메일 : " + userEmail;
		$('#userName').append(userNameStr);
		$('#userEmail').append(userEmailStr);

		// 로그인 버튼 누르면 로그인 실행하는 부분
		$('#loginBtn').on('click', function() {

		// 로그인 실행부분
			login();
		});

		// 로그아웃 버튼 누르면 로그아웃하는 부분
		$('#loginOutBtn').on('click', function() {

			// 로그아웃 실행 부분
			logout();
		})

// 내정보 가져오는걸 처리
		$('#updateMemberInfoBtn').on('click', function() {
			<%-- <%
				if(pageCount > 0) {
			%> --%>
			$('#div_result *').remove();
			//console.log(pageCount);
			getMemberInfoVal();
			<%-- <%}%> --%>
		})
		
		//내정보수정 버튼 클릭하면 이 작업 수행
		//$('#myinfoUpdateBtn').on('click', function(){
		$(document).on('click', '#myinfoUpdateBtn', function(){
			MemberInfoVal();
			
		})
		
		// 내정보 수정 완료하면 업데이트 부분
		//$('#myinfoUpdateSubmit').on('click', function() {
		$(document).on('click', '#myinfoUpdateSubmit', function() {
			
			MemberInfoValUpdateSubmit();
			updateSessionDate();
			
		})
		
		// 유저가 예약한 정보 확인
		$('#getMyResvlogBtn').on('click', function() {
			getMyResvlogList();
		})
	})
</script>
<link href="../css/jquery.bxslider.css" rel="stylesheet"> 
<!-- 공통 타이틀부분 끝 -->
<!-- 공통 스크립트 부분 끝 -->
<script>
$(function(){
	  $('.bxslider').bxSlider({
	    mode: 'fade',
	    captions: true,
	    slideWidth: 600
	  });
	});
</script>

</head>
<!-- <style>
.bxslider{
	margin-left: 200px; 
</style> -->





<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="../css/room.css">
<script src="../js/jquery.bxslider.js"></script>

<script type="text/javascript">
//<![CDATA[
var jQ182 = $.noConflict(true);
jQ182(document).ready(function(){
     jQ182('.bxslider').bxSlider({
        auto: true,
        speed: 500,
        pause: 4000,
        mode:'fade',
        autoControls: true,
        pager: true,
    });
});

//]]>
</script>


<body>
<!-- 바디 공통 부분 시작 -->
	<div id="login" style="float: right;"></div>

	<br>

	<div class="container">
		<ul class="nav nav-tabs">
			<li class="active"><a href="main.jsp">Home</a></li>
			<li><a data-toggle="tab" href="#menu1">마이페이지</a></li>
			<li><a data-toggle="tab" href="#menu2">게시판</a></li>
			<li><a data-toggle="tab" href="#menu3">안내</a></li>
		</ul>

		<div class="tab-content">
			<div id="home" class="tab-pane fade in active"></div>
			<div id="menu1" class="tab-pane fade">
				<h3>마이페이지</h3>
				<a href="myinfomodify2.jsp" style="text-decoration: none">내 정보
					확인/수정</a><br> <a href="해당주소입력" style="text-decoration: none">예약
					확인</a>

				<!--	<p>테스트로 집어넣음</p>
				<ul class="nav nav-tabs">
					<li class="active"><a data-toggle="tab" href="">Home</a></li>
					<li><a data-toggle="tab" href="">메뉴 1</a></li>
					<li><a data-toggle="tab" href="">메뉴 2</a></li>
					<li><a data-toggle="tab" href="">메뉴 3</a></li>
				</ul>-->
				<hr>
			</div>
			<div id="menu2" class="tab-pane fade">
				<h3>게시판</h3>
				<a href="notice2.jsp" style="text-decoration: none">공지게시판</a><br>
				<a href="review2.jsp" style="text-decoration: none">후기게시판</a>
				<hr>
			</div>
			<div id="menu3" class="tab-pane fade">
				<h3>안내</h3>
				<a href="해당주소입력" style="text-decoration: none">이벤트 안내</a><br>
				<a href="해당주소입력" style="text-decoration: none">시설 안내</a><br> 
				<a href="votemember2.jsp" style="text-decoration: none">직원 안내</a><br>
				<a href="location2.jsp" style="text-decoration: none">오시는 길</a><br>

				<hr>
			</div>
		</div>
	</div>
	<section id="section_result">
		<article id="article_result">
			<div id="div_result"></div>
		</article>
	</section>
	<!-- 바디 공통 공통부분 끝  -->
<div style="max-width: 780px; margin-left: 500px; margin-top: 50px;" >


<h1 style="text-align: center;">객실타입</h1> 
<ul class="bxslider">
  <li><img src="../images/객실1.jpg" title="DUPLEX SUITE"></li>
  <li><img src="../images/객실2.jpg" title="JUNIOR SUITE"></li>
  <li><img src="../images/객실3.jpg" title="ROYAL SUITE"></li>
</ul>
</div>

	<br>
	<br>

	<div style="width: 600px; height: 400px; margin-left: 300px; ">
		<h3>DUPLEX SUITE</h3>
		<img src="../images/객실1.jpg" width="500" height="300">
		<div class="des">
			<p>
			<strong>
			트렌디하며 감각적으로 꾸며진 복층구조의<br>
			듀플렉스 스위트<br>
			</strong>
			<br>
			- 면적하부층 : 42.5m² / 상부층 14.9m²<br>
			<br>
			- 인원성인 : 2인 기준<br>
			<br>
			- 베드타입 : KING<br>
			</p>
		</div>
		<!-- <input type="button" value='예약하기' id="room1" class="btn1"> -->
	</div>
	<hr>
	<div style="width: 600px; height: 400px; margin-left: 300px;">
		<h3>JUNIOR SUITE</h3>
			<img src="../images/객실2.jpg" width="500" height="300">
		<div class="des">
			<p>
			<strong>
			예술이 마치 일상처럼 깃들어 품격이 돋보이는<br>
			주니어 스위트<br>
			</strong>
			<br>
			- 면적하부층 : 61.8m² / 62.8m² / 64.6m²<br>
			<br>
			- 인원성인 : 2인 기준<br>
			<br>
			- 베드타입 : KING / TWIN<br>
			</p>
		</div>
		<!-- <input type="button" value='예약하기' id="room2" class="btn2"> -->
	</div>
	<hr>
	<div style="width: 600px; height: 400px; margin-left: 300px;">
		<h3>ROYAL SUITE</h3>
			<img src="../images/객실3.jpg" width="500" height="300">
		<div class="des">
			<p class="de">
			<strong>
			자택처럼 자유롭고 넓게 누리는 VIP만을 위한<br>
			최상급 로열 스위트
			</strong>
			<br><br>
			- 면적하부층 : 84.9m²<br>
			<br>
			- 인원성인 : 2인 기준<br>
			<br>
			- 베드타입 : KING / TWIN<br>
			</p>
		</div>
		<!-- <input type="button" value='예약하기' id="room2" class="btn2"> -->
	</div>
	
</body>


</html>