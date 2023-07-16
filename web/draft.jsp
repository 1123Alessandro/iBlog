<%-- 
    Document   : draft
    Created on : Jul 15, 2023, 2:46:40 PM
    Author     : araza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Draft</title>
    </head>
    <body>
        <h1>Draft!</h1>
        <form action="Publish" method="POST">
            <input type="hidden" name="draft" value="true">
            <input type="text" name="title" placeholder="Blog Title" style="font-size:3em">
            <textarea name="text" style="resize:none;width:100%;"></textarea>
            <button >harmless button</button>
        </form>
    </body>
</html>
