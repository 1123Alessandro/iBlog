<%-- 
    Document   : account
    Created on : Jul 17, 2023, 11:03:46 AM
    Author     : araza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="model.*" %>
<!DOCTYPE html>
<html>
    <%
    ResultSet acc = (ResultSet) request.getAttribute("info");
    ResultSet posts = (ResultSet) request.getAttribute("posts");
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= acc.getString("ACC_UNAME") %></title>
        <link rel="stylesheet" href="styles/acc.css">
    </head>
    <body>

        <div class="navbar">
            <a id="home" href="Landing">Home</a>
            <a id="profile" href="Profile?uname=<%= request.getSession().getAttribute("uname") %>">My Profile</a>
        </div>

        <h1 class="username"><%= acc.getString("ACC_UNAME") %></h1>
        <%
        if (posts.next()) {
        do {
        String text = posts.getString("POST_TEXT");
        %>

        <div class="postbox">
            <h2>
                <a href="View?id=<%= posts.getString("POST_ID") %>">
                    <%= posts.getString("POST_TITLE") %>
                </a>
            </h2>
            <!-- <a href="Profile?uname=<%= posts.getString("ACC_UNAME") %>"><%= posts.getString("ACC_UNAME") %></a> -->
            <p><%= posts.getDate("POST_DATE") %></p>
            <p><%= text.substring(0, (text.length() < 30) ? text.length()-1 : 30) + "..." %></p>
        </div>

        <%
        } while (posts.next());
        }
        else {
        %>
        <h1>NO POSTS, START POSTING</h1>
        <%
        }
        %>
    </body>
</html>
