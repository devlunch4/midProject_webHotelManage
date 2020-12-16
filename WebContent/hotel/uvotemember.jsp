<%@page import="vo.MemberInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔 달고나 홈페이지 직원 안내</title>
<link rel="stylesheet" href="../css/votemember2.css">
<!-- 공통 스타일 시작 -->
<style type="text/css">
#footer {
	position : absolute;
	bottom : auto;
	width: 100%;
	height: 120px;
	background: #2c2b29;
	clear: both;
	text-align: left;
	padding: 20px

}
#logo {
	position : absolute;
	bottom : 10px;
	float: right;
	height: 100px;
	width: auto;
	right : 10px;
}
</style>
<!-- 공통 스타일 끝 -->

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
			String power;

			if (vo != null) {%>
			createLoginAfterPart();
			<%userId = vo.getMem_id();
				userName = vo.getMem_name();
				userEmail = vo.getMem_email();
				userId = vo.getMem_id();
				power = vo.getPower();
			} else {%>
			createLoginPart();
			<%userId = null;
				userName = null;
				userEmail = null;
				power = null;
			}%>

 		userId = "<%=userId%>";
		userName = "<%=userName%>";
		userEmail = "<%=userEmail%>";
		power = "<%= power %>";

		//console.log("userId : " + userId);
		//console.log("userName : " + userName);
		//console.log("userEmail : " + userEmail);
		//console.log("power : " + power);

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
		$(document).on('click', '#myinfoUpdateBtn', function(){
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
		<%
		if(userId  == null) {
		%>
			// 아이디 비밀번호 찾기 버튼 생성
			$(document).on('click', '#findIdPassWord', function() {
				
				$('#reservation').hide();
				createfindIdPassWordMode();
			})
		<% } %>
		
		// 아이디 찾기위해 입력부분 만들기
		<%
		if(userId  == null) {
		%>
			// 아이디 찾기위해 입력부분 만들기
			$(document).on('click', '#createfindIdBtn', function() {
				
				createfindIdMode();
			})
		<% } %>
		
		// 비밀번호 찾기위해 입력부분 만들기
		<%
		if(userId  == null) {
		%>
			// 비밀번호 찾기위해 입력부분 만들기
			$(document).on('click', '#createfindPassWordBtn', function() {
				
				createfindPassWordMode();
			})
		<% } %>
		
		// 비밀번호 찾기부분
		<%
		if(userId  == null) {
		%>
			// 비밀번호 찾기 생성
			$(document).on('click', '#createfindPassWordBtn', function() {
				
				createfindPassWordMode();
			})
		<% } %>
		
		// Id 찾기부분
		<%
		if(userId  == null) {
		%>
			// id 찾기 
			$(document).on('click', '#findIdBtn', function() {
				
				nameVal = $('#findNameVal').val().trim();
				console.log("nameVal : " + nameVal);
				EmailVal = $('#findEmailVal').val().trim();
				console.log("EmailVal : " + EmailVal);
				
				findId();
			})
		<% } %>
		
		// 비밀번호 찾기부분
		<%
		if(userId  == null) {
		%>
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
		<% } %>
	});
</script>
<!-- 공통 타이틀부분 끝 -->
<!-- 공통 스크립트 부분 끝 -->

</head>
<script>
	/* 직원 투표하기 기능 */

	num1 = 0;
	num = 0;

	$(function() {

		// DB에 업데이트한 정보를 다시 가져오기

		$.ajax({

			//var arrnum = new Array("num1","num2");

			url : "/hotel/voteUpdate.do",
			type : "get",
			data : {
				"code" : name,
				"count" : num1
			},
			dataType : "json",
			success : function(res) {
				for (var i = 0; i < res.length; i++) {
					var classname = ".numRes" + res[i].code;
					$(classname).html(res[i].count);

				}
			},
			error : function(xhr) {

			}

		})

		// 첫번째 직원의 투표수 가져오기

		$('.numRes').append(num);

		$(this).on(
				'click',
				'.btn1',
				function() {

					var name = "101";

					var num1 = $(this).parents('.votemember')
							.find('.numRes101').text();
					num1 = parseInt(num1) + 1;
					$.ajax({
						url : "/hotel/voteUpdate.do",
						type : "post",
						data : {
							"code" : name,
							"count" : num1

						},
						dataType : "json",
						success : function(res) {
							//alert(res.sw);
							//console.log("성공");
							//	$(".numRes").html(value);
						},
						error : function(xhr) {
							//alert("실패" + xhr.status);
						}
					})

					$(this).parents('.votemember').find('.numRes101').empty();
					$(this).parents('.votemember').find('.numRes101')
							.text(num1);
				})

		// 두번째 직원의 투표수 가져오기
		$(this).on(
				'click',
				'.btn2',
				function() {

					var name = "102";

					var num2 = $(this).parents('.votemember')
							.find('.numRes102').text();
					num2 = parseInt(num2) + 1;

					$.ajax({
						url : "/hotel/voteUpdate.do",
						type : "get",
						data : {
							"code" : name,
							"count" : num2

						},
						dataType : "json",
						success : function(res) {
							//alert(res);

							// $(".numRes102").html(num2);

						},
						error : function(xhr) {

						}

					})

					$(this).parents('.votemember').find('.numRes102').empty();
					$(this).parents('.votemember').find('.numRes102')
							.text(num2);

					$.ajax({
						url : "/hotel/voteUpdate.do",
						type : "post",
						data : {
							"code" : name,
							"count" : num2

						},
						dataType : "json",
						success : function(res) {

							//	$(".numRes").html(value);
							//	alert(res.sw);
							//console.log("성공");
						},
						error : function(xhr) {
							//	alert("실패" + xhr.status);
						}
					})

				})
		//memberVote();
	})
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


	<h1 class="t1">직원 안내</h1>
	<pre class="t2">
	칭찬 릴레이에 참여하시려면 하트 버튼을 클릭해 
	기억에 남는 친절한 직원에게 투표해주세요.
	</pre>
	<br>
	<div class="votemember"
		style="width: 600px; height: 300px; margin-left: 100px;">
		<img src="../images/직원1.png" width="250" height="250">
		<p class="memnm">고객관리팀 : 최대훈 직원</p>
		<!-- <span>Like</span> -->
		<div class="like" style="width: 50px; height: 50px;">
			<input type="image" src="../images/투표.png"
				style="width: 50px; height: 50px;" id="101" class="btn1">
		</div>
		<div id="test1" class="numRes101"></div>
	</div>
	<hr>

	<div class="votemember"
		style="width: 600px; height: 300px; margin-left: 100px;">
		<img src="../images/직원2.png" width="250" height="250">
		<p class="memnm">식음료팀 : 유수정 직원</p>
		<!-- <span>Like</span> -->
		<div class="like2" style="width: 50px; height: 50px;">
			<input type="image" src="../images/투표.png"
				style="width: 50px; height: 50px;" id="102" class="btn2">
		</div>
		<div id="test2" class="numRes102"></div>
	</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>


<footer id="footer">
		<p id ="footer title" style="color : #9c836a;">HOTEL DALGONA <img id="logo" src="../images/log.png"> </p>
		<p id="WebShop" style="color: rgba(255,255,255,0.8);">
						㈜호텔달고나 주소 대전광역시 중구 대흥동 500-5<br>
						대표이사 전영헌 사업자등록번호 123-45-67890<br>
						대표전화 1004-1004
		</p>
	</footer>
</body>
</html>