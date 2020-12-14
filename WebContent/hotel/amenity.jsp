<%@page import="vo.MemberInfoVO"%>
<%@page import="vo.FacVO"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<FacVO> list = (ArrayList<FacVO>) request.getAttribute("scoreList");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>호텔 달고나 홈페이지</title>


<!-- 공통 스타일 시작 -->
<style type="text/css">
#footer {
	height: 80px;
	background: #722f37;
	clear: both;
}
</style>
<!-- 공통 스타일 끝 -->
<link href="<%=request.getContextPath()%>/css/reset.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/common.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/contents.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/hotel.css">
<!-- 공통부분 타이틀부분  시작 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.serializejson.min.js"></script>
<script src="<%=request.getContextPath()%>/js/xlogon.js"></script>
<!-- 공통부분 타이틀부분 이어서 스크립트 시작 -->

<script>
	/* 부대시설 별점 평가 기능 */

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
	
	
	
			
		
		$('.star').click(function() {
			
			a = $(this).parent('.stardiv').attr("id");
			console.log("id값 : " + a);
			
			$(this).parent().children('a').removeClass('on');

			$(this).addClass('on').prevAll('a').addClass('on');
			var dbstar = $(this).addClass('on').prevAll('a').addClass('on');
			star01 = dbstar.length + 1;

			console.log(star01);

			$.ajax({
				url : '/hotel/amenity.do', //404 url 쪽
				type : 'post',
				data : {
					"star" : star01,
					"fac_no" : a
				}, 
				dataType : 'json',
				success : function(res) {
					alert(res.sw);
					console.log('성공');
					location.reload();
					//$('#idspan').html(star).css('color', 'red');
				},
				error : function(xhr) {
					alert("상태 : " + xhr.status);
				}
			})
		})
		})

</script>
</head>
<style>
#dalgona {
	width: 50px;
	height: 50px;
}
</style>
<body>
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
				<a href="해당주소입력" style="text-decoration: none">이벤트 안내</a><br> <a
					href="해당주소입력" style="text-decoration: none">시설 안내</a><br> <a
					href="votemember2.jsp" style="text-decoration: none">직원 안내</a><br>
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




	<div class="hotelParadiseWrap">
		<div class="innerBox">
			<h1 class="contTitle">
				<span>부대시설</span>다채로운 액티비티와 휴식을 함께 <br />즐길 수 있는 호텔 달고나의 시설을 즐겨보세요.
			</h1>



			<div class="descBox">
				<div class="imageWrap">
					<img src="<%=request.getContextPath()%>/images/풀장.jpg" alt="">
				</div>
				<div class="text">
					<p class="title">
						<span>Indoor Pool</span>자연과 하나되는 Relaxation Indoor Pool
					</p>
					<div class="stardiv" id="f1">
						<a class="star">★</a> <a class="star">★</a> <a class="star">★</a>
						<a class="star">★</a> <a class="star">★</a>
						<p class="title">
							&nbsp;&nbsp;<span id="idspan">평 점 <%=list.get(0).getFac_sum() / 10%></span>
						</p>
					</div>
				</div>
			</div>
			<div class="descBox">
				<div class="imageWrap">
					<img src="<%=request.getContextPath()%>/images/볼링장.jpg">
				</div>
				<div class="text">
					<p class="title">
						<span>Balling Jang</span>게임을 시작하지
					</p>
					<div class="stardiv" id="f2">
						<a class="star">★</a> <a class="star">★</a> <a class="star">★</a>
						<a class="star">★</a> <a class="star">★</a>

						<p class="title">
							&nbsp;&nbsp;<span id="idspan2">평 점<%=list.get(1).getFac_sum() / 10%></span>
						</p>
					</div>

				</div>
			</div>
		</div>

		<%-- 	<img src="<%= request.getContextPath() %>/images/부대시설헬스장.png" width="200" height="150"> --%>
		<!-- 	<h2>GYM</h2> -->
		<!-- 	<pre>집에서 즐기는 것과 같은 편안한 운동 시설</pre> -->
		<!-- 	<br> -->
		<!-- 	<div class="stardiv" id="f1"> -->
		<!-- 		<a class="star">★</a> -->
		<!-- 		 <a class="star">★</a> -->
		<!-- 		  <a class="star">★</a> -->
		<!-- 		   <a class="star">★</a>  -->
		<!-- 		   <a class="star">★</a> -->

		<%-- 		<span id="idspan"><%= list.get(0).getFac_sum() / 10 %></span> --%>
		<!-- 	</div> -->





		</section>
</body>
</html>