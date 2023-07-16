<%-- 
    Document   : index
    Created on : Jul 15, 2023, 5:16:58 AM
    Author     : araza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="model.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>JSP Page</title>
	</head>
	<body>
        <%
        String uname = (String) session.getAttribute("uname");
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
        <!-- TODO: Make navbar -->

        <h1>Trending Now</h1>
        <!-- <a href="Landing?query=mine">My Posts</a> | <a href="Landing?query=comms">My Comments</a> -->
		<form action="Publish" method="POST">
			<button type="submit">Write Post</button>
		</form>

		<%
		ResultSet posts = (ResultSet) request.getAttribute("posts");
		while (posts.next()) {
		%>

		<h3><%= posts.getString("POST_TITLE") %></h3>
		<p><%= posts.getDate("POST_DATE") %></p>

		<%
		}
		%>
		<%
		}
		%>
	</body>
</html>
