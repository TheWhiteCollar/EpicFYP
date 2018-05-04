
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Epic- Overseas study missions/internships for all</title>
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
        <header id="header">
            <a href="index.jsp"><img src="images/icon.png" srcset="images/icon.png 1000w, images/icon.png 2000w" alt="Epic Journey"></a>

            <nav id="nav">
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="aboutUs.jsp">About Us</a></li>
                    <li><a href="studyTrip.jsp">Overseas Study Trips</a></li>
                    <li><a href="internship.jsp">Overseas Internships</a></li>						
                    <li><a href="partnerWithUs.jsp">Partner With Us</a></li>
                    <li><a href="login.jsp">Log In</a></li>
                </ul>
            </nav>
        </header>

        <!-- Main -->
        <section id="login" class="wrapper">
            <div class="container">

                <header class="major">
                    <h2>Login to Epic</h2>
                </header>                                       
                <%
                    String ErrorMsg = (String) request.getAttribute("ErrorMsg");
                    if (ErrorMsg != null) {
                        out.println(ErrorMsg);
                    }
                %>

                <form action="loginServlet" method="post">
                    <input type="text" name="userid" placeholder="User ID">
                    <br>
                    <input type="password" name="password" placeholder="Password">
                    <br>
                    <input type="submit" value="Login">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    Not yet a user? <a href="signuppage.jsp">Sign up for an account!</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="forgetpassword.jsp">Forget your password?</a>
                </form> 

            </div>
        </section>

        <!-- Footer -->
        <footer id="footer">
            <div class="container">
                <div class="row">
                    <section class="4u 6u(medium) 12u$(small)">
                        <h3>Programmes we offer</h3>
                        <p>Interested in having a customised trip for a group of people? Just drop us an email, and we can work something out!</p>
                        <ul class="alt">
                            <li><a href="studyTrip.jsp">Overseas Study Trips</a></li>
                            <li><a href="internship.jsp">Overseas Internships</a></li>							
                        </ul>
                    </section>
                    <section class="4u 6u$(medium) 12u$(small)">
                        <h3>About Us</h3>
                        <ul class="alt">
                            <!-- <a href="http://url.to.site/index.html#target">Link</a>-->
                            <li><a href="aboutUs.jsp#main">Our Founders</a></li>
                            <li><a href="aboutUs.jsp#vision">Our Vision</a></li>
                            <li><a href="aboutUs.jsp#value">Our Value Proposition</a></li>
                            <li><a href="aboutUs.jsp#corporate">Partner With Us</a></li>
                        </ul>
                    </section>
                    <section class="4u$ 12u$(medium) 12u$(small)">
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
