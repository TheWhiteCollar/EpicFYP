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
                $.get('/EpicFYPApp/getAllTripsServlet', function (tripJson) {
                    var trips = JSON.parse(tripJson);
                    var tripHTML = '<div class="table-wrapper"><table>';
                    $.each(trips, function (index, trip) {
                        tripHTML += '<thead><tr><th>Trip ID : ' + trip.tripID + '</th><th colspan="3">' + trip.programme + "</th></tr></thead>";
                        tripHTML += '<tr><td>Country : ' + trip.country + "</td><td> Start : " + trip.tripStart + "</td>";
                        tripHTML += "<td>End : " + trip.tripEnd + "</td><td>Price : $" + trip.price + "</tr>";
                        tripHTML += '<tr><td colspan="4"> Trip Description?</td></tr>';
                        var number = 5 - trip.signedUpEmails.length;
                        if (trip.activated) {
                            tripHTML += '<tr><td colspan="3">Activated</td>';
                        } else {

                            tripHTML += '<tr><td colspan="3">Not Activated : ' + number + " more to activate this trip</td>";
                        }
                        tripHTML += "<td>" + trip.signedUpEmails.length + " signed up</td></tr>";
                        tripHTML += "<tr><td><form class=\"deleteTrip\">";
                        tripHTML += "<input style=\"display: none\" type=\"text\" name=\"tripID\" value=\"" + trip.tripID + "\"/>";
                        tripHTML += "<button class = \"button\" type=\"submit\" id=\"asd" + index + "\">Delete Trip</button></form></td>";
                        tripHTML += "<td>Edit Button</td>" + "<td>View users signed up</td>" + "</tr>";
                    });
                    tripHTML += '</table></div>';
                    $("#trips").append(tripHTML);


                    $(".deleteTrip").submit(function (event) {
                        var tripID = "" + $('input[name=tripID]').val();
                        var deleteData = {
                            'id': tripID
                        };
                        $.post('/EpicFYPApp/deleteTrip', deleteData, function (response) {
                            if (response === "success") {
                                $.notify({
                                    // options
                                    message: 'Successfully deleted trip'
                                }, {
                                    // settings
                                    type: 'success'
                                });
                            } else {
                                $.notify({
                                    // options
                                    message: 'Fail to delete trip'
                                }, {
                                    // settings
                                    type: 'danger'
                                });
                            }
                            reloadTable();
                        })
                        event.preventDefault();
                        // validate and process form here
                    });
                });
                $("#addTrip").submit(function (event) {
                    let country = $('input[name="country"]').val();
                    let price = $('input[name="price"]').val();
                    let programme = $('input[name="programme"]').val();
                    let rating = $('input[name="rating"]').val();
                    let duration = $('input[name="duration"]').val();
                    let tripStart = $('input[name="tripStart"]').val();
                    let tripEnd = $('input[name="tripEnd"]').val();
                    let tripData = {
                        "country": country,
                        "price": price,
                        "programme": programme,
                        "rating": rating,
                        "duration": duration,
                        "tripStart": tripStart,
                        "tripEnd": tripEnd,
                    }
                    $.post('/EpicFYPApp/addTrip', tripData, function (response) {
                        $('button[data-dismiss="modal"]').click();
                        reloadTable();
                        if (response === "success") {
                            $.notify({
                                // options
                                message: 'Successfully inserted trip'
                            }, {
                                // settings
                                type: 'success'
                            });
                        } else {
                            $.notify({
                                // options
                                message: 'Fail to insert trip'
                            }, {
                                // settings
                                type: 'danger'
                            });
                        }
                    });
                    event.preventDefault();
                });
                function reloadTable() {
                    $.get('/EpicFYPApp/getAllTripsServlet', function (tripJson) {                     
                        var trips = JSON.parse(tripJson);
                        $("#trips").empty();
                        var tripHTML = '<div class="table-wrapper"><table>';
                        $.each(trips, function (index, trip) {
                            tripHTML += '<thead><tr><th>Trip ID : ' + trip.tripID + '</th><th colspan="3">' + trip.programme + "</th></tr></thead>";
                            tripHTML += '<tr><td>Country : ' + trip.country + "</td><td> Start : " + trip.tripStart + "</td>";
                            tripHTML += "<td>End : " + trip.tripEnd + "</td><td>Price : $" + trip.price + "</tr>";
                            tripHTML += '<tr><td colspan="4"> Trip Description?</td></tr>';
                            var number = 5 - trip.signedUpEmails.length;
                            if (trip.activated) {
                                tripHTML += '<tr><td colspan="3">Activated</td>';
                            } else {

                                tripHTML += '<tr><td colspan="3">Not Activated : ' + number + " more to activate this trip</td>";
                            }
                            tripHTML += "<td>" + trip.signedUpEmails.length + " signed up</td></tr>";
                            tripHTML += "<tr><td><form class=\"deleteTrip\">";
                            tripHTML += "<input style=\"display: none\" type=\"text\" name=\"tripID\" value=\"" + trip.tripID + "\"/>";
                            tripHTML += "<button class = \"button\" type=\"submit\" id=\"asd" + index + "\">Delete Trip</button></form></td>";
                            tripHTML += "<td>Edit Button</td>" + "<td>View users signed up</td>" + "</tr>";
                        });
                        tripHTML += '</table></div>';
                        $("#trips").append(tripHTML);
                    });
                }


            });
        </script>
        <!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
    </head>
    <body>

        <!-- Header -->
        <jsp:include page="header_admin.jsp" />

        <!-- Main -->
        <section id="main" class="wrapper">
            <!---->
            <div class="container">

                <div class="container">
                    <!-- Trigger the modal with a button -->
                    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">+ Add new trip</button>
                    <!-- Modal -->
                    <div class="modal fade" id="myModal" role="dialog">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">ADD NEW TRIP</h4>
                                </div>
                                <div class="modal-body">
                                    <form id="addTrip">
                                        <p>Country: <input required type="text" name="country" value="Singapore"><br></p>
                                        <p>Price: $<input required tinput type="number" min="1" step="any" name="price" value=""><br></p>
                                        <p>Programme: <input required type="text" name="programme" value=" Winter Study Trip"><br></p>
                                        <p>Rating: <input required type="number" min="1" step="1" name="rating" value=" 4"><br></p>
                                        <p>Trip Duration: <input required type="text" min="1" step="1" placeholder="days" name="duration" value=""><br></p>
                                        <p>Trip Start: <input required type="date" name="tripStart" value=""><br></p>
                                        <p>Trip End: <input required type="date" name="tripEnd" value=""><br></p>
                                        <p><button type="button" class="btn btn-info btn-lg">+ Upload Trip Itinerary</button><br></p>
                                        <input type="submit" value="Create a Trip!">
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- this contains all the trips -->

                <h2>All Listed Trips</h2>
                <div id="trips">
                </div>
            </div>
        </section>
    </body>
</html>