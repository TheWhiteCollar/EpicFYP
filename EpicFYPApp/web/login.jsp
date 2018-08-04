
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

                <!-- For user to choose if they want to login as student or admin -->
                <div class="tab">
                    <button class="tablinks" onclick="openUser(event, 'Admin')">Admin</button>
                    <button class="tablinks" onclick="openUser(event, 'Students')" id="defaultOpen">Student</button>
                </div>
                <div class = "outsidetab">
                     
                        <%
                            String ErrorMsg = (String) request.getAttribute("ErrorMsg");
                            if (ErrorMsg != null) {
                                out.println(ErrorMsg);
                            }
                        %>
                    
                </div>

                <!-- For user to choose if they want to login as student or admin -->
                <div id="Admin" class="tabcontent">
                    <form action="LoginServlet_admin" method="post">
                        <input type="text" name="userid" placeholder="Admin Email">
                        <br>
                        <input type="password" name="password" placeholder="Admin Password">
                        <br>
                        <input type="submit" value="Login">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="forgetpassword.jsp">Forgot your password?</a>                    
                    </form> 
                </div>

                <!-- For user to choose if they want to login as student or admin -->
                <div id="Students" class="tabcontent">
                    <form action="LoginServlet_student" method="post">
                        <input type="text" name="userid" placeholder="Student Email">
                        <br>
                        <input type="password" name="password" placeholder="Student Password">
                        <br>
                        <input type="submit" value="Login">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        Not yet a user? <a href="signuppage.jsp">Click to sign up!</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="forgetpassword.jsp">Forgot your password?</a>                    
                    </form> 

                </div>
            </div>
        </section>

        <!-- Footer -->
        <jsp:include page="footer.jsp" />

        <!-- For user to choose if they want to login as student or admin -->
        <script>
            function openUser(evt, userName) {
                var i, tabcontent, tablinks;
                tabcontent = document.getElementsByClassName("tabcontent");
                for (i = 0; i < tabcontent.length; i++) {
                    tabcontent[i].style.display = "none";
                }
                tablinks = document.getElementsByClassName("tablinks");
                for (i = 0; i < tablinks.length; i++) {
                    tablinks[i].className = tablinks[i].className.replace(" active", "");
                }
                document.getElementById(userName).style.display = "block";
                evt.currentTarget.className += " active";
            }
            document.getElementById("defaultOpen").click();
        </script>

    </body>
</html>
