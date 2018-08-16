<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
//Scriplets with the boolean value for now
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Portal Main Page</title>
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
    <!-- make a scriplet for the landing -->

    <!-- If user is signed up to trips-->
    <%
        //need to include the trips/internship interest, shows differing sections
        boolean userSignedUpForTrip = true;
        if (userSignedUpForTrip) {
    %>
    <body >
        <!-- Header -->
        <jsp:include page="header.jsp" />


        <section class="wrapper">
            <div class ="container">
                <h3>Application Status</h3>
                insert the time line of payment here, and the view their trips?
               
            </div>
            
            
        </section>
        

        <!-- If user have not signed up -->
        <%
        } else {
        %>
    <body class = "landing">
        <!-- Header -->
        <jsp:include page="header.jsp" />

        <section id="banner">
            <h2>You are not signed up to any trips</span></h2>
            <ul class="actions">
                <li>
                    if picked the one then do it
                    <a href="studyTrip.jsp" class="button big"><font color="white">Look for an overseas trip</font></a>
                    <a href="internship.jsp" class="button big"><font color="white">Look for an overseas internship</font></a>
                
                </li>
            </ul>
        </section>
        <%
            }
        %>



        <!-- Trip Customisation: only show if they click study trip -->
        <section id="trip_ustomisation" class="wrapper style1 align-center">
            <div class="container">
                <header>
                    <h2>Trip Customisation</h2>
                    <p>Design your dream trip, and it might just become reality</p>
                </header>
                <div class="row 200%">
                    <section class="4u 12u(small)">
                        <i class="icon big rounded fa-map-marker"></i>
                        <p>Tell us the places you would like to visit</p>
                    </section>
                    <section class="4u 12u(small)">
                        <i class="icon big rounded fa-check-square-o"></i>
                        <p>Pick an overseas programme (internship/study trip) of your choice</p>
                    </section>
                    <section class="4u 12u(small)">
                        <i class="icon big rounded fa-user"></i>
                        <p>Get friends to activate trip</p>
                    </section>
                    <!-- click button to customisation-->
                </div>
            </div>
        </section>

        <!-- Trip Recommendations based on interest: only show if they click study trip -->
        <section id="trip_recommendation" class="wrapper align-center">
            <!-- a carousell?-->
        </section>

    </body>
</html>
