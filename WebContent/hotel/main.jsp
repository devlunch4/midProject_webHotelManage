<%@page import="vo.MemberInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>호텔 달고나 메인</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="../js/main.js"></script>
<script src="../js/jquery.serializejson.min.js"></script>
<script src="../js/xlogon.js"></script>


<style>
body {
	overflow: auto;
	min-width: 800px;
}

.ul, .li {
	float: left;
	list-style: none;
	margin: 5px;
	text-align: center;
}

.ul {
	width: 100%;
	padding-left: 30%;
	border: 1px solid red;
	border-left: none;
	border-right: none;
}

#footer {
	position : absolute;
	bottom: auto;
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

#reservation {
	text-align: center;
}

table {
	text-align: center;
	border-collapse: collapse;
}
</style>


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
		
		// 20201215추가
		$('#reservation').show();

 		userId = "<%= userId %>";
		userName = "<%= userName %>";
		userEmail = "<%= userEmail %>";
		power = "<%= power %>";
		
		
		console.log("userId : " + userId);
		console.log("userName : " + userName);
		console.log("userEmail : " + userEmail);
		console.log("power : " + power);
		
		// 로그인하면 로그인부분에 유저 닉네임하고 이메일 출력해서 보여주는부분
		userNameStr = " / " + userName + " 님";
		userEmailStr = "이메일 : " + userEmail;
		$('#userId').append(userId);
		$('#userName').append(userNameStr);
		$('#userEmail').append(userEmailStr);
		
		getRoomPlList();
		
		// 방 종류 선택
		getRoomTypeList();
		
		// 방번호 처리
		getRoomNumList();
		
		// 예약 처리
		$('#reservationBtn').on('click', function() {
			<%
			if(userId!=null) {
			%>	
				
			// 예약 처리
			// 방번호
			vroomNo = $('#roomNoList').val();
					
			// 방 인원수 값
			vroomPeople = $('#roomPeople').text();
					
			// 시작날짜 가져오기
			dateStartVal = $('#dateStart').val().trim();
			console.log("dateStartVal : " + dateStartVal);
			
			// 끝날짜 가져오기
			dateEndVal = $('#dateEnd').val().trim();
			console.log("dateEndVal : " + dateEndVal);
			
			// 날짜 변환
			dateStartVal = dateStartVal.split('-');
			dateEndVal = dateEndVal.split('-');
			console.log("dateStartVal : " + dateStartVal);
			console.log("dateEndVal : " + dateEndVal);
			
			dateStartValArr = new Date(dateStartVal[0], dateStartVal[1], dateStartVal[2]);
			dateEndValArr = new Date(dateEndVal[0], dateEndVal[1], dateEndVal[2]);
			console.log("dateStartVal : " + dateStartValArr);
			console.log("dateEndVal : " + dateEndValArr);
			
			console.log("dateStartValArr 값 : " + dateStartValArr);
			console.log("dateEndValArr 값 : " + dateEndValArr);
			
			
			// 현재 시간 구하기
			NowDate = new Date();
			NowTime = NowDate.getFullYear();
			NowTime += '-' + (NowDate.getMonth()+1);
			NowTime += '-' + NowDate.getDate();
			console.log("NowTime 값 : " + NowTime);
			
			NowTime = NowTime.split('-');
			console.log("NowTime 값 변환 : " + NowTime);
			
			NowTimeArr = new Date(NowTime[0], NowTime[1], NowTime[2]);
			console.log("NowTimeArr 현재시간값 : " + NowTimeArr);
			
			if( NowTimeArr <= dateStartValArr
					&& dateStartValArr < dateEndValArr) {
				console.log("예약 가능");
				// 예약 처리 부분
				insertResVLog();
			} else {
				console.log("예약 불가능");
				alert("예약이 불가능합니다 다시 예약설정을 해주십시오.");
			}
			
			
			<%	
			} else {
				%>
				alert("로그인 하시기 바랍니다.");
				console.log("로그인 하시기 바랍니다.");
				<%
			}
			%>
		})
		
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

