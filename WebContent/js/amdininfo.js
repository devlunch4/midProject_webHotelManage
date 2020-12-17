/**
 * 
 */

//
var deleteMember = function() {
	
	memId = memId;
	console.log("memId : " + memId);
	
	// 회원정보 업데이트
	$.ajax({
		
		url : '/hotel/DeleteMember.do',
		type : 'post',
		data : {"mem_id" : memId},
		dataType : 'json',
		success : function(res) {
			
			alert("회원 삭제" + res.sw);
			$('#div_result *').remove();
			$('#modal_result *').remove();
			location.reload();
		},
		error : function(xhr) {
			
			alert("상태 : " + xhr.stauts)
		}
	})
	
}

// 모달창에 회원정보 입력하면 회원 등록하기
var insertMember = function() {
	
	memId = memId;
	memPass = memPass;
	memName = memName;
	memBir = memBir;
	memTel = memTel;
	memAddr = memAddr;
	memEmail = memEmail;
	power = power;
	
	// 회원정보 업데이트
	$.ajax({
		
		url : '/hotel/InsertMember.do',
		type : 'post',
		data : {
			"mem_id" : memId, 
			"mem_pass" : memPass, 
			"mem_name" : memName, 
			"mem_bir" : memBir,
			"mem_tel" : memTel, 
			"mem_addr" : memAddr, 
			"mem_email" : memEmail, 
			"power" : power
			},
		dataType : 'json',
		success : function(res) {
			
			alert("회원정보 추가" + res.sw);
			$('#div_result *').remove();
			$('#modal_result *').remove();
			location.reload();
		},
		error : function(xhr) {
			
			alert("상태 : " + xhr.stauts)
		}
	})
	
}

