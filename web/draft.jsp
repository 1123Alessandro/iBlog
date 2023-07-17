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
        <link rel="stylesheet" href="styles/draft.css">
    </head>
    <body>
        <h1>Draft!</h1>
        <form action="Publish" method="POST">
            <input type="hidden" name="draft" value="true">
            <input class="title" type="text" name="title" placeholder="Blog Title" value="Testing">
            <div class="espan">
                <textarea name="text" class="essay">Testing</textarea>
                <button type="submit" class="sub" >Post</button>
            </div>
        </form>
    </body>
</html>
