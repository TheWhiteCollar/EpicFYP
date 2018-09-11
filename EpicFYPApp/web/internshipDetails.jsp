<%@page import="Model.Entity.CountryInternship"%>
<%@page import="Model.Dao.CountryInternshipDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Date"%>
<%@page import="Model.Entity.Admin"%>
<%@page import="Model.Entity.User"%>
<%@page import="Model.Entity.User"%>
<%@page import="Model.Dao.TripsDAO"%>
<%@page import="Model.Entity.Trip"%>
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

    </head>
    <body>

        <!-- Header -->        
        <jsp:include page="header.jsp" />

        <!-- Main -->
        <section id="main" class="wrapper ">
            <div class="container">

                <%
                    // pass the trip ID over - by a session??
                    String contient = request.getParameter("cont");

                %>

                <header class="major align-center">
                    <h2>Internship in <%out.print(contient);%></h2>
                    <p>Step 2 : Fill up the form</p>
                </header>
                <div class="row 50% uniform">                       
                    </br>
                    <div class="8u">
                       Our partnering countries:
                       <table class="alt">
                           <thead>
                               <tr>
                                   <th class = "align-center">#</th>
                                    <th>Country Name</th>
                               </tr> 
                           </thead>
                           <%
                               ArrayList<CountryInternship> allAmericaCountries = CountryInternshipDAO.getAllCountryInternshipAmerica();
                               if (allAmericaCountries == null) {
                                //for (int i = 0; i < allAmericaCountries.size(); i++) {
                                   // CountryInternship ci = allAmericaCountries.get(i);
                                
                           %>
                           <tbody>
                               <tr>
                                   <td><%out.print("hello");%></td>
                               </tr>
                           </tbody>
                           <%
                            //}
}
                           %>
                       </table>
                    </div> 
                    <div class="4u"><span class="image fit"><img src="images/pic05.jpg" alt="" width="388px" height="254px"/></span></div>
                                    
                </div>
                    <p>
                        
                    </p>

            </div>
        </div>	

        <%

        %>
    </div>
</section>

    


<!-- Footer -->
<jsp:include page="footer.jsp" />



</body>
</html>