// 회원 추가하기위해 모달창 생성
var createMemberModal = function() {
	
$('#modal_result *').remove();
	
	code = '<div id="memberInsertModal" class="modal fade" role="dialog">';
	code +='<div class="modal-dialog">';
	code +='회원정보 수정하기';
	code +='<div class="modal-content">';
	code +='<div class="modal-header">';
	code +='<button type="button" class="close" data-dismiss="modal">&times;</button>';
	code +='<h4 class="modal-title">회원정보 수정하기</h4>';
	code +='</div>';
	code +='<div class="modal-body">';
	code +='<form id="memberInsertform">';
	code +='<label>Id</label> : <input id="memberModalmem_id" type="text" name="mem_id"><br>';
	code +='<label>pass</label> : <input id="memberModalmem_pass" type="text" name="mem_pass"><br>';
	code +='<label>이름</label> : <input id="memberModalmem_name" type="text" name="mem_name"><br>';
	code +='<label>생년월일</label> : <input id="memberModalmem_bir" type="date" name="mem_bir"><br>';
	code +='<label>전화번호</label> : <input id="memberModalmem_tel" type="text" name="mem_tel"><br>';
	code +='<label>주소</label> : <input id="memberModalmem_addr" type="text" name="mem_addr"><br>';
	code +='<label>이메일</label> : <input id="memberModalmem_email" type="text" name="mem_email"><br>';
	code +='<label>권한</label> : <input id="memberModalpower" type="text" name="power"><br>';
	code +='<input type="button" value="추가완료" id="memberInsertSubmitBtn"><br>';
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

// 모달창에 입력된 수정된 회원정보 업데이트 하기
var MemberInfoUpdateSubmit = function() {
	
	memId = memId;
	memPass = memPass;
	memName = memName;
	memTel = memTel;
	memAddr = memAddr;
	memEmail = memEmail;
	power = power;
	
	// 회원정보 업데이트
	$.ajax({
		
		url : '/hotel/MemberInfoUpdate.do',
		type : 'post',
		data : {
			"mem_id" : memId, 
			"mem_pass" : memPass, 
			"mem_name" : memName, 
			"mem_tel" : memTel, 
			"mem_addr" : memAddr, 
			"mem_email" : memEmail, 
			"power" : power
			},
		dataType : 'json',
		success : function(res) {
			
			alert("회원정보 수정 작업" + res.sw);
			$('#div_result *').remove();
			$('#modal_result *').remove();
			location.reload();
		},
		error : function(xhr) {
			
			alert("상태 : " + xhr.stauts)
		}
	})
}

// 회원정보 띄우는 모달창
var createMemberInfoUpdateModal = function() {
	
	$('#modal_result *').remove();
	
	code ='<div id="memberModal" class="modal fade" role="dialog">';
	code +='<div class="modal-dialog">';
	code +='회원정보 수정하기';
	code +='<div class="modal-content">';
	code +='<div class="modal-header">';
	code +='<button type="button" class="close" data-dismiss="modal">&times;</button>';
	code +='<h4 class="modal-title">회원정보 수정하기</h4>';
	code +='</div>';
	code +='<div class="modal-body">';
	code +='<form id="memberform">';
	code +='<label>Id</label> : <input id="memberModalmem_id" type="text" name="mem_id" readonly><br>';
	code +='<label>pass</label> : <input id="memberModalmem_pass" type="text" name="mem_pass"><br>';
	code +='<label>이름</label> : <input id="memberModalmem_name" type="text" name="mem_name"><br>';
	code +='<label>생년월일</label> : <input id="memberModalmem_bir" type="text" name="mem_bir" readonly><br>';
	code +='<label>전화번호</label> : <input id="memberModalmem_tel" type="text" name="mem_tel"><br>';
	code +='<label>주소</label> : <input id="memberModalmem_addr" type="text" name="mem_addr"><br>';
	code +='<label>이메일</label> : <input id="memberModalmem_email" type="text" name="mem_email"><br>';
	code +='<label>권한</label> : <input id="memberModalpower" type="text" name="power"><br>';
	code +='<input type="button" value="수정완료" id="memberUpdateSubmitBtn"><br>';
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

// 회원정보 수정모드로 출력
var MemberInfoUpdateMode = function() {
	
	// 회원정보 가져오기
	$.ajax({
		
		url : '/hotel/GetMemberInfoList.do',
		type : 'get',
		dataType : 'json',
		success : function(res) {
			
			$('#div_result *').remove();
			
			code = '<table id="getMemberInfoListTable" border="1">';
			code += '<tr><th>Id</th><th>pass</th><th>이름</th><th>생년월일</th>';
			code += '<th>전화번호</th><th>주소</th><th>이메일</th><th>권한</th><th>수정하기</th><th>삭제하기</th></tr>';
			$.each(res, function(i, v) {
				code += '<tr id="'+i+'">';
				code += '<td id="mem_id'+i+'" name="'+v.mem_id+'">'+ v.mem_id +'</td>';
				code += '<td id="mem_pass'+i+'" value="'+v.mem_pass+'">'+ v.mem_pass +'</td>';
				code += '<td id="mem_name'+i+'" value="'+v.mem_name+'">'+ v.mem_name +'</td>';
				code += '<td id="mem_bir'+i+'" value="'+v.mem_bir+'">'+ v.mem_bir +'</td>';
				code += '<td id="mem_tel'+i+'" value="'+v.mem_tel+'">'+ v.mem_tel +'</td>';
				code += '<td id="mem_addr'+i+'" value="'+v.mem_addr+'">'+ v.mem_addr +'</td>';
				code += '<td id="mem_email'+i+'" value="'+v.mem_email+'">'+ v.mem_email +'</td>';
				code += '<td id="power'+i+'" value="'+v.power+'">'+ v.power +'</td>';
				code += '<td><input id="getMemberInfoUpdateModeBtn" type="button" idx="'+i+'" value="회원정보수정하기"></td>';
				code += '<td><input id="MemberInfoDeleteBtn" type="button" idx="'+i+'" value="회원정보삭제하기"></td>';
				code += '</tr>';
				
			})
			code +='</table>';
			
			$('#div_result').append(code);
		},
		error : function(xhr) {
			
			alert("상태 : " + xhr.stauts)
		}
		
	})
	
}

// 회원정보 출력하기
var MemberInfoList = function() {
	
	// 회원정보 가져오기
	$.ajax({
		
		url : '/hotel/GetMemberInfoList.do',
		type : 'get',
		dataType : 'json',
		success : function(res) {
			
			$('#div_result *').remove();
			code ='<div id="powerinfox">[ 회원권한: 0  / 회원제한 : 1  / 회원탈퇴 : 2 ]</div>';
			code += '<input id="getMemberInfoAddBtn" type="button" value="회원추가">';
			code += '<input id="getMemberInfoUpdateBtn" type="button" value="회원수정"><br>';
			code += '<table id="getMemberInfoListTable" border="1">';
			code += '<tr><th>Id</th><th>pass</th><th>이름</th><th>생년월일</th>';
			code += '<th>전화번호</th><th>주소</th><th>이메일</th><th>권한</th></tr>';
			$.each(res, function(i, v) {
				code += '<tr id="'+i+'">';
				code += '<td id="mem_id'+i+'" name="'+v.mem_id+'">'+ v.mem_id +'</td>';
				code += '<td id="mem_pass'+i+'" value="'+v.mem_pass+'">'+ v.mem_pass +'</td>';
				code += '<td id="mem_name'+i+'" value="'+v.mem_name+'">'+ v.mem_name +'</td>';
				code += '<td id="mem_bir'+i+'" value="'+v.mem_bir+'">'+ v.mem_bir +'</td>';
				code += '<td id="mem_tel'+i+'" value="'+v.mem_tel+'">'+ v.mem_tel +'</td>';
				code += '<td id="mem_addr'+i+'" value="'+v.mem_addr+'">'+ v.mem_addr +'</td>';
				code += '<td id="mem_email'+i+'" value="'+v.mem_email+'">'+ v.mem_email +'</td>';
				code += '<td id="power'+i+'" value="'+v.power+'">'+ v.power +'</td>';
				code += '</tr>';
				
			})
			code +='</table>';
			
			$('#div_result').append(code);
		},
		error : function(xhr) {
			
			alert("상태 : " + xhr.stauts)
		}
		
	})
	
}

// 방 추가하기위한 지점 가져오기
var getcreateRoomPlList = function() {
	
	
	// 지점 가져오기
	$.ajax({
		
		url : '/hotel/RoomList.do',
		type : 'get',
		dataType : 'json',
		success : function(res) {
			
			$('#cModalroom_pl *').remove();
			
			code = "";
			
			$.each(res, function(i, v) {
				code += '<option value="'+v.room_pl+'">'+ v.room_pl +'</option>';
			})
			
			$('#cModalroom_pl').append(code);
		},
		error : function(xhr) {
			
			alert("상태 : " + xhr.stauts)
		}
		
	})
	
}

// 호텔 방 삭제
var deleteRoom = function() {
	
	dNum = dNum;
	console.log("num : " + dNum);
	
	dRoomPl = dRoomPl;
	console.log("roomPl : " + dRoomPl);
	
	dRoomNo = dRoomNo;
	console.log("roomNo : " + dRoomNo);
	
	// 방 삭제
	$.ajax({

		url : '/hotel/DeleteRoom.do',
		type : 'post',
		data : { 
			"room_pl" : dRoomPl,
			"room_no" : dRoomNo
			},	
		success : function(res) {
			
			alert("방 삭제 작업" + res.sw);
			
			$('#div_result *').remove();
			$('#modal_result *').remove();
			location.reload();
			
		},
		error : function(xhr) {
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
	
}

// 방 추가작업하고 DB에 방 추가하기
var insertRoom = function() {
	
	roomPl = roomPl;
	console.log("파라미터 roomPl : " + roomPl);
	
	roomNo = roomNo;
	console.log("파라미터 roomNo : " + roomNo);

	roomType = roomType;
	console.log("파라미터 roomType : " + roomType);

	roomStatus = roomStatus;
	console.log("파라미터 roomStatus : " + roomStatus);
	
	// 방 추가
	$.ajax({

		url : '/hotel/InsertRoom.do',
		type : 'post',
		data : { 
			"room_pl" : roomPl,
			"room_no" : roomNo,
			"room_type" : roomType,
			"room_status" : roomStatus
			},	
		success : function(res) {
			
			alert("방 추가 작업" + res.sw);
			
			$('#div_result *').remove();
			$('#modal_result *').remove();
			location.reload();
			
		},
		error : function(xhr) {
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
	
}

// 방 추가할 모델창 만드는 부분
var createRoomModal = function() {
	
	$('#modal_result *').remove();
	
	code ='<div id="cModal" class="modal fade" role="dialog">';
	code +='<div class="modal-dialog">';
	code +='방추가하기';
	code +='<div class="modal-content">';
	code +='<div class="modal-header">';
	code +='<button type="button" class="close" data-dismiss="modal">&times;</button>';
	code +='<h4 class="modal-title">방추가하기</h4>';
	code +='</div>';
	code +='<div class="modal-body">';
	code +='<form id="cform">';
	code +='<label>지점</label> : <select id="cModalroom_pl" name="room_pl"></select><br>';
	code +='<label>방번호</label> : <input id="cModalroom_no" type="text" name="room_no"><br>';
	code +='<label>방타입</label> : <input id="cModalroom_type" type="text" name="room_type"><br>';
	code +='<label>방상태</label> : <input id="cModalroom_status" type="text" name="room_status"<br>';
	code +='<input type="button" value="추가완료" id="roomCreateSubmitBtn"><br>';
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

// 월 매출 조회 
var getResvlogDateMoneyVal = function() {
	
	resvlogDateValArr = resvlogDateValArr;
	console.log("DB에 조회할 매출 파라미터값 : " + resvlogDateValArr);
	
	// 방 수정
	$.ajax({

		url : '/hotel/getResvlogDateMoney.do',
		type : 'post',
		data : { "resev_date" : resvlogDateValArr },	
		success : function(res) {
			
			$('#getResvlogDate_result *').remove();
			
			code = '<table class="getResvlogDateMoneyTable" id="getResvlogDateMoneyTable" border="1">';
			code += '<tr><th>예약번호</th><th>체크인날</th><th>체크아웃날</th><th>회원계정</th>';
			code += '<th>지점</th><th>방번호</th><th>방타입</th><th>투숙인원</th><th>예약결제상태</th>';
			code += '<th>결제날짜</th><th>매출</th><th>총매출</th></tr>';
			salesAll = 0;
			$.each(res, function(i, v) {
				salesAll += parseInt(v.sales);
				code += '<tr id="'+i+'">';
				code += '<td id="resev_no'+i+'" name="'+v.resev_no+'">'+ v.resev_no +'</td>';
				code += '<td id="room_in'+i+'" value="'+v.room_in+'">'+ v.room_in +'</td>';
				code += '<td id="room_out'+i+'" value="'+v.room_out+'">'+ v.room_out +'</td>';
				code += '<td id="mem_id'+i+'" value="'+v.mem_id+'">'+ v.mem_id +'</td>';
				code += '<td id="room_no'+i+'" value="'+v.room_no+'">'+ v.room_no +'</td>';
				code += '<td id="room_pl'+i+'" value="'+v.room_pl+'">'+ v.room_pl +'</td>';
				code += '<td id="room_type'+i+'" value="'+v.room_type+'">'+ v.room_type +'</td>';
				code += '<td id="room_num'+i+'" value="'+v.room_num+'">'+ v.room_num +'</td>';
				code += '<td id="resev_state'+i+'" value="'+v.resev_state+'">'+ v.resev_state +'</td>';
				code += '<td id="resev_date'+i+'" value="'+v.resev_date+'">'+ v.resev_date +'</td>';
				code += '<td id="sales'+i+'" value="'+v.sales+'">'+ v.sales +'</td>';
				code += '<td></td>';
				code += '</tr>';
				
			})
			salesAll = String (salesAll);
			salesAll = salesAll.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
			code += '<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>';
			code += '<td id="salesAll" value="'+salesAll+'">'+ salesAll +'</td></tr>';
			code +='</table>';
			
			$('#getResvlogDate_result').append(code);
			
		},
		error : function(xhr) {
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
	
}

// 월 매출 조회 하기위해 칸 생성
var getResvlogDate = function() {
	
	$('#div_result *').remove();
	
	code = '<input id="getResvlogDate" type="date">';
	code += '<input id="getResvlogDateBtn" type="button" value="매출조회">';
	code += '<div id="getResvlogDate_result">';
	code += '</div>';
	$('#div_result').append(code);
	
}

// 방 상태 수정 완료
var getRoomInfoUpdateCommitAfter = function() {
	
	console.log("num : " + num);
	console.log("roomPl : " + roomPl);
	console.log("roomNo : " + roomNo);
	console.log("roomType : " + roomType);
	console.log("roomStatus : " + roomStatus);
	
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
			
			code ='<input id="roomCreateBtn" type="button" value="방추가하기"><br>';
			code +='<table class="getRoomInfoUpdateList" id="getRoomInfo" border="1">';
			code +='<tr><td>지점</td><td>방 번호</td><td>방타입</td><td>방상태</td><td>방수정</td><td>방삭제</td></tr>';
			$.each(res, function(i, v) {
				code += '<tr id="'+i+'">';
				code += '<td id="room_pl'+i+'" name="'+v.room_pl+'">'+ v.room_pl +'</td>';
				code += '<td id="room_no'+i+'" value="'+v.room_no+'">'+ v.room_no +'</td>';
				code += '<td id="room_type'+i+'" value="'+v.room_type+'">'+ v.room_type +'</td>';
				code += '<td id="room_status'+i+'" value="'+v.room_status+'">'+ v.room_status +'</td>';
				code +='<td><input id="room_statusUdpateSubmitBtn" type="button" idx="'+i+'" value="방상태수정하기"></td>';
				code +='<td><input id="roomDeleteBtn" type="button" idx="'+i+'" value="방상태삭제하기"></td>';
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
	
	main = '<input id="room_statusCheckBtn" type="button" value="객실 상태 확인">&nbsp;&nbsp;';
	main += '<input type="button" id="resvloglist" value="예약 상태 확인">&nbsp;&nbsp;';
	main += '<input type="button" id="getResvlogDateMoneyBtn" value="선택 월 매출 확인">&nbsp;&nbsp;';
	main += '<input type="button" id="getMemberInfoListBtn" value="회원 정보 확인"><br><hr>';
	// 게시판 권한 신~
	main += '<a href = "unoticead.jsp">공지 게시판 관리(페이지이동)</a><br>';
	main += '<a href = "uqboardad.jsp">문의 게시판 관리(페이지이동)</a><br>';
	main += '<a href = "ureviewad.jsp">후기 게시판 관리(페이지이동)</a><br><hr>';
	
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
