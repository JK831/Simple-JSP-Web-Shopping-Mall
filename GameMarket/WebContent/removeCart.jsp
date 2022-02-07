<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.sql.*" %>
<%@ include file="./dbconn.jsp" %>

<%
String id = request.getParameter("id");
if(id == null || id.trim().equals("")){
	response.sendRedirect("Products.jsp");
	return;
}

String sql = "select * from product where p_id=?";
PreparedStatement pstmt = null;
ResultSet rs = null;
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, id);
rs = pstmt.executeQuery();

int count = 0;

while (rs.next()) {
	count++;
}

if (count == 0)
	response.sendRedirect("exceptionNoProductId.jsp");

HashMap<String, Integer> cartList = (HashMap<String, Integer>)session.getAttribute("cartlist");
cartList.remove(id);

/*Iterator<String> keys = cartList.keySet().iterator();
while (keys.hasNext()) {
	String key = keys.next();
	if (key.equals(id))
		cartList.remove(key);
}*/

response.sendRedirect("cart.jsp");
%>
</body>
</html>