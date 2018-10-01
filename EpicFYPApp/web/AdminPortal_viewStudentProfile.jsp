<%@page import="java.text.DecimalFormat"%>
<%@page import="Model.Entity.Trip"%>
<%@page import="Model.Dao.TripsDAO"%>
<%@page import="Model.Dao.TripStudentDAO"%>
<%@page import="Model.Entity.TripStudent"%>
<%@page import="java.time.LocalDate"%>
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

<!--         Main 
        <section id="main" class="wrapper">
            <div class="container">

                    
                

                 To add filter button 

                <div class ="row uniform 50%">
                    <div class ="6u 12u(xsmall)">
                        <input id="searchBar" type="text" name="searchbar" placeholder="Search for student:"/>
                    </div>
                    <div class ="2u 12u(xsmall)">
                        <input type="submit">
                    </div>

                    <div class ="4u 12u(xsmall)">
                        <% //LocalDate todayDate = java.time.LocalDate.now(); %>
                        <form method="get" action="#">
                            <button type="submit" class="button">Download!</button>
                        </form>
                        <a href="/Users/xiuwenhime/NetBeansProjects/JavaApplication5/NewExcelFile.xls" download="<%// out.print(todayDate); %>_all_student_profile" class="button full_width">Download all student profiles</a>
                    </div>
                </div>
            </div>
        </section>-->
        <section class="wrapper">
            <div class="container">
                
                <h2 class="align-center">Students' Profiles</h2>
                
                
                <table class = "alt">
                    <thead>
                        <tr>
                            <th class = "align-center">#</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th class = "align-center">Contact</th>
                            <th class = "align-center">More information</th>

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
                            <td class = "align-center"><%out.print(count);%></td>
                            <td><% out.print(u.getUserFirstName() + " " + u.getUserLastName()); %></td>                      
                            <td><% out.print(u.getUserEmail()); %></td>
                            <td class = "align-center"><% out.print(u.getUserPhone()); %></td>
                            <td class = "align-center"><button type="button" class="button" data-toggle="modal" data-target="#myModal<%out.print(i);%>">View</button></td>
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
                            String name = u.getUserFirstName() + " " + u.getUserLastName();
                            String email = u.getUserEmail();

                %>
                <div class="modal fade" id="myModal<%out.print(i);%>" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title align-center"><b><% out.print(name); %></b></h4>
                            </div>
                            <div class="modal-body">           
                                <div class ="row">

                                    <div class ="4u 12u">
                                        <div align="center"><img src="https://image.flaticon.com/icons/png/512/149/149071.png" class = "avatar-image" alt ="avatar-image" height="80%" width="80%"></div>

                                        <table class="align-center">
                                            <tbody>
                                                <tr>
                                                    <td><b><% out.print(name); %></b></td>
                                                </tr>
                                                <tr>
                                                    <td><% out.print(u.getUserEmail()); %></td>
                                                </tr>
                                                <tr>
                                                    <td><% out.print(u.getUserPhone()); %></td>
                                                </tr>
                                            </tbody>
                                        </table>

                                    </div>
                                    <div class ="8u 12u">
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td class="align-right"><b>Year of birth </b></td>
                                                    <td><% out.print(u.getUserDOB()); %></td>
                                                </tr>
                                                <tr>
                                                    <td class="align-right"><b>Citizenship </b></td>
                                                    <td><% out.print(u.getUserCitizenship()); %></td>
                                                </tr>
                                                <tr>
                                                    <td class="align-right"><b>Highest Qualification</b></td>
                                                    <td><% out.print(u.getUserHighestEducation()); %></td>
                                                </tr>
                                                <tr>
                                                    <td class="align-right"><b>Occupation </b></td>
                                                    <td><% out.print(u.getUserOccupation()); %></td>
                                                </tr>
                                                <tr>
                                                    <td class="align-right"><b>Organisation/School </b></td>
                                                    <td><% out.print(u.getUserSchool()); %></td>
                                                </tr>
                                                <tr>
                                                    <td class="align-right"><b>Interests </b></td>
                                                    <td><% out.print(u.getUserInterest()); %></td>
                                                </tr>
                                            </tbody>

                                        </table>                                         
                                    </div>

                                </div>
                                <div class="row">
                                    <div class="12u 12u(small)">
                                        <h3 class="align-center"><b>Trips History</b></h3>

                                        <%

                                            ArrayList<TripStudent> t = TripStudentDAO.getTripsByUser(email);
                                            //if student has applied for trips previously
                                            if (!t.isEmpty()) {
                                                DecimalFormat df2 = new DecimalFormat("#.00");
                                        %>

                                        <table class="alt align-center">
                                            <thead>
                                                <tr>
                                                    <th class="align-center">Trip ID</th>
                                                    <th class="align-center">Trip Title</th>
                                                    <th class="align-center">Country</th>
                                                    <th class="align-center">Revenue</th>
                                                    <th class="align-center">Travel Period</th> 
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <%
                                                    for (int x = 0; x < t.size(); x++) {
                                                        TripStudent tripx = t.get(x);
                                                        Trip trip = TripsDAO.getTrip(tripx.getTripID());
                                                %>
                                                <tr>
                                                    <td><%out.print(trip.getTripID());%></td>
                                                    <td><%out.print(trip.getTripTitle());%></td>
                                                    <td><%out.print(trip.getTripCountry());%></td>
                                                    <td>$ <%out.print(df2.format(trip.getTripPrice()));%></td>
                                                    <td><%out.print(trip.getTripStart());%> <b>to</b> <%out.print(trip.getTripEnd());%></td>
                                                </tr>
                                                <%
                                                    }
                                                %>
                                            </tbody>
                                        </table>

                                        <%
                                        } else {
                                        %>
                                        <p class="align-center">This user has not taken any trips</p>
                                        <%
                                            }
                                        %>
                                    </div>
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