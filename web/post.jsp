<%-- 
    Document   : post
    Created on : Jul 17, 2023, 6:12:29 AM
    Author     : araza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="model.*" %>
<!DOCTYPE html>
<html>
    <%
    ResultSet rs = (ResultSet) request.getAttribute("post");
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= rs.getString("POST_TITLE") %></title>
    </head>
    <body>

        <h1><%= rs.getString("POST_TITLE") %></h1>

        <div>
            <h4>
                <a href="Profile?uname=<%= rs.getString("ACC_UNAME") %>">
                    <%= rs.getString("ACC_UNAME") %>
                </a>
            </h4>
            <h4>
                <%= rs.getString("POST_DATE") %>
            </h4>
            <%
            if (rs.getString("ACC_UNAME").equals(request.getSession().getAttribute("uname"))) {
            %>
            <a href="Edit?id=<%= rs.getString("POST_ID") %>">Edit Post</a>
            <a href="Delete?id=<%= rs.getString("POST_ID") %>">Delete Post</a>
            <%
            }
            %>
        </div>

        <p>
        <%= rs.getString("POST_TEXT").replace("\n", "<br>") %>
        </p>

        <div>
            <h3>Comments</h3>
            <p><%= request.getAttribute("commentCount") %></p>
        </div>
        <form action="Critique" method="POST">
            <input type="hidden" name="postid" value="<%= rs.getString("POST_ID") %>">
            <textarea name="text"></textarea>
            <button type="submit">Post Comment</button>
        </form>
        <%
        ResultSet comments = (ResultSet) request.getAttribute("comments");
        while (comments.next()) {
        %>
        <div>
            <h4><%= comments.getString("ACC_UNAME") %></h4>
            <p><%= comments.getDate("COM_DATE") %></p>
            <p><%= comments.getString("COM_TEXT").replace("\n", "<br>") %></p>
        </div>
        <%
        }
        %>

    </body>
</html>
