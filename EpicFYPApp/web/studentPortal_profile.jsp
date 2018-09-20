
<%@page import="java.util.Arrays"%>
<%@page import="Model.Dao.InterestDAO"%>
<%@page import="Model.Dao.FieldOfStudyDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    /*
    Things undone:
    - Drop down of interest? (based off database)
    - taking into account if there is blanks in db (check if can make it send blank instead
    - reading profile picture from db
    - default image to show to users with no profile picture
    
     */
%>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Epic- Overseas study missions/internships for all</title>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta name="description" content="Imparting life skills through overseas exposure via internships and study missions. Countries of focus: Cambodia, Laos, Myanmar, Vietnam, India, Indonesia, Thailand, Japan and China." />
        <meta name="keywords" content="overseas, study missions, internships, training, life skills, career exposure" />
        <!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
        <script src="js/jquery.min.js"></script>
        <script src="js/skel.min.js"></script>
        <script src="js/skel-layers.min.js"></script>
        <script src="js/init.js"></script>
        <script>(function (e, t, n) {
                var r = e.querySelectorAll("html")[0];
                r.className = r.className.replace(/(^|\s)no-js(\s|$)/, "$1js$2")
            })(document, window, 0);</script>

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
        <section id="login" class="wrapper">
            <div class="container">					
                <header class="major">                  
                    <h2>Account Information</h2>                     
                </header>

                <form action="updateUserServlet" method="post" enctype="multipart/form-data">
                    <div class="row"> 
                        <%
                            User User = (User) session.getAttribute("User");
                            if (User != null) {
                                String email = User.getUserEmail();
                                String password = User.getUserPassword();
                                String firstName = User.getUserFirstName();
                                String lastName = User.getUserLastName();
                                String occupation = User.getUserOccupation();
                                int yob = User.getUserDOB();
                                int phone = User.getUserPhone();
                                String gender = User.getUserGender();
                                String citizenship = User.getUserCitizenship();
                                String interest = User.getUserInterest();
                                String userFos = User.getUserFieldOfStudy();
                                String qualification = User.getUserHighestEducation();
                                String school = User.getUserSchool();
                                String description = User.getUserDescription();
                                String profilePic = User.getUserProfilePic();
                        %>
                        <div class="3u 12u(xsmall)" align="center"> 
                            <% if (profilePic != null) { %>
                            <!--<img src="images/jasmine.jpg" class = "avatar-image" height="80%" width="80%">-->
                            <img src="images/<%= profilePic %>" class = "avatar-image" alt ="avatar-image" height="80%" width="80%"> 
                             <!-- <img src="C:/temp/<%= profilePic %>" class = "avatar-image" alt ="avatar-image" height="80%" width="80%"> -->
                            <%    } else { %>
                            <img src="https://image.flaticon.com/icons/png/512/149/149071.png" class = "avatar-image" alt ="avatar-image" height="80%" width="80%">
                            <% } %>
                            <br>
                            <br>
                            <input type="file" name="profilePicture" id="file-1" class="inputfile inputfile-1" style="visibility:hidden" accept=".png, .jpg, .jpeg"/>
                            <label for="file-1"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg> 
                                <span>Upload Picture</span>
                            </label> 
                        </div>

                        <div class="9u 12u(xsmall)">
                            <div class="table-wrapper">
                                <table class="blank">

                                    <tbody>
                                        <tr>
                                            <td class="align-right"><b>User email</b></td>
                                            <td><% out.print(email);%> </td>
                                        </tr>
                                        <tr>
                                            <td class="align-right"><b>Password</b></td>
                                            <td><input type ="password" name ="password" value =" <% out.print(password);%>"/> </td>
                                        </tr>
                                        <tr>
                                            <td class="align-right"><b>First Name</b></td>
                                            <td><input type ="text" name ="firstName" value =" <% out.print(firstName);%>"/> </td>
                                        </tr>

                                        <tr>
                                            <td class="align-right"><b>Last Name</b></td>
                                            <td><input type ="text" name ="lastName" value =" <% out.print(lastName);%>"/></td>
                                        </tr>
                                        <tr>
                                            <td class="align-right"><b>Phone number</b></td>
                                            <td><input type ="number" name ="phone" value ="<%out.print(phone);%>"/></td>
                                        </tr>
                                        <tr>
                                            <td class="align-right"><b>Gender</b></td>
                                            <td><select name ="gender">
                                                    <%
                                                        if (gender.equals("F")) {
                                                    %>
                                                    <option value =" <% out.print(gender);%>"/>Female</option>
                                                    <option value ="Male"/>Male</option>
                                                    <%
                                                        }
                                                        if (gender.equals("M")) {
                                                    %>
                                                    <option value ="<% out.print(gender);%>"/>Male</option>
                                                    <option value ="Female"/>Female</option>                                                        
                                                    <%
                                                        }
                                                    %>

                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="align-right"><b>Citizenship</b></td>
                                            <td>
                                                <select name ="citizenship">
                                                    <option selected value ="<% out.print(citizenship);%>"/><% out.print(citizenship);%></option>
                                                    <option value="Singaporean">Singaporean</option>
                                                    <option value="Singapore PR">Singapore PR</option>
                                                    <option value="Afghan">Afghan</option>
                                                    <option value="Albanian">Albanian</option>
                                                    <option value="Algerian">Algerian</option>
                                                    <option value="American">American</option>
                                                    <option value="Andorran">Andorran</option>
                                                    <option value="Angolan">Angolan</option>
                                                    <option value="Antiguans">Antiguans</option>
                                                    <option value="Argentinean">Argentinean</option>
                                                    <option value="Armenian">Armenian</option>
                                                    <option value="Australian">Australian</option>
                                                    <option value="Austrian">Austrian</option>
                                                    <option value="Azerbaijani">Azerbaijani</option>
                                                    <option value="Bahamian">Bahamian</option>
                                                    <option value="Bahraini">Bahraini</option>
                                                    <option value="Bangladeshi">Bangladeshi</option>
                                                    <option value="Barbadian">Barbadian</option>
                                                    <option value="Barbudans">Barbudans</option>
                                                    <option value="Batswana">Batswana</option>
                                                    <option value="Belarusian">Belarusian</option>
                                                    <option value="Belgian">Belgian</option>
                                                    <option value="Belizean">Belizean</option>
                                                    <option value="Beninese">Beninese</option>
                                                    <option value="Bhutanese">Bhutanese</option>
                                                    <option value="Bolivian">Bolivian</option>
                                                    <option value="Bosnian">Bosnian</option>
                                                    <option value="Brazilian">Brazilian</option>
                                                    <option value="British">British</option>
                                                    <option value="Bruneian">Bruneian</option>
                                                    <option value="Bulgarian">Bulgarian</option>
                                                    <option value="Burkinabe">Burkinabe</option>
                                                    <option value="Burmese">Burmese</option>
                                                    <option value="Burundian">Burundian</option>
                                                    <option value="Cambodian">Cambodian</option>
                                                    <option value="Cameroonian">Cameroonian</option>
                                                    <option value="Canadian">Canadian</option>
                                                    <option value="Cape verdean">Cape Verdean</option>
                                                    <option value="Central african">Central African</option>
                                                    <option value="Chadian">Chadian</option>
                                                    <option value="Chilean">Chilean</option>
                                                    <option value="Chinese">Chinese</option>
                                                    <option value="Colombian">Colombian</option>
                                                    <option value="Comoran">Comoran</option>
                                                    <option value="Congolese">Congolese</option>
                                                    <option value="Costa rican">Costa Rican</option>
                                                    <option value="Croatian">Croatian</option>
                                                    <option value="Cuban">Cuban</option>
                                                    <option value="Cypriot">Cypriot</option>
                                                    <option value="Czech">Czech</option>
                                                    <option value="Canish">Danish</option>
                                                    <option value="Cjibouti">Djibouti</option>
                                                    <option value="Dominican">Dominican</option>
                                                    <option value="Dutch">Dutch</option>
                                                    <option value="East timorese">East Timorese</option>
                                                    <option value="Ecuadorean">Ecuadorean</option>
                                                    <option value="Egyptian">Egyptian</option>
                                                    <option value="Emirian">Emirian</option>
                                                    <option value="Equatorial guinean">Equatorial Guinean</option>
                                                    <option value="Eritrean">Eritrean</option>
                                                    <option value="Estonian">Estonian</option>
                                                    <option value="Ethiopian">Ethiopian</option>
                                                    <option value="Fijian">Fijian</option>
                                                    <option value="Filipino">Filipino</option>
                                                    <option value="Finnish">Finnish</option>
                                                    <option value="French">French</option>
                                                    <option value="Gabonese">Gabonese</option>
                                                    <option value="Gambian">Gambian</option>
                                                    <option value="Georgian">Georgian</option>
                                                    <option value="German">German</option>
                                                    <option value="Ghanaian">Ghanaian</option>
                                                    <option value="Greek">Greek</option>
                                                    <option value="Grenadian">Grenadian</option>
                                                    <option value="Guatemalan">Guatemalan</option>
                                                    <option value="Guinea-bissauan">Guinea-Bissauan</option>
                                                    <option value="Guinean">Guinean</option>
                                                    <option value="Guyanese">Guyanese</option>
                                                    <option value="Haitian">Haitian</option>
                                                    <option value="Herzegovinian">Herzegovinian</option>
                                                    <option value="Honduran">Honduran</option>
                                                    <option value="Hungarian">Hungarian</option>
                                                    <option value="Icelander">Icelander</option>
                                                    <option value="Indian">Indian</option>
                                                    <option value="Indonesian">Indonesian</option>
                                                    <option value="Iranian">Iranian</option>
                                                    <option value="Iraqi">Iraqi</option>
                                                    <option value="Irish">Irish</option>
                                                    <option value="Israeli">Israeli</option>
                                                    <option value="Italian">Italian</option>
                                                    <option value="Ivorian">Ivorian</option>
                                                    <option value="Jamaican">Jamaican</option>
                                                    <option value="Japanese">Japanese</option>
                                                    <option value="Jordanian">Jordanian</option>
                                                    <option value="Kazakhstani">Kazakhstani</option>
                                                    <option value="Kenyan">Kenyan</option>
                                                    <option value="Kittian and nevisian">Kittian and Nevisian</option>
                                                    <option value="Kuwaiti">Kuwaiti</option>
                                                    <option value="Kyrgyz">Kyrgyz</option>
                                                    <option value="Laotian">Laotian</option>
                                                    <option value="Latvian">Latvian</option>
                                                    <option value="Lebanese">Lebanese</option>
                                                    <option value="Liberian">Liberian</option>
                                                    <option value="Libyan">Libyan</option>
                                                    <option value="Liechtensteiner">Liechtensteiner</option>
                                                    <option value="Lithuanian">Lithuanian</option>
                                                    <option value="Luxembourger">Luxembourger</option>
                                                    <option value="Macedonian">Macedonian</option>
                                                    <option value="Malagasy">Malagasy</option>
                                                    <option value="Malawian">Malawian</option>
                                                    <option value="Malaysian">Malaysian</option>
                                                    <option value="Maldivan">Maldivan</option>
                                                    <option value="Malian">Malian</option>
                                                    <option value="Maltese">Maltese</option>
                                                    <option value="Marshallese">Marshallese</option>
                                                    <option value="Mauritanian">Mauritanian</option>
                                                    <option value="Mauritian">Mauritian</option>
                                                    <option value="Mexican">Mexican</option>
                                                    <option value="Micronesian">Micronesian</option>
                                                    <option value="Moldovan">Moldovan</option>
                                                    <option value="Monacan">Monacan</option>
                                                    <option value="Mongolian">Mongolian</option>
                                                    <option value="Moroccan">Moroccan</option>
                                                    <option value="Mosotho">Mosotho</option>
                                                    <option value="Motswana">Motswana</option>
                                                    <option value="Mozambican">Mozambican</option>
                                                    <option value="Namibian">Namibian</option>
                                                    <option value="Nauruan">Nauruan</option>
                                                    <option value="Nepalese">Nepalese</option>
                                                    <option value="New zealander">New Zealander</option>
                                                    <option value="Ni-vanuatu">Ni-Vanuatu</option>
                                                    <option value="Nicaraguan">Nicaraguan</option>
                                                    <option value="Nigerien">Nigerien</option>
                                                    <option value="North korean">North Korean</option>
                                                    <option value="Northern irish">Northern Irish</option>
                                                    <option value="Norwegian">Norwegian</option>
                                                    <option value="Omani">Omani</option>
                                                    <option value="Pakistani">Pakistani</option>
                                                    <option value="Palauan">Palauan</option>
                                                    <option value="Panamanian">Panamanian</option>
                                                    <option value="Papua new guinean">Papua New Guinean</option>
                                                    <option value="Paraguayan">Paraguayan</option>
                                                    <option value="Peruvian">Peruvian</option>
                                                    <option value="Polish">Polish</option>
                                                    <option value="Portuguese">Portuguese</option>
                                                    <option value="Qatari">Qatari</option>
                                                    <option value="Romanian">Romanian</option>
                                                    <option value="Russian">Russian</option>
                                                    <option value="Rwandan">Rwandan</option>
                                                    <option value="Saint lucian">Saint Lucian</option>
                                                    <option value="Salvadoran">Salvadoran</option>
                                                    <option value="Samoan">Samoan</option>
                                                    <option value="San marinese">San Marinese</option>
                                                    <option value="Sao tomean">Sao Tomean</option>
                                                    <option value="Saudi">Saudi</option>
                                                    <option value="Scottish">Scottish</option>
                                                    <option value="Senegalese">Senegalese</option>
                                                    <option value="Serbian">Serbian</option>
                                                    <option value="Seychellois">Seychellois</option>
                                                    <option value="Sierra leonean">Sierra Leonean</option>
                                                    <option value="Slovakian">Slovakian</option>
                                                    <option value="Slovenian">Slovenian</option>
                                                    <option value="Solomon islander">Solomon Islander</option>
                                                    <option value="Somali">Somali</option>
                                                    <option value="South african">South African</option>
                                                    <option value="South korean">South Korean</option>
                                                    <option value="Spanish">Spanish</option>
                                                    <option value="Sri lankan">Sri Lankan</option>
                                                    <option value="Sudanese">Sudanese</option>
                                                    <option value="Surinamer">Surinamer</option>
                                                    <option value="Swazi">Swazi</option>
                                                    <option value="Swedish">Swedish</option>
                                                    <option value="Swiss">Swiss</option>
                                                    <option value="Syrian">Syrian</option>
                                                    <option value="Taiwanese">Taiwanese</option>
                                                    <option value="Tajik">Tajik</option>
                                                    <option value="Tanzanian">Tanzanian</option>
                                                    <option value="Thai">Thai</option>
                                                    <option value="Togolese">Togolese</option>
                                                    <option value="Tongan">Tongan</option>
                                                    <option value="Trinidadian or tobagonian">Trinidadian or Tobagonian</option>
                                                    <option value="Tunisian">Tunisian</option>
                                                    <option value="Turkish">Turkish</option>
                                                    <option value="Tuvaluan">Tuvaluan</option>
                                                    <option value="Ugandan">Ugandan</option>
                                                    <option value="Ukrainian">Ukrainian</option>
                                                    <option value="Uruguayan">Uruguayan</option>
                                                    <option value="Uzbekistani">Uzbekistani</option>
                                                    <option value="Venezuelan">Venezuelan</option>
                                                    <option value="Vietnamese">Vietnamese</option>
                                                    <option value="Welsh">Welsh</option>
                                                    <option value="Yemenite">Yemenite</option>
                                                    <option value="Zambian">Zambian</option>
                                                    <option value="Zimbabwean">Zimbabwean</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="align-right"><b>Year of birth</b></td>
                                            <td>
                                                <select name = "yob">
                                                    <option selected value="<% out.print(yob);%>"><% out.print(yob);%></option>
                                                    <option value="2012">2012</option>
                                                    <option value="2011">2011</option>
                                                    <option value="2010">2010</option>
                                                    <option value="2009">2009</option>
                                                    <option value="2008">2008</option>
                                                    <option value="2007">2007</option>
                                                    <option value="2006">2006</option>
                                                    <option value="2005">2005</option>
                                                    <option value="2004">2004</option>
                                                    <option value="2003">2003</option>
                                                    <option value="2002">2002</option>
                                                    <option value="2001">2001</option>
                                                    <option value="2000">2000</option>
                                                    <option value="1999">1999</option>
                                                    <option value="1998">1998</option>
                                                    <option value="1997">1997</option>
                                                    <option value="1996">1996</option>
                                                    <option value="1995">1995</option>
                                                    <option value="1994">1994</option>
                                                    <option value="1993">1993</option>
                                                    <option value="1992">1992</option>
                                                    <option value="1991">1991</option>
                                                    <option value="1990">1990</option>
                                                    <option value="1989">1989</option>
                                                    <option value="1988">1988</option>
                                                    <option value="1987">1987</option>
                                                    <option value="1986">1986</option>
                                                    <option value="1985">1985</option>
                                                    <option value="1984">1984</option>
                                                    <option value="1983">1983</option>
                                                    <option value="1982">1982</option>
                                                    <option value="1981">1981</option>
                                                    <option value="1980">1980</option>
                                                    <option value="1979">1979</option>
                                                    <option value="1978">1978</option>
                                                    <option value="1977">1977</option>
                                                    <option value="1976">1976</option>
                                                    <option value="1975">1975</option>
                                                    <option value="1974">1974</option>
                                                    <option value="1973">1973</option>
                                                    <option value="1972">1972</option>
                                                    <option value="1971">1971</option>
                                                    <option value="1970">1970</option>
                                                    <option value="1969">1969</option>
                                                    <option value="1968">1968</option>
                                                    <option value="1967">1967</option>
                                                    <option value="1966">1966</option>
                                                    <option value="1965">1965</option>
                                                    <option value="1964">1964</option>
                                                    <option value="1963">1963</option>
                                                    <option value="1962">1962</option>
                                                    <option value="1961">1961</option>
                                                    <option value="1960">1960</option>
                                                    <option value="1959">1959</option>
                                                    <option value="1958">1958</option>
                                                    <option value="1957">1957</option>
                                                    <option value="1956">1956</option>
                                                    <option value="1955">1955</option>
                                                    <option value="1954">1954</option>
                                                    <option value="1953">1953</option>
                                                    <option value="1952">1952</option>
                                                    <option value="1951">1951</option>
                                                    <option value="1950">1950</option>
                                                    <option value="1949">1949</option>
                                                    <option value="1948">1948</option>
                                                    <option value="1947">1947</option>
                                                    <option value="1946">1946</option>
                                                    <option value="1945">1945</option>
                                                    <option value="1944">1944</option>
                                                    <option value="1943">1943</option>
                                                    <option value="1942">1942</option>
                                                    <option value="1941">1941</option>
                                                    <option value="1940">1940</option>
                                                    <option value="1939">1939</option>
                                                    <option value="1938">1938</option>
                                                    <option value="1937">1937</option>
                                                    <option value="1936">1936</option>
                                                    <option value="1935">1935</option>
                                                    <option value="1934">1934</option>
                                                    <option value="1933">1933</option>
                                                    <option value="1932">1932</option>
                                                    <option value="1931">1931</option>
                                                    <option value="1930">1930</option>
                                                    <option value="1929">1929</option>
                                                    <option value="1928">1928</option>
                                                    <option value="1927">1927</option>                                      
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="align-right"><b>Occupation</b></td>
                                            <td>
                                                <select name="occupation" >
                                                    <option selected value="<% out.print(occupation);%>"><% out.print(occupation);%></option>
                                                    <optgroup label="Healthcare Practitioners and Technical Occupations:">
                                                        <option value="Chiropractor">-  Chiropractor</option>
                                                        <option value="Dentist">-  Dentist</option>
                                                        <option value="Dietitian or Nutritionist">-  Dietitian or Nutritionist</option>
                                                        <option value="Optometrist">-  Optometrist</option>
                                                        <option value="Pharmacist">-  Pharmacist</option>
                                                        <option value="Physician">-  Physician</option>
                                                        <option value="Physician Assistant">-  Physician Assistant</option>
                                                        <option value="Podiatrist">-  Podiatrist</option>
                                                        <option value="Registered Nurse">-  Registered Nurse</option>
                                                        <option value="Therapist">-  Therapist</option>
                                                        <option value="Veterinarian">-  Veterinarian</option>
                                                        <option value="Health Technologist or Technician">-  Health Technologist or Technician</option>
                                                        <option value="Other Healthcare Practitioners and Technical Occupation">-  Other Healthcare Practitioners and Technical Occupation</option>
                                                    </optgroup>
                                                    <optgroup label="Healthcare Support Occupations:">
                                                        <option value="Nursing, Psychiatric, or Home Health Aide">-  Nursing, Psychiatric, or Home Health Aide</option>
                                                        <option value="Occupational and Physical Therapist Assistant or Aide">-  Occupational and Physical Therapist Assistant or Aide</option>
                                                        <option value="Other Healthcare Support Occupation">-  Other Healthcare Support Occupation</option>
                                                    </optgroup>
                                                    <optgroup label="Business, Executive, Management, and Financial Occupations:">
                                                        <option value="Chief Executive">-  Chief Executive</option>
                                                        <option value="General and Operations Manager">-  General and Operations Manager</option>
                                                        <option value="Advertising, Marketing, Promotions, Public Relations, and Sales Manager">-  Advertising, Marketing, Promotions, Public Relations, and Sales Manager</option>
                                                        <option value="Operations Specialties Manager (e.g., IT or HR Manager)">-  Operations Specialties Manager (e.g., IT or HR Manager)</option>
                                                        <option value="Construction Manager">-  Construction Manager</option>
                                                        <option value="Engineering Manager">-  Engineering Manager</option>
                                                        <option value="Accountant, Auditor">-  Accountant, Auditor</option>
                                                        <option value="Business Operations or Financial Specialist">-  Business Operations or Financial Specialist</option>
                                                        <option value="Business Owner">-  Business Owner</option>
                                                        <option value="Other Business, Executive, Management, Financial Occupation">-  Other Business, Executive, Management, Financial Occupation</option>
                                                    </optgroup>
                                                    <optgroup label="Architecture and Engineering Occupations:">
                                                        <option value="Architect, Surveyor, or Cartographer">-  Architect, Surveyor, or Cartographer</option>
                                                        <option value="Engineer">-  Engineer</option>
                                                        <option value="Other Architecture and Engineering Occupation">-  Other Architecture and Engineering Occupation</option>
                                                    </optgroup>
                                                    <optgroup label="Education, Training, and Library Occupations:">
                                                        <option value="Postsecondary Teacher (e.g., College Professor)">-  Postsecondary Teacher (e.g., College Professor)</option>
                                                        <option value="Primary, Secondary, or Special Education School Teacher">-  Primary, Secondary, or Special Education School Teacher</option>
                                                        <option value="Other Teacher or Instructor">-  Other Teacher or Instructor</option>
                                                        <option value="Other Education, Training, and Library Occupation">-  Other Education, Training, and Library Occupation</option>
                                                    </optgroup>
                                                    <optgroup label="Other Professional Occupations:">
                                                        <option value="Arts, Design, Entertainment, Sports, and Media Occupations">-  Arts, Design, Entertainment, Sports, and Media Occupations</option>
                                                        <option value="Computer Specialist, Mathematical Science">-  Computer Specialist, Mathematical Science</option>
                                                        <option value="Counselor, Social Worker, or Other Community and Social Service Specialist">-  Counselor, Social Worker, or Other Community and Social Service Specialist</option>
                                                        <option value="Lawyer, Judge">-  Lawyer, Judge</option>
                                                        <option value="Life Scientist (e.g., Animal, Food, Soil, or Biological Scientist, Zoologist)">-  Life Scientist (e.g., Animal, Food, Soil, or Biological Scientist, Zoologist)</option>
                                                        <option value="Physical Scientist (e.g., Astronomer, Physicist, Chemist, Hydrologist)">-  Physical Scientist (e.g., Astronomer, Physicist, Chemist, Hydrologist)</option>
                                                        <option value="Religious Worker (e.g., Clergy, Director of Religious Activities or Education)">-  Religious Worker (e.g., Clergy, Director of Religious Activities or Education)</option>
                                                        <option value="Social Scientist and Related Worker">-  Social Scientist and Related Worker</option>
                                                        <option value="Other Professional Occupation">-  Other Professional Occupation</option>
                                                    </optgroup>
                                                    <optgroup label="Office and Administrative Support Occupations:">
                                                        <option value="Supervisor of Administrative Support Workers">-  Supervisor of Administrative Support Workers</option>
                                                        <option value="Financial Clerk">-  Financial Clerk</option>
                                                        <option value="Secretary or Administrative Assistant">-  Secretary or Administrative Assistant</option>
                                                        <option value="Material Recording, Scheduling, and Dispatching Worker">-  Material Recording, Scheduling, and Dispatching Worker</option>
                                                        <option value="Other Office and Administrative Support Occupation">-  Other Office and Administrative Support Occupation</option>
                                                    </optgroup>
                                                    <optgroup label="Services Occupations:">
                                                        <option value="Protective Service (e.g., Fire Fighting, Police Officer, Correctional Officer)">-  Protective Service (e.g., Fire Fighting, Police Officer, Correctional Officer)</option>
                                                        <option value="Chef or Head Cook">-  Chef or Head Cook</option>
                                                        <option value="Cook or Food Preparation Worker">-  Cook or Food Preparation Worker</option>
                                                        <option value="Food and Beverage Serving Worker (e.g., Bartender, Waiter, Waitress)">-  Food and Beverage Serving Worker (e.g., Bartender, Waiter, Waitress)</option>
                                                        <option value="Building and Grounds Cleaning and Maintenance">-  Building and Grounds Cleaning and Maintenance</option>
                                                        <option value="Personal Care and Service (e.g., Hairdresser, Flight Attendant, Concierge)">-  Personal Care and Service (e.g., Hairdresser, Flight Attendant, Concierge)</option>
                                                        <option value="Sales Supervisor, Retail Sales">-  Sales Supervisor, Retail Sales</option>
                                                        <option value="Retail Sales Worker">-  Retail Sales Worker</option>
                                                        <option value="Insurance Sales Agent">-  Insurance Sales Agent</option>
                                                        <option value="Sales Representative">-  Sales Representative</option>
                                                        <option value="Real Estate Sales Agent">-  Real Estate Sales Agent</option>
                                                        <option value="Other Services Occupation">-  Other Services Occupation</option>
                                                    </optgroup>
                                                    <optgroup label="Agriculture, Maintenance, Repair, and Skilled Crafts Occupations:">
                                                        <option value="Construction and Extraction (e.g., Construction Laborer, Electrician)">-  Construction and Extraction (e.g., Construction Laborer, Electrician)</option>
                                                        <option value="Farming, Fishing, and Forestry">-  Farming, Fishing, and Forestry</option>
                                                        <option value="Installation, Maintenance, and Repair">-  Installation, Maintenance, and Repair</option>
                                                        <option value="Production Occupations">-  Production Occupations</option>
                                                        <option value="Other Agriculture, Maintenance, Repair, and Skilled Crafts Occupation">-  Other Agriculture, Maintenance, Repair, and Skilled Crafts Occupation</option>
                                                    </optgroup>
                                                    <optgroup label="Transportation Occupations:">
                                                        <option value="Aircraft Pilot or Flight Engineer">-  Aircraft Pilot or Flight Engineer</option>
                                                        <option value="Motor Vehicle Operator (e.g., Ambulance, Bus, Taxi, or Truck Driver)">-  Motor Vehicle Operator (e.g., Ambulance, Bus, Taxi, or Truck Driver)</option>
                                                        <option value="Other Transportation Occupation">-  Other Transportation Occupation</option>
                                                    </optgroup>
                                                    <optgroup label="Other Occupations:">
                                                        <option value="Military">-  Military</option>
                                                        <option value="Homemaker">-  Homemaker</option>
                                                        <option value="Student">-  Student</option>
                                                        <option value="Other Occupation">-  Other Occupation</option>
                                                        <option value="Don't Know">-  Don't Know</option>
                                                        <option value="Not Applicable">-  Not Applicable</option>
                                                    </optgroup>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="align-right"><b>Field of Study</b></td>
                                            <td>
                                                <select name="fos">
                                                    <option selected value="<%out.print(userFos);%>"><%out.print(userFos);%></option>
                                                    <%
                                                        ArrayList<String> allFieldOfStudy = FieldOfStudyDAO.getFieldOfStudies();

                                                        if (!allFieldOfStudy.isEmpty()) {
                                                            for (int i = 0; i < allFieldOfStudy.size(); i++) {
                                                                String fos = allFieldOfStudy.get(i);

                                                    %>
                                                    <option value="<%out.print(fos);%>"><%out.print(fos);%></option>
                                                    <%    }
                                                        }

                                                    %>
                                                </select> 
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="align-right"><b>Highest Qualification</b></td>
                                            <td>
                                                <select name="highest_qualification" >
                                                    <option selected value="<%out.print(qualification);%>"> <%out.print(qualification);%></option>
                                                    <option value="primary">Primary School</option>
                                                    <option value="secondary" >Secondary School</option>
                                                    <option value="post-secondary" >Post-secondary (non-tertiary) School</option>
                                                    <option value="polytechnic" >Polytechnic Diploma</option>
                                                    <option value="ite" >ITE</option>
                                                    <option value="bachelor" >Bachelor Degree</option>
                                                    <option value="postgraduate" >Postgraduate Diploma</option>
                                                    <option value="Masters/Doctorate" >Masters/Doctorate</option>
                                                </select> 
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="align-right"><b>School</b></td>
                                            <td><input type ="text" name ="school" value ="<% out.print(school);%>"/></td>
                                        </tr>
                                        <tr>
                                            <td class="align-right"><b>Interest</b></td>
                                            <td>
                                                <select name="interest" multiple style="height: 100px;">
                                                    <%
                                                        //user selected put in an arraylist
                                                        ArrayList<String> selectedInterestitems = new ArrayList<String>(Arrays.asList(interest.split("\\s*,\\s*")));

                                                        for (int i = 0; i < selectedInterestitems.size(); i++) {
                                                            String interestName = selectedInterestitems.get(i);
                                                    %>
                                                    <option selected value="<%out.print(interestName);%>"><%out.print(interestName);%></option>
                                                    <%
                                                        }
                                                        ArrayList<String> allUserInterest = InterestDAO.getInterests();
                                                        //remove the ones taken from the list
                                                        allUserInterest.removeAll(selectedInterestitems);
                                                        if (!allUserInterest.isEmpty()) {
                                                            for (int i = 0; i < allUserInterest.size(); i++) {
                                                                String interestList = allUserInterest.get(i);

                                                    %>
                                                    <option value="<%out.print(interestList);%>"><%out.print(interestList);%></option>
                                                    <%    }
                                                        }

                                                    %>
                                                </select> 

                                            </td>


                                        </tr>
                                        <tr>
                                            <td class="align-right"><b>Description</b></td>
                                            <td><textarea name ="description" rows="6"/><% out.print(description);%></textarea></td>
                                        </tr>

                                    </tbody>


                                </table>

                                <br>
                                <input type="hidden" name="userEmail" value="<%out.print(email);%>">
                                <input type="submit" value="Save" class="full_width">
                            </div>
                        </div>
                        <%
                            }
                        %> 

                </form>


            </div>
        </div>

    </section>



    <script src="js/custom-file-input.js"></script>
</body>
</html> 