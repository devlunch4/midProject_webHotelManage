<%@page import="vo.AdminInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>호텔 달고나 | 관리자 페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="../js/jquery.serializejson.min.js"></script>
<script src="../js/amdininfo.js"></script>
<script src="../js/resvLogAllList.js"></script>


<style>
table, th, td{
width : auto;
hight : auto;
text-align: center;}
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
		<%
		if(adminId != null && adminPower != null) {
		%>
			// 매출 조회하기 위해 날짜 버튼 생성
			$(document).on('click', '#getResvlogDateMoneyBtn', function() {
				
				console.log("매출 확인");
				
				getResvlogDate();
			})
		<% } %>
		
		<%
		if(adminId != null && adminPower != null) {
		%>
			// 년월 매출 조회
			$(document).on('click', '#getResvlogDateBtn', function() {
				
				// 시작날짜 가져오기
				resvlogDateVal = $('#getResvlogDate').val().trim();
				//console.log("resvlogDateVal : " + resvlogDateVal);
				
				resvlogDateVal = resvlogDateVal.split('-');
				//console.log("resvlogDateVal 이후 : " + resvlogDateVal);
				
				resvlogDateValArr = resvlogDateVal[0] + resvlogDateVal[1];
				//console.log("resvlogDateValArr 값 결과 : " + resvlogDateValArr);
				
				// 년월 매출 조회
				getResvlogDateMoneyVal();
			})
		<% } %>
		
		// 방 추가하는 부분
		<%
		if(adminId != null && adminPower != null) {
		%>
			// 방 추가하기
			$(document).on('click', '#roomCreateBtn', function() {
				
				// 방 추가해주는 모달창 생성
				createRoomModal();
				
				// 지점
				getcreateRoomPlList();
				
				$('#cModal').modal('show');
				
			})
		<% } %>
		// 모달창에서 방 추가작업 완료 작업
		<%
		if(adminId != null && adminPower != null) {
		%>
		// 모달창에서 방 추가작업 완료 작업하기
			$(document).on('click', '#roomCreateSubmitBtn', function() {
				
				roomPl = $('#cform #cModalroom_pl').val();
				console.log("roomPl : " + roomPl);
				
				roomNo = $('#cform #cModalroom_no').val();
				console.log("roomNo : " + roomNo);

				roomType = $('#cform #cModalroom_type').val();
				console.log("roomType : " + roomType);

				roomStatus = $('#cform #cModalroom_status').val();
				console.log("roomStatus : " + roomStatus);
				
				insertRoom();
				
			})
		<% } %>
		
		// 방 삭제하는 부분
		<%
		if(adminId != null && adminPower != null) {
		%>
			// 방 삭제하기
			$(document).on('click', '#roomDeleteBtn', function() {
				
				dNum = $(this).attr('idx');
				console.log("num : " + dNum);
				
				dRoomPl = $('#room_pl'+dNum).text();
				console.log("roomPl : " + dRoomPl);
				
				dRoomNo = $('#room_no'+dNum).text();
				console.log("roomNo : " + dRoomNo);
				
				deleteRoom();
			})
		<% } %>
		
		// 회원정보 출력하는 부분
		<%
		if(adminId != null && adminPower != null) {
		%>
			// 회원정보 출력
			$(document).on('click', '#getMemberInfoListBtn', function() {
				
				MemberInfoList();
				
			})
		<% } %>
		
		// 회원 추가하는 부분
		<%
		if(adminId != null && adminPower != null) {
		%>
			// 회원 추가하기 위한 모달창 생성
			$(document).on('click', '#getMemberInfoAddBtn', function() {
				
				createMemberModal();
				$('#memberInsertModal').modal('show');
			})
		<% } %>
		
		// 회원 정보 입력하고 insert 부분
		<%
		if(adminId != null && adminPower != null) {
		%>
			// 회원 정보 입력하고 insert
			$(document).on('click', '#memberInsertSubmitBtn', function() {
				
				memId = $('#memberInsertform #memberModalmem_id').val();
				console.log("memId : " + memId);
				
				memPass = $('#memberInsertform #memberModalmem_pass').val();
				console.log("memPass : " + memPass);

				memName = $('#memberInsertform #memberModalmem_name').val();
				console.log("memName : " + memName);
				
				memBir = $('#memberInsertform #memberModalmem_bir').val();
				console.log("memBir : " + memBir);

				memTel = $('#memberInsertform #memberModalmem_tel').val();
				console.log("memTel : " + memTel);

				memAddr = $('#memberInsertform #memberModalmem_addr').val();
				console.log("memAddr : " + memAddr);

				memEmail = $('#memberInsertform #memberModalmem_email').val();
				console.log("memEmail : " + memEmail);

				power = $('#memberInsertform #memberModalpower').val();
				console.log("power : " + power);
				
				insertMember();
				
			})
		<% } %>

		// 회원 정보 수정하는 모드 부분
		<%
		if(adminId != null && adminPower != null) {
		%>
			// 회원 수정하기
			$(document).on('click', '#getMemberInfoUpdateBtn', function() {
				
				MemberInfoUpdateMode();
			})
		<% } %>	
		
		// 버튼 클릭하면 회원 정보 수정하는 모달창 띄우는 부분
		<%
		if(adminId != null && adminPower != null) {
		%>
			// 버튼 클릭하면 회원 정보 수정하는 모달창 띄우기
			$(document).on('click', '#getMemberInfoUpdateModeBtn', function() {
				
				createMemberInfoUpdateModal();
				
				num = $(this).attr('idx');
				console.log("num : " + num);
				
				memId = $('#mem_id'+num).text()
				console.log("memId : " + memId);
				
				memPass = $('#mem_pass'+num).text();
				console.log("memPass : " + memPass);

				memName = $('#mem_name'+num).text();
				console.log("memName : " + memName);

				memBir = $('#mem_bir'+num).text();
				console.log("memBir : " + memBir);

				memTel = $('#mem_tel'+num).text();
				console.log("memTel : " + memTel);

				memAddr = $('#mem_addr'+num).text();
				console.log("memAddr : " + memAddr);

				memEmail = $('#mem_email'+num).text();
				console.log("memEmail : " + memEmail);

				power = $('#power'+num).text();
				console.log("power : " + power);
				
				
				$('#memberModal').modal('show');
				
				// uform에 출력
				$('#memberform #memberModalmem_id').val(memId);
				$('#memberform #memberModalmem_pass').val(memPass);
				$('#memberform #memberModalmem_name').val(memName);
				$('#memberform #memberModalmem_bir').val(memBir);
				$('#memberform #memberModalmem_tel').val(memTel);
				$('#memberform #memberModalmem_addr').val(memAddr);
				$('#memberform #memberModalmem_email').val(memEmail);
				$('#memberform #memberModalpower').val(power);
				
			})
		<% } %>		
		
		// 버튼 클릭하면 회원 정보 DB에 업데이트 부분
		<%
		if(adminId != null && adminPower != null) {
		%>
			// 버튼 클릭하면 회원 정보 DB에 업데이트
			$(document).on('click', '#memberUpdateSubmitBtn', function() {
				
				memId = $('#memberform #memberModalmem_id').val();
				console.log("memId : " + memId);
				
				memPass = $('#memberform #memberModalmem_pass').val();
				console.log("memPass : " + memPass);

				memName = $('#memberform #memberModalmem_name').val();
				console.log("memName : " + memName);
				
				memBir = $('#memberform #memberModalmem_bir').val();
				console.log("memBir : " + memBir);

				memTel = $('#memberform #memberModalmem_tel').val();
				console.log("memTel : " + memTel);

				memAddr = $('#memberform #memberModalmem_addr').val();
				console.log("memAddr : " + memAddr);

				memEmail = $('#memberform #memberModalmem_email').val();
				console.log("memEmail : " + memEmail);

				power = $('#memberform #memberModalpower').val();
				console.log("power : " + power);
				
				MemberInfoUpdateSubmit();
				
			})
		<% } %>		
		
		// 회원 정보 삭제하는 부분
		<%
		if(adminId != null && adminPower != null) {
		%>
			// 회원 삭제하기
			$(document).on('click', '#MemberInfoDeleteBtn', function() {
				
				num = $(this).attr("idx");
				console.log("num : " + num);
				memId = $('#mem_id'+num).text();
				console.log("memId : " + memId);
				
				deleteMember();
			})
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