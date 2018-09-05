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

    <body >
        <!-- Header -->
        <jsp:include page="header.jsp" />


        <section class="wrapper">
            <div class ="container">            
                <header class="major">
                    <h2>Trip Customisation</h2>
                    <p>Note: Approval of trip will take approximately 5 working days</p>
                </header>
                <div class="container">
                    <header>
                        <h3 class="align-center">Step 1 : </h3>
                    </header>

                    <div class="signup-tab">
                        <div align="center"> 
                            <p>Which country do you want your Study Trip to be in?</p>

                            <select name="customised_country" style="max-width:50%">
                                <option disabled selected value style="display:none"> - select a country - </option>
                                <%
                                        //get from countryDAO
%>
                                <option value="countryName" >country</option>
                                <%%>
                            </select>


                        </div>
                    </div>

                </div>
            </div>
        </section>
    </body>

</html>
