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
        <link rel="stylesheet" href="styles/landing.css">
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

        <div class="navbar">
            <a href="Landing">Home</a>
            <a href="Profile?uname=<%= request.getSession().getAttribute("uname") %>">My Profile</a>
        </div>


        <h1>Trending Now</h1>
        <!-- <a href="Landing?query=mine">My Posts</a> | <a href="Landing?query=comms">My Comments</a> -->
		<form action="Publish" method="POST">
			<button type="submit">Write Post</button>
		</form>

		<%
		ResultSet posts = (ResultSet) request.getAttribute("posts");
		while (posts.next()) {
            String text = posts.getString("POST_TEXT");
		%>

        <div class="postbox">
            <h2>
                <a href="View?id=<%= posts.getString("POST_ID") %>">
                    <%= posts.getString("POST_TITLE") %>
                </a>
            </h2>
            <a href="Profile?uname=<%= posts.getString("ACC_UNAME") %>"><%= posts.getString("ACC_UNAME") %></a>
            <p><%= posts.getDate("POST_DATE") %></p>
            <p><%= text.substring(0, (text.length() < 30) ? text.length()-1 : 30) + "..." %></p>
        </div>

		<%
        }
		}
		%>
	</body>
</html>
