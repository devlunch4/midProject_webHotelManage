<%@page import="vo.MemberInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>호텔 달고나 홈페이지 - 이벤트</title>

<link rel="stylesheet" href="../css/event.css">

<!-- 공통 스타일 시작 -->
<style type="text/css">
#footer {
	position: absolute;
	bottom: auto;
	width: 100%;
	height: 120px;
	background: #2c2b29;
	clear: both;
	text-align: left;
	padding: 20px
}

#logo {
	position: absolute;
	bottom: 10px;
	float: right;
	height: 100px;
	width: auto;
	right: 10px;
}
</style>
<!-- 공통 스타일 끝 -->


<meta name="viewport" content="width=device-width, initial-scale=1">


<!-- 공통부분 타이틀부분  시작 -->
<link rel="stylesheet" href="../css/event.css">
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
				userId = vo.getMem_id();
			} else {%>
			createLoginPart();
			<%userId = null;
				userName = null;
				userEmail = null;
			}%>

 		userId = "<%=userId%>";
		userName = "<%=userName%>";
		userEmail = "<%=userEmail%>
	";

		//console.log("userId : " + userId);
		//console.log("userName : " + userName);
		//console.log("userEmail : " + userEmail);

		// 로그인하면 로그인부분에 유저 닉네임하고 이메일 출력해서 보여주는부분
		userNameStr = " / " + userName + " 님";
		userEmailStr = "이메일 : " + userEmail;
		$('#userId').append(userId);
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
		});

		// 내정보 가져오는걸 처리
		$('#updateMemberInfoBtn').on('click', function() {
			$('#div_result *').remove();
			//console.log(pageCount);
			getMemberInfoVal();
		});

		//내정보수정 버튼 클릭하면 이 작업 수행
		//$('#myinfoUpdateBtn').on('click', function(){
		$(document).on('click', '#myinfoUpdateBtn', function() {
			MemberInfoVal();

		});

		// 내정보 수정 완료하면 업데이트 부분
		//$('#myinfoUpdateSubmit').on('click', function() {
		$(document).on('click', '#myinfoUpdateSubmit', function() {
			MemberInfoValUpdateSubmit();
			updateSessionDate();
		});

		// 유저가 예약한 정보 확인
		$('#getMyResvlogBtn').on('click', function() {
			getMyResvlogList();
		});

		// 아이디 비밀번호 찾기부분
<%if (userId == null) {%>
	// 아이디 비밀번호 찾기 버튼 생성
		$(document).on('click', '#findIdPassWord', function() {

			$('#reservation').hide();
			createfindIdPassWordMode();
		})
<%}%>
	// 아이디 찾기위해 입력부분 만들기
<%if (userId == null) {%>
	// 아이디 찾기위해 입력부분 만들기
		$(document).on('click', '#createfindIdBtn', function() {

			createfindIdMode();
		})
<%}%>
	// 비밀번호 찾기위해 입력부분 만들기
<%if (userId == null) {%>
	// 비밀번호 찾기위해 입력부분 만들기
		$(document).on('click', '#createfindPassWordBtn', function() {

			createfindPassWordMode();
		})
<%}%>
	// 비밀번호 찾기부분
<%if (userId == null) {%>
	// 비밀번호 찾기 생성
		$(document).on('click', '#createfindPassWordBtn', function() {

			createfindPassWordMode();
		})
<%}%>
	// Id 찾기부분
<%if (userId == null) {%>
	// id 찾기 
		$(document).on('click', '#findIdBtn', function() {

			nameVal = $('#findNameVal').val().trim();
			console.log("nameVal : " + nameVal);
			EmailVal = $('#findEmailVal').val().trim();
			console.log("EmailVal : " + EmailVal);

			findId();
		})
<%}%>
	// 비밀번호 찾기부분
<%if (userId == null) {%>
	// 비밀번호 찾기 
		$(document).on('click', '#findPassWordBtn', function() {

			userIdVal = $('#findIdVal').val().trim();
			console.log("userIdVal : " + userIdVal);
			nameVal = $('#findNameVal').val().trim();
			console.log("nameVal : " + nameVal);
			EmailVal = $('#findEmailVal').val().trim();
			console.log("EmailVal : " + EmailVal);

			findPassWord();
		})
<%}%>
	});

	// 추가본 클릭하면 상세정보보기(modal창 띄워짐)
	$(".event").on("click", function() {
		$('#Modal').modal('show');
	});
</script>
<!-- 공통 타이틀부분 끝 -->
<!-- 공통 스크립트 부분 끝 -->

