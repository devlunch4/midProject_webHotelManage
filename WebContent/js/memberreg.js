/**
 * 
 */
function idcheck() {
	// id 정규식 검사

	idvaluex = $("#joinid").val().trim();

	if (idvaluex.length < 1) {
		// alert("아이디입력");
		$("#joinidspan").html("아이디입력").css("color", "red");
		return false;
	}

	// 아이디 길이4~8
	if (idvaluex.length < 4 || idvaluex.length > 12) {
		// alert("아이디 4~12 사이의 자리로 입력해주세요");
		$("#joinidspan").html("아이디 4~12 사이의 자리로 입력해주세요").css("color", "red");
		return false;
	}

	// 아이디 정규식 -소문자로 시작하고 대문자와 소문자로 조합가능하다.
	idreg = /^[a-z][a-zA-z0-9]{3,7}$/;
	if (!(idreg.test(idvaluex))) {
		// alert("아이디는 소문자로 시작 또는 4~7자리 입니다");
		$("#joinidspan").html("아이디는 소문자로 시작 또는 4~7자리 입니다").css("color", "red");
		return false;
	} else {
		$('#joinidspan').html("올바른 아이디 입력").css('color', 'green');
	}
	return true;
}

// 함수 사용을 통해 체크를 한다.
function regcheck() {

	idvaluex = $("#joinid").val().trim();

	if (idvaluex.length < 1) {
		// alert("아이디입력");
		$("#joinidspan").html("아이디입력").css("color", "red");
		return false;
	}

	// 아이디 길이4~8
	if (idvaluex.length < 4 || idvaluex.length > 12) {
		// alert("아이디 4~12 사이의 자리로 입력해주세요");
		$("#joinidspan").html("아이디 4~12 사이의 자리로 입력해주세요").css("color", "red");
		return false;
	}

	// 아이디 정규식 -소문자로 시작하고 대문자와 소문자로 조합가능하다.
	idreg = /^[a-z][a-zA-z0-9]{3,7}$/;
	if (!(idreg.test(idvaluex))) {
		// alert("아이디는 소문자로 시작 또는 4~7자리 입니다");
		$("#joinidspan").html("아이디는 소문자로 시작 또는 4~7자리 입니다").css("color", "red");
		return false;
	} else {
		$('#joinidspan').html("올바른 아이디 입력").css('color', 'green');
	}
	return true;
}
// ///////////////////////////////////////////////////////////
// 비밀번호 - 공백,길이, 정규식 비밀번호 영문대소문자 숫자 특수문자가 하나이상씩
function regpwdck() {

	vpwd = $("#pwd").val().trim();
	vpwd2 = $("#pwd2").val().trim();
	regpwd = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,12}$/;

	if (vpwd.length < 1) {
		// alert("비밀번호 입력");
		$('#pwdspan').html("비밀번호 입력").css('color', 'red');
		return false;
	}

	if (vpwd.length < 8 || vpwd.length > 12) {
		// alert("8~12 자리수로 비밀번호 입력");
		$('#pwdspan').html("8~12 자리수로 비밀번호 입력").css('color', 'red');
		return false;
	}

	if (!(regpwd.test(vpwd))) {
		// alert("비밀번호 형식 오류");
		$('#pwdspan').html("비밀번호 형식 오류").css('color', 'red');
		return false;
	} else {
		$('#pwdspan').html("올바른 비밀번호 입력").css('color', 'green');
	}
	return true;
}

function regpwdck2() {
	vpwd = $("#pwd").val().trim();
	vpwd2 = $("#pwd2").val().trim();
	regpwd = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,12}$/;
	
	// ///비밀번호 확인
	if (vpwd2 < 1) {
		// alert("비밀번호 확인 입력");
		$('#pwdspan2').html("비밀번호 확인 입력").css('color', 'red');
		return false;
	}

	if (vpwd2 != vpwd) {
		// alert("비밀번호 확인의 입력 값이 다릅니다.");
		$('#pwdspan2').html("비밀번호 값 불일치").css('color', 'red');
		return false;
	} else {
		$('#pwdspan2').html("비밀번호 값 일치").css('color', 'green');
	}
	return true;
}

