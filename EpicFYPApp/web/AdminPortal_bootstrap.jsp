<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    /*
    Things undone:
    - Edit button
    - neaten up the javascript files
    -
    
     */
%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Epic Journey - Admin Bulk Uploading</title>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta name="description" content="Imparting life skills through overseas exposure via internships and study missions. Countries of focus: Cambodia, Laos, Myanmar, Vietnam, India, Indonesia, Thailand, Japan and China." />
        <meta name="keywords" content="overseas, study missions, internships, training, life skills, career exposure" />
        <!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/animate.css@3.5.2/animate.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap-notify.min.js"></script>
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
        <jsp:include page="header.jsp" />

        <!-- Main -->
        <section id="main" class="wrapper">

            <div class="container">

                <h1>Upload files here for bulk updates to database</h1>

                <form action="AdminBootstrapServlet" method="post" enctype="multipart/form-data">

                    Update trips: <input type="file" name="updateTrips" id="updateTrips" accept=".csv*"><br>
                    Update Users: <input type="file" name="updateUsers" accept=".csv*"><br>
                    Update trips users signed up for: <input type="file" name="updateTripsUsersSignedUpFor" accept=".csv*"><br>

                    <input type="submit">

                </form>
                
            </div>

        </section>

        <script src="js/custom-file-input.js"></script>
        <script src="js/tabs.js"></script>
    </body>
</html>