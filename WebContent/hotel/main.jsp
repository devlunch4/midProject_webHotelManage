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
	<%
		MemberInfoVO vo = (MemberInfoVO) session.getAttribute("result");
	
		String userId = vo.getMem_id();
		String userName = vo.getMem_name();
		String userEmail = vo.getMem_email();
	%>

		userId = "<%= userId %>";
		userName = "<%= userName %>";
		userEmail = "<%= userEmail %>";

	$(function() {
		
		console.log("userId : " + userId);
		console.log("userName : " + userName);
		console.log("userEmail : " + userEmail);
				
		
		// 로그인하면 로그인부분에 유저 닉네임하고 이메일 출력해서 보여주는부분
		userNameStr = userName + "님";
		userEmailStr = " 이메일 : " + userEmail;
		$('#userName').append(userNameStr);
		$('#userEmail').append(userEmailStr);
		
		getRoomPlList();
		
		getRoomTypeList();
		
		getRoomNumList(); 
		
		// 예약 부분
		insertResVLog();
		
		// 로그아웃 부분
		logout();
		
		 
		/* 
		// 내정보 가져오는걸 처리
		$('#updateMemberInfoBtn').on('click', function() {
			
			// 내정보 가져오기
			$.ajax({
				
				url : '/hotel/MyMemberInfoList.do',
				type : 'get',
				dataType : 'json',
				success : function(res) {
					
					$('#roomPlList').empty();
					$('#roomPeople').empty();
					
					code = "";
					
					$.each(res, function(i, v) {
						code += '<option value="'+v.room_pl+'">'+ v.room_pl +'</option>';
					})
					
					$('#roomPlList').append(code);
				},
				error : function(xhr) {
					
					alert("상태 : " + xhr.stauts)
				}
				
			})
			
		})
		 */
		 
		 
		
	})
</script>

</head>
<body>

	<div id="login" style="float : right;">
		<form id="loginForm" action="main.html" method="post">
			<div id="loginAfter">
				<label id="userName"></label>
				<label id="userEmail"></label>
				<input id="loginOutBtn" type="submit" value="로그아웃">
				<input type="button" value="내정보">
			</div>
		</form>
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
    			<td rowspan="2"><input id="reservationBtn" type="button" value="예약"></td>
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
	
	<!-- <input type="button" id="updateMemberInfoBtn" value="내정보 수정"> -->
	
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