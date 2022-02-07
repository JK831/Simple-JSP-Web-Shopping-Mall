<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>

<nav class="navbar navbar-expand navbar-dark bg-dark">
	<ul class="navbar-nav mr-auto">
		<c:choose>
			<c:when test="${empty sessionId }">
				<li class="nav-item"><a class="nav-link" href="<c:url value="/member/logInMember.jsp" />">로그인 </a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value = "/member/addMember.jsp" />">회원 가입</a></li>
			</c:when>
			<c:otherwise>
				<li style="padding-top: 7px; color: white">[<%=sessionId %>님]</li>
				<li class="nav-item"><a class="nav-link" href="<c:url value="/member/logoutMember.jsp"/>">로그아웃</a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value="/member/updateMember.jsp"/>">회원 수정</a></li>
			</c:otherwise>
		</c:choose>
		<li class="nav-item"><a class="nav-link" href="./manager/managerMain.jsp">관리자 메인 
		페이지</a></li>
	</ul>
</nav>
<div id="topMenu">
<nav id="topMenu" >
        <ul>
            <li><a class="menuLink" href="/GameMarket/welcome.jsp">Home</a></li>
            <li><a class="menuLink" href="/GameMarket/products.jsp">For sale</a></li>
            <li><a class="menuLink" href="/GameMarket/requestBoardListAction.do">Request Plaza</a></li>
            <li><a class="menuLink" href="/GameMarket/recruitingBoardListAction.do">Recruiting Party</a></li>      
        </ul>
</nav>
</div>