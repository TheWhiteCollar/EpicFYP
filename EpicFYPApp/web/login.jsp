
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
                    <button class="tablinks" onclick="openUser(event, 'Admin')">Admin</button>
                    <button class="tablinks" onclick="openUser(event, 'Students')" id="defaultOpen">Student</button>
                </div>


                <!-- For user to choose if they want to login as student or admin -->
                <div id="Admin" class="tabcontent">
                    <p style="text-align:center; color: red">
                        <%
                            String Admin_ErrorMsg = (String) request.getAttribute("Admin_ErrorMsg");

                            if (Admin_ErrorMsg != null) {
                                out.println(Admin_ErrorMsg);
                            }
                        %>
                    </p>

                    <form action="LoginServlet_admin" method="post">
                        <input type="text" name="userid" placeholder="- Enter Admin Email -" style="text-align:center">
                        <br>
                        <input type="password" name="password" placeholder="- Enter Admin Password -" style="text-align:center">
                        <br>
                        <input type="submit" value="Login" style="width:100%">                                                          
                    </form> 
                    <p style="text-align:center"><a href="forgetpassword.jsp">Forgot your password?</a></p>
                </div>

                <!-- For user to choose if they want to login as student or admin -->
                <div id="Students" class="tabcontent">
                    <p style="text-align:center; color: red">

                        <%
                            String Student_ErrorMsg = (String) request.getAttribute("Student_ErrorMsg");

                            if (Student_ErrorMsg != null) {
                                out.print(Student_ErrorMsg);
                            }

                            // to check if user come to login page straight or come from study trip
                            String comefrom = (String) request.getParameter("comefrom");
                        %>
                    </p>

                    <form action="LoginServlet_student" method="post">
                        <input type="text" name="userid" placeholder="- Enter Student Email -" style="text-align:center">
                        <br>
                        <input type="password" name="password" placeholder="- Enter Student Password -" style="text-align:center">
                        <br>
                        <%
                            // if user come from study trip, pass a hidden value of studyTrip to login servlet, so will send back to studyTrip instead of student portal
                            if (comefrom != null) { %>
                        <input type="hidden" name="comefrom" value="studyTrip" style="text-align:center">
                        <%
                            }
                        %>
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
