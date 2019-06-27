<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<%@ page import="board.model.*,board.service.*" %>



<%

	// 1. 삭제할 레코드의 게시글번호와 비밀번호를 넘겨받기

	String article_id = request.getParameter("article_id");

	String password = request.getParameter("password");

	// 2. Service에 delete() 호출

	DeleteArticleService service= DeleteArticleService.getInstance();

	int result =service.delete(article_id,password); 

%>

<!DOCTYPE html>

<html>

<head> 

<meta http-equiv="Conte nt-Type" content="text/html; charset=UTF-8">

<title> 게시글 삭제 </title>

</head>

<body>



	<% if( result != 0) { %>

			글을 삭제하였습니다.

	<% } else { %>

			삭제가 실패되었습니다.

	<% } %>

	<br/><br/>

	<a href="BoardList.jsp"> 목록보기 </a>

</body>

</html>