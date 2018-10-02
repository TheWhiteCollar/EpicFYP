<%@page import="Model.Entity.Internship"%>
<%@page import="Model.Dao.InternshipDAO"%>
<%@page import="java.time.LocalDate"%>
<%@page import="Model.Dao.PartnerDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Entity.Partner"%>
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
                    <button class="tablinks" onclick="openUser(event, 'approved')">Approved Applications</button>
                    <button class="tablinks" onclick="openUser(event, 'pending')" id="defaultOpen">Pending Applications</button>
                    <button class="tablinks" onclick="openUser(event, 'rejected')">Rejected Applications</button>
                </div>
                
                <!--tabs' content 1.approved 2.pending 3.rejected-->
                <div id="approved" class="tabcontent">
                    <span onclick="this.parentElement.style.display = 'none'" class="toprightClose">&times</span>
                    <div class="row">
                    <div class="12u 12u(xsmall)">
                        <table class="alt align-center">
                            <thead>
                                <tr>
                                    <th class="align-center">#</th>
                                    <th class="align-center">Job Title</th>
                                    <th class="align-center">Partner Company</th>
                                    <th class="align-center">Field of Study</th>
                                    <th class="align-center">More Information</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                ArrayList<Internship> approvedInternships = InternshipDAO.getAllApprovedInternships();
                                int counta = 0;
                                if (!approvedInternships.isEmpty()) {
                                    for (int i = 0; i < approvedInternships.size(); i++) {
                                        Internship internship = approvedInternships.get(i);
                                        Partner partner = PartnerDAO.getPartnerByID(internship.getInternshipPartnerID());
                                        counta += 1;
                                %>
                                <tr>
                                    <td class = "align-center"><%out.print(counta);%></td>
                                    <td><%out.print(internship.getInternshipName());%></td>
                                    <td><%out.print(partner.getPartnerName());%></td>
                                    <td><%out.print(internship.getInternshipFieldOfStudy());%></td>
                                    <td><button type="button" class="button" data-toggle="modal" data-target="#myModalApproved<%out.print(i);%>">View</button></td>
                                </tr>
                                
                                <%
                                }}
                                %>
                            </tbody>
                        </table>
                    </div>
                    
                </div>
                </div>
                
                <div id="pending" class="tabcontent">
                    <span onclick="this.parentElement.style.display='none'" class="toprightClose">&times</span>
                    <div class="row">
                        <div class="12u 12u(xsmall)">
                            <table class="alt align-center">
                            <thead>
                                <tr>
                                    <th class="align-center">#</th>
                                    <th class="align-center">Job Title</th>
                                    <th class="align-center">Partner Company</th>
                                    <th class="align-center">Contact's Name</th>
                                    <th class="align-center">Contact's Email</th>
                                    <th class="align-center">More Information</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                ArrayList<Internship> pendingInternships = InternshipDAO.getAllPendingInternships();
                                int countp = 0;
                                if (!pendingInternships.isEmpty()) {
                                    for (int i = 0; i < pendingInternships.size(); i++) {
                                        Internship internship = pendingInternships.get(i);
                                        Partner partner = PartnerDAO.getPartnerByID(internship.getInternshipPartnerID());
                                        countp += 1;
                                %>
                                <tr>
                                    <td class = "align-center"><%out.print(countp);%></td>
                                    <td><%out.print(internship.getInternshipName());%></td>
                                    <td><%out.print(partner.getPartnerName());%></td>
                                    <td><%out.print(internship.getInternshipSupervisor());%></td>
                                    <td><%out.print(internship.getInternshipSupervisorEmail());%></td>
                                    <td><button type="button" class="button" data-toggle="modal" data-target="#myModalPending<%out.print(i);%>">View</button></td>
                                </tr>
                                <%
                                }}
                                %>
                            </tbody>
                        </table>
                        </div>
                    </div>
                </div>
                
                <div id="rejected" class="tabcontent">
                    <span onclick="this.parentElement.style.display='none'" class="toprightClose">&times</span>
                    <div class="row">
                        <div class="12u 12u(xsmall)">
                            <table class="alt align-center">
                            <thead>
                                <tr>
                                    <th class="align-center">#</th>
                                    <th class="align-center">Job Title</th>
                                    <th class="align-center">Partner Company</th>
                                    <th class="align-center">Contact's Name</th>
                                    <th class="align-center">Contact's Email</th>
                                    <th class="align-center">More Information</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                ArrayList<Internship> rejectedInternships = InternshipDAO.getAllRejectedInternships();
                                int countr = 0;
                                if (!rejectedInternships.isEmpty()) {
                                    for (int i = 0; i < rejectedInternships.size(); i++) {
                                        Internship internship = rejectedInternships.get(i);
                                        Partner partner = PartnerDAO.getPartnerByID(internship.getInternshipPartnerID());
                                        countr += 1;
                                %>
                                <tr>
                                    <td class = "align-center"><%out.print(countr);%></td>
                                    <td><%out.print(internship.getInternshipName());%></td>
                                    <td><%out.print(partner.getPartnerName());%></td>
                                    <td><%out.print(internship.getInternshipSupervisor());%></td>
                                    <td><%out.print(internship.getInternshipSupervisorEmail());%></td>
                                    <td><button type="button" class="button" data-toggle="modal" data-target="#myModalRejected<%out.print(i);%>">View</button></td>
                                
                                </tr>
                                <%
                                }}
                                %>
                            </tbody>
                        </table>
                        </div>
                    </div>
                </div>

               
                <!--modal box content: 1.approved 2.pending 3.rejected-->
                <%
                if (!approvedInternships.isEmpty()) {
                    for (int i = 0; i < approvedInternships.size(); i++) {
                        Internship internship = approvedInternships.get(i);
                        Partner partner = PartnerDAO.getPartnerByID(internship.getInternshipPartnerID());
                        
                        String dateTimes = internship.getInternshipDatetime();
                        String[] dateTimeList = dateTimes.split("\\s*,\\s*");
                        
                                      
                %>
                <div class="modal fade" id="myModalApproved<%out.print(i);%>" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title align-center"><b><%out.print(partner.getPartnerName()); %></b> internship application for <b><%out.print(internship.getInternshipName());%></b></h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="4u 12u">
                                        <div align="center"><img src="https://www.freelogodesign.org/Content/img/logo-ex-7.png" alt ="partner-logo" height="80%" width="80%"></div>
                                        <table class="align-center">
                                            <tbody>
                                                <tr>
                                                    <td><b><%out.print(partner.getPartnerName()); %></b></td>
                                                </tr>
                                                <tr>
                                                    <td><%out.print(partner.getPartnerCountry()); %>, <%out.print(partner.getPartnerState()); %></td>
                                                </tr>

                                            </tbody>
                                        </table>                                          
                                    </div>
                                    <div class="8u 12u">
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td class="align-right"><b>Internship Position</b></td>
                                                    <td><%out.print(internship.getInternshipName()); %></td>
                                                </tr>
                                                <tr>
                                                    <td class="align-right"><b>Time Period</b></td>
                                                    <td><%out.print(internship.getInternshipStart()); %> to <%out.print(internship.getInternshipEnd()); %></td>
                                                </tr>
                                                <tr>
                                                    <td class="align-right"><b>Salary</b></td>
                                                    <td><%out.print(internship.getInternshipPay()); %></td>
                                                </tr>
                                                <tr>
                                                    <td class="align-right"><b>Vacancy</b></td>
                                                    <td><%out.print(internship.getInternshipVacancy()); %></td>
                                                </tr>
                                                <tr>
                                                    <td class="align-right"><b>Supervisor Name</b></td>
                                                    <td><%out.print(internship.getInternshipSupervisor()); %></td>
                                                </tr>
                                                <tr>
                                                    <td class="align-right"><b>Supervisor Email</b></td>
                                                    <td><%out.print(internship.getInternshipSupervisorEmail()); %></td>
                                                </tr>
                                                <tr>
                                                    <td class="align-right"><b>Field of Study</b></td>
                                                    <td><%out.print(internship.getInternshipFieldOfStudy()); %></td>
                                                </tr>
                                                <tr>
                                                    <td class="align-right"><b>Description</b></td>
                                                    <td><%out.print(internship.getInternshipDescription()); %></td>
                                                </tr>
                                                
                                            </tbody>

                                        </table>
                                                                             
                                    </div>                             
                                </div>
                                <div class="row">
                                    <div class="12u 12u(small)">
                                        <h2 class="align-center">Application Status History</h2>
                                        <table class="alt align-center">
                                            <thead>
                                                <tr>
                                                    <th class="align-center">#</th>
                                                    <th class="align-center">Application Status</th>
                                                    <th class="align-center">Date & Time (YYYY-MM-DD HH:MM:SS)</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>1</td>
                                                    <td>Approved</td>
                                                    <td><%out.print(dateTimeList[1]); %></td>
                                                </tr>
                                                <tr>
                                                    <td>2</td>
                                                    <td>Pending</td>
                                                    <td><%out.print(dateTimeList[0]); %></td>
                                                </tr>
                                                
                                            </tbody>   
                                        </table>
                                    </div>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="button" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                }}
                %>
                
                <%
                if (!pendingInternships.isEmpty()) {
                    for (int i = 0; i < pendingInternships.size(); i++) {
                        Internship internship = pendingInternships.get(i);
                        Partner partner = PartnerDAO.getPartnerByID(internship.getInternshipPartnerID());
                        
                        
                                      
                %>
                <div class="modal fade" id="myModalPending<%out.print(i);%>" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title align-center"><b><%out.print(partner.getPartnerName()); %></b> internship application for <b><%out.print(internship.getInternshipName());%></b></h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="4u 12u">
                                        <div align="center"><img src="https://www.freelogodesign.org/Content/img/logo-ex-7.png" alt ="partner-logo" height="80%" width="80%"></div>
                                        <table class="align-center">
                                            <tbody>
                                                <tr>
                                                    <td><b><%out.print(partner.getPartnerName()); %></b></td>
                                                </tr>
                                                <tr>
                                                    <td><%out.print(partner.getPartnerCountry()); %>, <%out.print(partner.getPartnerState()); %></td>
                                                </tr>

                                            </tbody>
                                        </table>                                          
                                    </div>
                                    <div class="8u 12u">
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td class="align-right"><b>Internship Position</b></td>
                                                    <td><%out.print(internship.getInternshipName()); %></td>
                                                </tr>
                                                <tr>
                                                    <td class="align-right"><b>Time Period</b></td>
                                                    <td><%out.print(internship.getInternshipStart()); %> to <%out.print(internship.getInternshipEnd()); %></td>
                                                </tr>
                                                <tr>
                                                    <td class="align-right"><b>Salary</b></td>
                                                    <td><%out.print(internship.getInternshipPay()); %></td>
                                                </tr>
                                                <tr>
                                                    <td class="align-right"><b>Vacancy</b></td>
                                                    <td><%out.print(internship.getInternshipVacancy()); %></td>
                                                </tr>
                                                <tr>
                                                    <td class="align-right"><b>Supervisor Name</b></td>
                                                    <td><%out.print(internship.getInternshipSupervisor()); %></td>
                                                </tr>
                                                <tr>
                                                    <td class="align-right"><b>Supervisor Email</b></td>
                                                    <td><%out.print(internship.getInternshipSupervisorEmail()); %></td>
                                                </tr>
                                                <tr>
                                                    <td class="align-right"><b>Field of Study</b></td>
                                                    <td><%out.print(internship.getInternshipFieldOfStudy()); %></td>
                                                </tr>
                                                <tr>
                                                    <td class="align-right"><b>Description</b></td>
                                                    <td><%out.print(internship.getInternshipDescription()); %></td>
                                                </tr>
                                                
                                            </tbody>

                                        </table>
                                                                             
                                    </div>                             
                                </div>
                                <div class="row">
                                    <div class="12u 12u(small)">
                                        <h2 class="align-center">Application Status History</h2>
                                        <table class="alt align-center">
                                            <thead>
                                                <tr>
                                                    <th class="align-center">#</th>
                                                    <th class="align-center">Application Status</th>
                                                    <th class="align-center">Date & Time (YYYY-MM-DD HH:MM:SS)</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>1</td>
                                                    <td>Pending</td>
                                                    <td><%out.print(internship.getInternshipDatetime()); %></td>
                                                </tr>
                                            </tbody>   
                                        </table>
                                    </div>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="button" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                }}
                %>
                
                <%
                if (!rejectedInternships.isEmpty()) {
                    for (int i = 0; i < rejectedInternships.size(); i++) {
                        Internship internship = rejectedInternships.get(i);
                        Partner partner = PartnerDAO.getPartnerByID(internship.getInternshipPartnerID());
                        
                        String dateTimes = internship.getInternshipDatetime();
                        String[] dateTimeList = dateTimes.split("\\s*,\\s*");
                        
                                      
                %>
                <div class="modal fade" id="myModalRejected<%out.print(i);%>" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title align-center"><b><%out.print(partner.getPartnerName()); %></b> internship application for <b><%out.print(internship.getInternshipName());%></b></h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="4u 12u">
                                        <div align="center"><img src="https://www.freelogodesign.org/Content/img/logo-ex-7.png" alt ="partner-logo" height="80%" width="80%"></div>
                                        <table class="align-center">
                                            <tbody>
                                                <tr>
                                                    <td><b><%out.print(partner.getPartnerName()); %></b></td>
                                                </tr>
                                                <tr>
                                                    <td><%out.print(partner.getPartnerCountry()); %>, <%out.print(partner.getPartnerState()); %></td>
                                                </tr>

                                            </tbody>
                                        </table>                                          
                                    </div>
                                    <div class="8u 12u">
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td class="align-right"><b>Internship Position</b></td>
                                                    <td><%out.print(internship.getInternshipName()); %></td>
                                                </tr>
                                                <tr>
                                                    <td class="align-right"><b>Time Period</b></td>
                                                    <td><%out.print(internship.getInternshipStart()); %> to <%out.print(internship.getInternshipEnd()); %></td>
                                                </tr>
                                                <tr>
                                                    <td class="align-right"><b>Salary</b></td>
                                                    <td><%out.print(internship.getInternshipPay()); %></td>
                                                </tr>
                                                <tr>
                                                    <td class="align-right"><b>Vacancy</b></td>
                                                    <td><%out.print(internship.getInternshipVacancy()); %></td>
                                                </tr>
                                                <tr>
                                                    <td class="align-right"><b>Supervisor Name</b></td>
                                                    <td><%out.print(internship.getInternshipSupervisor()); %></td>
                                                </tr>
                                                <tr>
                                                    <td class="align-right"><b>Supervisor Email</b></td>
                                                    <td><%out.print(internship.getInternshipSupervisorEmail()); %></td>
                                                </tr>
                                                <tr>
                                                    <td class="align-right"><b>Field of Study</b></td>
                                                    <td><%out.print(internship.getInternshipFieldOfStudy()); %></td>
                                                </tr>
                                                <tr>
                                                    <td class="align-right"><b>Description</b></td>
                                                    <td><%out.print(internship.getInternshipDescription()); %></td>
                                                </tr>
                                                
                                            </tbody>

                                        </table>
                                                                             
                                    </div>                             
                                </div>
                                <div class="row">
                                    <div class="12u 12u(small)">
                                        <h2 class="align-center">Application Status History</h2>
                                        <table class="alt align-center">
                                            <thead>
                                                <tr>
                                                    <th class="align-center">#</th>
                                                    <th class="align-center">Application Status</th>
                                                    <th class="align-center">Date & Time (YYYY-MM-DD HH:MM:SS)</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>1</td>
                                                    <td>Rejected</td>
                                                    <td><%out.print(dateTimeList[1]); %></td>
                                                </tr>
                                                <tr>
                                                    <td>2</td>
                                                    <td>Pending</td>
                                                    <td><%out.print(dateTimeList[0]); %></td>
                                                </tr>
                                                
                                            </tbody>   
                                        </table>
                                    </div>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="button" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                }}
                %>
        

            </div>
        </section>
    </body>
    <script src="js/tabs.js"></script>
</html>