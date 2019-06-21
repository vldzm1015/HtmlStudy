<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	<script  type="text/javascript"  src="libs/jquery-1.9.1.min.js"> </script>
	<script type="text/javascript">
	$(document).ready(function(){
		var param = { cate : '책', name : "이름" };
		$.ajax({
			type : 'post',  	// 브라우저에 따라 기본 방식이 달라서 지정안하면 문제 발생가능
			data : param, 		//보낼 데이타 객체
			url : '03_server.jsp',
			dataType : 'xml', 	// 받는 데이타 형식
			success : parseData
		});

		// 축약형, 권장하지 않음
// 		$.post('03_server.jsp', param, parseData, 'xml');
		
		function parseData(xmlInfo){
			$('#cate').val($(xmlInfo).find('first').text());
			$('#name').val($(xmlInfo).find('second').text());
		}
		});
	</script>
</head>

<body>
서버로부터 넘겨받은 데이터<br/>
첫번째 데이터 : <input type="text" name="" id="cate"/><br/>
두번째 데이터 : <input type="text" name="" id="name"/><br/>
</body>
</html>


