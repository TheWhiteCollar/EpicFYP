<%@page import="java.time.LocalDate"%>
<%@page import="java.time.Instant"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Dao.TripsDAO"%>
<%@page import="Model.Entity.Trip"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Epic Journey - Overseas study missions/internships for all</title>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta name="description" content="Imparting life skills through overseas exposure via internships and study missions. Countries of focus: Cambodia, Laos, Myanmar, Vietnam, India, Indonesia, Thailand, Japan and China." />
        <meta name="keywords" content="overseas, study missions, internships, training, life skills, career exposure" />
        <!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <script src="js/jquery.min.js"></script>
        <script src="js/skel.min.js"></script>
        <script src="js/skel-layers.min.js"></script>
        <script src="js/init.js"></script>
        <style>
            table, th, td {
                border: 1px solid black;
                width: 90px;
                text-align: center;
            } 
        </style>
        <script>
            $(function () {
                $.get('/EpicFYPApp/getAllTripsServlet', function (tripJson) {
                    var trips = JSON.parse(tripJson);
                    $("#trips").append("<table>");
                    $("#trips").append("<tr><th>Trip ID</th><th>Country</th><th>Cost</th><th>number of sign ups</th><th>activated</th><th></th></tr>");
                    $.each(trips, function (index, trip) {
                        var tripHTML = "<tr><td>" + trip.tripID + "</td><td>" + trip.country + "</td><td>$" + trip.price + "</td>";
                        tripHTML += "<td>" + trip.signedUpEmails.length + "</td>" + "<td>" + trip.activated + "</td>"
                        tripHTML += "<td><form action=\"applyForTrips\" method=\"post\">"
                        tripHTML += "<input style=\"display: none\" type=\"text\" name=\"tripID\" value=\"" + trip.tripID + "\"/>"
                        tripHTML += "<input style=\"display: none\" type=\"text\" name=\"email\" value=\"" + "${User.getUserEmail()}" + "\"/>"
                        tripHTML += "<input type=\"submit\" value=\"Apply\"/></form></td></tr>"
                        $("#trips").append(tripHTML);
                        console.log(trip);
                    });
                    $("#trips").append("</table>");
                });
            });

        </script>

        <noscript>
        <link rel="stylesheet" href="css/skel.css" />
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="css/style-xlarge.css" />
        </noscript> 
    </head>
    <body>
        <!-- Header -->
        <jsp:include page="header.jsp" />

        <!-- Filter -->
        <section id="main" class="wrapper">
            <div class="container">
                <header class="major">
                    <h2>Overseas Study Trips</h2>
                    <p>Let's Explore! Apply for your study trip here!</p>
                </header>

                <div class="tab">
                    <button class="tablinks" onclick="openUser(event, 'filter')">Click for more filtering options:</button>      
                </div>

                <div id="filter" class="tabcontentFade">
                    <span onclick="this.parentElement.style.display = 'none'" class="toprightClose">&times</span>

                    <form action="filterTrips.jsp" method="post" onsubmit="showLoader()">
                        <p>
                        <div class = "row">
                            <div class="3u 12u(small)">
                                <% LocalDate todayDate = java.time.LocalDate.now(); %>
                                Date From:                                                                        
                                <input name = "startDate" type="date" min = "<% out.print(todayDate); %>" >
                            </div>
                            <div class="3u 12u(small)">
                                Date To:                              
                                <input name = "endDate" type="date" min = "<% out.print(todayDate); %>" >
                            </div> 
                        </div>

                        </p>

                        <p>
                        <div class = "row">
                            <div class="2u 12u(small)">
                                Price (min):
                                <input type="number" value = "min" min = "0">
                            </div>
                            <div class="2u 12u(small)">
                                Price (max):
                                <input type="number" value = "max" min = "0"tes
                                       >
                            </div>
                            <div class="3u 12u(small)">
                                Ratings:
                                <select name="rating">
                                    <option value="null">- Rating -</option>
                                    <option value="bad" >Bad</option>
                                    <option value="average" >Average</option>
                                    <option value="excellent" >Excellent</option>
                                </select>
                            </div>
                            <div class="4u 12u(small)">
                                Programmes:
                                <select name="programmes" >
                                    <option value="null">- Programmes -</option>
                                    <option value="it" >IT</option>
                                    <option value="supplychain" >Supply Chain</option>
                                    <option value="leadership">Leadership</option>
                                </select>
                            </div>
                        </div>
                        </p>

                        <p>
                        <div class = "row">
                            <div class="1u 12u(small)">
                                Country:
                            </div>
                            <div class="2u 12u(small)">                                   
                                <input type="checkbox" id="Singapore" name="country" value="Singapore">
                                <label for="Singapore">Singapore</label>
                            </div>
                            <div class="2u 12u(small)">                                   
                                <input type="checkbox" id="Myanmar" name="country" value="Myanmar">
                                <label for="Myanmar">Myanmar</label>
                            </div>
                            <div class="2u 12u(small)">                                   
                                <input type="checkbox" id="China" name="country" value="China">
                                <label for="China">China</label>
                            </div>
                            <div class="2u 12u(small)">                                   
                                <input type="checkbox" id="Indonesia" name="country" value="Indonesia">
                                <label for="Indonesia">Indonesia</label>
                            </div>
                        </div>
                    </p>

                        <input type="submit" value="Apply" style="width:100%"> 
                    </form> 
                </div>
        </section>

        <!-- Overseas trip populates -->

        <section class="wrapper">
            <div id="trips"></div>  

            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-4">
                        <div class="card">
                            <img class="card-img-top" src="images/Germany.jpg" alt="Card image cap">
                            <div class="card-body">
                                <h5 class="card-title">Germany Trip</h5>
                                <p class="card-text">From the heights of the Alps to the depths of the Black Forest, find yourself lost in a fairy tale come to life.</p>
                                <a href="tripDetail.jsp" class="btn btn-primary">View Details</a>
                                <div><br><a href="submitTrip.jsp" class="button small">Apply for Trip</a></div>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-4">
                        <div class="card">
                            <img class="card-img-top" src="images/Spain.jpg" alt="Card image cap">
                            <div class="card-body">
                                <h5 class="card-title">Spain Trip</h5>
                                <p class="card-text">Fiestas and holy weeks cram the Spanish calendar year, so no matter when you go there’s an event going on somewhere.</p>
                                <a href="tripDetail.jsp" class="btn btn-primary">View Details</a>
                                <div><br><a href="submitTrip.jsp" class="button small">Apply for Trip</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="card">
                            <img class="card-img-top" src="images/Norway.jpg" alt="Card image cap">
                            <div class="card-body">
                                <h5 class="card-title">Norway Trip</h5>
                                <p class="card-text">Embrace the wild outdoors learn new skills and enjoy independence like no other trip</p>
                                <a href="tripDetail.jsp" class="btn btn-primary">View Details</a>
                                <div><br><a href="submitTrip.jsp" class="button small">Apply for Trip</a></div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>  
    </section>

    <<!-- Footer -->
    <jsp:include page="footer.jsp" />
    <script src="js/tabs.js"></script>
</body>
</html>