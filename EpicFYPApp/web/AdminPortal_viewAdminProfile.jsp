<%@page import="Model.Entity.Admin"%>
<%@page import="Model.Dao.AdminDAO"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Epic Journey - Admin View Admin Profile</title>
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
        
        <script>
            $(function () {
                //call get all admins using ajax get method. receives adminJson string
                $.get('/EpicFYPApp/getAllAdminsServlet', function (adminJson) {
                    //parse string into JSON object
                    var admins = JSON.parse(adminJson);
                    console.log(admins);
                    var adminHTML = '<div class="table-wrapper"><table>';
                    //loop through each admin and print out as rows in a table
                    $.each(admins, function (index, admin) {
                        adminHTML += '<thead><tr><th>Admin Name : ' + admin.adminName +"</th></tr></thead>";
                        adminHTML += '<tr><td>Admin Level : ' + admin.adminLevel + "</td>";                    
                        adminHTML += "<tr><td><form class=\"deleteAdmin\">";
                        adminHTML += "<input style=\"display: none\" type=\"text\" name=\"adminName\" value=\"" + admin.adminName + "\"/>";
                        adminHTML += "<button class = \"button\" type=\"submit\" id=\"asd" + index + "\">Delete Admin</button></form></td>";                    
                    });
                    
                    adminHTML += '</table></div>';
                    
                    $("#admins").append(adminHTML);

                    //wait for delete admin form to be submited
                    $(".deleteAdmin").submit(function (event) {
                        //store the adminname from the form
                        var adminName = "" + $(this).children("input").val();
                        var deleteData = {
                            'id': adminName
                        };
                        console.log("adminName: " + adminName);
                        //send an ajax post request to the delete admin servlet with delete data
                        $.post('/EpicFYPApp/deleteAdmin', deleteData, function (response) {
                            if (response === "success") {
                                $.notify({
                                    // options
                                    message: 'Successfully deleted admin'
                                }, {
                                    // settings
                                    type: 'success'
                                });
                            } else {
                                $.notify({
                                    // options
                                    message: 'Fail to delete admin'
                                }, {
                                    // settings
                                    type: 'danger'
                                });
                            }
                            reloadTable();
                        })
                        //prevents form from being submitted
                        event.preventDefault();
                        // validate and process form here
                    });
                });
                // wait for add trip submit event 
                $("#addAdmin").submit(function (event) {
                    let adminName = $('input[name="adminName"]').val();
                    let adminPassword = $('input[name="adminPassword"]').val();
                    let adminLevel = $('input[name="adminLevel"]').val();
                    
                    let adminData = {
                        "adminName": adminName,
                        "adminPassword": adminPassword,
                        "adminLevel": adminLevel
                    }
                    
                    console.log("this is admin data");
                    console.log(adminData);
                    //send ajax post request to addAdmin servlet with adminData
                    $.post('/EpicFYPApp/addAdmin', adminData, function (response) {
                        $('button[data-dismiss="modal"]').click();
                        reloadTable();
                        if (response === "success") {
                            $.notify({
                                // options
                                message: 'Successfully inserted admin'
                            }, {
                                // settings
                                type: 'success'
                            });
                        } else {
                            $.notify({
                                // options
                                message: 'Fail to insert admin'
                            }, {
                                // settings
                                type: 'danger'
                            });
                        }
                    });
                    event.preventDefault();
                });
                
                function reloadTable() {
                    $.get('/EpicFYPApp/getAllAdminsServlet', function (adminJson) {
                    //parse string into JSON object
                    var admins = JSON.parse(adminJson);
                    console.log(admins);
                    var adminHTML = '<div class="table-wrapper"><table>';
                    //loop through each admin and print out as rows in a table
                    $.each(admins, function (index, admin) {
                        adminHTML += '<thead><tr><th>Admin Name : ' + admin.adminName +"</th></tr></thead>";
                        adminHTML += '<tr><td>Admin Level : ' + admin.adminLevel + "</td>";                    
                        adminHTML += "<tr><td><form class=\"deleteAdmin\">";
                        adminHTML += "<input style=\"display: none\" type=\"text\" name=\"adminName\" value=\"" + admin.adminName + "\"/>";
                        adminHTML += "<button class = \"button\" type=\"submit\" id=\"asd" + index + "\">Delete Admin</button></form></td>";                    
                    });
                    
                    adminHTML += '</table></div>';
                    
                    $("#admins").append(adminHTML);

                    //wait for delete admin form to be submited
                    $(".deleteAdmin").submit(function (event) {
                        //store the adminname from the form
                        var adminName = "" + $(this).children("input").val();
                        var deleteData = {
                            'id': adminName
                        };
                        console.log("adminName: " + adminName);
                        //send an ajax post request to the delete admin servlet with delete data
                        $.post('/EpicFYPApp/deleteAdmin', deleteData, function (response) {
                            if (response === "success") {
                                $.notify({
                                    // options
                                    message: 'Successfully deleted admin'
                                }, {
                                    // settings
                                    type: 'success'
                                });
                            } else {
                                $.notify({
                                    // options
                                    message: 'Fail to delete admin'
                                }, {
                                    // settings
                                    type: 'danger'
                                });
                            }
                            reloadTable();
                        })
                        //prevents form from being submitted
                        event.preventDefault();
                    });
                });
                }
            });
        </script>
                
        <!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
    </head>
    <body>

        <!-- Header -->
        <jsp:include page="header.jsp" />

        <section class="wrapper">
            <div class="container" >
                
                <h2 class="align-center">Admins' Profiles</h2>
                <%
                //if superadmin
                Admin admin = (Admin) session.getAttribute("Admin");
                if (admin != null) {
                    String adminLevel = admin.getAdminLevel();
                    if(adminLevel.equals("superadmin")){
                
                %>
                <div class="container align-center">
                    <button type="button" class="button" data-toggle="modal" data-target="#myModalAdd">Add a new Admin</button> 
                    <button type="button" class="button" data-toggle="modal" data-target="#myModalDelete">Delete a Admin</button> 
                </div>
                <%
                    }
                }
                %>
                </br>
                <div class="container">
                    <table class="alt align-center">
                        <thead>
                            <tr>
                                <th class="align-center">#</th>
                                <th class="align-center">Admin Username</th>
                                <th class="align-center">Admin Level</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                ArrayList<Admin> allAdmin = AdminDAO.getAllAdmins();
                                int count = 0;
                                if (!allAdmin.isEmpty()) {
                                    for (int i = 0; i < allAdmin.size(); i++) {
                                        Admin a = allAdmin.get(i);
                                        count += 1;
                            %>
                            <tr>
                                <td><%out.print(count);%></td>
                                <td><% out.print(a.getAdminName()); %></td>                      
                                <td><% out.print(a.getAdminLevel()); %></td>

                            </tr>
                            <%
                                    }
                                }
                            %>
                        </tbody>    
                    </table>
                </div>

         
                <div class="modal fade" id="myModalAdd" role="dialog" style="top:20%;">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title align-center"><b>Add a new Admin</b></h4>
                            </div>
                            <div class="modal-body">
                                <table>
                                    <tr>
                                        <td class="align-right">Admin Username</td>
                                        <td><input type ="text" name ="adminName" placeholder ="Admin Username *" style="width:200px;"/></td>
                                    </tr>
                                    <tr>
                                        <td class="align-right">Admin Password</td>
                                        <td><input type ="text" name ="adminPassword" placeholder ="Admin Password *" style="width:200px;"/></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="align-center"><input type="submit" value="Submit" ></td>
                                    </tr>
                                </table>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="button" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
    
            </div>
        </section>
    </body>
</html>