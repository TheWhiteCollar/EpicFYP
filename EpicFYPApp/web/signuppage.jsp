
<%@page import="Model.Dao.FieldOfStudyDAO"%>
<%@page import="Model.Dao.InterestDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!DOCTYPE html>

<html lang="en" class="no-js">
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
        <section id="login">
            <div class = "container">
                <div class = "container">

                    <%
                        String ErrorMsg = (String) request.getAttribute("ErrorMsg");
                        if (ErrorMsg != null) {
                            out.println(ErrorMsg);
                        }
                    %>

                    <form id="regForm" action="signupServlet" method="post">
                        <header class="major">
                            <h2>Sign up with your email</h2>
                        </header> 
                        <!-- One "tab" for each step in the form: -->

                        <div class="signup-tab">
                            <h2 class = "align-center">Account Information</h2>
                            <div class="row uniform 50%">
                                <div class="6u 12u(xsmall)">
                                    <input type ="text" name ="firstName" placeholder ="First name *"/>
                                </div>
                                <div class="6u 12u(xsmall)">
                                    <input type ="text" name ="lastName" placeholder = "Last name *"/>
                                </div>
                                <div class="6u 12u(xsmall)">
                                    <input type ="text" name ="email" placeholder ="Email*"/>
                                </div>
                                <div class="6u 12u(xsmall)">
                                    <input type ="number" name ="phone" placeholder ="Phone *"/>                                             
                                </div>

                                <div class="12u">
                                    <br/><input type ="password" name ="password" placeholder ="Password *"/>
                                </div>

                            </div>

                        </div>
                        <div class="signup-tab">
                            <h2 class = "align-center">User Information</h2>
                            <div class="row uniform 50%">              
                                <div class="6u 12u(xsmall)">
                                    <select name="occupation" >
                                        <option disabled selected value style="display:none"> - select an occupation - </option>
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
                                </div>
                                <div class="6u 12u(xsmall)">
                                    <input type ="text" name ="school" placeholder ="Company/School*"/>                          
                                </div>
                            </div>
                            </br>
                            <div class="row uniform 50%"> 

                                <div class="4u 12u(small)">
                                    <input type="radio" name="citizenship" id = "SG" value = "Singaporean" checked>
                                    <label for="SG">Singaporean</label>
                                </div>
                                <div class="4u 12u(small)">
                                    <input type="radio" name="citizenship" id ="SG_PR" value = "Singapore PR">
                                    <label for="SG_PR">Singapore PR</label>
                                </div>
                                <div class="4u 12u(small)">
                                    <input type="radio" name="citizenship" id ="other">
                                    <label for="other">
                                        <select name="citizenship" style = "height: 1.9em">
                                            <option disabled selected value style="display:none"> - Other - </option>
                                            <option value="afghan">Afghan</option>
                                            <option value="albanian">Albanian</option>
                                            <option value="algerian">Algerian</option>
                                            <option value="american">American</option>
                                            <option value="andorran">Andorran</option>
                                            <option value="angolan">Angolan</option>
                                            <option value="antiguans">Antiguans</option>
                                            <option value="argentinean">Argentinean</option>
                                            <option value="armenian">Armenian</option>
                                            <option value="australian">Australian</option>
                                            <option value="austrian">Austrian</option>
                                            <option value="azerbaijani">Azerbaijani</option>
                                            <option value="bahamian">Bahamian</option>
                                            <option value="bahraini">Bahraini</option>
                                            <option value="bangladeshi">Bangladeshi</option>
                                            <option value="barbadian">Barbadian</option>
                                            <option value="barbudans">Barbudans</option>
                                            <option value="batswana">Batswana</option>
                                            <option value="belarusian">Belarusian</option>
                                            <option value="belgian">Belgian</option>
                                            <option value="belizean">Belizean</option>
                                            <option value="beninese">Beninese</option>
                                            <option value="bhutanese">Bhutanese</option>
                                            <option value="bolivian">Bolivian</option>
                                            <option value="bosnian">Bosnian</option>
                                            <option value="brazilian">Brazilian</option>
                                            <option value="british">British</option>
                                            <option value="bruneian">Bruneian</option>
                                            <option value="bulgarian">Bulgarian</option>
                                            <option value="burkinabe">Burkinabe</option>
                                            <option value="burmese">Burmese</option>
                                            <option value="burundian">Burundian</option>
                                            <option value="cambodian">Cambodian</option>
                                            <option value="cameroonian">Cameroonian</option>
                                            <option value="canadian">Canadian</option>
                                            <option value="cape verdean">Cape Verdean</option>
                                            <option value="central african">Central African</option>
                                            <option value="chadian">Chadian</option>
                                            <option value="chilean">Chilean</option>
                                            <option value="chinese">Chinese</option>
                                            <option value="colombian">Colombian</option>
                                            <option value="comoran">Comoran</option>
                                            <option value="congolese">Congolese</option>
                                            <option value="costa rican">Costa Rican</option>
                                            <option value="croatian">Croatian</option>
                                            <option value="cuban">Cuban</option>
                                            <option value="cypriot">Cypriot</option>
                                            <option value="czech">Czech</option>
                                            <option value="danish">Danish</option>
                                            <option value="djibouti">Djibouti</option>
                                            <option value="dominican">Dominican</option>
                                            <option value="dutch">Dutch</option>
                                            <option value="east timorese">East Timorese</option>
                                            <option value="ecuadorean">Ecuadorean</option>
                                            <option value="egyptian">Egyptian</option>
                                            <option value="emirian">Emirian</option>
                                            <option value="equatorial guinean">Equatorial Guinean</option>
                                            <option value="eritrean">Eritrean</option>
                                            <option value="estonian">Estonian</option>
                                            <option value="ethiopian">Ethiopian</option>
                                            <option value="fijian">Fijian</option>
                                            <option value="filipino">Filipino</option>
                                            <option value="finnish">Finnish</option>
                                            <option value="french">French</option>
                                            <option value="gabonese">Gabonese</option>
                                            <option value="gambian">Gambian</option>
                                            <option value="georgian">Georgian</option>
                                            <option value="german">German</option>
                                            <option value="ghanaian">Ghanaian</option>
                                            <option value="greek">Greek</option>
                                            <option value="grenadian">Grenadian</option>
                                            <option value="guatemalan">Guatemalan</option>
                                            <option value="guinea-bissauan">Guinea-Bissauan</option>
                                            <option value="guinean">Guinean</option>
                                            <option value="guyanese">Guyanese</option>
                                            <option value="haitian">Haitian</option>
                                            <option value="herzegovinian">Herzegovinian</option>
                                            <option value="honduran">Honduran</option>
                                            <option value="hungarian">Hungarian</option>
                                            <option value="icelander">Icelander</option>
                                            <option value="indian">Indian</option>
                                            <option value="indonesian">Indonesian</option>
                                            <option value="iranian">Iranian</option>
                                            <option value="iraqi">Iraqi</option>
                                            <option value="irish">Irish</option>
                                            <option value="israeli">Israeli</option>
                                            <option value="italian">Italian</option>
                                            <option value="ivorian">Ivorian</option>
                                            <option value="jamaican">Jamaican</option>
                                            <option value="japanese">Japanese</option>
                                            <option value="jordanian">Jordanian</option>
                                            <option value="kazakhstani">Kazakhstani</option>
                                            <option value="kenyan">Kenyan</option>
                                            <option value="kittian and nevisian">Kittian and Nevisian</option>
                                            <option value="kuwaiti">Kuwaiti</option>
                                            <option value="kyrgyz">Kyrgyz</option>
                                            <option value="laotian">Laotian</option>
                                            <option value="latvian">Latvian</option>
                                            <option value="lebanese">Lebanese</option>
                                            <option value="liberian">Liberian</option>
                                            <option value="libyan">Libyan</option>
                                            <option value="liechtensteiner">Liechtensteiner</option>
                                            <option value="lithuanian">Lithuanian</option>
                                            <option value="luxembourger">Luxembourger</option>
                                            <option value="macedonian">Macedonian</option>
                                            <option value="malagasy">Malagasy</option>
                                            <option value="malawian">Malawian</option>
                                            <option value="malaysian">Malaysian</option>
                                            <option value="maldivan">Maldivan</option>
                                            <option value="malian">Malian</option>
                                            <option value="maltese">Maltese</option>
                                            <option value="marshallese">Marshallese</option>
                                            <option value="mauritanian">Mauritanian</option>
                                            <option value="mauritian">Mauritian</option>
                                            <option value="mexican">Mexican</option>
                                            <option value="micronesian">Micronesian</option>
                                            <option value="moldovan">Moldovan</option>
                                            <option value="monacan">Monacan</option>
                                            <option value="mongolian">Mongolian</option>
                                            <option value="moroccan">Moroccan</option>
                                            <option value="mosotho">Mosotho</option>
                                            <option value="motswana">Motswana</option>
                                            <option value="mozambican">Mozambican</option>
                                            <option value="namibian">Namibian</option>
                                            <option value="nauruan">Nauruan</option>
                                            <option value="nepalese">Nepalese</option>
                                            <option value="new zealander">New Zealander</option>
                                            <option value="ni-vanuatu">Ni-Vanuatu</option>
                                            <option value="nicaraguan">Nicaraguan</option>
                                            <option value="nigerien">Nigerien</option>
                                            <option value="north korean">North Korean</option>
                                            <option value="northern irish">Northern Irish</option>
                                            <option value="norwegian">Norwegian</option>
                                            <option value="omani">Omani</option>
                                            <option value="pakistani">Pakistani</option>
                                            <option value="palauan">Palauan</option>
                                            <option value="panamanian">Panamanian</option>
                                            <option value="papua new guinean">Papua New Guinean</option>
                                            <option value="paraguayan">Paraguayan</option>
                                            <option value="peruvian">Peruvian</option>
                                            <option value="polish">Polish</option>
                                            <option value="portuguese">Portuguese</option>
                                            <option value="qatari">Qatari</option>
                                            <option value="romanian">Romanian</option>
                                            <option value="russian">Russian</option>
                                            <option value="rwandan">Rwandan</option>
                                            <option value="saint lucian">Saint Lucian</option>
                                            <option value="salvadoran">Salvadoran</option>
                                            <option value="samoan">Samoan</option>
                                            <option value="san marinese">San Marinese</option>
                                            <option value="sao tomean">Sao Tomean</option>
                                            <option value="saudi">Saudi</option>
                                            <option value="scottish">Scottish</option>
                                            <option value="senegalese">Senegalese</option>
                                            <option value="serbian">Serbian</option>
                                            <option value="seychellois">Seychellois</option>
                                            <option value="sierra leonean">Sierra Leonean</option>
                                            <option value="slovakian">Slovakian</option>
                                            <option value="slovenian">Slovenian</option>
                                            <option value="solomon islander">Solomon Islander</option>
                                            <option value="somali">Somali</option>
                                            <option value="south african">South African</option>
                                            <option value="south korean">South Korean</option>
                                            <option value="spanish">Spanish</option>
                                            <option value="sri lankan">Sri Lankan</option>
                                            <option value="sudanese">Sudanese</option>
                                            <option value="surinamer">Surinamer</option>
                                            <option value="swazi">Swazi</option>
                                            <option value="swedish">Swedish</option>
                                            <option value="swiss">Swiss</option>
                                            <option value="syrian">Syrian</option>
                                            <option value="taiwanese">Taiwanese</option>
                                            <option value="tajik">Tajik</option>
                                            <option value="tanzanian">Tanzanian</option>
                                            <option value="thai">Thai</option>
                                            <option value="togolese">Togolese</option>
                                            <option value="tongan">Tongan</option>
                                            <option value="trinidadian or tobagonian">Trinidadian or Tobagonian</option>
                                            <option value="tunisian">Tunisian</option>
                                            <option value="turkish">Turkish</option>
                                            <option value="tuvaluan">Tuvaluan</option>
                                            <option value="ugandan">Ugandan</option>
                                            <option value="ukrainian">Ukrainian</option>
                                            <option value="uruguayan">Uruguayan</option>
                                            <option value="uzbekistani">Uzbekistani</option>
                                            <option value="venezuelan">Venezuelan</option>
                                            <option value="vietnamese">Vietnamese</option>
                                            <option value="welsh">Welsh</option>
                                            <option value="yemenite">Yemenite</option>
                                            <option value="zambian">Zambian</option>
                                            <option value="zimbabwean">Zimbabwean</option>
                                        </select>
                                    </label>
                                </div>
                            </div>
                            </br>
                            <div class="row uniform 50%"> 

                                <div class="6u 12u(xsmall)">
                                    <select name = "yob">
                                        <option disabled selected value style="display:none"> - Year of birth - </option>
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
                                </div>

                                <div class="6u 12u(xsmall)">
                                    <select name="highest_qualification" >
                                        <option disabled selected value style="display:none"> - Highest Qualification - </option>
                                        <option value="primary">Primary School</option>
                                        <option value="secondary" >Secondary School</option>
                                        <option value="post-secondary" >Post-secondary (non-tertiary) School</option>
                                        <option value="polytechnic" >Polytechnic Diploma</option>
                                        <option value="ite" >ITE</option>
                                        <option value="bachelor" >Bachelor Degree</option>
                                        <option value="postgraduate" >Postgraduate Diploma</option>
                                        <option value="Masters/Doctorate" >Masters/Doctorate</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row uniform 50%"> 
                                <div class="12u">
                                    <select name="gender" >
                                        <option disabled selected value style="display:none"> - select your gender - </option>
                                        <option value="M" >Male</option>
                                        <option value="F" >Female</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="signup-tab">
                            <h2 class = "align-center">User Interests</h2>
                            <p class = "align-center" style="color: red;font-weight: bold;">Note: Press Ctrl or Command key to select multiple options</p>
                            <div class="row uniform 50%">   
                                <div class="6u 12u(xsmall)">
                                    <h3>Field of Study interested in:</h3> 
                                    <select name="fos">
                                        <option disabled selected value style="display:none"> - Field of Study interests - </option>
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


                                </div>
                                <div class="6u 12u(xsmall)">
                                    <h3>Study Trips interested in:</h3> 
                                    <select name="interest" multiple="multiple" style="height: 200px;">
                                        <option disabled selected value style="display:none"> - Field of Study interests - </option>
                                        <%                                            
                                            ArrayList<String> allInterests = InterestDAO.getInterests();

                                            if (!allInterests.isEmpty()) {
                                                for (int i = 0; i < allInterests.size(); i++) {
                                                    String interests = allInterests.get(i);

                                        %>
                                        <option value="<%out.print(interests);%>"><%out.print(interests);%></option>
                                        <%    }
                                            }

                                        %>
                                    </select>                                  
                                </div>
                            </div>

                        </div>
                </div>

                <div class="signup-tab">
                    <h2 class = "align-center">Getting to know you</h2>
                    <div class ="row">
                        <div class ="12u 12u(xsmall)">
                            <textarea name="message" placeholder="Short description of yourself" rows="6"></textarea>
                        </div>

                    </div>
                </div>
                </br>
                <div style="overflow:auto;">
                    <div style="float:left;">
                        <button type="button" id="prevBtn" class = "button" onclick="nextPrev(-1)">Previous</button>
                    </div>

                    <div style="float:right;">
                        <button type="button" id="nextBtn" class = "button" onclick="nextPrev(1)">Next</button>
                    </div>
                </div>
                <!-- Circles which indicates the steps of the form: -->
                <div style="text-align:center;">
                    <span class="step"></span>
                    <span class="step"></span>
                    <span class="step"></span>
                    <span class="step"></span>
                </div>
                </form> 
            </div>

        </section>


        <!-- Footer -->
        <jsp:include page="footer.jsp" />


        <script>
            var currentTab = 0; // Current tab is set to be the first tab (0)
            showTab(currentTab); // Display the crurrent tab

            function showTab(n) {
                // This function will display the specified tab of the form...
                var x = document.getElementsByClassName("signup-tab");
                x[n].style.display = "block";
                //... and fix the Previous/Next buttons:
                if (n == 0) {
                    document.getElementById("prevBtn").style.display = "none";
                } else {
                    document.getElementById("prevBtn").style.display = "inline";
                }
                if (n == (x.length - 1)) {
                    document.getElementById("nextBtn").innerHTML = "Submit";
                } else {
                    document.getElementById("nextBtn").innerHTML = "Next";
                }
                //... and run a function that will display the correct step indicator:
                fixStepIndicator(n)
            }

            function nextPrev(n) {
                // This function will figure out which tab to display
                var x = document.getElementsByClassName("signup-tab");
                // Exit the function if any field in the current tab is invalid:
                if (n == 1 && !validateForm())
                    return false;
                // Hide the current tab:
                x[currentTab].style.display = "none";
                // Increase or decrease the current tab by 1:
                currentTab = currentTab + n;
                // if you have reached the end of the form...
                if (currentTab >= x.length) {
                    // ... the form gets submitted:
                    document.getElementById("regForm").submit();
                    return false;
                }
                // Otherwise, display the correct tab:
                showTab(currentTab);
            }

            function validateForm() {
                // This function deals with validation of the form fields
                var x, y, i, valid = true;
                x = document.getElementsByClassName("signup-tab");
                y = x[currentTab].getElementsByTagName("input");
                // A loop that checks every input field in the current tab:
                for (i = 0; i < y.length; i++) {
                    // If a field is empty...
                    if (y[i].value == "") {
                        // add an "invalid" class to the field:
                        y[i].className += " invalid";
                        // and set the current valid status to false
                        valid = false;
                    }
                }
                // If the valid status is true, mark the step as finished and valid:
                if (valid) {
                    document.getElementsByClassName("step")[currentTab].className += " finish";
                }
                return valid; // return the valid status
            }

            function fixStepIndicator(n) {
                // This function removes the "active" class of all steps...
                var i, x = document.getElementsByClassName("step");
                for (i = 0; i < x.length; i++) {
                    x[i].className = x[i].className.replace(" active", "");
                }
                //... and adds the "active" class on the current step:
                x[n].className += " active";
            }
        </script>
    </body>
</html> 