<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 
 
 
 
<!--  변수선언  -->
<c:set var='gender' value='male'/>

<!-- 조건문 -->
<c:if test="${gender eq 'male'}">당신은 남자입니다.</c:if>
<c:if test="${gender == 'female'}">당신은 여자입니다.</c:if>
<hr/>




<!-- age변수선언 -->
<c:set var='age' value='25' />

<c:choose>
<c:when test="${age le 10}">어린이입니다.</c:when><%-- 10살이하 --%>
<c:when test="${(age gt 10) and (age lt 20)}">청소년입니다.</c:when> <%-- 10살 초과 20살 미만 --%>
<c:otherwise>성인입니다.</c:otherwise><%-- 20살 이상 --%>
</c:choose>
<hr/>



<c:set var="sum" value="0"/>
 <c:forEach var="i" begin="1" end="100">
<c:set var="sum" value="${sum+i}"/>
</c:forEach>
1~100까지의 합 : ${sum}<br/>
<hr/>

<%-- 1~100까지의 홀수의 합과 짝수의 합을 출력하시오 --%>
<c:forEach var="i" begin="1" end="100" step="2">
	<c:set var="odd" value="${odd+i}"/>
</c:forEach>
<c:forEach var="i" begin="0" end="100" step="2">
	<c:set var="even" value="${even+i}"/>
</c:forEach>
	
홀수="${odd}"<br/>
짝수="${even}"<br/>
</body>
</html>