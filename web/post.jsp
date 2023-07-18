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

        <div class="navbar">
            <a href="Landing">Home</a>
            <a href="Profile?uname=<%= request.getSession().getAttribute("uname") %>">My Profile</a>
        </div>


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
            <a href="DeletePost?id=<%= rs.getString("POST_ID") %>">Delete Post</a>
            <%
            }
            %>

            <div>
                <%
                Boolean upvoted = (Boolean) request.getAttribute("upvoted");
                Integer count = (Integer) request.getAttribute("voteCount");
                %>
                <form action="Up">
                    <input type="hidden" name="postid" value="<%= rs.getString("POST_ID") %>">
                    <button type="submit"><%= (upvoted) ? "Already Upvoted" : "Upvote" %></button>
                </form>
                <p><%= count %> Upvotes</p>
            </div>
        </div>

        <p>
        <%= rs.getString("POST_TEXT").replace("\n", "<br>") %>
        </p>

        <div>
            <h3><%= request.getAttribute("commentCount") %> Comments</h3>
            <!-- <p><%= request.getAttribute("commentCount") %></p> -->
        </div>
        <form action="Critique" method="POST">
            <input type="hidden" name="postid" value="<%= rs.getString("POST_ID") %>">
            <textarea name="text"></textarea>
            <button type="submit">Post Comment</button>
        </form>
        <%
        ResultSet comments = (ResultSet) request.getAttribute("comments");
        while (comments.next()) {
        String commenter = comments.getString("ACC_UNAME");
        %>
        <div>
            <h4><%= commenter %></h4>
            <p><%= comments.getDate("COM_DATE") %></p>
            <p><%= comments.getString("COM_TEXT").replace("\n", "<br>") %></p>
            <%
            if (commenter.equals(request.getSession().getAttribute("uname"))) {
            %>
            <form action="DeleteComment" method="POST">
                <input type="hidden" name="id" value="<%= comments.getString("COM_ID") %>">
                <input type="hidden" name="postid" value="<%= comments.getString("POST_ID") %>">
                <button type="submit">Delete Comment</button>
            </form>
            <!-- <a href="DeleteComment?id=<%= comments.getString("COM_ID") %>">Delete Comment</a> -->
            <%
            }
            %>
        </div>
        <%
        }
        %>

    </body>
</html>
