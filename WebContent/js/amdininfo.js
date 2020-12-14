/**
 * 
 */

// 방 상태 수정 완료
var getRoomInfoUpdateCommitAfter = function() {
	
	console.log("num : " + num);
	console.log("test : " + roomPl);
	console.log("test1 : " + roomNo);
	console.log("test2 : " + roomType);
	console.log("test3 : " + roomStatus);
	
	// 방 수정
	$.ajax({

		url : '/hotel/updateRoomStatus.do',
		type : 'post',
		data : {
			"room_status" : roomStatus,
			"room_pl" :roomPl,
			"room_no" : roomNo,
			"room_type" : roomType
				},	
		success : function(res) {
			
			alert("방 상태 수정" + res.sw);
			
			$('#div_result *').remove();
			$('#modal_result *').append(code);
			location.reload();
			
		},
		error : function(xhr) {
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
	
	
}

var getRoomInfoUpdateCommitBefore = function() {
	
	
	
	console.log("num : " + num);
	console.log("test : " + roomPl);
	console.log("test1 : " + roomNo);
	console.log("test2 : " + roomType);
	console.log("test3 : " + roomStatus);
	
	code ='<div id="uModal" class="modal fade" role="dialog">';
	code +='<div class="modal-dialog">';
	code +='방상태 수정중';
	code +='<div class="modal-content">';
	code +='<div class="modal-header">';
	code +='<button type="button" class="close" data-dismiss="modal">&times;</button>';
	code +='<h4 class="modal-title">Modal Header</h4>';
	code +='</div>';
	code +='<div class="modal-body">';
	code +='<form id="uform">';
	code +='<label>지점</label> : <input type="text" id="uModalroom_pl" name="room_pl"><br>';
	code +='<label>방번호</label> : <input type="text" id="uModalroom_no" name="room_no"><br>';
	code +='<label>방타입</label> : <input type="text" id="uModalroom_type" name="room_type"><br>';
	code +='<label>방상태</label> : <input type="text" class="txt" id="uModalroom_status" name="room_status"><br>';
	code +='<input type="button" value="수정완료" id="room_statusUdpateSendBtn"><br>';
	code +='</form>';
	code +='</div>';
	code +='<div class="modal-footer">';
	code +='<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>';
	code +='</div>';
	code +='</div>';
	code +='</div>';
	code +='</div>';
	
	$('#modal_result').append(code);
	
	
}

// 방 수정 상태로 만들기
var getRoomInfoUpdateList = function() {
	
	$('#div_result *').remove();
	
	$.ajax({
		
		url : '/hotel/getRoomInfo.do',
		type : 'get',
		success : function(res) {
					
			$('#div_result *').remove();
			
			code ='<table class="getRoomInfoUpdateList" id="getRoomInfo" border="1">';
			code +='<tr><td>지점</td><td>방 번호</td><td>방타입</td><td>방상태</td><td>방수정</td></tr>';
			$.each(res, function(i, v) {
				code += '<tr id="'+i+'">';
				code += '<td id="room_pl'+i+'" name="'+v.room_pl+'">'+ v.room_pl +'</td>';
				code += '<td id="room_no'+i+'" value="'+v.room_no+'">'+ v.room_no +'</td>';
				code += '<td id="room_type'+i+'" value="'+v.room_type+'">'+ v.room_type +'</td>';
				code += '<td id="room_status'+i+'" value="'+v.room_status+'">'+ v.room_status +'</td>';
				code +='<td><input id="room_statusUdpateSubmitBtn" type="button" idx="'+i+'" value="방상태수정하기"></td>';
				code += '</tr>';
				
			})
			code +='</table>';
			
			$('#div_result').append(code);
				
					
			
		},
		error : function(xhr) {
			alert("상태 : " + xhr.stauts)
		},
		dataType : 'json'
				
	})
	
}

//관리자가 쓸 호텔 정보 가져오기
var getRoomInfo = function() {
	
	$('#div_result *').remove();
	
	$.ajax({
		
		url : '/hotel/getRoomInfo.do',
		type : 'get',
		success : function(res) {
					
			$('#div_result *').remove();
			
			code ='<input id="room_statusUdpateBtn" type="button" value="방상태수정하기">';
			code +='<table id="getRoomInfo" border="1">';
			code +='<tr><td>지점</td><td>방 번호</td><td>방타입</td><td>방상태</td></tr>';
			$.each(res, function(i, v) {
				code += '<tr>';
				code += '<td id="room_pl'+i+'">'+ v.room_pl +'</td>';
				code += '<td id="room_no'+i+'">'+ v.room_no +'</td>';
				code += '<td id="room_type'+i+'">'+ v.room_type +'</td>';
				code += '<td id="room_status'+i+'">'+ v.room_status +'</td>';
				code += '</tr>';
				
			})
			code +='</table>';
			
			$('#div_result').append(code);
				
					
			
		},
		error : function(xhr) {
			alert("상태 : " + xhr.stauts)
		},
		dataType : 'json'
				
	})
	
} 

// 관리자 로그아웃하면 로그인소스 생성
var adminLogOut = function() {
	
	// 로그아웃
	// 로그아웃 및 세션 정보 지우기
	$.ajax({
				
		url : '/hotel/AdminLogOut.do',
		type : 'get',
		success : function(res) {
					
			alert("로그아웃 " + res.sw + "하셨습니다.");
					
			$('#userName').empty();
					
			// 로그인 성공하면 페이지 새로고침
			location.reload();
					
		},
		error : function(xhr) {
			alert("상태 : " + xhr.stauts)
		},
		dataType : 'json'
				
	})
	
}

// 관리자 로그인하는 부분
var adminLogIN = function() {
	
	idval = $('#id').val().trim();
	passval = $('#password').val().trim();
	adminId = idval;
	adminPassword = passval;
	
	// 로그인
	$.ajax({

		url : '/hotel/AdminLoginIn.do',
		type : 'post',
		data : {"admin_id" : adminId, "admin_pass" : adminPassword},	
		success : function(res) {
			
			alert("로그인 성공!!\n" + res.admin_id + "님 환영합니다.");
			
			$('#userName').empty();
			location.reload();
			
		},
		error : function(xhr) {
			alert("상태 : " + xhr.status);
			$('#id').empty();
			$('#password').empty();
			return false;
		},
		dataType : 'json'
	})
	
}

// 관리자로 로그인하면 생성
var adminLoginAfter = function() {
	
	$('#login *').remove();
	
	code='<form id="loginForm" action="#" method="post">';
	code+='<div id="loginAfter">';
	code+='<label id="userName"></label>';
	code+='<label id="userEmail"></label>';
	code+='<input id="loginOutBtn" type="button" value="로그아웃">';
	code+='</div>';
	code+='</form>';
	
	main = '<input id="room_statusCheckBtn" type="button" value="방상태확인"><br>';
	main += '<input type="button" id="resvloglist" value="resvloglist">';
	
	$('#login').append(code);
	$('#main_result').append(main);
	
}

// 관리자 페이지 들어가면 로그인 생성
var adminLoginBefore = function() {
	
	code='<form id="loginForm" action="#" method="post">';
	code='<div id="loginBefore">';
	code+='<label>아이디 : </label><input id="id" type="text" name="id">';
	code+='<label>비밀번호 : </label><input id="password" type="password" name="pass">';
	code+='<input id="loginBtn" type="button" value="로그인">';
	code+='</div>';
	code+='</form>';
	
	$('#login').append(code);
	
}
