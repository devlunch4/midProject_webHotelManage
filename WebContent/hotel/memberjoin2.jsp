<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script src="../js/jquery.serializejson.min.js"></script>
<script src="../js/memberreg.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function openDaumZipAddress() {
		new daum.Postcode({
			oncomplete : function(data) {
				//jQuery("#postcode1").val(data.postcode1);
				//jQuery("#postcode2").val(data.postcode2);
				jQuery("#zip").val(data.zonecode);
				jQuery("#addr1").val(data.address);
				jQuery("#addr2").focus();
				console.log(data);
			}
		}).open();
	}
</script>

<link rel="stylesheet" href="../css/public.css">


<style>
.ziptr:hover {
	background: crimson;
}

#result1 {
	background: linear-gradient(to right, LightCyan, white);
}
</style>

<script>
infox = {};

	$(
			function() {
							
				$("#resetbtn").on("click", function() {
					document.location.reload(true);
				})

				$('#id').keyup(function() {
					if (!regcheck()) {
						return false;
					}
				})

				/* 	$("#pwd").on("change", function() {
						if (!regpwdck()) {
							regpwdck2();
							return false;
						}else if (!regpwdck2()) {
							regpwdck();
							return false;
						}
						
					});

					$("#pwd2").on("change", function() {
						if (!regpwdck2()) {
							regpwdck();
							return false;
						}else if (!regpwdck()) {
							regpwdck2();
							return false;
						}
						
					}); */

				$("#pwd").keyup( function() {
					if (!regpwdck()) {
						regpwdck2();
						return false;
					}
				});

				$("#pwd2").keyup( function() {
					if (!regpwdck2()) {
						regpwdck();
						return false;
					}
				});

				$("#name").keyup(function() {
					if (!regnameck()) {
						return false;
					}
				});

				$("#bir").on("change", function() {
					if (!regbirck()) {
						return false;
					}
				});

				$("#gend").on("change", function() {
					if (!reggendck()) {
						return false;
					}
				});

				$("#email").keyup(function() {
					if (!regemailck()) {
						return false;
					}
				});

				$("#tel").keyup(function() {
					if (!regtelck()) {
						return false;
					}
				});

				$("#zip").keyup(function() {
					if (!regzipck()) {
						return false;
					}
				});

				$("#addr1").keyup(function() {
					if (!regaddr1ck()) {
						return false;
					}
				});
				$("#addr2").keyup(function() {
					if (!regaddr2ck()) {
						return false;
					}
				});

				//아이디 중복 검사
				$("#idbtn").on(
						"click",
						function() {
							idvalue = $("#id").val().trim();

							if (idvalue.length < 1) {
								alert("아이디입력");
								return false;
							}

							//--------------

							//외부 스크립트에서 공백,길이,정규식 체크하여 
							//올바른 데이터로 검증될때 ajax를 수행 

							if (!idcheck()) {
								return false;
							}
							//---------

							$.ajax({
								url : "/hotel/idCheck.do",
								type : "post",
								data : {
									"id" : idvalue
								},
								success : function(res) {
									$("#idspan").html(res.sw + " : " + idvalue)
											.css("color", "red");
								},
								error : function(xhr) {
									alert("상태 : " + xhr.status);
								},
								dataType : "json"
							})

						})

				/* // 우편번호 검색 -window
				$("#zipw").on(
						"click",
						function() {
							//jsp는 응답페이지 아니고 요청페이지 이다.
							window.open("zipSearch.jsp", "_blank",
									"width=600 height=500");
						})

				// 우편번호 검색 -modal
				$("#dongbtn")
						.on(
								"click",
								function() {
									dongvalue = $("#dong").val().trim();

									if (dongvalue.length < 1) {
										alert("동입력");
										return false;
									}

									$
											.ajax({
												url : "/member/dongCheck",
												type : "post",
												data : {
													"dong" : dongvalue
												},
												success : function(res) {
													code = "<table>";
													code += "<tr><td>우편번호</td>";
													code += "<td>주소</td>";
													code += "<td>번지</td></tr>";

													$
															.each(
																	res,
																	function(i,
																			v) {
																		code += "<tr class='ziptr'><td>"
																				+ v.zipcode
																				+ "</td>";
																		code += "<td>"
																				+ v.addr
																				+ "</td>";
																		code += "<td>"
																				+ v.bunji
																				+ "</td></tr>";
																	})
													code += "</table>";
													$("#result").html(code);
												},
												error : function(xhr) {
													alert("상태 : " + xhr.status);
												},
												dataType : "json"
											})
								})

				//선택 -동적으로 나중에 추가된 이벤트는 뒤쪽에..?
				$("#result").on("click", ".ziptr", function() {
					alert("이전 화면의 우편번호와 주소에 선택한 값이 자동으로 입력됩니다.");
					//아래 this 는 ziptr >> 보낼떄는 text()로 보내고 사용할떄는 val()로 사용한다
					//ziptr 이내에에 0번째 td를 가져오려면 this를 앞에 붙이지 못하므로.. 뒤쪽에 ,사용후 this를 알린다. 
					//즉 this 범위내에서 "td:eq(0)"를 찾는다. ppt 확인 
					zip1 = $("td:eq(0)", this).text();
					addr = $("td:eq(1)", this).text();

					//도튜먼트의 해당 아이디에  오프너 호출 후 해당 아이디에 값을 지정
					//현재 창의 아이디에 값을 지정
					$("#zip").val(zip1);
					$("#addr1").val(addr);

					$("#myModal").modal("hide");

				}) */

				$("#joinbtn").on(
						"click",
						function() {
							//입력한 모든 값을 가져온다
							// $("#id").val(); $("#name").val()..................
							//하나씩 적어야하므로 한번에 하도록 시리얼라이즈? 를 한다. 세가지 방법중 하나.
							// 제이슨 사용 시 jquery.serializejson.min.js 필요 및 현 페이지에 호출(상단)한다.
							//console.log($("#joinform").serializeJSON());
							//console.log($("#joinform").serializeArray()); 
							//console.log("String"+ $("#joinform").serialize());
							//---------------------------------------------

							//각 항목의 정규식과 길이 체크
							//체크한 결과가 모두 올바르다면 ajax를 실행한다.
							//만약 하나라도 올바르지 않은 데이터가 있다면 리턴한다
							//if(regcheck() ==false)
							if (!regcheck()) {
								return false;
							}
							
							idvalue = $("#id").val().trim();
							
							
							infox.mem_id = $("#id").val().trim();
							infox.mem_name  = $("#name").val().trim();
							infox.mem_pass  = $("#pwd").val().trim();
							infox.mem_email  = $("#email").val().trim();
							infox.mem_bir  = $("#bir").val().trim();
							infox.mem_hp  = $("#tel").val().trim();
							infox.mem_zip  = $("#zip").val().trim();
							infox.mem_add1  = $("#addr1").val().trim();
							infox.mem_add2  = $("#addr2").val().trim();
							
							console.log(infox);
							
							$.ajax({
								url : "/hotel/memberJoin.do",
								data : infox,
								type : "post",
								success : function(res) {
									//alert("가입버튼 후 INSERT 성공");
									
									$("#joinspan").html(idvalue + " 님 "+ res.sw).css("color", "red");
								},
								error : function(xhr) {
									alert("상태 : " + xhr.status);
								},
								dataType : "json"
							})
						})

			})
