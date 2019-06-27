<%@ page language="java" contentType="text/html; charset=utf-8"%>
 <%@ page import="mybaties.guest.model.Comment" %>   
 <%@ page import="mybaties.guest.service.CommentService" %>     
  
      
  <!-- 키에 해당하는 글번호를 넘겨받아 서비스의 메소드 호출  -->
  <% 
  long commentNo = Integer.parseInt( request.getParameter("cId"));
  Comment comment = CommentService.getInstance().selectCommentByPrimaryKey(commentNo);
  %>
     
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
<title> 메세지 보기 </title>
<script type="text/javascript">
window.onload = function(){
	
	document.getElementById("btnDelete").onclick = function(){
		window.location.href = 
			"deleteComment.jsp?cId=<%=  comment.getCommentNo()%>";
	}
}

</script>
</head> 
<body>
<form name="frm" action="ModifyCommentSave.jsp">
<input type="hidden" name="commentNo" value="<%=  comment.getCommentNo()%>">
	<table border="1">
			<tr><td>작성자</td><td><input type="text" name="userId" value="<%=  comment.getUserId()%>"/></td></tr>
			<tr><td>메세지</td><td><input type="text"  name="commentContent" value="<%=  comment.getCommentContent()%>"></td></tr>
			<tr><td>등록일</td><td><%=  comment.getRegDate()%></td></tr>
			<tr><td colspan="2">
					<input type="submit" id="btnModify" value="수정" />
					<input type="button" id="btnDelete" value="삭제" />
					</td></tr>
	</table>
</form>

</body>
</html>