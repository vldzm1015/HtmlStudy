<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>고객관리 프로그램</title>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$('input[value="입력"]').click(function(){
		 $.ajax({
            type: 'get',
            url: 'DataInput.jsp',
			data : {
				name : $('#name').val(),
				age : $('#age').val(),
				tel : $('#tel').val(),
				addr : $('#addr').val()
			},
			success : function(){
				alert("ok");
			},
			error : function(e){
				alert("error" + e);
			}
		}); // end of ajax
	}); // end of click


// 	$(function() {
		
		
		$('input[value="가져오기"]').click(function() {

			
			$.ajax({
				
				type : 'post',
				
				url : 'DataSelect.jsp',
				
				dataType : 'xml',
				
				success : function(rtn_xml) {
					
					
					var person = $(rtn_xml).find("person");
					
					$(person).each(function() {
						
						var pname = $(this).find("name").text();
						var page = $(this).find("age").text();
						var ptel = $(this).find("tel").text();
						var paddr = $(this).find("addr").text();

						var table = "";
						
						table += "<tr>";
						table += "<td>" + pname + "</td>";
						table += "<td>" + page + "</td>";
						table += "<td>" + ptel + "</td>";
						table += "<td>" + paddr + "</td>";
						table += "</tr>";

						$('#listTable').append(table);
					}); // each end
				},

				error : function(e) {
					alert('error' + e);
				}

			}); // ajax end
		}); //click end
	});// function end
</script>

</head>


<!-- <body> -->
<body>

	<h2>고객정보 입력</h2>

	<form name="inForm" method="post">
		<table border=1>
			<tr>
				<td width="80" align="center">Name</td>
				<td width="50" align="center">Age</td>
				<td width="100" align="center">Tel</td>
				<td width="250" align="center">Addr</td>
			</tr>
			<tr>
				<td align="center"><input type="text" size="8" name="name"
					id="name"></td>
				<td align="center"><input type="text" size="4" name="age"
					id="age"></td>
				<td align="center"><input type="text" size="12" name="tel"
					id="tel"></td>
				<td align="center"><input type="text" size="30" name="addr"
					id="addr"></td>
			</tr>
			<tr>
				<td colspan="4" align="center"><input type="button" value="입력" "></td>
			</tr> <!-- onclick="insertCustomer() -->
		</table>

		<br>
		<hr>

		<h2>고객정보 목록보기</h2>
		<table border='0' width="510">
			<tr>
				<td align="right"><input type="button" id="select" value="가져오기"></td>
			</tr>
		</table>
		<table border=1 id="listTable">
			<tr>
				<td width="80" align="center">Name</td>
				<td width="50" align="center">Age</td>
				<td width="100" align="center">Tel</td>
				<td width="250" align="center">Addr</td>
			</tr>
		</table>
		<div id="myDiv"></div>

	</form>
</body>
</html>