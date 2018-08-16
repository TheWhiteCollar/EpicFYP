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
        <title>Epic Journey - Admin Trips</title>
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
                        var number = 6 - trip.signedUpEmails.length;
                        if (trip.activated) {
                            tripHTML += '<tr><td colspan="3">Activated</td>';
                        } else {

                            tripHTML += '<tr><td colspan="3">Not Activated : ' + number + " more to activate this trip</td>";
                        }
                        tripHTML += "<td>" + trip.signedUpEmails.length + " signed up</td></tr>";
                        tripHTML += "<tr><td><form class=\"deleteTrip\">";
                        tripHTML += "<input style=\"display: none\" type=\"text\" name=\"tripID\" value=\"" + trip.tripID + "\"/>";
                        tripHTML += "<button class = \"button\" type=\"submit\" id=\"asd" + index + "\">Delete Trip</button></form></td>";
                        tripHTML += "<td>Edit Button</td>" + '<td><button type="button" class="button" data-toggle="modal" data-target="#myModal">View users signed up</button></td>' + "</tr>";
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
        <jsp:include page="header.jsp" />

        <!-- Main -->
        <section id="main" class="wrapper">

            <!-- Tab for: filter, add trip form -->
            <div class ="container">
                <div class="tab">
                    <button class="tablinks" onclick="openUser(event, 'filterTab')">More filter options</button>
                    <button class="tablinks" onclick="openUser(event, 'addTripTab')">List a new Trip</button>
                </div>


                <!-- For user to choose if they want to login as student or admin -->
                <div id="filterTab" class="tabcontent">

                    <span onclick="this.parentElement.style.display = 'none'" class="toprightClose">&times</span>
                    <form action="filterTrips.jsp" method="post">
                        <p>
                        <div class = "row">
                            <div class="3u 12u(small)">
                                <% LocalDate todayDate = java.time.LocalDate.now(); %>
                                Date (min):                                                                       
                                <input name = "startDate" type="date" min = "<% out.print(todayDate); %>" >
                            </div>
                            <div class="3u 12u(small)">
                                Date (max):                              
                                <input name = "endDate" type="date" min = "<% out.print(todayDate);%>" >
                            </div> 
                        </div>

                        </p>

                        <p>
                        <div class = "row">
                            <div class="2u 12u(small)">
                                Price (min):
                                <input type="number" value = "min" min = "0">
                            </div>
                            <div class="2u 12u(small)">
                                Price (max):
                                <input type="number" value = "max" min = "0"tes
                                       >
                            </div>
                            <div class="3u 12u(small)">
                                Rating:
                                <select name="rating">                                      
                                    <option disabled selected value style="display:none"> - select a rating - </option>
                                    <option value="bad" >Bad</option>
                                    <option value="average" >Average</option>
                                    <option value="excellent" >Excellent</option>
                                </select>
                            </div>
                            <div class="4u 12u(small)">
                                Programmes Category:
                                <select name="programmes" >
                                    <option disabled selected value style="display:none"> - select a programme category - </option>
                                    <option value="Nature and Culture" >Nature and Culture</option>
                                    <option value="Academic & Business" >Academic & Business</option>
                                    <option value="Service & Social Innovation">Service & Social Innovation</option>
                                </select>
                            </div>
                        </div>
                        </p>

                        <p>
                        <div class = "row">
                            <div class="1u 12u(small)">
                                Country:
                            </div>
                            <div class="2u 12u(small)">                                   
                                <input type="checkbox" id="Singapore" name="country" value="Singapore">
                                <label for="Singapore">Singapore</label>
                            </div>
                            <div class="2u 12u(small)">                                   
                                <input type="checkbox" id="Myanmar" name="country" value="Myanmar">
                                <label for="Myanmar">Myanmar</label>
                            </div>
                            <div class="2u 12u(small)">                                   
                                <input type="checkbox" id="China" name="country" value="China">
                                <label for="China">China</label>
                            </div>
                            <div class="2u 12u(small)">                                   
                                <input type="checkbox" id="Indonesia" name="country" value="Indonesia">
                                <label for="Indonesia">Indonesia</label>
                            </div>
                        </div>
                        </p>

                        <input type="submit" value="Apply" style="width:100%"> 
                    </form> 
                </div>

                <!-- Adding a trip -->
                <div id="addTripTab" class="tabcontent">

                    <span onclick="this.parentElement.style.display = 'none'" class="toprightClose">&times</span>
                    <form id="addTrip">
                        <div class = "row">
                            <div class = "6u 12u">
                                <p>
                                    Programme Title: <input required type="text" name="programme" placeholder="e.g: Winter Study Trip">
                                </p>
                            </div>
                            <div class = "6u 12u">
                                <p>                               
                                    Country of visit: <select name="country">   
                                        <option disabled selected value style="display:none"> - select a country - </option>
                                        <option value="Afghanistan">Afghanistan</option> 
                                        <option value="Albania">Albania</option> 
                                        <option value="Algeria">Algeria</option> 
                                        <option value="American Samoa">American Samoa</option> 
                                        <option value="Andorra">Andorra</option> 
                                        <option value="Angola">Angola</option> 
                                        <option value="Anguilla">Anguilla</option> 
                                        <option value="Antarctica">Antarctica</option> 
                                        <option value="Antigua and Barbuda">Antigua and Barbuda</option> 
                                        <option value="Argentina">Argentina</option> 
                                        <option value="Armenia">Armenia</option> 
                                        <option value="Aruba">Aruba</option> 
                                        <option value="Australia">Australia</option> 
                                        <option value="Austria">Austria</option> 
                                        <option value="Azerbaijan">Azerbaijan</option> 
                                        <option value="Bahamas">Bahamas</option> 
                                        <option value="Bahrain">Bahrain</option> 
                                        <option value="Bangladesh">Bangladesh</option> 
                                        <option value="Barbados">Barbados</option> 
                                        <option value="Belarus">Belarus</option> 
                                        <option value="Belgium">Belgium</option> 
                                        <option value="Belize">Belize</option> 
                                        <option value="Benin">Benin</option> 
                                        <option value="Bermuda">Bermuda</option> 
                                        <option value="Bhutan">Bhutan</option> 
                                        <option value="Bolivia">Bolivia</option> 
                                        <option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option> 
                                        <option value="Botswana">Botswana</option> 
                                        <option value="Bouvet Island">Bouvet Island</option> 
                                        <option value="Brazil">Brazil</option> 
                                        <option value="British Indian Ocean Territory">British Indian Ocean Territory</option> 
                                        <option value="Brunei Darussalam">Brunei Darussalam</option> 
                                        <option value="Bulgaria">Bulgaria</option> 
                                        <option value="Burkina Faso">Burkina Faso</option> 
                                        <option value="Burundi">Burundi</option> 
                                        <option value="Cambodia">Cambodia</option> 
                                        <option value="Cameroon">Cameroon</option> 
                                        <option value="Canada">Canada</option> 
                                        <option value="Cape Verde">Cape Verde</option> 
                                        <option value="Cayman Islands">Cayman Islands</option> 
                                        <option value="Central African Republic">Central African Republic</option> 
                                        <option value="Chad">Chad</option> 
                                        <option value="Chile">Chile</option> 
                                        <option value="China">China</option> 
                                        <option value="Christmas Island">Christmas Island</option> 
                                        <option value="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option> 
                                        <option value="Colombia">Colombia</option> 
                                        <option value="Comoros">Comoros</option> 
                                        <option value="Congo">Congo</option> 
                                        <option value="Congo, The Democratic Republic of The">Congo, The Democratic Republic of The</option> 
                                        <option value="Cook Islands">Cook Islands</option> 
                                        <option value="Costa Rica">Costa Rica</option> 
                                        <option value="Cote D'ivoire">Cote D'ivoire</option> 
                                        <option value="Croatia">Croatia</option> 
                                        <option value="Cuba">Cuba</option> 
                                        <option value="Cyprus">Cyprus</option> 
                                        <option value="Czech Republic">Czech Republic</option> 
                                        <option value="Denmark">Denmark</option> 
                                        <option value="Djibouti">Djibouti</option> 
                                        <option value="Dominica">Dominica</option> 
                                        <option value="Dominican Republic">Dominican Republic</option> 
                                        <option value="Ecuador">Ecuador</option> 
                                        <option value="Egypt">Egypt</option> 
                                        <option value="El Salvador">El Salvador</option> 
                                        <option value="Equatorial Guinea">Equatorial Guinea</option> 
                                        <option value="Eritrea">Eritrea</option> 
                                        <option value="Estonia">Estonia</option> 
                                        <option value="Ethiopia">Ethiopia</option> 
                                        <option value="Falkland Islands (Malvinas)">Falkland Islands (Malvinas)</option> 
                                        <option value="Faroe Islands">Faroe Islands</option> 
                                        <option value="Fiji">Fiji</option> 
                                        <option value="Finland">Finland</option> 
                                        <option value="France">France</option> 
                                        <option value="French Guiana">French Guiana</option> 
                                        <option value="French Polynesia">French Polynesia</option> 
                                        <option value="French Southern Territories">French Southern Territories</option> 
                                        <option value="Gabon">Gabon</option> 
                                        <option value="Gambia">Gambia</option> 
                                        <option value="Georgia">Georgia</option> 
                                        <option value="Germany">Germany</option> 
                                        <option value="Ghana">Ghana</option> 
                                        <option value="Gibraltar">Gibraltar</option> 
                                        <option value="Greece">Greece</option> 
                                        <option value="Greenland">Greenland</option> 
                                        <option value="Grenada">Grenada</option> 
                                        <option value="Guadeloupe">Guadeloupe</option> 
                                        <option value="Guam">Guam</option> 
                                        <option value="Guatemala">Guatemala</option> 
                                        <option value="Guinea">Guinea</option> 
                                        <option value="Guinea-bissau">Guinea-bissau</option> 
                                        <option value="Guyana">Guyana</option> 
                                        <option value="Haiti">Haiti</option> 
                                        <option value="Heard Island and Mcdonald Islands">Heard Island and Mcdonald Islands</option> 
                                        <option value="Holy See (Vatican City State)">Holy See (Vatican City State)</option> 
                                        <option value="Honduras">Honduras</option> 
                                        <option value="Hong Kong">Hong Kong</option> 
                                        <option value="Hungary">Hungary</option> 
                                        <option value="Iceland">Iceland</option> 
                                        <option value="India">India</option> 
                                        <option value="Indonesia">Indonesia</option> 
                                        <option value="Iran, Islamic Republic of">Iran, Islamic Republic of</option> 
                                        <option value="Iraq">Iraq</option> 
                                        <option value="Ireland">Ireland</option> 
                                        <option value="Israel">Israel</option> 
                                        <option value="Italy">Italy</option> 
                                        <option value="Jamaica">Jamaica</option> 
                                        <option value="Japan">Japan</option> 
                                        <option value="Jordan">Jordan</option> 
                                        <option value="Kazakhstan">Kazakhstan</option> 
                                        <option value="Kenya">Kenya</option> 
                                        <option value="Kiribati">Kiribati</option> 
                                        <option value="Korea, Democratic People's Republic of">Korea, Democratic People's Republic of</option> 
                                        <option value="Korea, Republic of">Korea, Republic of</option> 
                                        <option value="Kuwait">Kuwait</option> 
                                        <option value="Kyrgyzstan">Kyrgyzstan</option> 
                                        <option value="Lao People's Democratic Republic">Lao People's Democratic Republic</option> 
                                        <option value="Latvia">Latvia</option> 
                                        <option value="Lebanon">Lebanon</option> 
                                        <option value="Lesotho">Lesotho</option> 
                                        <option value="Liberia">Liberia</option> 
                                        <option value="Libyan Arab Jamahiriya">Libyan Arab Jamahiriya</option> 
                                        <option value="Liechtenstein">Liechtenstein</option> 
                                        <option value="Lithuania">Lithuania</option> 
                                        <option value="Luxembourg">Luxembourg</option> 
                                        <option value="Macao">Macao</option> 
                                        <option value="Macedonia, The Former Yugoslav Republic of">Macedonia, The Former Yugoslav Republic of</option> 
                                        <option value="Madagascar">Madagascar</option> 
                                        <option value="Malawi">Malawi</option> 
                                        <option value="Malaysia">Malaysia</option> 
                                        <option value="Maldives">Maldives</option> 
                                        <option value="Mali">Mali</option> 
                                        <option value="Malta">Malta</option> 
                                        <option value="Marshall Islands">Marshall Islands</option> 
                                        <option value="Martinique">Martinique</option> 
                                        <option value="Mauritania">Mauritania</option> 
                                        <option value="Mauritius">Mauritius</option> 
                                        <option value="Mayotte">Mayotte</option> 
                                        <option value="Mexico">Mexico</option> 
                                        <option value="Micronesia, Federated States of">Micronesia, Federated States of</option> 
                                        <option value="Moldova, Republic of">Moldova, Republic of</option> 
                                        <option value="Monaco">Monaco</option> 
                                        <option value="Mongolia">Mongolia</option> 
                                        <option value="Montserrat">Montserrat</option> 
                                        <option value="Morocco">Morocco</option> 
                                        <option value="Mozambique">Mozambique</option> 
                                        <option value="Myanmar">Myanmar</option> 
                                        <option value="Namibia">Namibia</option> 
                                        <option value="Nauru">Nauru</option> 
                                        <option value="Nepal">Nepal</option> 
                                        <option value="Netherlands">Netherlands</option> 
                                        <option value="Netherlands Antilles">Netherlands Antilles</option> 
                                        <option value="New Caledonia">New Caledonia</option> 
                                        <option value="New Zealand">New Zealand</option> 
                                        <option value="Nicaragua">Nicaragua</option> 
                                        <option value="Niger">Niger</option> 
                                        <option value="Nigeria">Nigeria</option> 
                                        <option value="Niue">Niue</option> 
                                        <option value="Norfolk Island">Norfolk Island</option> 
                                        <option value="Northern Mariana Islands">Northern Mariana Islands</option> 
                                        <option value="Norway">Norway</option> 
                                        <option value="Oman">Oman</option> 
                                        <option value="Pakistan">Pakistan</option> 
                                        <option value="Palau">Palau</option> 
                                        <option value="Palestinian Territory, Occupied">Palestinian Territory, Occupied</option> 
                                        <option value="Panama">Panama</option> 
                                        <option value="Papua New Guinea">Papua New Guinea</option> 
                                        <option value="Paraguay">Paraguay</option> 
                                        <option value="Peru">Peru</option> 
                                        <option value="Philippines">Philippines</option> 
                                        <option value="Pitcairn">Pitcairn</option> 
                                        <option value="Poland">Poland</option> 
                                        <option value="Portugal">Portugal</option> 
                                        <option value="Puerto Rico">Puerto Rico</option> 
                                        <option value="Qatar">Qatar</option> 
                                        <option value="Reunion">Reunion</option> 
                                        <option value="Romania">Romania</option> 
                                        <option value="Russian Federation">Russian Federation</option> 
                                        <option value="Rwanda">Rwanda</option> 
                                        <option value="Saint Helena">Saint Helena</option> 
                                        <option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option> 
                                        <option value="Saint Lucia">Saint Lucia</option> 
                                        <option value="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option> 
                                        <option value="Saint Vincent and The Grenadines">Saint Vincent and The Grenadines</option> 
                                        <option value="Samoa">Samoa</option> 
                                        <option value="San Marino">San Marino</option> 
                                        <option value="Sao Tome and Principe">Sao Tome and Principe</option> 
                                        <option value="Saudi Arabia">Saudi Arabia</option> 
                                        <option value="Senegal">Senegal</option> 
                                        <option value="Serbia and Montenegro">Serbia and Montenegro</option> 
                                        <option value="Seychelles">Seychelles</option> 
                                        <option value="Sierra Leone">Sierra Leone</option> 
                                        <option value="Singapore">Singapore</option> 
                                        <option value="Slovakia">Slovakia</option> 
                                        <option value="Slovenia">Slovenia</option> 
                                        <option value="Solomon Islands">Solomon Islands</option> 
                                        <option value="Somalia">Somalia</option> 
                                        <option value="South Africa">South Africa</option> 
                                        <option value="South Georgia and The South Sandwich Islands">South Georgia and The South Sandwich Islands</option> 
                                        <option value="Spain">Spain</option> 
                                        <option value="Sri Lanka">Sri Lanka</option> 
                                        <option value="Sudan">Sudan</option> 
                                        <option value="Suriname">Suriname</option> 
                                        <option value="Svalbard and Jan Mayen">Svalbard and Jan Mayen</option> 
                                        <option value="Swaziland">Swaziland</option> 
                                        <option value="Sweden">Sweden</option> 
                                        <option value="Switzerland">Switzerland</option> 
                                        <option value="Syrian Arab Republic">Syrian Arab Republic</option> 
                                        <option value="Taiwan, Province of China">Taiwan, Province of China</option> 
                                        <option value="Tajikistan">Tajikistan</option> 
                                        <option value="Tanzania, United Republic of">Tanzania, United Republic of</option> 
                                        <option value="Thailand">Thailand</option> 
                                        <option value="Timor-leste">Timor-leste</option> 
                                        <option value="Togo">Togo</option> 
                                        <option value="Tokelau">Tokelau</option> 
                                        <option value="Tonga">Tonga</option> 
                                        <option value="Trinidad and Tobago">Trinidad and Tobago</option> 
                                        <option value="Tunisia">Tunisia</option> 
                                        <option value="Turkey">Turkey</option> 
                                        <option value="Turkmenistan">Turkmenistan</option> 
                                        <option value="Turks and Caicos Islands">Turks and Caicos Islands</option> 
                                        <option value="Tuvalu">Tuvalu</option> 
                                        <option value="Uganda">Uganda</option> 
                                        <option value="Ukraine">Ukraine</option> 
                                        <option value="United Arab Emirates">United Arab Emirates</option> 
                                        <option value="United Kingdom">United Kingdom</option> 
                                        <option value="United States">United States</option> 
                                        <option value="United States Minor Outlying Islands">United States Minor Outlying Islands</option> 
                                        <option value="Uruguay">Uruguay</option> 
                                        <option value="Uzbekistan">Uzbekistan</option> 
                                        <option value="Vanuatu">Vanuatu</option> 
                                        <option value="Venezuela">Venezuela</option> 
                                        <option value="Viet Nam">Viet Nam</option> 
                                        <option value="Virgin Islands, British">Virgin Islands, British</option> 
                                        <option value="Virgin Islands, U.S.">Virgin Islands, U.S.</option> 
                                        <option value="Wallis and Futuna">Wallis and Futuna</option> 
                                        <option value="Western Sahara">Western Sahara</option> 
                                        <option value="Yemen">Yemen</option> 
                                        <option value="Zambia">Zambia</option> 
                                        <option value="Zimbabwe">Zimbabwe</option>
                                    </select>
                                </p>
                            </div>
                        </div>

                        <div class = "row">
                            <div class = "3u 12u">
                                <p>
                                    Trip Start (dd-mm-yyyy): <input name="tripStart" id="tripStart" required type="date" min = "<% out.print(todayDate); %>">
                                </p>
                            </div>
                            <div class = "3u 12u">
                                <p>
                                    Trip End (dd-mm-yyyy): <input name="tripEnd" id="tripEnd" required type="date" min = "<% out.print(todayDate);%>" ">
                                </p>
                            </div>
                            <div class = "3u 12u">
                                <p>
                                    Price ($): <input name="price" required type="number" min="1" placeholder="e.g: 100">
                                </p>
                            </div>
