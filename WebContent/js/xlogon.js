/**
 * 
 */

// 비밀번호찾기
var findPassWord = function() {

	userIdVal = userIdVal;
	nameVal = nameVal;
	EmailVal = EmailVal;

	$.ajax({

		url : '/hotel/FindPassWord.do',
		type : 'post',
		data : {
			"mem_name" : nameVal,
			"mem_email" : EmailVal,
			"mem_id" : userIdVal
		},
		success : function(res) {

			alert("비밀번호 전송이 " + res.sw + "되었습니다.");

			$('#div_result *').remove();
			location.reload();
		},
		error : function(xhr) {
			alert("상태 : " + xhr.stauts)
		},
		dataType : 'json'
	})
}
// Id찾기
var findId = function() {

	nameVal = nameVal;
	EmailVal = EmailVal;

	$.ajax({

		url : '/hotel/FindId.do',
		type : 'post',
		data : {
			"mem_name" : nameVal,
			"mem_email" : EmailVal
		},
		success : function(res) {

			alert("아이디 전송이 " + res.sw + "되었습니다.");

			$('#div_result *').remove();
			location.reload();
		},
		error : function(xhr) {
			alert("상태 : " + xhr.stauts)
		},
		dataType : 'json'

	})
}

// 비밀번호 찾기위해 입력부분 모드
var createfindPassWordMode = function() {

	$('#div_result *').remove();

	code = '<div class="findpasswordx" style="text-align : center;"><br><input type="text" id="findIdVal" value="" placeholder="아이디 입력"><br><br>';
	code += '<input type="text" id="findNameVal" value="" placeholder="이름 입력"><br><br>'; 
	code += '<input type="text" id="findEmailVal" value="" placeholder="이메일 입력"><br><br>';
	code += '<input type="button" id="findPassWordBtn"';
	code +=	' style="min-width: auto; padding: 0 12px; font-size: 13.5px; height: 45px; background: #dfbd94; border: 1px solid #9c836a; color: #fff;"';
	code +=	' value="비밀번호 찾기"></div>';

	$('#div_result').append(code);

}
// 아이디 찾기위해 입력부분 모드
var createfindIdMode = function() {

	$('#div_result *').remove();

	code = '<div class="findidwordx" style="text-align : center;"><br><input type="text" id="findNameVal" value="" placeholder="이름 입력"><br><br>';
	code += '<input type="text" id="findEmailVal" value="" placeholder="이메일 입력"><br><br>';
	code += '<input type="button" id="findIdBtn"';
	code +=	' style="min-width: auto; padding: 0 12px; font-size: 13.5px; height: 45px; background: #dfbd94; border: 1px solid #9c836a; color: #fff;"';
	code += ' value="아이디 찾기"></div>';
		

	$('#div_result').append(code);

}

// 아이디 비밀번호 찾기
var createfindIdPassWordMode = function() {

	$('#div_result *').remove();

	code = '<div class="findidpassx" style="text-align : center;"><br><input type="button" id="createfindIdBtn" ';
	code +=	' style="min-width: auto; padding: 0 12px; font-size: 13.5px; height: 45px; background: #dfbd94; border: 1px solid #9c836a; color: #fff;"';
	code +=	'value="아이디 찾기"><br><br>';
	code += '<input type="button" id="createfindPassWordBtn" '; 
	code +=	' style="min-width: auto; padding: 0 12px; font-size: 13.5px; height: 45px; background: #dfbd94; border: 1px solid #9c836a; color: #fff;"';
	code += ' value="비밀번호 찾기"></div>';
	$('#div_result').append(code);

}

// 유저 자신이 예약한 정보 가져오는 부분
var getMyResvlogList = function() {

	userId = userId;
	console.log("userId : " + userId);

	// 유저 자신이 예약한 정보 가져오기
	$
			.ajax({

				url : '/hotel/getresvLogAllList.do',
				type : 'post',
				data : {
					"mem_id" : userId
				},
				dataType : 'json',
				success : function(res) {

					code = '<table class="getresvLogAllListTable" id="getResvlogDateMoneyTable" border="1">';
					code += '<thead>';
					code += '<tr id="tabletitle"><th scope="cols">예약번호</th><th scope="cols">체크인</th><th scope="cols">체크아웃시간</th><th scope="cols">회원계정</th><th scope="cols">방번호</th>';
					code += '<th scope="cols">지점</th><th scope="cols">방타입</th><th scope="cols">투숙인원</th><th scope="cols">예약 상태</th><th scope="cols">예약한 날짜</th></tr>';
					code += '</thead>';
					$.each(res, function(i, v) {

						code += '<tbody>';
						code += '<tr><th scope="row" id="RESEV_NO" value="'
								+ v.RESEV_NO + '">' + v.RESEV_NO + '</th>';
						code += '<td id="ROOM_IN' + i + '" value="' + v.ROOM_IN
								+ '">' + v.ROOM_IN + '</td>';
						code += '<td id="ROOM_OUT' + i + '" value="'
								+ v.ROOM_OUT + '">' + v.ROOM_OUT + '</td>';
						code += '<td id="MEM_ID' + i + '" value="' + v.MEM_ID
								+ '">' + v.MEM_ID + '</td>';
						code += '<td id="ROOM_PL' + i + '" value="' + v.ROOM_PL
								+ '">' + v.ROOM_PL + '</td>';
						code += '<td id="ROOM_NO' + i + '" value="' + v.ROOM_NO
								+ '">' + v.ROOM_NO + '</td>';
						code += '<td id="ROOM_TYPE' + i + '" value="'
								+ v.ROOM_TYPE + '">' + v.ROOM_TYPE + '</td>';
						code += '<td id="ROOM_NUM' + i + '" value="'
								+ v.ROOM_NUM + '">' + v.ROOM_NUM + '</td>';
						code += '<td id="RESEV_STATE' + i + '" value="'
								+ v.RESEV_STATE + '">' + v.RESEV_STATE
								+ '</td>';
						code += '<td id="RESEV_DATE' + i + '" value="'
								+ v.RESEV_DATE + '">' + v.RESEV_DATE
								+ '</td><tr>';
						code += '</tbody>';
					})
					code += '</table>';
					$('#div_result *').remove();
					$('#div_result').append(code);

				},
				error : function(xhr) {

					alert("예약한 정보 호출 불가 상태 : " + xhr.stauts);
				}

			})

}

