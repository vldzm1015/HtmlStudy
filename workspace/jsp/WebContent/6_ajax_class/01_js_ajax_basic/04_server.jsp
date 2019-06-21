<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%	// 1. 이전 화면에서 넘겨받은 데이타
	String cate = request.getParameter("cate");
	String name = request.getParameter("name");
	
	// 2. 다시 화면으로 보낼 데이터 구성
	//{ 'name' : '홍길동', 'cate' : '책' }
	//  명확하게 하기위해 ''
	String result ="";
	result += "{";
	result += "'first' : '서버에서"+cate+"',"; // '서버에서 book'
	result += "'second' : '"+name+"변경'"; // 'kim변경'
	result += "}";
	
	out.write(result);
	
%>    
