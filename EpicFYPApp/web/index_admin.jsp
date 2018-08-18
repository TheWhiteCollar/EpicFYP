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
        <title>Epic Journey - Admin Index</title>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta name="description" content="Imparting life skills through overseas exposure via internships and study missions. Countries of focus: Cambodia, Laos, Myanmar, Vietnam, India, Indonesia, Thailand, Japan and China." />
        <meta name="keywords" content="overseas, study missions, internships, training, life skills, career exposure" />
        <!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->

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

        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {
        'packages':['geochart'],
        // Note: you will need to get a mapsApiKey for your project.
        // See: https://developers.google.com/chart/interactive/docs/basic_load_libs#load-settings
        'mapsApiKey': 'AIzaSyD-9tSrke72PouQMnMX-a7eZSW0jkFMBWY'
      });
      google.charts.setOnLoadCallback(drawRegionsMap);

      function drawRegionsMap() {
        var data = google.visualization.arrayToDataTable([
          ['Country', 'Popularity'],
          ['China', 200],
          ['Malaysia', 300],
          ['Myanmar', 400],
          ['South Korea', 600],
          ['Russia', 400],
         
        ]);

        var options = {};

        var chart = new google.visualization.GeoChart(document.getElementById('regions_div'));

        chart.draw(data, options);
      }
    </script>
        
        <!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
    </head>
    <body>

        <!-- Header -->
        <jsp:include page="header.jsp" />

        <!-- Main -->
        <section id="admin_dashboard" class="container wrapper">

            <header class="major align-center">
                <h2>Admin Dashboard</h2>					
            </header>

            <div class ="row">
                <div class ="6u 12u(small)">
                    <div class = "grid-wrapper1">
                        <h3 class = "align-center">Overseas Study Trips</h3>
                        <table class = "align-center">
                            <thead>
                                <tr >
                                    <th class = "align-center">Listed trips</th>
                                    <th class = "align-center">Activated trips</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>5</td>
                                    <td>6</td>
                                </tr>
                            </tbody>
                        </table>
                        <p><a href=#"" class = "button" style="width:100%">Approve customised trips (#)</a></p>
                        <p><a href=#"" class = "button" style="width:100%">View/Manage all trips</a></p>

                    </div>
                </div>
                <div class ="6u 12u(small)">
                    <div class = "grid-wrapper2">
                        <h3 class = "align-center">Overseas Internships</h3>
                        <table class = "align-center">
                            <thead>
                                <tr >
                                    <th class = "align-center">Listed jobs</th>
                                    <th class = "align-center">Expired jobs</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>5</td>
                                    <td>6</td>
                                </tr>
                            </tbody>
                        </table>
                        <p><a href=#"" class = "button" style="width:100%; background-color: #66b3ff;">Approve match suggestion (#)</a></p>
                        <p><a href=#"" class = "button" style="width:100% ; background-color: #66b3ff;">View/Manage all jobs</a></p>
                    </div>
                </div>
            </div>
        </section>
        
        <section id="admin_graphs" class="container wrapper">
            <header class="major align-center">
                <h2>Site Analytics</h2>					
            </header>
            
            <h3 class = "align-center">Popular Country Destinations</h3>
            <div id="regions_div" style="width: 900px; height: 500px;"></div>
    </body>
</html>