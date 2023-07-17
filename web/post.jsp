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
                <a href="#">
                    <%= rs.getString("ACC_UNAME") %>
                </a>
            </h4>
            <h4>
                <%= rs.getString("POST_DATE") %>
            </h4>
        </div>
        <p>
        <%= rs.getString("POST_TEXT").replace("\n", "<br>") %>
        </p>
    </body>
</html>
