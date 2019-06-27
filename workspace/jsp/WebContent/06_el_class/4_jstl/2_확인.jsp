<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.beans.Member" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>확인하기</title>
</head>
<body>


1. 자바객체 <br/>
<%
	Member m = new Member();
	m.setName("홍홍");
	m.setAddr("ghghjal");
%>
이름 : <%=m.getName() %> / 주소 : <%=m.getAddr() %> <br/>
이름 : ${m.name} / 주소 : ${m.addr} <br/> <%--안나옴 --%>
<hr/>


2. c:set 변수지정 <br/>
<c:set var="m2" value="<%=m%>"></c:set>
이름 : ${m2.name} / 주소 : ${m2.addr} <br/>


</body>
</html>