// 내정보 수정하면 세션 정보 업데이트 해주기
var updateSessionDate = function() {

	userId = userId;

	// 세션 정보 업데이트
	$.ajax({

		url : '/hotel/updateSession.do',
		type : 'post',
		data : {
			"mem_id" : userId
		},
		dataType : 'json',
		success : function(res) {

			// 내정보수정이 성공하면 페이지 새로고침
			location.reload();
		},
		error : function(xhr) {

			alert("내정보 수정/업데이트 불가 상태 : " + xhr.stauts);
		}

	})

}

// 수정할 내정보 입력하구 난 후 업데이트 부분
var MemberInfoValUpdateSubmit = function() {

	p_nameVal = $('#p_nameVal').val();
	p_telVal = $('#p_telVal').val();
	p_addrVal = $('#p_addrVal').val();
	p_emailVal = $('#p_emailVal').val();

	userId = userId;

	// 수정한 내정보 업데이트
	$.ajax({

		url : '/hotel/MyMemberInfoUpdate.do',
		type : 'post',
		data : {
			"mem_id" : userId,
			"mem_name" : p_nameVal,
			"mem_tel" : p_telVal,
			"mem_addr" : p_addrVal,
			"mem_email" : p_emailVal
		},
		dataType : 'json',
		success : function(res) {

			alert("내정보 수정" + res.sw + "하셨습니다.");

			$('#div_result *').remove();

			// 내정보수정이 성공하면 페이지 새로고침
			location.reload();
		},
		error : function(xhr) {

			alert("내 정보 수정 실패상태 : " + xhr.stauts);
		}

	})

}

// 내정보수정 버튼 클릭하면 내정보를 출력
var MemberInfoVal = function() {

	p_idVal = $('#p_id').text();
	p_nameVal = $('#p_name').text();
	p_telVal = $('#p_tel').text();
	p_addrVal = $('#p_addr').text();
	p_emailVal = $('#p_email').text();

	console.log("p_idVal : " + p_idVal);
	console.log("p_nameVal : " + p_nameVal);
	console.log("p_telVal : " + p_telVal);
	console.log("p_addrVal : " + p_addrVal);
	console.log("p_emailVal : " + p_emailVal);

	$('#div_result *').remove();

	code = '<div class="clickmyinfox"><p id="p_name">닉네임</p><input id="p_nameVal" type="text" value="'
			+ p_nameVal + '"><br><br>';
	code += '<p id="p_tel">전화번호</p><input id="p_telVal" type="text" value="'
			+ p_telVal + '"><br><br>';
	code += '<p id="p_addr">주소</p><input id="p_addrVal" type="text" value="'
			+ p_addrVal + '"><br><br>';
	code += '<p id="p_email">이메일</p><input id="p_emailVal" type="text" value="'
			+ p_emailVal + '"><br><br><br>';
	code += '<input id="myinfoUpdateSubmit" type="button" value="내정보수정완료"></div>';

	$('#div_result').append(code);

}

