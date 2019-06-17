<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>

<%@ page import="java.io.*"%>







<%

//form 사용자 입력 값 가져오기.

request.setCharacterEncoding("utf-8");

String name = request.getParameter("name"); //대소문자 지켜줘야함.

String email = request.getParameter("email");

String website = request.getParameter("website");

String password = request.getParameter("password");



// 1.drive 설정

String driver = "oracle.jdbc.driver.OracleDriver";

String url ="jdbc:oracle:thin:@192.168.0.91:1521:orcl";

String user = "hr";

String pass = "hr";



Connection con = null;



Class.forName(driver);

// 2. 연결객체 얻어오기

con = DriverManager.getConnection(url, user ,pass);

// 3. sql 문장 만들기

String sql = "insert INTO memberjoin (member_name, member_mail, member_url, member_pw) values (?,?,?,?)";

// 4. 전송 객체 얻어오기

PreparedStatement st = con.prepareStatement(sql); // 완성되지않은 SQL문

			

			st.setString(1, name);

			st.setString(2,email);

			st.setString(3,website);

			st.setString(4, password);

			

// 5. 전송

int result = st.executeUpdate(); 



%>







<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Insert title here</title>

</head>

<body>

 <h2>정보 확인</h2>

        <form action="jquery_update.jsp" method="post">

          <div>

            <label for="name">이름:</label>

            <input name="name" id="name" type="text" value="<%=name%>"/>

          </div>

          <div>

            <label for="email">이메일:</label>

            <input name="email" id="email" type="text" value="<%=email%>" readonly/>

          </div>

          <div>

            <label for="website">웹사이트 URL:</label>

            <input name="website" id="website" type="text" value="<%=website%>" />

          </div>

          <div>

            <label for="password">암호:</label>

            <input name="password" id="password" type="text" value="<%=password%>"/>

          </div>

            <div>

           <input type="submit" value="수정하기" />

        </div>

</body>

</html>