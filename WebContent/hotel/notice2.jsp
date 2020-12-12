<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
<!--   <script src="http://192.168.42.49/board/js/board.js"></script> -->
  <script src="../js/notice.js"></script>
  <script src="../js/jquery.serializejson.min.js"></script>
<style>
  h1, #write, .panel{
	margin : 10px;
  }
  .panel-heading:hover{
    background : #28a0ff;
  }
  .pager {
	float : left;
	width : 120px;
	margin : 5px;
	margin-left : 5%;
  }
  .p1{
 	float:left; width: 80%;
  }
  .p2{
 	float:right; width: 20%;
  }
  hr{
 	clear : both;
  }
  .repb{
 	height : 45px;
 	vertical-align: top;
  }
  .rep{
  	margin : 2px;
  	padding : 3px;
  	background : pink;
  }
   label{
   	display : inline-block;
   	width : 100px;
   	height : 30px;
  }
</style>
<script>
 notice= {};	//객체선언
 $(function() {
	listPageServer(1);
	
	//페이지 번호를 클릭 이벤트 처리
	$('#pagelist').on('click', '.paging', function() {

// 		 }
	currentPage = $(this).text().trim();
	console.log(currentPage);
	listPageServer(currentPage);
	 })
	 
 	//next버튼 클릭 이벤트
	$('#pagelist').on('click', '.next', function() {
		

// 	$('.paging:last')
	currentPage = parseInt($('.paging').last().text() ) + 1;
	listPageServer(currentPage);
	})
	
	//이전 버튼 클릭 이벤트
	$('#pagelist').on('click','.prev', function() {

// 		}
// 		//$('.paging:first')
		currentPage = parseInt($('.paging').first().text() ) - 1;
		listPageServer(currentPage);
	})
	
// 	//글쓰기버튼 이벤트
// 	$('#write').on('click', function() {
// 		//글쓰기 창 - modal창
// 		$(#wModal).modal('show');
		
// 	})
	//본문의 버튼에서 data-toggle, data-target속성으로 modal을 연다
	//<input data-toggle="modal" data-target="#wModal" type="button" value="글쓰기" id="write">
	
	//글쓰기 폼에서 확인버튼 클릭
	$ ('#wsend').on('click', function(){
		//입력한 모든 값을 가져온다 -$('#name').val() subject = $('#subject').val()
		//name = $('#name').val();
		//subject = $('#subject').val();
		//data = {"writer" : name, "subject" : subject}
		
		// 	console.log($('#wform').serializeJSON());
		noticeSaveServer();
		// 모달창 닫기
		$('#wModal').modal('hide');
		$('#wform .txt').val("");
	})
	
	//각 버튼의 이벤트 - 수정, 삭제
	$('.box').on('click','.action', function() {
		
		vidx = $(this).attr('idx');
		vname = $(this).attr('name');
		
		if(vname == 'modify'){
// 			alert(vidx + '번글 수정')
			$('#uModal').modal('show');
			
			//수정할 내용을 가져와서 modal창에 출력
			pbody = $(this).parents('.panel');
// 			name = $(pbody).find('.nspan').text(); //이름
// 			mail = $(pbody).find('.mspan').text(); //메일
			
			cont = $(pbody).find('.cspan').html(); //내용
// 			cont = $(pbody).find('.cspan').html().trim(); //내용
// 			console.log(cont);
			cont = cont.replace(/<br>/g,"\n");
			
			title = $(pbody).find('a').text();	//제목
			
			//uform에 출력
// 			$('#uform #name').val(name);
			$('#uform #noti_title').val(title);
// 			$('#uform #mail').val(mail);
			$('#uform #cont').val(cont);
			
			
		}else if (vname == 'delete'){
// 			alert(vidx + '번글 삭제')
			noticeDeleteServer(this);
		}
	})
		//글 수정창에서 글 수정 후 확인버튼 클릭
		$('#usend').on('click', function() {
			
			//모달창에 수정된 내용을 가져온다
// 			board.writer = $('#uform #name').val();
			notice.noti_title = $('#uform #noti_title').val();
// 			board.mail = $('#uform #mail').val();
			notice.noti_cont = $('#uform #cont').val();
//	 		board.content = $('#uform #cont').val().trim();
// 			board.password = $('#uform #pass').val();
			notice.noti_no = vidx;
			
			//console.log(board.seq);
			noticeUpdateServer();
			$('#uModal').modal('hide');
			$('#uform.txt').val("");
			
		
	 })
})
</script>
</head>
<body>
	<h1>공지게시판</h1>
	<br>
	<input data-toggle="modal" data-target="#wModal" type="button" value="글쓰기" id="write">
	<br><br><br>
<div class = "box">
</div>
<br>
<br>
<div id="pagelist"></div>

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
          <form id="wform">​		​
<!-- 			<label>이름:</label> <input type='text' class='txt' id='name' name="writer"><br>​ -->
			<label>제목:</label> <input type='text' class='txt' id='subject' name="noti_title" ><br>​
<!-- 			<label>메일:</label> <input type='text' class='txt' id='mail' name="mail" ><br>​ -->
			
<!-- 			<label>비밀번호:</label> <input type='password' class='txt' id='pass' name="password"><br>​ -->
			<label>내용:</label> <br>
			<textarea rows="10" cols="50" name="noti_cont" class='txt'></textarea><br>
			<input type='button' value='확인' id="wsend"><br>​
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
          <form id="uform">​		​
<!-- 			<label>이름:</label> <input type='text' class='txt' id='name' name="writer"><br>​ -->
			<label>제목:</label> <input type='text' class='txt' id='noti_title' name="noti_title"><br>​
<!-- 			<label>메일:</label> <input type='text' class='txt' id='mail' name="mail"><br>​ -->
			
<!-- 			<label>비밀번호:</label> <input type='password' class='txt' id='pass' name="password"><br>​ -->
			<label>내용:</label> <br>
			<textarea rows="10" cols="50" name="noti_cont" id="cont" class='txt'></textarea><br>
			<input type='button' value='확인' id="usend"><br>​
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