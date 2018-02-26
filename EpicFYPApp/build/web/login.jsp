<%-- 
    Document   : login.jsp
    Created on : 21 Feb, 2018, 4:34:48 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h1>Login here! </h1>

        <form action="src\\java\\Controller\\loginServlet.java" method="post">
            Userid:<br>
            <input type="text" name="userid" value="yijing">
            <br>
            Password:<br>
            <input type="password" name="password" value="YIjing94">
            <br><br>
            <input type="submit" value="Login">
        </form> 

    </body>
</html>
