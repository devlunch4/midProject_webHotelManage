/**
 * 
 */

var insertResVLog = function() {
	
	 
	 // 예약 처리
	$('#reservationBtn').on('click', function() {
		
		// 방번호
		vroomNo = $('#roomNoList').val();
		console.log("방번호 : " + vroomNo);
		
		// 방 인원수 값
		vroomPeople = $('#roomPeople').text();
		console.log("방 인원수 : " + vroomPeople);
		
		// 시작날짜 가져오기
		dateStartVal = $('#dateStart').val().trim();
		console.log("시작 날짜 : " + dateStartVal);
	
		// 끝날짜 가져오기
		dateEndVal = $('#dateEnd').val().trim();
		console.log("끝 날짜 : " + dateEndVal);
		
		test = "2";
		
		// 예약 등록
		$.ajax({
			
			url : '/hotel/InsertResVLog.do',
			type : 'post',
			data : {
				"room_in" : dateStartVal
				,"room_out" : dateEndVal
				, "mem_id" : test
				, "room_no" : vroomNo
				,"room_pl" : vroomPl
				, "room_type" : vroomType
				, "room_num" : vroomPeople
				},
			success : function(res) {
				alert(res.sw);
				alert(test + "님 예약 하셨습니다.");					
			},
			error : function(xhr) {
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
			
			
		});
		
	})
	 
	
}

var getRoomNumList = function() {
	
	 
	// 방번호 처리
	$('#roomTypeList').on('click', function() {
		
		// 방타입값
		vroomType = $('#roomTypeList').val();
		console.log("방정류 : " + vroomType);
		
		// 방번호 가져오기
		$.ajax({
			
			url : '/hotel/RoomNum.do',
			type : 'post',
			data : {"room_pl" : vroomPl, "room_type" : vroomType},	
			success : function(res) {
				
				$('#roomNoList').empty();
				$('#roomPeople').empty();
				
				code = "";
				$.each(res, function(i, v) {
					code += '<option value="'+v.room_no+'">'+ v.room_no +'</option>';
				})
				
				$('#roomNoList').append(code);
				
				if(vroomType == "싱글"){
					code = '<p value="1">1</p>';
					$('#roomPeople').append(code);
				} else if(vroomType == "더블"){
					code = '<p value="2">2</p>';
					$('#roomPeople').append(code);
				} else if(vroomType == "스위트"){
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

var getRoomTypeList = function() {
	

	// 방 종류 선택
	$('#roomPlList').on('click', function() {
		
		vroomPl = $(this).val();
		console.log("지점 : " + vroomPl);
		
		// 방 타입 가져오기
		$.ajax({
	
			url : '/hotel/RoomList.do',
			type : 'post',
			data : {"room_pl" : vroomPl},	
			success : function(res) {
				
				$('#roomTypeList').empty();
				$('#roomPeople').empty();
				
				code = "";
				$.each(res, function(i, v) {
					code += '<option value="'+v.room_type+'">'+ v.room_type +'</option>';
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
					code += '<option value="'+v.room_pl+'">'+ v.room_pl +'</option>';
				})
				
				$('#roomPlList').append(code);
			},
			error : function(xhr) {
				
				alert("상태 : " + xhr.stauts)
			}
			
		})
	
}




