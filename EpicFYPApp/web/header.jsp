<%-- 
    Document   : header
    Created on : 29 Jul, 2018, 1:23:59 AM
    Author     : User
--%>

<%@page import="Model.Entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header page</title>
<!--        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">-->
    </head>
    <body>
        <header id="header">
            <a href="index.jsp"><img src="images/icon.png" srcset="images/icon.png 1000w, images/icon.png 2000w" alt="Epic Journey"></a>

            <nav id="nav">
                <ul>
                    <li><a href="aboutUs.jsp">About Us</a></li>
                    <li><a href="studyTrip.jsp">Overseas Study Trips</a></li>
                    <li><a href="internship.jsp">Overseas Internships</a></li>						
                    <li><a href="partnerWithUs.jsp">Partner With Us</a></li>

                    <%
                        User User = (User) session.getAttribute("User");
                        if (User != null) {
                            String Username = User.getUserFirstName();
                            if (Username != null && !Username.isEmpty()) {
                    %>
                    <li>
                        <div class="w3-dropdown-hover">
                            <button class="w3-button">Hello, <% out.println(Username); %></button>
                            <div class="w3-dropdown-content w3-bar-block w3-card-4">
                                <!-- To include hyperlink for edit profile once we get the page done -->
                                <a href="#" class="w3-bar-item w3-button">Edit Profile</a>
                                <a href="#" class="w3-bar-item w3-button"><a href="logout.jsp">Logout</a></a>
                            </div>
                        </div>
                    </li>
                    <%
                        }
                    } else {
                    %>
                    <li><a href="login.jsp">Log In</a></li>    
                        <%
                            }
                        %>

                </ul>
            </nav>
        </header>
    </body>
</html>