// 로그인한 유저정보 가져오는 부분
var getMemberInfoVal = function() {
	console.log(userId);
	userId = userId;

	// 내정보 가져오기
	$
			.ajax({

				url : '/hotel/MyMemberInfoList.do',
				type : 'post',
				data : {
					"MEM_ID" : userId
				},
				dataType : 'json',
				success : function(res) {

					console.log("res.mem_id : " + res.mem_id);
					console.log("res.mem_name : " + res.mem_name);
					console.log("res.mem_bir : " + res.mem_bir);
					console.log("res.mem_tel : " + res.mem_tel);
					console.log("res.mem_addr : " + res.mem_addr);
					console.log("res.mem_email : " + res.mem_email);
					
					
					birx = res.mem_bir;
					birx= birx.slice(0,10);
					
					console.log(" NEWNEW res.mem_bir : " + birx);
					
					
					code = '<div class="getmyinfox"><label>아이디 </label><p id="p_id" value="'
							+ res.mem_id + '">' + res.mem_id + '</p>';
					code += '<label>닉네임 </label><p id="p_name" value="'
							+ res.mem_name + '">' + res.mem_name + '</p>';
					code += '<label>생년월일</label> <p id="p_bir" value="'
							+ res.mem_bir + '">' + birx + '</p>';
					code += '<label>전화번호 </label><p id="p_tel" value="'
							+ res.mem_tel + '">' + res.mem_tel + '</p>';
					code += '<label>주소 </label><p id="p_addr" value="'
							+ res.mem_addr + '">' + res.mem_addr + '</p>';
					code += '<label>이메일 </label><p id="p_email" value="'
							+ res.mem_email + '">' + res.mem_email + '</p><br><br>';
					code += '<input id="myinfoUpdateBtn" type="button" value="내정보수정하기">';
					code += '</div>';
					
					code += '<div class="memberLeave">';
					code += '<h4>회원탈퇴</h4>';
					code += '<p id="leavetext">호텔달고나 회원탈퇴는 하단 ‘회원 탈퇴신청’ 버튼을 클릭하시면 즉시 탈퇴가 이루어집니다. <br />탈퇴 후 해당 아이디와 회원 정보는 비활성처리 됩니다.</p>';
					code +=	'<input id="memberWithdrawBtn" type="button" value="회원탈퇴하기">';
					code += '</div>';

					$('#div_result').append(code);
				},
				error : function(xhr) {

					alert("로그인 필요 / 내 정보가 없는 상태 : " + xhr.stauts);
				}

			})

}

// 회원 탈퇴
var MemberWithdraw = function() {
	alert("회원탈퇴가 진행됩니다.");
	userId = userId;
	$.ajax({
		url : '/hotel/UpdateMemberWithdraw.do',
		type : 'post',
		data : {
			"mem_id" : userId
		},
		success : function(res) {
			alert("회원탈퇴가" + res.sw + "했습니다.\n이용해주셔서 감사합니다.");
			$('#div_result *').remove();
			location.href="main.jsp";
		},
		error : function(xhr) {
			alert("회원 탈퇴 실패 상태 : " + xhr.stauts)
		},
		dataType : 'json'
	})
}

// 로그인하면 생기는 부분
var createLoginAfterPart = function() {

	code = '<form id="loginForm" action="#" method="post">';
	code += '<div id="loginAfter">';
	code += '<label id="userId"></label>&nbsp';
	code += '<label id="userName"></label>&nbsp';
	code += '<label id="userEmail"></label>&nbsp';
	code += '<input id="loginOutBtn" type="button" value="로그아웃">';
	// code+='<input type="button" value="내정보">';
	code += '</div>';
	code += '</form>';

	$('#login').append(code);

}

// 로그인 하기 위해 입력하는 부분 만드는 부분
var createLoginPart = function() {

	code = '<form id="loginForm" action="#" method="post">';
	code += '<div id="loginBefore">';
	code += '<label>아이디 : &nbsp;</label><input id="id" type="text" name="id" style="width:100px">';
	code += ' &nbsp;<label>비밀번호 : &nbsp;</label><input id="password" type="password" name="pass" style="width:100px">';
	code += ' &nbsp;<input id="loginBtn" type="button" value="로그인">';
	code += '<a href="umemberjoin.jsp">&nbsp;회원가입&nbsp;</a>';
	code += '<a href="#" id="findIdPassWord"> ID/비밀번호찾기&nbsp;</a>';
	code += '</div>';
	code += '</form>';

	$('#login').append(code);

}

// 로그아웃 부분
var logout = function() {

	// 로그아웃
	// 로그아웃 및 세션 정보 지우기
	$.ajax({

		url : '/hotel/LogOut.do',
		type : 'get',
		success : function(res) {

			alert("로그아웃 " + res.sw + "하셨습니다.");

			$('#userName').empty();
			$('#userEmail').empty();

			// 로그인 성공하면 페이지 새로고침
			location.reload();

		},
		error : function(xhr) {
			alert("로그아웃 실패 상태 : " + xhr.stauts)
		},
		dataType : 'json'

	})

}

// 로그인 부분
var login = function() {

	idval = $('#id').val().trim();
	passval = $('#password').val().trim();
	userId = idval;
	userPassword = passval;

	// 로그인
	$.ajax({

		url : '/hotel/LoginIn.do',
		type : 'post',
		data : {
			"MEM_ID" : userId,
			"MEM_PASS" : userPassword
		},

		success : function(res) {
			if (res.power == 0) {
				alert("로그인 성공!!\n" + res.mem_name + " 님 환영합니다.");
				$('#userName').empty();
				location.reload();
			} else {
				alert("로그인이 불가합니다.[제한] 관리자에게 문의하세요.");
			}
		},
		error : function(xhr) {
			alert("로그인 실패 상태 : " + xhr.status);
			$('#id').empty();
			$('#password').empty();
			return false;
		},
		dataType : 'json'
	})
}