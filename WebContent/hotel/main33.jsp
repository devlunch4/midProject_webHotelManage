<%@page import="vo.MemberInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Web Shop</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="../js/main.js"></script>

<style>
	body {
		overflow: auto;
		min-width: 800px;
	}
	.ul, .li {
		float : left;
		list-style:none;
		margin : 5px;
		text-align: center;
	}
	.ul {
		width : 100%;
		padding-left: 30%;
		border : 1px solid red;
		border-left: none;
		border-right: none;
	}
	#footer {
		height : 80px;
		background : #722f37;
		clear : both;
	}
	#reservation {
		text-align: center;
	}
	table {
		text-align: center;
		border-collapse : collapse;
	}
</style>

<script>
	$(function() {
	<%
		MemberInfoVO vo = (MemberInfoVO) session.getAttribute("result");
		
		String userId;
		String userName;
		String userEmail;
		
		// 페이지 유지를 위해 변수 선언
		//int pageCount=0;
		
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
				// 예약 처리 부분
				insertResVLog();
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

</head>
<body>

	<div id="login" style="float : right;">
	</div>
	
    <br>
    
    <div class="container">
	  <ul class="nav nav-tabs">
	    <li class="active"><a data-toggle="tab" href="#home">Home</a></li>
	    <li><a data-toggle="tab" href="#menu1">메뉴 1</a></li>
	    <li><a data-toggle="tab" href="#menu2">메뉴 2</a></li>
	    <li><a data-toggle="tab" href="#menu3">메뉴 3</a></li>
	  </ul>
	
	  <div class="tab-content">
	    <div id="home" class="tab-pane fade in active">
	    </div>
	    <div id="menu1" class="tab-pane fade">
	      <h3>메뉴 1</h3>
	      <p>메뉴 1 넣으삼</p>
	      <p>테스트로 집어넣음</p>
	      <ul class="nav nav-tabs">
		    <li class="active"><a data-toggle="tab" href="">Home</a></li>
		    <li><a data-toggle="tab" href="">메뉴 1</a></li>
		    <li><a data-toggle="tab" href="">메뉴 2</a></li>
		    <li><a data-toggle="tab" href="">메뉴 3</a></li>
		  </ul>
		  <hr>
	    </div>
	    <div id="menu2" class="tab-pane fade">
	      <h3>메뉴 2</h3>
	      <p>메뉴2 넣으삼</p>
	    </div>
	    <div id="menu3" class="tab-pane fade">
	      <h3>메뉴 3</h3>
	      <p>메뉴3 넣으삼</p>
	    </div>
	  </div>
	</div>
    
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
    			<td rowspan="2">
    				<input id="reservationBtn" type="button" value="예약">
    			</td>
    		</tr>
    		<tr>
    			<td id="room_pl" idx="room_pl" name="room_pl">
    				<select id="roomPlList">
    				</select>
    			</td>
    			<td><input type="date" id="dateStart" name="dateStart"></td>
    			<td><input type="date" id="dateEnd" name="dateEnd"></td>
    			<td id="room_type" idx="room_type" name="room_type">
    				<select id="roomTypeList">
    				</select>
    			</td>
    			<td id="roomPeople" idx="roomPeople" name="roomPeople">
    				<!-- <p id="roomPeopleList"></p> -->
    			</td>
    			<td id="room_no" idx="room_no" name="room_no">
    				<select id="roomNoList">
    				</select>
    			</td>
    		</tr>
 			   		
    	</table>
    </div>

	<br>
	
	<input type="button" id="updateMemberInfoBtn" value="내정보 확인">
	<input type="button" id="getMyResvlogBtn" value="예약정보 확인">
	
	<section id="section_result">
		<article id="article_result">
			<div id="div_result">
			</div>
		</article>
	</section>

	<br>

	
	<footer id="footer">
		<p id="WebShop" style="color:white;">호텔 달고나</p>
	</footer>


</body>
</html>