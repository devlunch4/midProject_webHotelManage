<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔 달고나 홈페이지</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="../js/jquery.serializejson.min.js"></script>


</head>
<script>

	/* 직원 투표하기 기능 */

	num1 = 0;
	num = 0;
	
	$(function() {
		
		
		// DB에 업데이트한 정보를 다시 가져오기
		
	 	$.ajax({
	 		
	 		//var arrnum = new Array("num1","num2");
	 		
	 		
			url : "/hotel/voteUpdate.do",
			type : "get",
			data : { "code" : name,
					 "count" : num1	
			},
			dataType : "json",
			success : function (res) {
				for(var i=0; i<res.length; i++){
					var classname = ".numRes" + res[i].code;
			 $(classname).html(res[i].count);	
					
				}
			}, 
			error : function (xhr) {
				
			}
			
		})

		
		
		// 첫번째 직원의 투표수 가져오기

		$('.numRes').append(num);

		$(this).on('click', '.btn1', function() {

			var name= "101";
			
			
			
			var num1 = $(this).parents('.member').find('.numRes101').text();
			num1 = parseInt(num1) + 1;
			$.ajax({
				url : "/hotel/voteUpdate.do",
				type : "post",
				data : { "code" : name,
						 "count" : num1
					
				},
				dataType : "json",
				success : function (res) {
					//alert(res.sw);
					//console.log("성공");
				//	$(".numRes").html(value);
				},
				error : function (xhr) {
					//alert("실패" + xhr.status);
				}
			})
			
			
			
			$(this).parents('.member').find('.numRes101').empty();
			$(this).parents('.member').find('.numRes101').text(num1);
		})
		
		// 두번째 직원의 투표수 가져오기
			$(this).on('click', '.btn2', function() {
			
			var name= "102";
				
			var num2 = $(this).parents('.member').find('.numRes102').text();
			num2 = parseInt(num2) + 1;
			
		 	$.ajax({
				url : "/hotel/voteUpdate.do",
				type : "get",
				data : { "code" : name,
						"count" : num2
					
				},
				dataType : "json",
				success : function (res) {
					//alert(res);
				
				// $(".numRes102").html(num2);
				
				}, 
				error : function (xhr) {
					
				}
				
			})
			
			$(this).parents('.member').find('.numRes102').empty();
			$(this).parents('.member').find('.numRes102').text(num2);
			
			$.ajax({
				url : "/hotel/voteUpdate.do",
				type : "post",
				data : { "code" : name,
						 "count" : num2
					
				},
				dataType : "json",
				success : function (res) {
					
				//	$(".numRes").html(value);
				//	alert(res.sw);
					//console.log("성공");
				},
				error : function (xhr) {
				//	alert("실패" + xhr.status);
				}
			})

		})
		memberVote();
	})
</script>
<body>
	<h1>구성원</h1>
	<pre>
	호텔을 구성하고 있는 직원들을 소개하며 
	칭찬 투표 공간을 마련했습니다.
	</pre>
	<br>
	<div class="member">
		<img src="../images/직원1.png" width="150" height="150">
		<input type="button" value='투표하기' id="101" class="btn1">
		<div id="test1" class="numRes101" ></div>
	</div>
	
	<div class="member">
		<img src="../images/직원2.png" width="150" height="150"> 
		<input type="button" value='투표하기' id="102" class="btn2">
		<div id="test2" class="numRes102"></div>
	</div>
	



</body>
</html>