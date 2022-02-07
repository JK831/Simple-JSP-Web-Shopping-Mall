<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE>
<html>
    <head>
    <meta charset="UTF-8">
    </head>
<body>
<%
String id = request.getParameter("id");
String pw = request.getParameter("password");
String userLevel = "";
if(id.equals("")){  %>
     <script>
	 alert("아이디를 입력하세요");
	 document.location.href='./logInMember.jsp'
	 </script>
    <% }
else if(pw.equals("")){ %>
     <script>
	 alert("비밀번호를 입력하세요");
	 document.location.href='./logInMember.jsp'
	 </script>
    <% }
else{
	%>
	<%@ include file="../dbconn.jsp"%>
	<%
    //여기서 부터 DB 연결 코드
	
    String sql = "select * from member where id = ? AND password =?";
	PreparedStatement pstmt = null;
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, pw);
	ResultSet rs = pstmt.executeQuery();
	Boolean check = false;
	while(rs.next()) // 결과값을 하나씩 가져와서 저장하기 위한 while문
    {
    	session.setAttribute("sessionId", id);
		check = true;	
    }
	if(check){ //ID,PW가 DB에 존재하는 경우 게시판으로 이동하는 코드 
    
		rs.close();
		pstmt.close();
    	conn.close();
    %> 
 			 <script>
  			 document.location.href='../welcome.jsp'
 			 </script> <%
    	        
		}   else  { //ID,PW가 일치하지 않는 경우
        
			rs.close();
			pstmt.close();
	    	conn.close();
        %>
     <script>
	 alert("ID 또는 PW를 잘못 입력했습니다.");
	 document.location.href='./logInMember.jsp'
	 </script>
    <%    }
   } %>