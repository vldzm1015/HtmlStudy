<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.Map" %>
<%
	// 0. 한글처리
	request.setCharacterEncoding("utf-8");

	//1. 폼의 입력값 얻어오기
	String name = request.getParameter("name");
	String adds = request.getParameter("address");
	String pet[] = request.getParameterValues("pet");
	String pets = "";
	if (pet != null){
	 	for( int i =0; i <pet.length; i++){
	 		pets += pet[i]+ "/";
	 	}
	}
%>
<!DOCTYPE html>
<html>
<head><title>요청 파라미터 출력</title></head>
<body>
<h5> 이전화면에서 사용자의 입력값을 출력하세요 </h5>
<%-- 3. 얻어온 입력값을 출력 --%>
	이름 : <%= name %> <br/>
	주소 : <%= adds %> <br/>
	애완동물 : <%= pets %>

<h5> 방법 2 </h5>



<h5> 방법 3 </h5>


</body>
</html>
