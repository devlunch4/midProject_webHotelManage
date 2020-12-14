/**
 * 
 */

// 유저 자신이 예약한 정보 가져오는 부분
var getMyResvlogList = function() {
	
	userId = userId;
	console.log("userId : " + userId);
	
	// 유저 자신이 예약한 정보 가져오기
	$.ajax({
		
		
		url : '/hotel/getresvLogAllList.do',
		type : 'post',
		data : {"mem_id" : userId},
		dataType : 'json',
		success : function(res) {
			
			code = "****************************************************************************<br>";
			
			$.each(res, function(i, v) {
				code += '예약번호 : <p id="RESEV_NO" value="'+v.RESEV_NO+'">'+v.RESEV_NO+'</p>';
				code += '체크인 : <p id="ROOM_IN" value="'+v.ROOM_IN+'">'+v.ROOM_IN+'</p>';
				code += '체크아웃시간 : <p id="ROOM_OUT" value="'+v.ROOM_OUT+'">'+v.ROOM_OUT+'</p>';
				code += '회원계정 : <p id="MEM_ID" value="'+v.MEM_ID+'">'+v.MEM_ID+'</p>';
				code += '방번호 : <p id="ROOM_PL" value="'+v.ROOM_PL+'">'+v.ROOM_PL+'</p>';
				code += '지점 : <p id="ROOM_NO" value="'+v.ROOM_NO+'">'+v.ROOM_NO+'</p>';
				code += '방타입 : <p id="ROOM_TYPE" value="'+v.ROOM_TYPE+'">'+v.ROOM_TYPE+'</p>';
				code += '투숙인원 : <p id="ROOM_NUM" value="'+v.ROOM_NUM+'">'+v.ROOM_NUM+'</p>';
				code += '예약 상태 : <p id="RESEV_STATE" value="'+v.RESEV_STATE+'">'+v.RESEV_STATE+'</p>';
				code += '예약한 날짜 : <p id="RESEV_DATE" value="'+v.RESEV_DATE+'">'+v.RESEV_DATE+'</p>';
				code += "****************************************************************************<br>";
			})
			
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
		data : {"mem_id" : userId},
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
			"mem_email": p_emailVal
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

//내정보수정 버튼 클릭하면 내정보를 출력
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
	
	code = '<p id="p_name">닉네임 :</p><input id="p_nameVal" type="text" value="'+ p_nameVal +'">';
	code += '<p id="p_tel">전화번호 :</p><input id="p_telVal" type="text" value="'+ p_telVal +'">';
	code += '<p id="p_addr">주소 :</p><input id="p_addrVal" type="text" value="'+ p_addrVal +'">';
	code += '<p id="p_email">이메일 :</p><input id="p_emailVal" type="text" value="'+ p_emailVal +'"><br>';
	code += '<input id="myinfoUpdateSubmit" type="button" value="내정보수정완료">';
	
	$('#div_result').append(code);
	
}

// 로그인한 유저정보 가져오는 부분
var getMemberInfoVal = function() {
	console.log(userId);
	userId = userId;
	
	
	// 내정보 가져오기
	$.ajax({
		
		
		url : '/hotel/MyMemberInfoList.do',
		type : 'post',
		data : {"MEM_ID" : userId},
		dataType : 'json',
		success : function(res) {
			
			console.log("res.mem_id : " + res.mem_id);
			console.log("res.mem_name : " + res.mem_name);
			console.log("res.mem_bir : " + res.mem_bir);
			console.log("res.mem_tel : " + res.mem_tel);
			console.log("res.mem_addr : " + res.mem_addr);
			console.log("res.mem_email : " + res.mem_email);
			
			code= '아이디 :<p id="p_id" value="'+ res.mem_id +'">' + res.mem_id +'</p>';				
			code += '닉네임 :<p id="p_name" value="'+ res.mem_name +'">' + res.mem_name +'</p>';
			code += '생년월일 :<p id="p_bir" value="'+ res.mem_bir +'">' + res.mem_bir +'</p>';
			code += '전화번호 :<p id="p_tel" value="'+ res.mem_tel +'">' + res.mem_tel +'</p>';
			code += '주소 :<p id="p_addr" value="'+ res.mem_addr +'">' + res.mem_addr +'</p>';
			code += '이메일 :<p id="p_email" value="'+ res.mem_email +'">' + res.mem_email +'</p>';
			code += '<input id="myinfoUpdateBtn" type="button" value="내정보수정하기">';
			
			$('#div_result').append(code);
		},
		error : function(xhr) {
			
			alert("로그인 필요 / 내 정보가 없는 상태 : " + xhr.stauts);
		}
		
	})
	
}

// 로그인하면 생기는 부분
var createLoginAfterPart = function() {
	
	code='<form id="loginForm" action="#" method="post">';
	code+='<div id="loginAfter">';
	code+='<label id="userName"></label>';
	code+='<label id="userEmail"></label>';
	code+='<input id="loginOutBtn" type="button" value="로그아웃">';
	code+='<input type="button" value="내정보">';
	code+='</div>';
	code+='</form>';
	
	$('#login').append(code);
	
}

// 로그인 하기 위해 입력하는 부분 만드는 부분
var createLoginPart = function() {
	
	code='<form id="loginForm" action="#" method="post">';
	code='<div id="loginBefore">';
	code+='<label>아이디 : </label><input id="id" type="text" name="id">';
	code+='<label>비밀번호 : </label><input id="password" type="password" name="pass">';
	code+='<input id="loginBtn" type="button" value="로그인">';
	code+='<a href="memberjoin2.jsp">회원가입</a>';
	code+='<a href="main.html">ID/비밀번호찾기</a>';
	code+='</div>';
	code+='</form>';
	
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
			data : {"MEM_ID" : userId, "MEM_PASS" : userPassword},	
			success : function(res) {
				
				alert("로그인 성공!!\n" + res.mem_name + " 님 환영합니다.");
				
				$('#userName').empty();
				location.reload();
				
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