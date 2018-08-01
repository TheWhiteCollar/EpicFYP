
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
        <noscript>
        <link rel="stylesheet" href="css/skel.css" />
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="css/style-xlarge.css" />
        </noscript>
        <!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->

        <!-- For user to choose if they want to login as student or admin -->
        <style>
            

            /* Style the tab */
            .tab {
                overflow: hidden;
                border: 1px solid #ccc;
                background-color: #f1f1f1;
            }

            /* Style the buttons inside the tab */
            .tab button {
                background-color: inherit;
                float: left;
                border: none;
                outline: none;
                cursor: pointer;
                padding: 14px 16px;
                transition: 0.3s;
                font-size: 17px;
            }

            /* Change background color of buttons on hover */
            .tab button:hover {
                background-color: #ddd;
            }

            /* Create an active/current tablink class */
            .tab button.active {
                background-color: #ccc;
            }

            /* Style the tab content */
            .tabcontent {
                display: none;
                padding: 6px 12px;
                border: 1px solid #ccc;
                border-top: none;
            }
        </style>

    </head>
    <body>

        <!-- Header -->
        <jsp:include page="header.jsp" />

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

                <!-- For user to choose if they want to login as student or admin -->
                <div class="tab">
                    <button class="tablinks" onclick="openCity(event, 'Admin')">Admin</button>
                    <button class="tablinks" onclick="openCity(event, 'Students')">Student</button>
                </div>

                <!-- For user to choose if they want to login as student or admin -->
                <div id="Admin" class="tabcontent">
                    <form action="LoginServlet_admin" method="post">
                        <input type="text" name="userid" placeholder="User Email">
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

                <!-- For user to choose if they want to login as student or admin -->
                <div id="Students" class="tabcontent">
                    <form action="LoginServlet_student" method="post">
                        <input type="text" name="userid" placeholder="User Email">
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
            </div>
        </section>

        <!-- Footer -->
        <jsp:include page="footer.jsp" />

        <!-- For user to choose if they want to login as student or admin -->
        <script>
            function openCity(evt, cityName) {
                var i, tabcontent, tablinks;
                tabcontent = document.getElementsByClassName("tabcontent");
                for (i = 0; i < tabcontent.length; i++) {
                    tabcontent[i].style.display = "none";
                }
                tablinks = document.getElementsByClassName("tablinks");
                for (i = 0; i < tablinks.length; i++) {
                    tablinks[i].className = tablinks[i].className.replace(" active", "");
                }
                document.getElementById(cityName).style.display = "block";
                evt.currentTarget.className += " active";
            }
        </script>

    </body>
</html>
