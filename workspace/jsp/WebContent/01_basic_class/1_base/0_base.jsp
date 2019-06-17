<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--     멤버변수로 지정됨   -->
    <%!
    	String msg = "lunch??";
    %>
    
<!--     자바코드 기술  -->
    <%
	 	String name ="홍길동";
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% if(name.equals("홍길동")){ %>

	이 름 : <%= name %> <hr/>
	
	<%} else {  %>
	
	할 일 :  <%= msg %> <hr/>
	
<% } %>
</body>
</html>