
<%@page import="vo.AdminInfoVO"%>
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
<script src="../js/jquery.serializejson.min.js"></script>
<script src="../js/amdininfo.js"></script>
<script src="../js/resvLogAllList.js"></script>


<style>

</style>

<script>
	$(function() {
	<%
		AdminInfoVO vo = (AdminInfoVO) session.getAttribute("adminResult");
		
		String adminId;
		String adminPower;
		
		if(vo!=null) {
			%>
			adminLoginAfter();
			<%
	
			adminId = vo.getAdmin_id();
			adminPower = vo.getPower();
		
		} else {
			
			%>
			adminLoginBefore();
			<%
			
			adminId = null;
			adminPower = null;
		}
	%>

		adminId = "<%= adminId %>";
		adminPower = "<%= adminPower %>";
		
		console.log("adminId : " + adminId);
		console.log("adminPower : " + adminPower);
		
		// 로그인하면 로그인부분에 유저 닉네임하고 이메일 출력해서 보여주는부분
		adminNameStr = adminId + "님";
		$('#userName').append(adminNameStr);
		
		
		// 로그인 버튼 누르면 로그인 실행하는 부분
		$('#loginBtn').on('click', function() {
			
			// 로그인 실행부분
			adminLogIN();
		});
		
		// 로그아웃 버튼 누르면 로그아웃하는 부분
		$('#loginOutBtn').on('click', function() {
			
			// 로그아웃 실행 부분
			adminLogOut();
		})
		
		<%
			if(adminId != null && adminPower != null) {
		%>
			// 버튼 클릭하면 방상태 출력
			$('#room_statusCheckBtn').on('click', function() {
				
				getRoomInfo();
				
			})
		<% } %>
		
		<%
			if(adminId != null && adminPower != null) {
		%>
			// 버튼 클릭하면 방 수정 출력
			//$('#room_statusUdpateBtn').on('click', function() {
			$(document).on('click', '#room_statusUdpateBtn', function() {
				
				getRoomInfoUpdateList();
				
			})
		<% } %>
		
		
		
		<%
			if(adminId != null && adminPower != null) {
		%>
			// 버튼 클릭하면 방상태 수정으로 모달창 띄우기
			//$('#room_statusUdpateSubmitBtn').on('click', function() {
			$(document).on('click', '#room_statusUdpateSubmitBtn', function() {
				
				
				
				num = $(this).attr('idx');
				console.log("num : " + num);
				
				roomPl = $('#room_pl'+num).text()
				console.log("roomPl : " + roomPl);
				
				roomNo = $('#room_no'+num).text();
				console.log("roomNo : " + roomNo);

				roomType = $('#room_type'+num).text();
				console.log("roomType : " + roomType);

				roomStatus = $('#room_status'+num).text();
				console.log("roomStatus : " + roomStatus);
				
				
				getRoomInfoUpdateCommitBefore();
				
				$('#uModal').modal('show');
				
				// uform에 출력
				$('#uform #uModalroom_pl').val(roomPl);
				$('#uform #uModalroom_no').val(roomNo);
				$('#uform #uModalroom_type').val(roomType);
				$('#uform #uModalroom_status').val(roomStatus);
				
			})
		<% } %>
		<%
			if(adminId != null && adminPower != null) {
		%>
			// 방 상태 수정하면 완료하고 업데이트하기
			//$('#room_statusUdpateSubmitBtn').on('click', function() {
			$(document).on('click', '#room_statusUdpateSendBtn', function() {
				
								
				roomPl = $('#uform #uModalroom_pl').val();
				console.log("roomPl : " + roomPl);
				
				roomNo = $('#uform #uModalroom_no').val();
				console.log("roomNo : " + roomNo);

				roomType = $('#uform #uModalroom_type').val();
				console.log("roomType : " + roomType);

				roomStatus = $('#uform #uModalroom_status').val();
				console.log("roomStatus : " + roomStatus);
				
				getRoomInfoUpdateCommitAfter();
			})
		<% } %>
		
		<%
		if(adminId != null && adminPower != null) {
		%>
			// 예약 변경 관련쪽
			$(document).on('click', '#resvloglist', function() {
				resvViewAll();
			}) // $("#resvloglist") 함수 마감	
		<% } %>
		
		<%
		if(adminId != null && adminPower != null) {
		%>
			//상태가 예약건만 조회
			//$(".resvBox").on("click", ".action", function() {
			$(document).on('click', '.action', function() {
				//alert("해당 행의 클릭 확인 진입")
				vidx = $(this).attr("idx");
				vname = $(this).attr("name");
				alert("해당 번호글" +  vidx + ", 결재/취소환불 이름값확인 " + vname);
				
				
				resvStatusUpdateServer();
			}) //$(".paychk") 마감
		<% } %>
				
		 
		
	})
</script>

</head>
<body>
<!-- 공통 부분 시작 -->
	<div id="login" style="float : right;">
	</div>
	
	
    <br>
    
    <h3>관리자 페이지</h3>
	
	<div id="main_result">
	</div>
	
	
	<br>
	
	<section id="section_result">
		<article id="article_result">
			<div id="div_result">
			</div>
		</article>
	</section>
	
	<div id="modal_result">
	</div>




</body>
</html>