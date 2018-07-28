<%@page import="Model.Dao.UserDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
        Interphase by TEMPLATED
        templated.co @templatedco
        Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Epic Journey - View Students Profile</title>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta name="description" content="Imparting life skills through overseas exposure via internships and study missions. Countries of focus: Cambodia, Laos, Myanmar, Vietnam, India, Indonesia, Thailand, Japan and China." />
        <meta name="keywords" content="overseas, study missions, internships, training, life skills, career exposure" />
        <!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
        <script src="js/jquery.min.js"></script>
        <script src="js/skel.min.js"></script>
        <script src="js/skel-layers.min.js"></script>
        <script src="js/init.js"></script>
        <noscript>
        <link rel="stylesheet" href="css/skel.css" />
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="css/style-xlarge.css" />
        </noscript>
        <!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
    </head>
    <body>

        <!-- Header -->
        <jsp:include page="header_admin.jsp" />

        <!-- Main -->
        <section id="main" class="wrapper">
            <div class="container">

                <header class="major">
                    <h2>Students Profile</h2>
                </header>

                <!-- To add filter button -->

                <table>
                    <tr>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th>Contact</th>
                        <th>Age</th>
                        <th>Citizenship</th>
                        <th>School</th>
                        <th>Highest Qualification</th>
                        <th>Expected Graduation</th>
                        <th>Trips Taken</th>
                        <th>Pending Trips</th>
                        <th></th>
                    </tr>

                    <%
                        ArrayList<User> allUsers = UserDAO.getAllUsers();
                        if (!allUsers.isEmpty()) {
                            for (User u : allUsers) {
                    %>
                            <tr>
                                <td><% out.println(u.getUserFirstName()); %></td>
                                <td><% out.println(u.getUserLastName()); %></td>
                                <td><% out.println(u.getUserEmail()); %></td>
                                <td><% out.println(u.getUserPhone()); %></td>
                                <td><% out.println(u.getUserAge()); %></td>
                                <td><% out.println(u.getUserCitizenship()); %></td>
                                <td>School</td>
                                <td>Highest Qualification</td>
                                <td>Expected Graduation</td>
                                <td><a href="">3</a></td>
                                <td>Pending Trips</td>
                                <td><a href=""><button>View More</button></a></td>
                            </tr>
                    <%
                            }
                        }
                    %>

                </table>

            </div>
        </section>

    </body>
</html>