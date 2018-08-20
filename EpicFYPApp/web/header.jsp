<%@page import="Model.Entity.Admin"%>
<%@page import="Model.Entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Header</title>
    </head>
    <body>
        <header id="header">
            <a href="index.jsp"><img src="images/icon.png" srcset="images/icon.png 1000w, images/icon.png 2000w" alt="Epic Journey"></a>

            <nav id="nav">
                <ul>


                    <%
                        User User = (User) session.getAttribute("User");
                        Admin admin = (Admin) session.getAttribute("Admin");
                        if (User != null) {
                            String Username = User.getUserFirstName();
                            if (Username != null && !Username.isEmpty()) {
                    %>
                    <li><a href="aboutUs.jsp">About Us</a></li>
                    <li><a href="studyTrip.jsp">Overseas Study Trips</a></li>
                    <li><a href="internship.jsp">Overseas Internships</a></li>						                   
                    <li><a href="partnerWithUs.jsp">Partner With Us</a>
                    <li><a href="studentPortal_main.jsp">Hello, <% out.println(Username); %></a>
                        <ul>
                            <li><a href="studentPortal_profile.jsp">Profile</a></li>
                            <li><a href="studentPortal_customisation.jsp">Customise Trip</a></li>
                            <li><a href="logout.jsp">Logout</a></li>
                        </ul>

                    </li>
                    <%
                        }
                    } else if (admin != null) {
                        String Username = admin.getAdminName();
                        if (Username != null && !Username.isEmpty()) {
                    %>
                    <li><a href="AdminPortal_trips.jsp">Manage Trips</a></li>
                    <li><a href="viewStudentProfile.jsp">Manage Students</a></li>
                    <li><a href="AdminPortal_bootstrap.jsp">Bulk Uploading</a></li>
                    <li><a href="index_admin.jsp">Hello, <% out.println(Username); %></a>
                        <ul>

                            <!-- <li><a href="#">Manage Admins</a></li> -->
                            <li><a href="logout.jsp">Logout</a></li>
                        </ul>
                    </li>
                    <%
                        }

                    } else {
                    %>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="aboutUs.jsp">About Us</a></li>
                    <li><a href="studyTrip.jsp">Overseas Study Trips</a></li>
                    <li><a href="internship.jsp">Overseas Internships</a></li>						                   
                    <li><a href="partnerWithUs.jsp">Partner With Us</a>
                    <li><a href="login.jsp">Log In</a></li>    
                        <%
                            }
                        %>

                </ul>
            </nav>
        </header>
    </body>
</html>
