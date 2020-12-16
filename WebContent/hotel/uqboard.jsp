<%@page import="vo.MemberInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 공통 스타일 시작 -->
<style type="text/css">
#footer {
	position : absolute;
	bottom : auto;
	width: 100%;
	height: 120px;
	background: #2c2b29;
	clear: both;
	text-align: left;
	padding: 20px
}
#logo {
	position : absolute;
	bottom : 10px;
	float: right;
	height: 100px;
	width: auto;
	right : 10px;
}
</style>
<!-- 공통 스타일 끝 -->


<!-- 공통부분 타이틀부분  시작 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="../js/jquery.serializejson.min.js"></script>
<script src="../js/xlogon.js"></script>


<!-- 공통부분 타이틀부분 이어서 스크립트 시작 -->
<script>
	$(function() {
	<%MemberInfoVO vo = (MemberInfoVO) session.getAttribute("result");

			String userId;
			String userName;
			String userEmail;
			String power;

			if (vo != null) {%>
			createLoginAfterPart();
			<%userId = vo.getMem_id();
				userName = vo.getMem_name();
				userEmail = vo.getMem_email();
				power = vo.getPower();
			} else {%>
			createLoginPart();
			<%userId = null;
				userName = null;
				userEmail = null;
				power = null;
			}%>

 		userId = "<%=userId%>";
		userName = "<%=userName%>";
		userEmail = "<%=userEmail%>";
		power = "<%= power %>";

		//console.log("userId : " + userId);
		//console.log("userName : " + userName);
		//console.log("userEmail : " + userEmail);
		//console.log("power : " + power);

		// 로그인하면 로그인부분에 유저 닉네임하고 이메일 출력해서 보여주는부분
		userNameStr = " / " + userName + " 님";
		userEmailStr = "이메일 : " + userEmail;
		$('#userId').append(userId);
		$('#userName').append(userNameStr);
		$('#userEmail').append(userEmailStr);

		// 로그인 버튼 누르면 로그인 실행하는 부분
		$('#loginBtn').on('click', function() {
			// 로그인 실행부분
			login();
		});

		// 로그아웃 버튼 누르면 로그아웃하는 부분
		$('#loginOutBtn').on('click', function() {
			// 로그아웃 실행 부분
			logout();
		})

		// 내정보 가져오는걸 처리
		$('#updateMemberInfoBtn').on('click', function() {
			<%-- <%
				if(pageCount > 0) {
			%> --%>
			$('#div_result *').remove();
			//console.log(pageCount);
			getMemberInfoVal();
			<%-- <%}%> --%>
		})
		
		//내정보수정 버튼 클릭하면 이 작업 수행
		//$('#myinfoUpdateBtn').on('click', function(){
		$(document).on('click', '#myinfoUpdateBtn', function(){
			MemberInfoVal();
			
		})
		
		// 내정보 수정 완료하면 업데이트 부분
		//$('#myinfoUpdateSubmit').on('click', function() {
		$(document).on('click', '#myinfoUpdateSubmit', function() {
			MemberInfoValUpdateSubmit();
			updateSessionDate();
		})
					
		// 유저가 예약한 정보 확인
		$('#getMyResvlogBtn').on('click', function() {
			getMyResvlogList();
		})
	})
</script>
<!-- 공통 타이틀부분 끝 -->
<!-- 공통 스크립트 부분 끝 -->

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!--   <script src="http://192.168.42.49/board/js/board.js"></script> -->
<script src="../js/qboard3.js"></script>
<script src="../js/jquery.serializejson.min.js"></script>
<link rel="stylesheet" href="../css/allBoard.css">
<style>
</style>

