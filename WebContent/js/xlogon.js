/**
 * 
 */

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
			alert("상태 : " + xhr.stauts)
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
				
				alert("로그인 성공!!\n" + res.mem_name + "님 환영합니다.");
				
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