</head>
<body>
	<!-- 바디 공통 부분 시작 -->
	<div id="login" style="float: right;"></div>
	<br>
	<div class="container">
		<ul class="nav nav-tabs">
			<li class="active"><a href="main.jsp">Home</a></li>
			<li><a data-toggle="tab" href="#menu1">마이페이지</a></li>
			<li><a data-toggle="tab" href="#menu2">게시판</a></li>
			<li><a data-toggle="tab" href="#menu3">호텔 안내</a></li>
			<li><a data-toggle="tab" href="#menu4">이벤트</a></li>
		</ul>

		<div class="tab-content">
			<div id="home" class="tab-pane fade in active"></div>
			<div id="menu1" class="tab-pane fade">
				<h3>마이페이지</h3>
				<a href="umyinfomodify.jsp" style="text-decoration: none">내 정보
					확인/수정</a><br> <a href="umyresv.jsp" style="text-decoration: none">내
					예약 확인</a>

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
				<a href="unotice.jsp" style="text-decoration: none">공지 게시판</a><br>
				<a href="ureview.jsp" style="text-decoration: none">후기 게시판</a><br>
				<a href="uqboard.jsp" style="text-decoration: none">문의 게시판</a>
				<hr>
			</div>

			<div id="menu3" class="tab-pane fade">
				<h3>호텔 안내</h3>
				<a href="uroombxslide.jsp" style="text-decoration: none">객실 안내</a><br>
				<a href="<%=request.getContextPath()%>/amenity.me"
					style="text-decoration: none">시설 안내</a><br> <a
					href="uvotemember.jsp" style="text-decoration: none">직원 안내</a><br>
				<a href="ulocation.jsp" style="text-decoration: none">오시는 길</a><br>
				<hr>
			</div>

			<div id="menu4" class="tab-pane fade">
				<h3>이벤트</h3>
				<a href="uevent.jsp" style="text-decoration: none">이벤트 안내</a><br>
			</div>

		</div>
	</div>

	<section id="section_result">
		<article id="article_result">
			<div id="div_result"></div>
		</article>
	</section>
	<!-- 바디 공통 공통부분 끝  -->

	<h1 style="font-size: 30px; color: #9c836a; margin-left: 100px;">EVENT</h1>
	<pre class="intro"
		style="margin-left: 0px; background-color: white; border: none; font-size: 20px">
	호텔 달고나에서 진행되는<br> 
	이벤트를 소개합니다.
	</pre>
	<p style="color: blue; margin-left: 100px;">[클릭하시면 자세한 정보를 확인하실 수
		있습니다.]</p>

	<hr>

	<div class="event"
		style="height: 300px; margin-left: 100px; font-size: 25px;"
		data-toggle="modal" data-target="#Modal" type="button" value="상세보기"
		id="write">
		<img src="../images/이벤트1.jpg" width="400" height="300">
		<div class="des">
			<p class="e1" style="font-size: 25px; margin-left: 30%;">
				<br> <br> <strong>FESTIVAL-PARTY</strong><br> 달고나에서
				만나는 크리스마스의 비밀<br> <br> 2020.12.24(목) ~ 2020.12.25(금)<br>
			</p>
		</div>
	</div>
	<br>
	<hr>
	<div class="event" style="height: 300px; margin-left: 100px;"
		data-toggle="modal" data-target="#Modal1" type="button" value="상세보기"
		id="write">
		<img src="../images/이벤트2.jpg" width="400" height="300">
		<div class="des">
			<p class="e2" style="font-size: 25px; margin-left: 30%;">
				<br> <br> <strong>DINING-KICHEN</strong><br> 이탈리아의
				풍부하고 화려한 맛을 즐길 수 있는<br> 겨울 미식 여행<br> <br>
				2020.12.02(수) ~ 2021.02.28(일)
			</p>
		</div>
	</div>
	<div id="Modal" class="modal fade" role="dialog">
		<div class="modal-dialog"
			style="max-width: 100%; width: auto; display: table;">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">EVENT</h4>
				</div>
				<div class="modal-body">
					<form id="uform">
						<img src="../images/이벤트상세보기1.jpg">
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>

	<div id="Modal1" class="modal fade" role="dialog">
		<div class="modal-dialog"
			style="max-width: 100%; width: auto; display: table;">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">EVENT</h4>
				</div>
				<div class="modal-body">
					<form id="uform">
						<img src="../images/이벤트상세보기2.jpg">
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<footer id="footer">
		<p id="footer title" style="color: #9c836a;">
			HOTEL DALGONA <img id="logo" src="../images/log.png">
		</p>
		<p id="WebShop" style="color: rgba(255, 255, 255, 0.8);">
			㈜호텔달고나 주소 대전광역시 중구 대흥동 500-5<br> 대표이사 전영헌 사업자등록번호 123-45-67890<br>
			대표전화 1004-1004
		</p>
	</footer>
</body>
</html>