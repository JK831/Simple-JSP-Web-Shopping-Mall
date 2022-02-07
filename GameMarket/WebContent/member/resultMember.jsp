<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Locale" %>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet"
	href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="../resources/css/style.css"/>
<title>Welcome</title>
</head>
<body>
	<%@ include file = "../menu.jsp" %>
	<%! String greeting = "회원 가입이 완료되었습니다!";
	String tagline = "다양한 게임들, 개발을 함께할 협력자를 만나보세요!"; %>
	<div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3">
				<%= greeting %>
			</h1>		
		</div>
	</div>
	
	<div class = "container">
		<div class = "text-center">
			<h3>
				<%= tagline %>
			</h3>
		<%
			Locale locale = request.getLocale();
			String date = DateFormat.getDateTimeInstance(DateFormat.FULL, DateFormat.SHORT, locale).format(new Date());
			Date day = new java.util.Date();
			String am_pm;
			int hour = day.getHours();
			int minute = day.getMinutes();
			int second = day.getSeconds();
			if(hour / 12 == 0) {
				am_pm = "AM";
			} else {
				am_pm = "PM";
				hour = hour - 12;
			}
			String CT = hour + ":" + minute + ":" + second + " " + am_pm;
			out.println("현재 접속 시각: " + CT + "\n");
		%>		
		</div>
		<hr>
	</div>
	<%@ include file = "../footer.jsp" %>
</body>
</html>