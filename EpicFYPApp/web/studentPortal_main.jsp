<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
    <body class ="landing">
        <!-- Header -->
        <jsp:include page="header.jsp" />

        <!-- If user have not signed up -->
        <section id="banner" >

            <h2>You are not signed up to any trips</span></h2>
            <ul class="actions">
                <li>
                    <a href="studyTrip.jsp" class="button big"><font color="white">Look for an overseas trip</font></a>
                    <a href="internship.jsp" class="button big"><font color="white">Look for an overseas internship</font></a>
                </li>
            </ul>

        </section>
        
        <!-- If user have signed up for a trip -->
        
        <!-- Trip Customisation -->
        <section id="customisation" class="wrapper align-center">
            
        </section>
        
        <!-- Trip Recommendations based on interest -->
        <section id="recommendation" class="wrapper align-center">
            
        </section>

    </body>
</html>