// ///////////////////////////////////////////////////////////
// 이름 정규식 - 공백,길이, 정규식, 한글 2~5입력
function regnameck() {

	vname = $("#name").val().trim();

	// 이름공백
	if (vname.length < 1) {
		// alert("이름 입력");
		$('#namespan').html("이름 입력").css('color', 'red');
		return false;
	}
	// 이름길이 2~5
	if (vname.length < 2 || vname.length > 5) {
		// alert("이름길이 2~5");
		$('#namespan').html("이름 길이 2~5").css('color', 'red');
		return false;
	}

	regname = /^[가-힣]{2,5}$/;
	if (!(regname.test(vname))) {
		// alert("이름은 한글로 입력");
		$('#namespan').html("이름은 한글로 입력").css('color', 'red');
		return false;
	} else {
		$('#namespan').html("올바른 이름 입력").css('color', 'green');
	}
	return true;
}

// ///////////////////////////////////////////////////////////
// // 생년월일 10상이상
function regbirck() {

	bvalue = $("#bir").val().trim();

	if (bvalue.length < 1) {
		// alert("생년월일을 입력해주세요" + bvalue);
		$('#birspan').html("나이 입력").css('color', 'red');
		return false;
	}

	sub = parseInt(bvalue.substring(0, 4)); // 년도 추출
	today = new Date(); // 오늘 년월일
	year = today.getFullYear(); // 오늘 년 추출
	age = year - sub;
	if (age < 10) {
		// alert("당신의 나이는 " + age + "입니다. 나이가 어립니다.");
		$('#birspan').html("나이 제한, 당신은 " + age + " 세").css('color', 'red');
		return false;
	} else {
		$('#birspan').html("생년월일" + bvalue + ", 당신은 " + age + " 세").css(
				'color', 'green');
	}
	return true;
}

// ///////////////////////////////////////////////////////////
// 성별
function reggendck() {

	vgend = $("#gend").val().trim();
	if (vgend == "male") {
		$('#gendspan').html("남자").css('color', 'grean');
	} else if (vgend == "female") {
		$('#gendspan').html("여자").css('color', 'grean');
	}
	return true;
}

// ///////////////////////////////////////////////////////////
// 이메일- 공백
function regemailck() {
	vemail = $("#email").val().trim();
	if (vemail.length < 1) {
		// alert("이메일 입력해주세요");
		$('#emailspan').html("이메일 입력").css('color', 'red');
		return false;
	}

	// 이메일 정규식
	regemail = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z]+){1,2}$/;
	if (!(regemail.test(vemail))) {
		// alert("이메일 형식오류");
		$('#emailspan').html("이메일 형식오류").css('color', 'red');
		return false;
	} else {
		$('#emailspan').html("올바른 이메일 입력").css('color', 'green');
	}
	return true;
}
// ///////////////////////////////////////////////////////////
// 전화번호 - 공백 정규식
function regtelck() {
	vtel = $("#tel").val().trim();
	regtel = /^\d{3}-\d{4}-\d{4}$/;
	// 전화번호 공백
	if (vtel.length < 1) {
		// alert("전화번호 입력");
		$('#telspan').html("전화번호 입력").css('color', 'red');
		return false;
	}

	if (!(regtel.test(vtel))) {
		// alert("전화번호 형식오류 000-0000-0000");
		$('#telspan').html("전화번호 형식오류 000-0000-0000").css('color', 'red');
		return false;
	} else {
		$('#telspan').html("올바른 전화번호 입력").css('color', 'green');
	}
	return true;
}
// ///////////////////////////////////////////////////////////

// 우편번호
function regzipck() {
	vzip = $("#zip").val();
	// 주소 공백
	if (vzip.length < 1) {
		$('#zipspan').html("우편 주소 입력").css('color', 'red');
		return false;
	} else {
		$('#zipspan').html("우편 주소 입력 완료").css('color', 'green');
	}
	return true;
}

// 일반주소
function regaddr1ck() {

	vaddr1 = $("#addr1").val();
	// 주소 공백
	if (vaddr1.length < 1) {
		$('#addr1span').html("일반 주소 입력").css('color', 'red');
		return false;
	} else {
		$('#addr1span').html("일반 주소 입력 완료").css('color', 'green');
	}
	return true;
}
// ///////////////////////////////////////////////////////////
// 상세주소
function regaddr2ck() {
	vaddr2 = $("#addr2").val();
	if (vaddr2.length < 1) {
		$('#addr2span').html("일반 주소 입력").css('color', 'red');
		return false;
	} else {
		$('#addr2span').html("일반 주소 입력 완료").css('color', 'green');
	}
	return true;
}
