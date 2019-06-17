<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	//입력하기전에 utf-8 지정해줘야함
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String occupation = request.getParameter("occupation");
	String hobby[] = request.getParameterValues("hobby");
	String hobbystr = "";
	if(hobby !=null){
		for( int i=0; i <hobby.length; i++){
			hobbystr += hobby[i]+"/";
		}
	}
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	이름 : <%= name %> <br/>
	성별 : <%= gender %> <br/>
	직업 : <%= occupation %> <br/>
	취미 : <%= hobbystr %>
	
</body>
</html>