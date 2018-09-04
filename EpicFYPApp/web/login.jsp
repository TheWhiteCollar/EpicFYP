
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


                <!-- For user to choose if they want to login as student or admin -->
                <div class="tab">
                    <button class="tablinks" onclick="openUser(event, 'Students')" id="defaultOpen">User</button>
                </div>

                <div id="Students" class="tabcontent">
                    <p style="text-align:center; color: red">

                        <%
                            String Student_ErrorMsg = (String) request.getAttribute("Student_ErrorMsg");

                            if (Student_ErrorMsg != null) {
                                out.print(Student_ErrorMsg);
                            }
                        %>
                    </p>

                    <form action="LoginServlet_user" method="post">
                        <input type="text" name="userid" placeholder="- Enter User Email -" style="text-align:center">
                        <br>
                        <input type="password" name="userpassword" placeholder="- Enter User Password -" style="text-align:center">
                        <br>
                        <input type="submit" value="Login" style="width:100%">
                    </form> 
                    <p style="text-align:center">
                        <a href="forgetpassword.jsp">Forgot your password?</a><br /> 
                        <a href="signuppage.jsp">Click to sign up!</a>

                    </p>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <jsp:include page="footer.jsp" />

        <!-- For user to choose if they want to login as student or admin -->
        <script src="js/tabs.js"></script>
    </body>
</html>
