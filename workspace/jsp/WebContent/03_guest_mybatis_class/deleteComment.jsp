<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <!--   1. import  -->  
  <%@ page import="java.util.*" %>  
 <%@ page import="mybaties.guest.model.Comment" %>    
 <%@ page import="mybaties.guest.service.CommentService" %>  

 <!--  이전 폼에서 넘겨오는 데이타의 한글 처리  -->
 <% 
 	request.setCharacterEncoding("utf-8"); 
 %>
 
  <!--   2. 이전화면에서 넘어오는 cId값을 얻어오기  -->
 <% long delete = Long.parseLong(request.getParameter("cId")); %>
  
  <!--   3. Service에 함수 호출  -->   
 <%
CommentService.getInstance().delelteComment(delete);
//  CommentService.getInstance().delelteComment(comment);   
 %> 
 
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>deleteComment</title>
</head>
<body>
삭제되었습니다.
</body>
</html>