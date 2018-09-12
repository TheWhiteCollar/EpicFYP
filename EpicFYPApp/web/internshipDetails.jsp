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
                    <h2>Overseas Internship in <%out.print(contient);%></h2>

                </header>
                <div class="row 50% uniform">                       
                    </br>
                    <div class="5u 12u(xsmall))">
                        <h3 class="align-center">Our partnering country/countries:</h3>
                        <table>
                            <thead>
                                <tr>
                                    <th class = "align-center">#</th>
                                    <th>Country Name</th>
                                </tr> 
                            </thead>
                            <tbody>
                                <%
                                    ArrayList<CountryInternship> allCountries = CountryInternshipDAO.getAllCountryInternship(contient);
                                    int count = 0;
                                    if (allCountries != null) {
                                        for (int i = 0; i < allCountries.size(); i++) {
                                            CountryInternship ci = allCountries.get(i);
                                            count += 1;

                                %>

                                <tr>
                                    <td class="align-center"><%out.print(count);%></td>
                                    <td><%out.print(ci.getCountryName());%></td>
                                </tr>

                                <%
                                        }
                                    }

                                %>
                            </tbody>
                        </table>
                    </div> 
                    <div class="7u 12u(xsmall)">
                        <%                            User User = (User) session.getAttribute("User");
                            if (User != null) {
                                String email = User.getUserEmail();
                                String password = User.getUserPassword();
                                String firstName = User.getUserFirstName();
                                String lastName = User.getUserLastName();
                                String occupation = User.getUserOccupation();
                                int phone = User.getUserPhone();
                                String gender = User.getUserGender();
                                String citizenship = User.getUserCitizenship();
                                String interest = User.getUserInterest();
                        %>
                        <h3 class="align-center">Step 2 : Fill up the form</h3>
                        <div align="center"><p>Note: These fields will be used by the system to track your application process</p></div>

                        <form>
                            <div class="12u 12u(xsmall)">
                                <div class="table-wrapper">


                                    <table class="blank">

                                        <tbody>
                                            <tr>
                                                <td>User email:</td>
                                                <td><% out.print(email);%> </td>
                                            </tr>
                                            <tr>
                                                <td>Password:</td>
                                                <td><input type ="password" name ="password" value =" <% out.print(password);%>"/> </td>
                                            </tr>
                                            <tr>
                                                <td>First Name:</td>
                                                <td><input type ="text" name ="firstName" value =" <% out.print(firstName);%>"/> </td>
                                            </tr>

                                            <tr>
                                                <td>Last Name:</td>
                                                <td><input type ="text" name ="lastName" value =" <% out.print(lastName);%>"/></td>
                                            </tr>
                                            <tr>
                                                <td>Occupation:</td>
                                                <td><input type ="text" name ="lastName" value =" <%out.print(occupation);%>"/></td>
                                            </tr>
                                            <tr>
                                                <td>Phone number:</td>
                                                <td><input type ="text" name ="phone" value =" <%out.print(phone);%>"/></td>
                                            </tr>
                                            <tr>
                                                <td>Gender:</td>
                                                <td><select name ="gender">
                                                        <%
                                                            if (gender.equals("F")) {
                                                        %>
                                                        <option value =" <% out.print(gender);%>"/><%out.print(gender);%></option>
                                                        <option value ="Male"/>Male</option>
                                                        <%
                                                            }
                                                            if (gender.equals("M")) {
                                                        %>
                                                        <option value ="<% out.print(gender);%>"/><%out.print(gender);%></option>
                                                        <option value ="Female"/>Female</option>                                                        
                                                        <%
                                                            }
                                                        %>

                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Citizenship:</td>
                                                <td>
                                                    <select name ="citizenship">
                                                        <option value ="<% out.print(citizenship);%>"/><% out.print(citizenship);%></option>
                                                        <option value="S">Singaporean</option>
                                                        <option value="PR">Singapore PR</option>
                                                    </select>


                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Interest:</td>
                                                <td><input type ="text" name ="interest" value =" <% out.print(interest);%>"/></td>
                                            </tr>
                                            <tr>
                                                <td>Upload Resume:</td>
                                                <td><input type="file" name="uploadedfile" id="file-1" class="inputfile inputfile-1" accept=".pdf, .doc, .docx"/>
                                                    <label for="file-1"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg> 
                                                        <span>Upload Resume</span>
                                                    </label> 
                                                </td>
                                            </tr>

                                        </tbody>


                                    </table>

                                    <br>
                                    <input type="submit" value="Submit" class="full_width">
                                </div>
                            </div>

                        </form>
                    </div>

                </div>


            </div>


            <%
            } else {
            %>
            <h3 class="align-center">Log in/Sign up to register</h3>
            <div align="center"><a href = "login.jsp?comefrom=internshipDetails" class = "button">Log in/sign up to apply</a></div>



            <%
                }

            %>

        </section>




        <!-- Footer -->
        <jsp:include page="footer.jsp" />


        <script src="js/custom-file-input.js"></script>
    </body>
</html>