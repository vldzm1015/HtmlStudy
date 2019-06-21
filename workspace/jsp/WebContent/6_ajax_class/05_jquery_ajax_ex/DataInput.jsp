<%@ page language="java" import="java.sql.*"%>
<%
String driver="oracle.jdbc.driver.OracleDriver";
String user="mine";
String pass="1234";
String dbURL="jdbc:oracle:thin:@localhost:1521:orcl";


String name  = request.getParameter("name");
String age = request.getParameter("age");
String tel = request.getParameter("tel");
String addr= request.getParameter("addr");


	Class.forName(driver);
	Connection connection=DriverManager.getConnection(dbURL,user,pass);		
	
	String sql = "insert into ajax_temp(name, age, tel, addr) values(";
	sql += "'" + name + "','" + age + "','" + tel + "','" + addr + "')";
	
	Statement stmt = connection.createStatement();
	int result = stmt.executeUpdate(sql);		

	stmt.close();
	connection.close();
	
	out.write(String.valueOf(result));
%>