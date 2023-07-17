<%-- 
    Document   : draft
    Created on : Jul 15, 2023, 2:46:40 PM
    Author     : araza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="model.*" %>
<!DOCTYPE html>
<html>
    <%
    ResultSet details = (ResultSet) request.getAttribute("details");
    Boolean edit = (Boolean) request.getAttribute("editPost");
    System.out.println("Edit mode for post :: " + edit);
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Draft</title>
        <link rel="stylesheet" href="styles/draft.css">
    </head>
    <body>
        <h1>Drafting</h1>
        <form action="Publish" method="POST">
            <input type="hidden" name="draft" value="true">
            <% if (edit != null) { %>
            <input type="hidden" name="editPost" value="true">
            <input type="hidden" name="postid" value="<%= details.getString("POST_ID") %>">
            <% } %>
            <input class="title" type="text" name="title" placeholder="Blog Title" value="<%= (edit == null) ? "" : details.getString("POST_TITLE") %>">
            <div class="espan">
                <textarea name="text" class="essay"><%= (edit == null) ? "" : details.getString("POST_TEXT") %></textarea>
                <button type="submit" class="sub" ><%= (edit == null) ? "Post" : "Update" %></button>
            </div>
        </form>
    </body>
</html>
