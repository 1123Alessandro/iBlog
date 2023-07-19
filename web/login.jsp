<%-- 
    Document   : login
    Created on : Jul 15, 2023, 11:04:05 AM
    Author     : araza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="styles/login.css">
    </head>
    <body>
        <h1>Login Page!</h1>
        <%
        if (request.getAttribute("invalid") != null) {
        %>
        <h1>Incorrect username/password, please try again</h1>
        <%
        }
        %>
        <form action="Login" method="POST">
            <input type="hidden" name="login" value="true">
            <div>
                <label for="uname">Username:</label>
                <input type="text" name="uname">
            </div>
            <div>
                <label for="pass">Password:</label>
                <input type="password" name="pass">
            </div>
            <button type='submit'>Submit</button>
        </form>
    </body>
</html>
