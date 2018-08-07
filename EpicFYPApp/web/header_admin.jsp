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
                    <li><a href="index_admin.jsp">Pending Task</a></li>
                    <li><a href="viewStudentProfile.jsp">View Students Profile</a></li>

                    <%
                        User User = (User) session.getAttribute("User");
                        Admin admin = (Admin) session.getAttribute("Admin");
                        if (User != null) {
                            String Username = User.getUserFirstName();
                            if (Username != null && !Username.isEmpty()) {
                    %>
                    <li><a href="#">Hello, <% out.println(Username); %></a>
                        <ul>
                            <li><a href="#">Edit Profile</a></li>
                            <li><a href="logout.jsp">Logout</a></li>
                        </ul>
                        
                    </li>
                    <%
                        }
                    } else if (admin != null) {
                        String Username = admin.getAdminName();
                        if (Username != null && !Username.isEmpty()) {
                    %>
                    <li><a href="#">Hello, <% out.println(Username); %></a>
                        <ul>
                            <li><a href="#">Edit Profile</a></li>
                            <li><a href="logout.jsp">Logout</a></li>
                        </ul>
                    </li>
                    <%
                        }

                    } else {
                    %>s
                    <li><a href="login.jsp">Log In</a></li>    
                        <%
                            }
                        %>

                </ul>
            </nav>
        </header>
    </body>
</html>
