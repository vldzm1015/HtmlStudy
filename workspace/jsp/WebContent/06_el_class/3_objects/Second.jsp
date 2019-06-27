<%@ page contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title> 데이타 받는 페이지 </title>
</head>
<body>

<%-- <% String data = request.getParameter("data"); %> --%>
<%-- 전 페이지의 값 : <% =data %> <br/>  --%>
<!-- 위의 코딩 대신에  -->


<!-- 자바코드를 줄이기 위해 표현언어 사용 -->
<!-- request.getparameter(" ") -->
전 페이지의 값 : ${param.data}  <br/> 

<!-- session.getAttribute(" ") -->
세션의 값 : ${sessionScope.login} <br/>

<!-- Cookie[ ] c = request.getCookies() -->
쿠키의 값 :	 ${cookie.isFlag.value} <br/>


<hr>


</body>
</html>