<!--                            <div class = "3u 12u">
                                <p>
                                    Rating: <select name="rating">   
                                        <option disabled selected value style="display:none"> - select a rating - </option>
                                        <option value="1">1 (worst)</option>
                                        <option value="2">2 </option> 
                                        <option value="3">3 </option> 
                                        <option value="4">4 </option> 
                                        <option value="5">5 </option> 
                                        <option value="6">6 </option> 
                                        <option value="7">7 </option> 
                                        <option value="8">8 </option> 
                                        <option value="9">9 </option> 
                                        <option value="10">10 (best)</option>                                                                           
                                    </select>
                                </p>
                            </div>-->
                        </div>


                        <div class = "row">
                            <div class = "3u 12u">
                                <p>
                                    Trip Duration (days): 
                                    <input required type="text" min="1" step="1" placeholder="days" name="duration" id="duration" value="0" onclick="dateDiff()">
                                </p>
                            </div>
                            <div class = "5u 12u">
                                <p>
                                    Programme Category tag: 
                                    <select name="programmes" >
                                        <option disabled selected value style="display:none"> - select a programme category - </option>
                                        <option value="Nature and Culture" >Nature and Culture</option>
                                        <option value="Academic & Business" >Academic & Business</option>
                                        <option value="Service & Social Innovation">Service & Social Innovation</option>
                                    </select>
                                </p>
                            </div>
                            <div class = "4u 12u">
                                <p>
                                    <input type="file" name="profilePicture" id="file-1" class="inputfile inputfile-1" style="visibility:hidden" accept=".pdf"/>
                                    <label for="file-1" style="padding-top: 10px;padding-bottom: 10px;"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg> 
                                        <span>Upload Trip Itinerary</span>
                                    </label> 
                                </p>
                            </div>
                        </div>

                        <input type="submit" value="Create a Trip!" style="width:100%">
                    </form>

                </div>
            </div>

            <!-- this contains all the trips -->
            <div class ="container">
                <br>
                <h2>All Listed Trips</h2>
                <div id="trips" class ="container">
                </div>
            </div>

            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">List of Users</h4>
                        </div>
                        <div class="modal-body">

                            <table class = "alt" id = "tripUsers">
                                <thead>
                                <td>Number</td> 
                                <td>Name</td>
                                <td>Email</td>
                                <td>Phone</td>
                                </thead>
                                <tbody>

                                    <tr>
                                        <td>Number</td> 
                                        <td>Name</td>
                                        <td>Email</td>
                                        <td>Phone</td> 
                                    </tr>
                                    <tr>
                                        <td>Number</td> 
                                        <td>Name</td>
                                        <td>Email</td>
                                        <td>Phone</td> 
                                    </tr>

                                </tbody>

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

    <script>
        function dateDiff() {
            var date1 = document.getElementById('tripStart').value;
            date1 = new Date(date1);
            var date2 = document.getElementById('tripEnd').value;
            date2 = new Date(date2);
            var timeDiff = Math.abs(date2 - date1);
            var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));
            diffDays += 1;
            document.getElementById("duration").value = diffDays;
        }
    </script>
    <script src="js/custom-file-input.js"></script>
    <script src="js/tabs.js"></script>
</body>
</html>