<script>

//애니메이션 추가
	$(function(){
		  $('.bxslider').bxSlider({
		    mode: 'fade',
		    captions: true,
		    slideWidth: 600
		  });
		});
		
</script>

</head>

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="../css/mainbasic.css">

<script src="../js/jquery.bxslider.js"></script>

<script type="text/javascript">
	//<![CDATA[
	var jQ182 = $.noConflict(true);
	jQ182(document).ready(function() {
		jQ182('.bxslider').bxSlider({
			auto : true,
			speed : 500,
			pause : 4000,
			mode : 'fade',
			autoControls : true,
			pager : true,
		});
	});
	//]]>
</script>
<link href="../css/jquery.bxslider.css" rel="stylesheet">

<body>
	<!-- 바디 공통 부분 시작 -->
	<div id="login" style="margin-top: 15px; margin-right : 15px; float: right;"></div>
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
			<div id="home" class="tab-pane fade in active" ></div>
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

	<br>

	<div>

		<ul class="bxslider">
			<li>
				<div id="maindes">
					<h3 id="descr" style="text-align: center; width: 50px">호텔 달고나 Members Only</h3><br>
					<h1 id="descr1">Rewards Merry Winter</h1>
					<h4 id="detaildes">[성인 2인, 소인 1인] 크리스마스 북 콘서트, DIY키트, 에코백&키링 | 250,000원 부터
						</h4>
				</div> <img src="../images/호텔메인1.jpg"
				style="width: 2000px; height: 750px;">
			</li>
			<li>
				<div id="maindes">
					<h3 id="descr" style="text-align: center; width: 100px">호텔 달고나 Members Only</h3>
					<br>
					<h1 id="descr1">Rewards Early Bird Offer</h1>
					<h4 id="detaildes">[12월 31일까지 예약 가능] 라운지, 실내 실내사우나, 리워즈
						2만point</h4>
				</div> <img src="../images/호텔메인2.jpg" style="width: 100%; height: 750px;">
			</li>
			<li>
				<div id="maindes">
					<h3 id="descr" style="text-align: center; width: 100px">호텔 달고나 Members Only</h3>
					<br>
					<h1 id="descr1">Rewards Delicious Dinner</h1>
					<h4 id="detaildes">디너 2인, 리워즈 1만 p | 420,000원 부터</h4>
				</div> <img src="../images/호텔메인3.jpg" style="width: 100%; height: 750px;">
			</li>
		</ul>
	</div>


	<div id="reservation">
		<table id="tb" border="0" align="center">
			<tr id="tr1">
				<td>지점선택</td>
				<td>시작일</td>
				<td>마지막일</td>
				<td>객실타입</td>
				<td>객실인원</td>
				<td>방번호</td>
				<td rowspan="2"><input id="reservationBtn" type="button"
					value="예약"></td>
			</tr>
			<tr>
				<td id="room_pl" idx="room_pl" name="room_pl">
				<select id="roomPlList">
				</select>
				</td>
				<td><input type="date" id="dateStart" name="dateStart"></td>
				<td><input type="date" id="dateEnd" name="dateEnd"></td>
				<td id="room_type" idx="room_type" name="room_type"><select
					id="roomTypeList">
				</select></td>
				<td id="roomPeople" idx="roomPeople" name="roomPeople">
					<!-- <p id="roomPeopleList"></p> -->
				</td>
				<td id="room_no" idx="room_no" name="room_no"><select
					id="roomNoList">
				</select></td>
			</tr>

		</table>
	</div>

	<br>

	<!-- <input type="button" id="updateMemberInfoBtn" value="내정보 수정"> -->

	<section id="section_result">
		<article id="article_result">
			<div id="div_result"></div>
		</article>
	</section>

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