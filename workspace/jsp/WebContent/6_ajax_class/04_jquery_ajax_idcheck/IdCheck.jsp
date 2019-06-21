<%@ page contentType="text/xml; charset=utf-8" %>
<%@ page language="java" import="java.sql.*"%>

<%
String driver="oracle.jdbc.driver.OracleDriver";
String user="mine";
String pass="1234";
String dbURL="jdbc:oracle:thin:@localhost:1521:orcl";


	Class.forName(driver);
	Connection connection=DriverManager.getConnection(dbURL,user,pass);
	
	String sql = "select * from memberTest where id='" + request.getParameter("userid")+"'";
	System.out.println(sql);
	Statement stmt = connection.createStatement();
	ResultSet rs = stmt.executeQuery(sql);		

	String result="NO";
	if (rs.next()){		
		result = "YES";
	}		
	out.print(result);
%>

