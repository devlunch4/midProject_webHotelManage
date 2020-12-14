var resvStatusUpdateServer = function() {
	//alert("JS 진입 /// 해당 번호글" + vidx + ", 결재/취소환불 이름값확인 " + vname);
	$.ajax({
		url : "/hotel/resvStatusUpdate.do",
		type : "post",
		data : {
			"resev_no" : vidx,
			"resev_state" : vname
		},
		success : function() {
			alert("resvStatusUpdateServer() >> 결제상태 수정 성공");
			$('#div_result *').remove();
			location.reload();
		},
		error : function(xhr) {
			alert("resvStatusUpdateServer 실패 : " + xhr.status);
		},
		dataType : "json"
	})	
	document.location.reload(true);
}

var resvViewAll = function() {
	
	$("#div_result *").remove();
	
	$.ajax({
				url : "/hotel/resvLogAllList.do",
				type : "post",
				dataType : "json",
				success : function(res) {
					//alert("예약로그 테이블 중 예약 상태 목록 로딩 성공");
					code = "<div class='resvAllListTable' id='resvAllListTable>'";
					code += "<h1>예약 테이블</h1>";
					code += "<table border='1'>";
					code += "<tr><th>RESEV_NO</th><th>ROOM_IN</th><th>ROOM_OUT</th>";
					code += "<th>MEM_ID</th><th>ROOM_NO</th><th>ROOM_PL</th><th>ROOM_TYPE</th>";
					code += "<th>ROOM_NUM</th><th>RESEV_STATE</th><th>RESEV_DATE</th><th></th></tr>";
					code += "<tr><th>예약번호</th><th>체크인날짜</th><th>체크아웃날짜</th>";
					code += "<th>회원번호</th><th>방번호</th><th>지점</th><th>방타입</th>";
					code += "<th>투숙인원</th><th>현황(예약/결제/환불)</th><th>최종결제/환불날짜<th></tr>";
					
					$.each(res, function(i, v) {
						code += "<tr>";
						code += "<td>" + v.resev_no + "</td>";
						code += "<td>" + v.room_in + "</td>";
						code += "<td>" + v.room_out + "</td>";
						code += "<td>" + v.mem_id + "</td>";
						code += "<td>" + v.room_no + "</td>";
						code += "<td>" + v.room_pl + "</td>";
						code += "<td>" + v.room_type + "</td>";
						code += "<td>" + v.room_num + "</td>";
						code += "<td>" + v.resev_state + "</td>";
						code += "<td>" + v.resev_date + "</td>";
						code += "<td><button type='button' class='action' idx='"
										+ v.resev_no
												+ "' name='결제'>결제</button>";
						code += "<button type='button' class='action' idx='"
												+ v.resev_no
												+ "' name='취소환불'>취소환불</button></td>";
						code += "</tr>";
						})
					code += "</table>";
					code += "</div>";
					$("#div_result").append(code);
				},
				error : function(xhr) {
					alert("실패 상태 : " + xhr.status);
				}
			})
}
