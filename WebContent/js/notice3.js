/**
 * 
 */

currentPage=1;

var noticeUpdateServer = function() {
	
	$.ajax ({
		url : '/hotel/NoticeUpdate.do',
		type : 'post',
		data : notice,	//noti_no, noti_title, noti_cont 
		success : function(res) {
			alert(res.sw);
			//화면 수정 - 수정모달창에 있는 값들을 다시 가져와서(board객체) 화면에 출력.
//			$(pbody).find('.nspan').text(notice.writer);
//			$(pbody).find('.mspan').text(board.mail);
			
			content = notice.noti_cont;
			content = content.replace(/\n/g, "<br>");
			
			$(pbody).find('.cspan').html(content);
			$(pbody).find('a').text(notice.noti_title);
			
			today = new Date();
			today = today.toLocaleString();
			$(pbody).find('.wspan').text(today);
			
			
			
		},
		error : function(xhr) {
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
}

var noticeDeleteServer = function(but) { 	//but : 삭제버튼
	
	$.get(
			'/hotel/NoticeDelete.do',
			{"noti_no" : vidx},
			function(res) {
				alert(res.sw);
				//화면에서 지우기
				$(but).parents('.panel').remove();
			},
			'json'
	)
	
}
var noticeSaveServer = function() {
	
	$.ajax({
		url : '/hotel/NoticeSave.do',
		data : $('#wform').serializeJSON(),
		type : 'post',
		dataType : 'json',
		success : function(res) {
//			alert(res.sw)
			listPageServer(1);
		},
		error : function(whr) {
			alert("상태 : " + xhr.status)
		}
	})
}


//페이지별 리스트 - html에서 listPageServer(1) 호출
//cpage변수는 페이지 번호이고 controller로 전송한다

var listPageServer = function(cpage){
	$.ajax ({
		url : '/hotel/NoticeList.do',
		type : 'post',
		data : {"page" : cpage},
		dataType : 'json',
		success : function(res){
			code = '<div class="panel-group" id="accordion">';
			$.each(res.datas, function(i, v) {
			   code +='<div class="panel panel-default">';
			   code +='   <div class="panel-heading">';
			   code +='     <h4 class="panel-title">';
			   code +='       <a name="list" class="action" idx="' + v.noti_no + '" data-toggle="collapse" data-parent="#accordion" href="#collapse' + v.noti_no + '">'+ v.noti_title +'</a>';
			   code +='     </h4>';
			   code +='   </div>';
			   code +='   <div id="collapse' + v.noti_no + '" class="panel-collapse collapse">';
			   code +='     <div class="panel-body pbody">';
			   code +='     	<p class="p1">';
			   code +='     		작성자 : <span class="nspan">' + '관리자' + '</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
//			   code +='     		메일	 : <span class="mspan">' + v.mail + '</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
//			   code +='     		조회수 : <span class="hspan">' + v.hit + '</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
			   code +='     		작성날짜 : <span class="wspan">' + v.noti_date + '</span> &nbsp;&nbsp;&nbsp;';
			   code +='     	</p>';
//			   code +='     	<p class="p2">';
//			   code +='     		<button type="button" idx="' + v.noti_no + '" name="modify" class="action">수정</button>';
//			   code +='     		<button type="button" idx="' + v.noti_no + '" name="delete" class="action">삭제</button>';
//			   code +='     	</p>';
			   code +='     	<hr>';
			   code +='     	<p><span class="cspan">' + v.noti_cont + '</span></p>';
//			   code +=			'<p>';
//			   code +='    			<textarea class="area" cols="60"></textarea>';
//			   code +='    			<button type="button" idx="' + v.noti_no + '" class="action repb" name="reply">댓글등록</button>';
//			   code +='     	</p>';
			   code +='     </div>';
			   code +='   </div>';
			   code +=' </div>';
			})

			code +='</div>';
			$('.box').html(code);
			
			//pagelist에 append를 이용해서 출력
			$('#pagelist').empty();
			//이전버튼 출력
			if(res.sp > 1){
				pager = '<ul class="pager">';
				pager += '<li><a class="prev" href="#">Previous</a></li>';
				pager +='</ul>';
				$('#pagelist').append(pager);
			}
			
			//페이지번호 출력
			pager = '<ul class="pagination pager">';
			for(i=res.sp; i<=res.ep; i++){
				if(currentPage == i){
					pager += '<li class="active"><a class="paging" href="#">' + i + '</a></li>';
				}else{
					pager += '<li><a class="paging" href="#">' + i + '</a></li>';
				}
			}
			pager += '</ul>';
			$('#pagelist').append(pager);
			  
			//다음 버튼 출력
			if(res.ep < res.tp){
				pager = '<ul class="pager">';
				pager += '<li><a class="next" href="#">Next</a></li>';
				pager +='</ul>';
				$('#pagelist').append(pager);
			}
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
	})
}
//var listAll = function() {
//	
//	//게시글 가져오기
//	$.ajax({
//		url : '/hotel_notice/NoticeList.do',
//		type : 'get',
////		type : 'post',
////		data : {"page" : 1},
//		dataType : 'json',
//		success : function(res) {
//			
//			code = '<div class="panel-group" id="accordion">';
//			$.each(res, function(i, v) {
//			   code +='<div class="panel panel-default">';
//			   code +='   <div class="panel-heading">';
//			   code +='     <h4 class="panel-title">';
//			   code +='       <a data-toggle="collapse" data-parent="#accordion" href="#collapse' + v.noti_no + '">'+ v.noti_title +'</a>';
//			   code +='     </h4>';
//			   code +='   </div>';
//			   code +='   <div id="collapse' + v.noti_no + '" class="panel-collapse collapse">';
//			   code +='     <div class="panel-body">';
//			   code +='     	<p class="p1">';
//			   code +='     		작성자 : ' + v.admin_id + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
////			   code +='     		메일	 : ' + v.mail + 'kkk@korea.com &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
////			   code +='     		조회수 : ' + v.hit + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
//			   code +='     		작성날짜 : ' + v.noti_date + '&nbsp;&nbsp;&nbsp;';
//			   code +='     	</p>';
//			   code +='     	<p class="p2">';
//			   code +='     		<button type="button" idx="' + v.noti_no + '" name="modify" class="action">수정</button>';
//			   code +='     		<button type="button" idx="' + v.noti_no + '" name="delete" class="action">삭제</button>';
//			   code +='     	</p>';
//			   code +='     	<hr>';
//			   code +='     	<p>';
//			   code +=     	v.noti_cont;
//			   code +='     	</p>';
////			   code +='     	<p>';
////			   code +='    			<textarea class="area" cols="60"></textarea>';
////			   code +='    			<button type="button" idx="' + v.seq + '" class="action repb" name="reply">댓글등록</button>';
////			   code +='     	</p>';
//			   code +='     </div>';
//			   code +='   </div>';
//			   code +=' </div>';
//			})
//
//			code +='</div>';
//			$('.box').html(code);
//		},
//		error : function(xhr) {
//			alert("상태 : " + xhr.status)
//		}
//	})
//	
//}