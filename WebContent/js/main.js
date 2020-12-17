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

	code = '<input type="text" id="findIdVal" value="" placeholder="Id입력">';
	code += '<input type="text" id="findNameVal" value="" placeholder="이름입력">';
	code += '<input type="text" id="findEmailVal" value="" placeholder="이메일입력">';
	code += '<input type="button" id="findPassWordBtn" value="비밀번호 찾기">';

	$('#div_result').append(code);

}
// 아이디 찾기위해 입력부분 모드
var createfindIdMode = function() {

	$('#div_result *').remove();

	code = '<input type="text" id="findNameVal" value="" placeholder="이름입력">';
	code += '<input type="text" id="findEmailVal" value="" placeholder="이메일입력">';
	code += '<input type="button" id="findIdBtn" value="아이디 찾기">';

	$('#div_result').append(code);

}

// 아이디 비밀번호 찾기
var createfindIdPassWordMode = function() {

	$('#div_result *').remove();

	code = '<input type="button" id="createfindIdBtn" value="Id찾기">';
	code += '<input type="button" id="createfindPassWordBtn" value="비밀번호찾기">';

	$('#div_result').append(code);

}

// 로그인하면 생기는 부분
var createLoginAfterPart = function() {

	code = '<form id="loginForm" action="#" method="post">';
	code += '<div id="loginAfter">';
	code += '<label id="userId"></label>&nbsp';
	code += '<label id="userName"></label>&nbsp';
	code += '<label id="userEmail"></label>&nbsp';
	code += '<input id="loginOutBtn" type="button" value="로그아웃">';
	//code+='<input type="button" value="내정보">';
	code += '</div>';
	code += '</form>';

	$('#login').append(code);

}

// 로그인 하기 위해 입력하는 부분 만드는 부분
var createLoginPart = function() {

	code = '<form id="loginForm" action="#" method="post">';
	code += '<div id="loginBefore">';
	code += '<label>아이디 : </label><input id="id" type="text" name="id">';
	code += '<label>비밀번호 : </label><input id="password" type="password" name="pass">';
	code += '<input id="loginBtn" type="button" value="로그인">';
	code += '<a href="memberjoin2.jsp">회원가입</a>';
	code += '<a href="#" id="findIdPassWord">ID/비밀번호찾기</a>';
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
			if(res.power==0){
			alert("로그인 성공!!\n" + res.mem_name + " 님 환영합니다.");
			$('#userName').empty();
			location.reload();
			}else{
				alert("로그인이 불가합니다. 관리자에게 문의하세요.");
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

// 예약 부분
var insertResVLog = function() {

	// 예약 처리
	// 방번호
	vroomNo = $('#roomNoList').val();

	// 방 인원수 값
	vroomPeople = $('#roomPeople').text();

	// 시작날짜 가져오기
	dateStartVal = $('#dateStart').val().trim();

	// 끝날짜 가져오기
	dateEndVal = $('#dateEnd').val().trim();

	// 예약 등록
	$.ajax({

		url : '/hotel/InsertResVLog.do',
		type : 'post',
		data : {
			"room_in" : dateStartVal,
			"room_out" : dateEndVal,
			"mem_id" : userId,
			"room_no" : vroomNo,
			"room_pl" : vroomPl,
			"room_type" : vroomType,
			"room_num" : vroomPeople
		},
		success : function(res) {
			alert(userId + " 님 예약 " + res.sw + " 하셨습니다.");

			// 페이지 새로고침
			location.reload();
		},
		error : function(xhr) {
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'

	});

}

// 방번호 처리 부분
var getRoomNumList = function() {

	// 방번호 처리
	$('#roomTypeList').on(
			'click',
			function() {

				// 방타입값
				vroomType = $('#roomTypeList').val();

				// 방번호 가져오기
				$.ajax({

					url : '/hotel/RoomNum.do',
					type : 'post',
					data : {
						"room_pl" : vroomPl,
						"room_type" : vroomType
					},
					success : function(res) {

						$('#roomNoList').empty();
						$('#roomPeople').empty();

						code = "";
						$.each(res, function(i, v) {
							code += '<option value="' + v.room_no + '">'
									+ v.room_no + '</option>';
						})

						$('#roomNoList').append(code);

						if (vroomType == "싱글") {
							code = '<p value="1">1</p>';
							$('#roomPeople').append(code);
						} else if (vroomType == "더블") {
							code = '<p value="2">2</p>';
							$('#roomPeople').append(code);
						} else if (vroomType == "스위트") {
							code = '<p value="4">4</p>';
							$('#roomPeople').append(code);
						}

					},
					error : function(xhr) {
						alert("상태 : " + xhr.status);
					},
					dataType : 'json'
				})

			})

}

// 방종류 가져오는 부분
var getRoomTypeList = function() {

	// 방 종류 선택
	$('#roomPlList').on(
			'click',
			function() {

				vroomPl = $(this).val();

				// 방 타입 가져오기
				$.ajax({

					url : '/hotel/RoomList.do',
					type : 'post',
					data : {
						"room_pl" : vroomPl
					},
					success : function(res) {

						$('#roomTypeList').empty();
						$('#roomPeople').empty();

						code = "";
						$.each(res, function(i, v) {
							code += '<option value="' + v.room_type + '">'
									+ v.room_type + '</option>';
						})

						$('#roomTypeList').append(code);

					},
					error : function(xhr) {
						alert("상태 : " + xhr.status);
					},
					dataType : 'json'
				})

			})

}

// 지점 가져오는 부분
var getRoomPlList = function() {

	// 지점 가져오기
	$.ajax({

		url : '/hotel/RoomList.do',
		type : 'get',
		dataType : 'json',
		success : function(res) {

			$('#roomPlList').empty();
			$('#roomPeople').empty();

			code = "";

			$.each(res, function(i, v) {
				code += '<option value="' + v.room_pl + '">' + v.room_pl
						+ '</option>';
			})

			$('#roomPlList').append(code);
		},
		error : function(xhr) {

			alert("상태 : " + xhr.stauts)
		}

	})

}
