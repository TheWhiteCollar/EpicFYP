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
        <script src="js/jquery.min.js"></script>
        <script src="js/skel.min.js"></script>
        <script src="js/skel-layers.min.js"></script>
        <script src="js/init.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <style>
            table, th, td {
                border: 1px solid black;
                width: 90px;
                text-align: center;
            } 
        </style>
        <script>
            $(function() {
                $.get('/Testing/getAllTripsServlet', function(tripJson) {
                    var trips = JSON.parse(tripJson);
                    $( "#trips" ).append( "<table>" );
                    $( "#trips" ).append( "<tr><th>Trip ID</th><th>Country</th><th>Cost</th><th>number of sign ups</th><th>activated</th><th></th></tr>" );
                    $.each(trips, function(index, trip) {
                        var tripHTML = "<tr><td>" + trip.tripID + "</td><td>" + trip.country + "</td><td>$" + trip.price + "</td>";
                        tripHTML += "<td>" + trip.signedUpEmails.length + "</td>" + "<td>" + trip.activated + "</td>"
                        tripHTML += "<td><form action=\"applyForTrips\" method=\"post\">"
                        tripHTML += "<input style=\"display: none\" type=\"text\" name=\"tripID\" value=\"" + trip.tripID + "\"/>"
                        tripHTML += "<input style=\"display: none\" type=\"text\" name=\"email\" value=\"" + "${User.getUserEmail()}" + "\"/>"
                        tripHTML += "<input type=\"submit\" value=\"Apply\"/></form></td></tr>"
                        $( "#trips" ).append(tripHTML);
                        console.log(trip);
                    });
                    $( "#trips" ).append( "</table>" );
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
 
        <!-- Main -->
        <section id="main" class="wrapper">
            <div class="container">
                <header class="major">
                    <h2>Overseas Study Trips</h2>
                    <p>Let's Explore! Apply for your study trip here!</p>
                </header>
                <div id="content">
            <h1>Filter By </h1>
            <%                String datetime = (String) request.getAttribute("inputdatetime");
            %>
            <form action="applyForTrips" method="post" onsubmit="showLoader()">
                <label for="specialQuery">Date From:&nbsp;&nbsp;&nbsp;&nbsp;
                <input id="specialQuery" type="datetime-local" name="datetime" step=1 value = <%= (datetime != null) ? datetime : ""%>>
                &nbsp;&nbsp;&nbsp;&nbsp;Date To:&nbsp;&nbsp;&nbsp;&nbsp;
                <input id="specialQuery" type="datetime-local" name="datetime" step=1 value = <%= (datetime != null) ? datetime : ""%>></label><br/>
                Country:
                <select name="category1">
                    <option value=null >--Choose Country--</option>
                    <option value="gender" >Australia</option>
                    <option value="school" >USA</option>
                    <option value="year" >UK</option>
                </select>
                Price:
                <select name="category2">
                    <option value=null >--Price Range--</option>
                    <option value="gender" >1000-2000</option>
                    <option value="school" >2000-3000</option>
                    <option value="year">3000 and above</option>
                </select>
                Ratings:
                <select name="category3">
                    <option value=null >--Rating--</option>
                    <option value="gender" >Bad</option>
                    <option value="school" >Average</option>
                    <option value="year" >Excellent</option>
                </select>
                Programmes:
                <select name="category4">
                    <option value=null >--Programmes--</option>
                    <option value="gender" >IT</option>
                    <option value="school" >Supply Chain</option>
                    <option value="year">Leadership</option>
                </select>
                <br/>
                <input type="submit" value="Apply Filters!">                    
                </form> 
            </div>
                <div id="trips"></div>
         <div>Ongoing Trips</div><br>     
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
        
        <div class="col-sm-4">
            <div class="card">
            <img class="card-img-top" src="images/Belgium.jpg" alt="Card image cap">
            <div class="card-body">
            <h5 class="card-title">Belgium</h5>
            <p class="card-text">Discover the illusions of physics at Scientastic, or learn about the natural world at the Royal Belgian Institute.</p>
            <a href="tripDetail.jsp" class="btn btn-primary">View Details</a>
            <div><br><a href="submitTrip.jsp" class="button small">Apply for Trip</a></div>
            </div>
            </div>
        </div>

        <div class="col-sm-4">
            <div class="card">
            <img class="card-img-top" src="images/Glasgow.jpg" alt="Card image cap">
            <div class="card-body">
            <h5 class="card-title">Glasgow</h5>
            <p class="card-text">Conservation, photography, biology and cultural awareness are just a few of the topics available to study.</p>
            <a href="tripDetail.jsp" class="btn btn-primary">View Details</a>
            <div><br><a href="submitTrip.jsp" class="button small">Apply for Trip</a></div>
            </div>
            </div>
        </div>

        <div class="col-sm-4">
            <div class="card">
            <img class="card-img-top" src="images/Greece.jpg" alt="Card image cap">
            <div class="card-body">
            <h5 class="card-title">Greece</h5>
            <p class="card-text">Picture yourself living in a place that has teetered with life for thousands and thousands of years.</p>
            <a href="tripDetail.jsp" class="btn btn-primary">View Details</a>
            <div><br><a href="submitTrip.jsp" class="button small">Apply for Trip</a></div>
            </div>
            </div>
        </div>

        </div>
    </div>
</div>                
        </section>

        
        <!-- Footer -->
        <footer id="footer">
            <div class="container">
                <div class="row">
                    <section class="4u 6u(medium) 12u(small)">
                        <h3>Programmes we offer</h3>
                        <p>Interested in having a customised trip for a group of people? Just drop us an email, and we can work something out!</p>
                        <ul class="alt">
                            <li><a href="studyTrip.jsp">Overseas Study Trips</a></li>
                            <li><a href="internship.jsp">Overseas Internships</a></li>							
                        </ul>
                    </section>
                    <section class="4u 6u(medium) 12u(small)">
                        <h3>About Us</h3>
                        <ul class="alt">
                            <!-- <a href="http://url.to.site/index.html#target">Link</a>-->
                            <li><a href="aboutUs.jsp#main">Our Founders</a></li>
                            <li><a href="aboutUs.jsp#vision">Our Vision</a></li>
                            <li><a href="aboutUs.jsp#value">Our Value Proposition</a></li>
                            <li><a href="aboutUs.jsp#corporate">Partner With Us</a></li>

                        </ul>
                    </section>
                    <section class="4u 12u(medium) 12u(small)">
                        <h3>Contact Us</h3>
                        <!--
                        <ul class="icons">
                                <li><a href="#" class="icon rounded fa-twitter"><span class="label">Twitter</span></a></li>
                                <li><a href="#" class="icon rounded fa-facebook"><span class="label">Facebook</span></a></li>
                                <li><a href="#" class="icon rounded fa-pinterest"><span class="label">Pinterest</span></a></li>
                                <li><a href="#" class="icon rounded fa-google-plus"><span class="label">Google+</span></a></li>
                                <li><a href="#" class="icon rounded fa-linkedin"><span class="label">LinkedIn</span></a></li>
                        </ul>
                        -->
                        <ul class="alt">
                            <li>
                                <h3>Hot-desking Address</h3>
                                The Hangar by NUS Enterprise,<br>
                                21 Heng Mui Keng Terrace,<br>
                                #01-01/02 NUS, S119613
                            </li>
                            <li>
                                <h3>Mail</h3>
                                <a href="mailto:someone@example.com?Subject=Enquiries%20regarding%20Epic%20Journey">isabelle@epicjourney.sg</a>
                            </li>
                            <li>
                                <h3>Mailing Address</h3>
                                22 Sin Ming Lane #06-76,<br>
                                Midview City,<br>
                                Singapore 573969
                            </li>
                        </ul>
                    </section>
                </div>
                <!--
                <ul class="copyright">
                        <li>&copy; Untitled. All rights reserved.</li>
                        <li>Design: <a href="http://templated.co">TEMPLATED</a></li>
                        <li>Images: <a href="http://unsplash.com">Unsplash</a></li>
                </ul>
                -->
            </div>
        </footer>

    </body>
</html>