</script>

</head>
<body>
	<!-- 	<div class="box">
		<h3>회원가입</h3>
		아이디 중복검사 <br>우편번호 검색 - window.open / modal <br>회원가입 <br>
		<br>
	</div> -->

	<div id="result1">
		<div class="container">
			<h2>회원 가입</h2>
			<form id="joinform" class="form-horizontal">
				<div class="form-group">
					<label class="control-label col-sm-2" for="id">아이디 :</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="id"
							placeholder="Enter 아이디" name="mem_id">
					</div>
					<input id="idbtn" class="btn btn-warning" type="button"
						value="중복검사"> <span id="idspan"></span>
				</div>


				<div class="form-group">
					<label class="control-label col-sm-2" for="pwd">비밀번호 :</label>
					<div class="col-sm-4">
						<input type="password" class="form-control" id="pwd"
							placeholder="Enter 패스워드" name="mem_pass">
					</div>
					<span id="pwdspan"></span>
				</div>

				<div class="form-group">
					<label class="control-label col-sm-2" for="pwd">비밀번호확인 :</label>
					<div class="col-sm-4">
						<input type="password" class="form-control" id="pwd2"
							placeholder="Enter 패스워드확인" name="mem_pass2">
					</div>
					<span id="pwdspan2"></span>
				</div>


				<div class="form-group">
					<label class="control-label col-sm-2" for="name">이름 :</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="name"
							placeholder="Enter 이름" name="mem_name">
					</div>
					<span id="namespan"></span>
				</div>


				<div class="form-group">
					<label class="control-label col-sm-2" for="bir">생년월일 :</label>
					<div class="col-sm-4">
					<input type="date" class="form-control" id="bir"
							placeholder="2020-01-01" name="mem_bir" value="">
					</div>
					<span id="birspan"></span>
				</div>


				<div class="form-group">
					<label class="control-label col-sm-2" for="gend">성별:</label>
					<div class="col-sm-4">
						<select class="form-control" id="gend" name="gend">
							<option value="male">남자</option>
							<option value="female">여자</option>
						</select>
					</div>
					<span id="gendspan"></span>
				</div>


				<div class="form-group">
					<label class="control-label col-sm-2" for="email">이메일 :</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="email"
							placeholder="Enter 이메일" name="mem_email">
					</div>
					<span id="emailspan"></span>
				</div>




				<div class="form-group">
					<label class="control-label col-sm-2" for="tel">전화번호 :</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="tel"
							placeholder="Enter 전화번호" name="mem_hp">
					</div>
					<span id="telspan"></span>
				</div>




				<div class="form-group">
					<label class="control-label col-sm-2" for="zip">우편번호 :</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="zip"
							placeholder="Enter 우편번호" name="mem_zip">
					</div>

					<input class="btn btn-warning" type="button"
						onClick="openDaumZipAddress();" value="주소 찾기" /> <br>
					<!-- <input	id="zipw" type="button" value="번호검색window" class="btn btn-warning"> -->
					<!-- <input id="zipm" type="button"
						value="번호검색modal" class="btn btn-warning" data-toggle="modal"
						data-target="#myModal"> -->
					<span id="zipspan"></span>
				</div>
				<!-- #myModal 이 모달을 호출/확인 아이디 -->

				<div class="form-group">
					<label class="control-label col-sm-2" for="addr1">주소 :</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="addr1"
							placeholder="Enter 주소" name="mem_add1">
					</div>
					<span id="addr1span"></span>
				</div>


				<div class="form-group">
					<label class="control-label col-sm-2" for="addr2">상세주소 :</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="addr2"
							placeholder="Enter 상세주소" name="mem_add2">
					</div>
					<span id="addr2span"></span>
				</div>


				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<div class="checkbox">
							<label><input type="checkbox" name="remember">
								Remember me</label>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<!-- 클래스내 설정 
					btn btn-primary 버튼의 디자인 
					btn-lg  버튼의 크기 -->
						<button id="joinbtn" type="button" class="btn btn-primary btn-lg">전송버튼</button>
						<button id="resetbtn" type="reset" class="btn btn-danger btn-lg">초기화
						</button>
						<span id="joinspan"></span>
					</div>
				</div>
			</form>
		</div>
	</div>


	<!-- Modal -->
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Modal Header</h4>
				</div>

				<!-- 모달 바디부분을 수정한다. == 우편번호와 주소를 자동입력되게 한다. -->
				<div class="modal-body">
					<form>
						<h2>우편번호 검색</h2>
						찾고자 하는 동을 입력하세요 <br> <input type="text" id="dong"> <input
							type="button" value="검색" id="dongbtn"><br> <br>
						<div id="result"></div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>

</body>
</html>