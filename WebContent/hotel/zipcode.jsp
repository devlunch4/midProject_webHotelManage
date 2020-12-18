<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>호텔 달고나</title>
</head>
<body>

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
					jQuery("#zonecode").val(data.zonecode);
					jQuery("#addr1").val(data.address);
					jQuery("#addr2").focus();
					console.log(data);
				}
			}).open();
		}
	</script>
	<input type="button" onClick="openDaumZipAddress();" value="주소 찾기" />
	<br>
	<br><label>우편 번호</label>
	<!-- <input id="postcode1" type="text" value="" style="width: 50px;"
		readonly />-
	<input id="postcode2" type="text" value="" style="width: 50px;"
		readonly /> -->
	<input id="zonecode" type="text" value="" style="width: 50px;" readonly />
	<br><label>기본 주소</label>
	<input type="text" id="addr1" value="" style="width: 200px;" readonly />
	<br><label>상세 주소</label>
	<input type="text" id="addr2" value="" style="width: 200px;" />
</body>
</html>