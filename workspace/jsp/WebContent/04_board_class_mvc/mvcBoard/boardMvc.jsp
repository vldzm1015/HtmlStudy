
<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
    
<% String projectName = "/jsp"; %> 

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Insert title here</title>

</head>

<body>



<a href="<%= projectName %>/board?rec=list-page">목록보기</a>

<hr/>

<a href="<%= projectName %>/board?rec=write-page">게시글 쓰기</a>

<hr/>

<a href='BoardView.jsp?article_id=2'>2번글 내용보기</a>

</body>

</html>