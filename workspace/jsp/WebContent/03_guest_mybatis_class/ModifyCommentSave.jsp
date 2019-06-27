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
  
 <!--  이전 폼의 각각의 데이터를 빈즈의 멤버로 지정  -->
 <jsp:useBean id="comment" class="mybaties.guest.model.Comment">
 	<jsp:setProperty name="comment" property="*"/>
 </jsp:useBean>    
 
 <!-- 서비스의 메소드 호출  -->
 <%
 	CommentService.getInstance().modifyComment(comment); 
 %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>modifyComment</title>
</head>
<body>

수정되었는지 확인해보세요. <br/>
<a href="listComment.jsp">목록보기</a>

</body>
</html>