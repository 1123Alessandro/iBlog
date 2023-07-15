<%-- 
    Document   : index
    Created on : Jul 15, 2023, 5:16:58 AM
    Author     : araza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>JSP Page</title>
	</head>
	<body>
		<%
		String uname = (String) session.getAttribute("ACC_UNAME");
		if (uname == null) {
		%>
		<h1>Welcome Guest</h1>
		<form action="Login" method="GET">
			<button type="submit">Login</button>
		</form>
		<%
		}
		else {
		%>
		<h1>Trending Now</h1>
		<%
		}
		%>
	</body>
</html>