<script>
 qboard= {}; //객체선언
 qreply= {};
 $(function() {
	listPageServer(1);
	
	//페이지 번호를 클릭 이벤트 처리
	$('#pagelist').on('click', '.paging', function() {
		
		if($('#modifyForm').css('display') != 'none'){
			//다른 곳에 이미 열려 있다
			replyReset();
		}
		currentPage = $(this).text().trim();
		console.log(currentPage);
		listPageServer(currentPage);
	 })
	 
 	//next버튼 클릭 이벤트
	$('#pagelist').on('click', '.next', function() {
		if($('#modifyForm').css('display') != 'none'){
			//다른 곳에 이미 열려 있다
			replyReset();
		}

// 	$('.paging:last')
		currentPage = parseInt($('.paging').last().text() ) + 1;
		listPageServer(currentPage);
	})
	
	//이전 버튼 클릭 이벤트
	$('#pagelist').on('click','.prev', function() {
		//$('.paging:last')
		if($('#modifyForm').css('display') != 'none'){
			// 다른 곳에 이미 열려 있다
			replyReset();
		}

		//$('.paging:first')
		currentPage = parseInt($('.paging').first().text() ) - 1;
		listPageServer(currentPage);
	})
	

	
	//각 버튼의 이벤트 - 수정, 삭제, 댓글 등록, 댓글 수정, 댓글 삭제
	$('.box').on('click','.action', function() {
		vidx = $(this).attr('idx');
		vname = $(this).attr('name');
		
		if(vname == 'modify'){
			if(userId!="null"){
		
			writter = $(this).parents('.pbody').find('.nspan').html();
			
			alert("작성자 추출 : " +writter);
			if(userId==writter){
				
			
// 			alert(vidx + '번글 수정')
			$('#uModal').modal('show');
			
			//수정할 내용을 가져와서 modal창에 출력
			pbody = $(this).parents('.panel');
			
			cont = $(pbody).find('.cspan').html(); //내용
// 			console.log(cont);
			cont = cont.replace(/<br>/g,"\n");
			
			title = $(pbody).find('a').text();	//제목
			
			//uform에 출력
			$('#uform #q_title').val(title);
			$('#uform #cont').val(cont);	
			}else{alert("해당 문의글 작성자가 아닙니다.")}	
			}else{alert("로그인이 필요합니다.");};
		}else if (vname == 'delete'){
			if(userId!="null"){
		
			writter = $(this).parents('.pbody').find('.nspan').html();
			alert("작성자 추출 : " +writter);
			if(userId==writter){
				qboardDeleteServer(this);
			}else{alert("해당 문의글  작성자가 아닙니다.")}
		
// 			alert(vidx + '번글 삭제')
			}else{alert("로그인이 필요합니다.");};
		}else if(vname == 'reply'){
			alert(vidx + '번글의 댓글 등록')
			//qreply테이블에 저장 - qre_no,  q_no, qre_cont, qre_date, admin_id
			qreply.q_no = vidx;
 			
// 			//작성자 아이디 임의 생성 ==> admin_id로 불러와야함/ 잘 모르겠음
		
 			qreply.admin_id = 1;
 			
 			qreply.qre_cont = $(this).parent().find('.area').val();
			
			$(this).parent().find('.area').val("");
			//ajax를 통해서 revreply객체를 서버로 보내기
			qreplySaveServer(this);
			
		}else if (vname == 'list'){ //제목 클릭하면 해당 댓글 가져오기
			
			qreplyListServer(this);	//this -> list:  a태그
			
		}else if (vname == "r_modify"){
			//alert(vidx + "번 댓글을 수정합니다")
			
			//수정폼이 이미 열려 있는지 비교
			//다른곳에 열려 있다면 열려 있는 수정폼을 닫는다 - 폼을 body태그로 다시 append한다
			if($('#modifyForm').css('display') != 'none'){
				//다른 곳에 이미 열려 있다
				replyReset();
			}
			
			//원래 내용 가져오기
			modifycont = $(this).parents('.rep').find('.cont').html();
			//<br>를 \n으로 변경
			modifycont = modifycont.replace(/<br>/g, "\n");
			//수정내용을 수정폼의 text에 출력
			$('#text').val(modifycont);
			
			//body에 있는 댓글 수정폼을 댓글 수정위치로 추가한다.
			$(this).parents('.rep').find('.cont').empty().append($('#modifyForm'))
			$('#modifyForm').show();
		}else if(vname == "r_delete") {
			qreplyDeleteServer(this);
		}
		
		
	})
	
	function replyReset() {
		//원래 댓글 내용이 있었던 span검색
		spantag = $('#modifyForm').parent();
		
		//body로 다시수정 폼을 보낸다
		$('body').append($('#modifyForm'));
		$('#modifyForm').hide();
		//spantag 내용으로 span에 원래 내용을 다시 출력
		$(spantag).html(modifycont.replace(/\n/g, "<br>"));
		
	}
	
	//댓글 수정폼에서 확인 버튼 클릭
	$('#btnok').on('click', function() {
		//alert(vidx);
		
		//수정내용 가져오기
		modicont = $('#text').val();
		
		//수정폼은 사라지고 수정 내용으로 다시 출력
		spantag = $('#modifyForm').parent();
		$('body').append($('#modifyFrom'));
		$('#modifyForm').hide();
		
		$(spantag).html(modicont.replace(/\n/g, "<br>"))
		
		//alert(modicont);
		qreplyModifyServer();		//vidx, modicont
	})
	//댓글 수정폼에서 취소 버튼 클릭
	$('#btnreset').on('click', function() {
		if($('#modifyForm').css('display') != 'none'){
			//다른 곳에 이미 열려 있다
			replyReset();
		}
		
	})
	
	
// 	//글쓰기버튼 이벤트
 	$('#write').on('click', function() {
 		//글쓰기 창 - modal창
		if(userId!="null"){
 			$('#wModal').modal('show');
			}else{alert("로그인이 필요합니다.");};

 	})
	//본문의 버튼에서 data-toggle, data-target속성으로 modal을 연다
	//<input data-toggle="modal" data-target="#wModal" type="button" value="글쓰기" id="write">
	
	//글쓰기 폼에서 확인버튼 클릭
	$ ('#wsend').on('click', function(){
		//입력한 모든 값을 가져온다 -$('#name').val() subject = $('#subject').val()
		//name = $('#name').val();
		//subject = $('#subject').val();
		//data = {"writer" : name, "subject" : subject}
		
		// 	console.log($('#wform').serializeJSON());
		//alert(userId);
		qboardSaveServer();
		// 모달창 닫기
		$('#wModal').modal('hide');
		$('#wform .txt').val("");
	})
		//글 수정창에서 글 수정 후 확인버튼 클릭
		$('#usend').on('click', function() {
			
			//모달창에 수정된 내용을 가져온다
			qboard.q_title = $('#uform #q_title').val();
			qboard.q_cont = $('#uform #cont').val();
			qboard.q_no = vidx;
			
			//console.log(board.seq);
			qboardUpdateServer();
			$('#uModal').modal('hide');
			$('#uform.txt').val("");
		
	 })
})
</script>
</head>
<body>
	<!-- 바디 공통 부분 시작 -->
	<div id="login" style="float: right;"></div>
	<br>
	<div class="container">
		<ul class="nav nav-tabs">
			<li class="active"><a href="main.jsp">Home</a></li>
			<li><a data-toggle="tab" href="#menu1">마이페이지</a></li>
			<li><a data-toggle="tab" href="#menu2">게시판</a></li>
			<li><a data-toggle="tab" href="#menu3">안내</a></li>
		</ul>

		<div class="tab-content">
			<div id="home" class="tab-pane fade in active"></div>
			<div id="menu1" class="tab-pane fade">
				<h3>마이페이지</h3>
				<a href="myinfomodify2.jsp" style="text-decoration: none">내 정보
					확인/수정</a><br> <a href="myresv2.jsp" style="text-decoration: none">예약
					확인</a>

				<!--	<p>테스트로 집어넣음</p>
				<ul class="nav nav-tabs">
					<li class="active"><a data-toggle="tab" href="">Home</a></li>
					<li><a data-toggle="tab" href="">메뉴 1</a></li>
					<li><a data-toggle="tab" href="">메뉴 2</a></li>
					<li><a data-toggle="tab" href="">메뉴 3</a></li>
				</ul>-->
				<hr>
			</div>

			<div id="menu2" class="tab-pane fade">
				<h3>게시판</h3>
				<a href="unotice.jsp" style="text-decoration: none">공지게시판</a><br>
				<a href="ureview.jsp" style="text-decoration: none">후기게시판</a><br>
				<a href="uqboard.jsp" style="text-decoration: none">문의게시판</a>
				<hr>
			</div>

			<div id="menu3" class="tab-pane fade">
				<h3>호텔 안내</h3>
				<a href="uroombxslide.jsp" style="text-decoration: none">객실 안내</a><br>
				<a href="<%=request.getContextPath()%>/amenity.me"
					style="text-decoration: none">시설 안내</a><br> <a
					href="uvotemember.jsp" style="text-decoration: none">직원 안내</a><br>
				<a href="ulocation.jsp" style="text-decoration: none">오시는 길</a><br>
				<hr>
			</div>
			
			<div id="menu4" class="tab-pane fade">
				<h3>이벤트</h3>
				<a href="uevent.jsp" style="text-decoration: none">이벤트 안내</a><br>
			</div>

		</div>
	</div>

	<section id="section_result">
		<article id="article_result">
			<div id="div_result"></div>
		</article>
	</section>
	<!-- 바디 공통 공통부분 끝  -->



	<!-- 댓글 수정을 위한 폼 -->
	<div id="modifyForm" style="display: none;">
		<textarea id="text" rows="5" cols="50"></textarea>
		<input type="button" value="확인" id="btnok"> <input
			type="button" value="취소" id="btnreset">
	</div>
	<div id="boardintro">
		<h1 class=btxt1>문의게시판</h1>
		<h4 class=btxt2>이것은 문의게시판 입니다</h4>
	</div>
	<div class="box"></div>
	<br>
	<br>
	<div id="pagelist"></div>
	<br>
	<br>
	<!-- <input data-toggle="modal" data-target="#wModal" type="button"
		value="글쓰기" id="write"> -->
	<input type="button" value="글쓰기" id="write">

	<!-- Modal -->
	<div id="wModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Modal Header</h4>
				</div>
				<div class="modal-body">
					<form id="wform">
						​ ​ <label>제목:</label> <input type='text' class='txt' id='subject'
							name="q_title"><br>​ <label>내용:</label> <br>
						<textarea rows="10" cols="50" name="q_cont" class='txt'></textarea>
						<br> <input type='button' value='확인' id="wsend"><br>​
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>


	<!-- Modal -->
	<div id="uModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!--   Modal content -->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Modal Header</h4>
				</div>
				<div class="modal-body">
					<form id="uform">
						​ ​ <label>제목:</label> <input type='text' class='txt' id='q_title'
							name="q_title"><br>​ <label>내용:</label> <br>
						<textarea rows="10" cols="50" name="q_cont" id="cont" class='txt'></textarea>
						<br> <input type='button' value='확인' id="usend"><br>​
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

	
<footer id="footer">
		<p id ="footer title" style="color : #9c836a;">HOTEL DALGONA <img id="logo" src="../images/log.png"> </p>
		<p id="WebShop" style="color: rgba(255,255,255,0.8);">
						㈜호텔달고나 주소 대전광역시 중구 대흥동 500-5<br>
						대표이사 전영헌 사업자등록번호 123-45-67890<br>
						대표전화 1004-1004
		</p>
	</footer>
</body>
</html>