<%@page import="Model.Entity.CountryInternship"%>
<%@page import="Model.Dao.CountryInternshipDAO"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Epic Journey - Admin View Partner internship applications</title>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta name="description" content="Imparting life skills through overseas exposure via internships and study missions. Countries of focus: Cambodia, Laos, Myanmar, Vietnam, India, Indonesia, Thailand, Japan and China." />
        <meta name="keywords" content="overseas, study missions, internships, training, life skills, career exposure" />
        <!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/animate.css@3.5.2/animate.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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

        <section id="main" class="wrapper">
            <div class="container">
                <h2 class="align-center">Partner Internship Applications</h2>

                <!--tabs-->
                <div class="tab align-center">
                    <button class="tablinks" onclick="openUser(event, 'america')">America</button>
                    <button class="tablinks" onclick="openUser(event, 'asia')" id="defaultOpen">Asia</button>
                    <button class="tablinks" onclick="openUser(event, 'australia')">Australia</button>
                    <button class="tablinks" onclick="openUser(event, 'europe')">Europe</button>
                    <button class="tablinks" onclick="openUser(event, 'addCountry')">Add a country</button>
                </div>

                <!--tabs' content 1.america 2.asia 3.australia 4.europe 5.addCountry-->
                <div id="america" class="tabcontent">
                    <span onclick="this.parentElement.style.display = 'none'" class="toprightClose">&times</span>
                    <div class="row">
                        <div class="12u 12u(xsmall)">
                            <table class="alt align-center">
                                <thead>
                                    <tr>
                                        <td>#</td>
                                        <td>Country</td>
                                        <td>Continent</td>
                                        <td>More Actions</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        ArrayList<CountryInternship> allAmericaCountries = CountryInternshipDAO.getAllCountryInternship("America");
                                        int countAmerica = 0;
                                        if (allAmericaCountries != null) {
                                            for (int i = 0; i < allAmericaCountries.size(); i++) {
                                                CountryInternship ci = allAmericaCountries.get(i);
                                                countAmerica += 1;
                                    %>
                                    <tr>
                                        <td class = "align-center"><%out.print(countAmerica);%></td>
                                        <td><%out.print(ci.getCountryName());%></td>
                                        <td><%out.print(ci.getCountryContinent());%></td>
                                        <td><button type="button" class="button" data-toggle="modal" data-target="#myModalAmericaDelete<%out.print(i);%>">Delete</button></td>
                                    </tr>

                                    <%
                                            }
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>

                <div id="asia" class="tabcontent">
                    <span onclick="this.parentElement.style.display = 'none'" class="toprightClose">&times</span>
                    <div class="row">
                        <div class="12u 12u(xsmall)">
                            <table class="alt align-center">
                                <thead>
                                    <tr>
                                        <td>#</td>
                                        <td>Country</td>
                                        <td>Continent</td>
                                        <td>More Actions</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        ArrayList<CountryInternship> allAsiaCountries = CountryInternshipDAO.getAllCountryInternship("Asia");
                                        int countAsia = 0;
                                        if (allAsiaCountries != null) {
                                            for (int i = 0; i < allAsiaCountries.size(); i++) {
                                                CountryInternship ci = allAsiaCountries.get(i);
                                                countAsia += 1;
                                    %>
                                    <tr>
                                        <td class = "align-center"><%out.print(countAsia);%></td>
                                        <td><%out.print(ci.getCountryName());%></td>
                                        <td><%out.print(ci.getCountryContinent());%></td>
                                        <td><button type="button" class="button" data-toggle="modal" data-target="#myModalAsiaDelete<%out.print(i);%>">Delete</button></td>
                                    </tr>

                                    <%
                                            }
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div id="australia" class="tabcontent">
                    <span onclick="this.parentElement.style.display = 'none'" class="toprightClose">&times</span>
                    <div class="row">
                        <div class="12u 12u(xsmall)">
                            <table class="alt align-center">
                                <thead>
                                    <tr>
                                        <td>#</td>
                                        <td>Country</td>
                                        <td>Continent</td>
                                        <td>More Actions</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        ArrayList<CountryInternship> allAustraliaCountries = CountryInternshipDAO.getAllCountryInternship("Australia");
                                        int countAustralia = 0;
                                        if (allAustraliaCountries != null) {
                                            for (int i = 0; i < allAustraliaCountries.size(); i++) {
                                                CountryInternship ci = allAustraliaCountries.get(i);
                                                countAustralia += 1;
                                    %>
                                    <tr>
                                        <td class = "align-center"><%out.print(countAustralia);%></td>
                                        <td><%out.print(ci.getCountryName());%></td>
                                        <td><%out.print(ci.getCountryContinent());%></td>
                                        <td><button type="button" class="button" data-toggle="modal" data-target="#myModalAustraliaDelete<%out.print(i);%>">Delete</button></td>
                                    </tr>

                                    <%
                                            }
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div id="europe" class="tabcontent">
                    <span onclick="this.parentElement.style.display = 'none'" class="toprightClose">&times</span>
                    <div class="row">
                        <div class="12u 12u(xsmall)">
                            <table class="alt align-center">
                                <thead>
                                    <tr>
                                        <td>#</td>
                                        <td>Country</td>
                                        <td>Continent</td>
                                        <td>More Actions</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        ArrayList<CountryInternship> allEuropeCountries = CountryInternshipDAO.getAllCountryInternship("Europe");
                                        int countEurope = 0;
                                        if (allEuropeCountries != null) {
                                            for (int i = 0; i < allEuropeCountries.size(); i++) {
                                                CountryInternship ci = allEuropeCountries.get(i);
                                                countEurope += 1;
                                    %>
                                    <tr>
                                        <td class = "align-center"><%out.print(countEurope);%></td>
                                        <td><%out.print(ci.getCountryName());%></td>
                                        <td><%out.print(ci.getCountryContinent());%></td>
                                        <td><button type="button" class="button" data-toggle="modal" data-target="#myModalEuropeDelete<%out.print(i);%>">Delete</button></td>
                                    </tr>

                                    <%
                                            }
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div id="addCountry" class="tabcontent">
                    <span onclick="this.parentElement.style.display = 'none'" class="toprightClose">&times</span>
                    <div class="row">
                        <div class="12u 12u(xsmall)">
                            <table>
                                <tr>
                                    <td class="align-right">Country Name</td>
                                    <td><input type ="text" name ="countryName" placeholder ="Country Name *" style="width:200px;"/></td>
                                </tr>
                                <tr>
                                    <td class="align-right">Country Continent</td>
                                    <td><input type ="text" name ="countryContinent" placeholder ="Country Continent *" style="width:200px;"/></td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="align-center"><input type="submit" value="Submit" ></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div> 


                <!--modal box content: 1.america 2.asia 3.australia 4.europe-->
                <%
                    if (!allAmericaCountries.isEmpty()) {
                        for (int i = 0; i < allAmericaCountries.size(); i++) {
                            CountryInternship ci = allAmericaCountries.get(i);

                %>
                <div class="modal fade" id="myModalAmericaDelete<%out.print(i);%>" role="dialog" style="top:20%;">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title align-center"><b>Delete Confirmation</b></h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="12u 12u">
                                        <p class="align-center">Are you sure you want to delete <b><%out.print(ci.getCountryName());%>, <%out.print(ci.getCountryContinent());%></b></p>                                        
                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="button" >Confirm Delete</button>
                                    <button type="button" class="button" data-dismiss="modal">Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                        }
                    }
                %>

                <%
                    if (!allAsiaCountries.isEmpty()) {
                        for (int i = 0; i < allAsiaCountries.size(); i++) {
                            CountryInternship ci = allAsiaCountries.get(i);

                %>
                <div class="modal fade" id="myModalAsiaDelete<%out.print(i);%>" role="dialog" style="top:20%;">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title align-center"><b>Delete Confirmation</b></h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="12u 12u">
                                        <p class="align-center">Are you sure you want to delete <b><%out.print(ci.getCountryName());%>, <%out.print(ci.getCountryContinent());%></b></p>                                        
                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="button" >Confirm Delete</button>
                                    <button type="button" class="button" data-dismiss="modal">Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                        }
                    }
                %>

                <%
                    if (!allAustraliaCountries.isEmpty()) {
                        for (int i = 0; i < allAustraliaCountries.size(); i++) {
                            CountryInternship ci = allAustraliaCountries.get(i);

                %>
                <div class="modal fade" id="myModalAustraliaDelete<%out.print(i);%>" role="dialog" style="top:20%;">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title align-center"><b>Delete Confirmation</b></h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="12u 12u">
                                        <p class="align-center">Are you sure you want to delete <b><%out.print(ci.getCountryName());%>, <%out.print(ci.getCountryContinent());%></b></p>                                        
                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="button" >Confirm Delete</button>
                                    <button type="button" class="button" data-dismiss="modal">Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                        }
                    }
                %>

                <%
                    if (!allEuropeCountries.isEmpty()) {
                        for (int i = 0; i < allEuropeCountries.size(); i++) {
                            CountryInternship ci = allEuropeCountries.get(i);

                %>
                <div class="modal fade" id="myModalEuropeDelete<%out.print(i);%>" role="dialog" style="top:20%;">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title align-center"><b>Delete Confirmation</b></h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="12u 12u">
                                        <p class="align-center">Are you sure you want to delete <b><%out.print(ci.getCountryName());%>, <%out.print(ci.getCountryContinent());%></b></p>                                        
                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="button" >Confirm Delete</button>
                                    <button type="button" class="button" data-dismiss="modal">Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                        }
                    }
                %>



            </div>
        </section>
    </body>
    <script src="js/tabs.js"></script>
</html>