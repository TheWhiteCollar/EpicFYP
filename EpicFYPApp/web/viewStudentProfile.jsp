<%@page import="Model.Dao.UserDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Epic Journey - Admin View Students Profile</title>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta name="description" content="Imparting life skills through overseas exposure via internships and study missions. Countries of focus: Cambodia, Laos, Myanmar, Vietnam, India, Indonesia, Thailand, Japan and China." />
        <meta name="keywords" content="overseas, study missions, internships, training, life skills, career exposure" />
        <!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/animate.css@3.5.2/animate.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
        <jsp:include page="header.jsp" />

        <!-- Main -->
        <section id="main" class="wrapper">
            <div class="container">

                <header class="major">
                    <h2>Students Profiles</h2>
                </header>

                <!-- To add filter button -->

                <table class = "alt">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Contact</th>
                            <th>More information</th>


                            <!--                            <th>Age</th>
                                                        <th>Citizenship</th>
                                                        <th>School</th>
                                                        <th>Highest Qualification</th>
                                                        <th>Expected Graduation</th>
                                                        <th>Trips Taken</th>
                                                        <th>Pending Trips</th>-->

                        </tr>
                    </thead>
                    <tbody>
                        <%
                            ArrayList<User> allUsers = UserDAO.getAllUsers();
                            int count = 0;
                            if (!allUsers.isEmpty()) {
                                for (int i = 0; i < allUsers.size(); i++) {
                                    User u = allUsers.get(i);
                                    count += 1;
                        %>
                        <tr>
                            <td><%out.print(count);%></td>
                            <td><% out.print(u.getUserFirstName() + " " + u.getUserLastName()); %></td>                      
                            <td><% out.print(u.getUserEmail()); %></td>
                            <td><% out.print(u.getUserPhone()); %></td>
                            <td><button type="button" class="button" data-toggle="modal" data-target="#myModal<%out.print(i);%>">View</button></td>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </tbody>    
                </table>
                <%
                    if (!allUsers.isEmpty()) {
                        for (int i = 0; i < allUsers.size(); i++) {
                            User u = allUsers.get(i);
                            
                %>
                <div class="modal fade" id="myModal<%out.print(i);%>" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">User information | <% out.print(u.getUserFirstName() + " " + u.getUserLastName()); %></h4>
                            </div>
                            <div class="modal-body">
                                <div class ="row">

                                    <div class ="3u 12u">
                                        <p>
                                            Email : <% out.print(u.getUserEmail()); %>
                                        </p>                                           
                                    </div>
                                    <div class ="3u 12u">
                                        <p>
                                            Contact : <% out.print(u.getUserPhone()); %>
                                        </p>                                           
                                    </div>
                                    <div class ="3u 12u">
                                        <p>
                                            Year of birth : 1996
                                        </p>                                           
                                    </div>
                                </div>


                                <div class ="row">
                                    <div class ="6u 12u">
                                        <p>
                                            Citizenship : <% out.print(u.getUserCitizenship()); %>
                                        </p>
                                    </div>
                                    <div class ="6u 12u">
                                        <p>
                                            Highest Qualification : Undergraduate degree
                                        </p>                                           
                                    </div>
                                </div>

                                <div class ="row">
                                    <div class ="6u 12u">
                                        <p>
                                            Occupation : <% out.print(u.getUserOccupation()); %>
                                        </p>                                           
                                    </div>
                                    <div class ="6u 12u">
                                        <p>
                                            Organisation/School : Singapore Managament University
                                        </p>                                           
                                    </div>
                                </div>

                                <div class ="row">
                                    <p>
                                        Interests : <% out.print(u.getUserInterest());%>
                                    </p>
                                </div>

                                <div class ="row">    
                                    <div class ="6u 12u">
                                        <p>
                                            Trips signed up for : Winter Trip to Myanmar
                                        </p>                                           
                                    </div>
                                </div>

                                <div class ="row">
                                    <p>
                                        Trips taken previously : -
                                    </p>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="button" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                        }
                    }
                %>





            </div>
        </section>

    </body>
</html>