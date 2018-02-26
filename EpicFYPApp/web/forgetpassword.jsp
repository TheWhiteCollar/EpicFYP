<%-- 
    Document   : forgetpassword
    Created on : 26 Feb, 2018, 3:08:54 PM
    Author     : User
--%>

<%@page import="Model.Entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forget Password</title>
    </head>
    <body>
        <h1>Reset here! </h1>

        <% // To retrieve error message
            String ErrorMsg = (String) request.getAttribute("ErrorMsg");
            if (ErrorMsg != null) {
                out.println(ErrorMsg);
            }
        %>

        <br>

        <p> 
            <% // To get user
                User user = (User) request.getAttribute("User");
                if (user != null) {
                    String firstname = user.getFirstname();
                    String lastname = user.getLastname();
                    out.println("Hi " + firstname + " " + lastname + ", <br>");
                }
            %>

            If you have forgotten your password, <br>

        <form action="forgetPasswordServlet" method="post">
            Enter your email address:<br>
            <input type="text" name="email" value="xxx@gmail.com">
            <br>
            <input type="submit" value="Click here to reset your password">
        </form>


        <% // to retrieve reset password message 
            String PasswordSent = (String) request.getAttribute("PasswordSent");
            if (PasswordSent != null) {
                out.println(PasswordSent);
            }
        %>

    </p>

</body>
</html>
