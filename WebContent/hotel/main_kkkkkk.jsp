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
	height: 80px;
	background: #722f37;
	clear: both;
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
	<%
		MemberInfoVO vo = (MemberInfoVO) session.getAttribute("result");
		
		String userId;
		String userName;
		String userEmail;
		
		if(vo!=null) {
			%>
			createLoginAfterPart();
			<%
	
		userId = vo.getMem_id();
		userName = vo.getMem_name();
		userEmail = vo.getMem_email();
		
		} else {
			
			%>
			createLoginPart();
			<%
			
			userId = null;
			userName = null;
			userEmail = null;
		}
	%>
		
		$('#reservation').show();

 		userId = "<%= userId %>";
		userName = "<%= userName %>";
		userEmail = "<%= userEmail %>";
		
		console.log("userId : " + userId);
		console.log("userName : " + userName);
		console.log("userEmail : " + userEmail);
		
		// 로그인하면 로그인부분에 유저 닉네임하고 이메일 출력해서 보여주는부분
		userNameStr = userName + "님";
		userEmailStr = " 이메일 : " + userEmail;
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
		})
		
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
		 
		 
		
	})
</script>

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
					확인/수정</a><br> <a href="myresv2.jsp" style="text-decoration: none">예약
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
				<a href="review2.jsp" style="text-decoration: none">후기게시판</a><br>
				<a href="qboard2.jsp" style="text-decoration: none">문의게시판</a>
				<hr>
			</div>

			<div id="menu3" class="tab-pane fade">
				<h3>안내</h3>
				<a href="event2.jsp" style="text-decoration: none">이벤트 안내</a><br>
				<a href="<%=request.getContextPath()%>/amenity.me"
					style="text-decoration: none">시설 안내</a><br> <a
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

	<br>

	<div id="reservation">
		<table border="1" align="center">
			<tr>
				<td>지점 선택</td>
				<td>시작일</td>
				<td>마지막일</td>
				<td>객실타입</td>
				<td>객실 인원</td>
				<td>방번호</td>
				<td rowspan="2"><input id="reservationBtn" type="button"
					value="예약"></td>
			</tr>
			<tr>
				<td id="room_pl" idx="room_pl" name="room_pl"><select
					id="roomPlList">
				</select></td>
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
		<p id="WebShop" style="color: white;">호텔 달고나</p>
	</footer>


</body>
</html>