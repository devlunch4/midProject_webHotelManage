<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!-- <!DOCTYPE html> -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>호텔 달고나</title>
<style type="text/css">
.startmain {
	padding-left : 180px;
	padding-top : 60px;
	width : 40px;
	height : 40px;
}

.stbt {
	position : absolute;
	top : 25px;
	padding-left : 230px;
		
}
.admingogo {
	height : 40px;
	position : fixed;
	bottom : 0px;
	right : 20px;
	font-size: 20px;	
}
.stbt:hover {
	text-decoration: underline;
}
body {
	background : black;
}
</style>
</head>
<link rel="stylesheet" type="text/css"
		href="../css/main-pc-min.css">
	<link rel="stylesheet" type="text/css"
		href="../css/main-pc-scale.css">
	<link rel="stylesheet" type="text/css"
		href="../css/main-pc-max.css">
		
<body>
	
	
	<div class="main_visual r202007" style ="min-width : 800px;">
		
		<div class="kv" style="color: white;">
			<div class="video">
				<video autoplay muted loop
					src="../css/호텔영상.mp4"></video>
			</div>
			<div class="cont">
				<p>
					달콤함과 향으로 <br>최고의 휴가를 제공하는 <br> 달고나입니다
				</p>
				<div class = "cont" OnClick="location.href = 'mainb4.jsp'" style="cursor:pointer; ">
				<input type = "image" class = "startmain" src="../images/화살표.png" alt = "시작하기" >
				<p class ="stbt" style ="font-size: 25px; min-width : 400px;">
					시작하기
				</p>
				</div>	
				<div class = "cont" OnClick="location.href = 'mainAdmininfo.jsp'" style="cursor:pointer; ">
				<p class ="admingogo" style ="font-size: 15px;">
					Dalgona
				</p>			
			</div>
		</div>
	</div>
	
</body>
</html>

