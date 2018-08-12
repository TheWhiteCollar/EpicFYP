<%@page import="Model.Entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header page</title>
    </head>
    <body>
        <header id="header">
            <a href="index.jsp"><img src="images/icon.png" srcset="images/icon.png 1000w, images/icon.png 2000w" alt="Epic Journey"></a>

            <nav id="nav">
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="aboutUs.jsp">About Us</a></li>
                    <li><a href="studyTrip.jsp">Overseas Study Trips</a></li>
                    <li><a href="internship.jsp">Overseas Internships</a></li>						                   
                    <li><a href="partnerWithUs.jsp">Partner With Us</a>
                     
                    </li>
                    
                    <%
                        //LoginServlet_student
                        User User = (User) session.getAttribute("User");
                        if (User != null) {
                            String Username = User.getUserFirstName();
                            if (Username != null && !Username.isEmpty()) {
                    %>
                    <li><a href="studentPortal_main.jsp">Hello <% out.print(Username); %></a>
                        <ul>
                            <li><a href="studentPortal_profile.jsp">Profile</a></li>
                            <li><a href="logout.jsp">Logout</a></li>
                        </ul>
                        
                    </li>
                    <%
                        }
                    } else {
                    %>
                    <li>
                        <a href="login.jsp">Log In</a>
                    </li>    
                        <%
                            }
                        %>
      
                </ul>
            </nav>
        </header>
    </body>
</html>
