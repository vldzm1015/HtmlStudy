<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 서버 정보 </title>
</head>
<body>
 
<%-- request 객체의 역할 (1) 서버의 정보를 얻어오기 --%>

요청정보 프로토콜 = <%= request.getProtocol() %> <br>
<%-- 요청정보 프로토콜 = HTTP/1.1  --%>

요청정보 전송방식 = <%= request.getMethod() %> <br>
<%-- 요청정보 전송방식 = GET --%>

요청 URI = <%= request.getRequestURI() %> <br>
<%-- 요청 URI = /jsp/01_basic_class/3_objects/01_requestInfo.jsp  --%>

컨텍스트 경로 = <%= request.getContextPath() %> <br>
<%-- 컨텍스트 경로 = /jsp  --%>

서버이름 = <%= request.getServerName() %> <br>
<%-- 서버이름 = localhost  --%>

서버포트 = <%= request.getServerPort() %> <br>
<%-- 서버포트 = 8080  --%>


</body>
</html>