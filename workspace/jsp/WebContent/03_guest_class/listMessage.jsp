<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="guest.model.*,guest.service.*" %>   
<%@ page import="java.util.List" %>
 
<%
	//전체 메세지 레코드 검색 
// 	ListMessageService ls = new ListMessageService(); //불가능 private로 막아놓음
	ListMessageService listService = ListMessageService.getInstance();

	// 페이지 수 얻어오기
	int totalPageCount = listService.getTotalPage();
	
	// 페이지 번호 받기
	String pNum = request.getParameter("page");

	// 전체 메세지 레코드 검색 
	List <Message> mList =  listService.getMessageList(pNum);

// 	축약가능
// 	List <Message> mList =  ListMessageService.getInstance().getMessageList(); 
 	
%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 방명록 목록 </title>
</head>
<body>

	<% if( mList.isEmpty() ) { %>
		남겨진 메세지가 하나도~~없습니다. <br>
	<% } else { %>
	<table border="1">
	
		<% for(Message m : mList){ %>
		
		<tr>	
			<td> <%=m.getMessageId() %> </td> 
			<td> <%=m.getGuestName() %> </td> 
			<td> <a href = "deleteMessage.jsp?id=<%=m.getMessageId() %>">[삭제하기]</a> </td>			
		</tr>
		<tr>
			<td colspan='3'> 
			<textarea cols=35 rows=3 style="font-family: '돋움', '돋움체'; font-size: 10pt; font-style: normal; line-height: normal; color: #003399;background-color:#D4EBFF;border:1 solid #00009C;"><%=m.getMessage() %> </textarea>
			</td>
		</tr>
		<% } //end of for%> 
	</table>
	
	<% } // end if-else %>
	
	<a href="insertMessage.jsp">글쓰기</a><br/>
	
	<!-- 1. 페이지 번호 출력 -->
	<% for(int i = 1; i <= totalPageCount; i++ ){ %>
	
	<!-- 숫자에 현재 페이지로 링크를 걸어서 page 파라메타로 전송 -->
		<a href="listMessage.jsp?page=<%=i%>" >[<%= i %>]</a>
	<% } // end of for %>
	
</body>
</html>