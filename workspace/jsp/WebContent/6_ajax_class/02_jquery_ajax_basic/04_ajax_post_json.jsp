<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	<script  type="text/javascript"  src="libs/jquery-1.9.1.min.js"> </script>
	<script type="text/javascript">
	    $(function(){
	    	$.ajax({
	    		type : 'get',
	    		url : '04_server.jsp',
	    		data : { cate : '책', name : '홍홍이'},
	    		success : 	function (resText){
					    		var obj = eval('('+resText+')');
					    		$('#cate').val(obj.first);
					    		$('#name').val(obj.second);
				    		}  // 함수가 짧을때는 바로 가져와서 축약형 가능.
	    		
	    	});
	    	
	    	
	    	
	    });
	</script>
</head>

<body>
서버로부터 넘겨받은 데이터<br/>
첫번째 데이터 : <input type="text" name="" id="cate"/><br/>
두번째 데이터 : <input type="text" name="" id="name"/><br/>
</body>
</html>


