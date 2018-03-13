<%-- 
    Document   : profilepage
    Created on : 27 Feb, 2018, 10:48:02 AM
    Author     : Lenovo
--%>

<%@page import="Model.Entity.User"%>
<%@ include file = "navBar.jsp" %>

<% // to retrieve user 
    User user = (User) request.getAttribute("User");
    String email = "";
    if (user != null) {
        email = user.getUserEmail();
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Profile Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1>Profile Page</h1>

        First name * : <input type ="text" name ="firstName">  Last name * : <input type ="text" name ="lastName">
        <br><br>
        Email *  : 
        <input type ="text" name ="email" value="<% out.println(email); %>"><br><br>
        Phone *  : 
        <input type ="text" name ="phone"><br><br>
        Occupation * : 
        <input type ="text" name ="occupation"><br><br>
        Citizenship :
        <input type ="text" name ="citizenship"><br><br>
        Age : 
        <input type ="text" name ="Age"><br><br>
        Company/School      : 
        <input type ="text" name ="school"><br><br>
        Highest Qualification      : 
        <input type ="text" name ="highest qualification"><br><br>
        Expected Graduation<br> 
        <label for="specialQuery">Select Date & Time:</label>
        <input type ="text" name ="gradmonth">
        <input type ="text" name ="gradyear"><br><br>
        Field of Study      : <br/>
        <input name="field of Study" 
               type="checkbox" 
               value="OPS" />
        Operations System
        <br />
        <input name="field of Study" 
               type="checkbox" 
               value="IT" />
        Information Technology
        <br />
        <input name="field of Study" 
               type="checkbox" 
               value="M101" />
        Marketing
        <br />
        <input name="field of Study" 
               type="checkbox" 
               value="F101" />
        Finance <br><br>
        Language proficiency (Spoken and Written):<br>
        <input name="language" 
               type="checkbox" 
               value="Bahasa Melayu" />
        Bahasa Melayu
        <br />
        <input name="language" 
               type="checkbox" 
               value="Mandarin" />
        Mandarin
        <br />
        <input name="language" 
               type="checkbox" 
               value="English" />
        English
        <br /><br>

        Looking for:<br>
        <input name="looking for" 
               type="checkbox" 
               value="Internship" />
        Internship
        <br />
        <input name="looking for" 
               type="checkbox" 
               value="Study Trip" />
        Study Trip<br><br>

        Interest:<br>
        <input name="interest" 
               type="checkbox" 
               value="Banks / Funds" />
        Banks / Funds
        <br />
        <input name="interest" 
               type="checkbox" 
               value="Engineering" />
        Engineering<br><br>

        Add bio:<br>
        <textarea name="message" rows="10" cols="30"></textarea><br><br>

        Upload Resume: <br>
        Please choose a file: <br>
        <input name="uploadedfile" type="file" /><br /><br /> 

        Upload Photo: <br>
        Please choose a file: <br>
        <input name="uploadedfile" type="file" /><br /><br /> 

        <input type="submit" value="Submit" /><br><br>
