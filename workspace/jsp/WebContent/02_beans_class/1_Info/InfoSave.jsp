<%@ page contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>

<%
/*
InfoBean bean = new InfoBean();
String name = request.getParameter("name");
bean.setName("name");
String id = request.getParameter("id");
bean.setName("id");

위의 자바코딩 대신에  jsp로 짧게 씀
*/
%>
<jsp:useBean id="bean" class="info.beans.InfoBean">
	<jsp:setProperty name='bean' property='*'/>
</jsp:useBean>

<!DOCTYPE html>
<html>
<body>
	<h2>  당신의 신상명세서 확인 </h2>
	이   름  : <jsp:getProperty property="name" name="bean"/><br/>
	주민번호 : <jsp:getProperty property="id" name="bean"/> <br/>
	성  별   : <jsp:getProperty property="gender" name="bean"/><br/>  
	이   름  : <%= bean.getName() %> <br/>
	주민번호 : <%= bean.getId() %> <br/>
	성  별   : <%= bean.getGender() %> <br/>  
	맞습니까????
</body>
</html>