
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
        <section id="login" class="wrapper">
            <div class="container">					
                <header class="major">
                    <h2>Sign up with your email</h2>
                </header> 
                <%
                    String ErrorMsg = (String) request.getAttribute("ErrorMsg");
                    if (ErrorMsg != null) {
                        out.println(ErrorMsg);
                    }
                %>
                <form action="signupServlet" method="post">
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
                            <input type ="text" name ="phone" placeholder ="Phone *"/>                                             
                        </div>

                        <div class="12u">
                            <br/><input type ="password" name ="password" placeholder ="Password *"/>
                        </div>
                        <div class="12u">
                            <input type ="password" name ="reenterPassword" placeholder ="Re-enter Password *"/>
                        </div>

                        <div class="6u 12u(xsmall)">
                            <br/><input type ="text" name ="occupation" placeholder ="Occupation *"/>
                        </div>
                        <div class="6u 12u(xsmall)">
                            <br/><input type ="text" name ="Age" placeholder ="Age"/>
                        </div>
                        <div class="6u 12u(xsmall)">
                            <input type ="text" name ="citizenship" placeholder ="Citizenship"/>
                        </div>
                        <div class="6u 12u(xsmall)">
                            <input type ="text" name ="school" placeholder ="Company/School"/>
                        </div>

                        <div class="12u">
                            <br/><input type ="text" name ="highest qualification" placeholder ="Highest Qualification"/>
                        </div>
                        <div class="6u 12u(xsmall)">
                            <input type ="text" name ="gradmonth" placeholder ="Expected Graduation (MM)"/>
                        </div>
                        <div class="6u 12u(xsmall)">
                            <input type ="text" name ="gradyear" placeholder ="Expected Graduation (YY)"/>
                        </div>

                        <div class="4u 12u(small)">
                            <h3>Fields of Study:</h3>
                            <input type="checkbox" name="field of Study" id="field of Study1" value="OPS">
                            <label for="field of Study1">Operations System</label>
                            <br/>
                            <input type="checkbox" name="field of Study" id="field of Study2" value="IT">
                            <label for="field of Study2">Information Technology</label>
                            <br/>
                            <input type="checkbox"name="field of Study" id="field of Study3" value="M101">
                            <label for="field of Study3">Marketing</label> 
                            <br/>
                            <input type="checkbox" name="field of Study" id="field of Study4" value="F101">
                            <label for="field of Study4">Finance</label> 
                        </div>

                        <div class="4u 12u(small)">
                            <h3>Language Proficiency:</h3>
                            <input type="checkbox" name="language" id="language1" value="Bahasa Melayu">
                            <label for="language1">Bahasa Melayu</label>
                            <br/>
                            <input type="checkbox" name="language" id="language2" value="Mandarin">
                            <label for="language2">Mandarin</label>
                            <br/>
                            <input type="checkbox" name="language" id="language3" value="English">
                            <label for="language3">English</label>                                         
                        </div>

                        <div class="4u 12u(small)">
                            <h3>Looking For:</h3>
                            <input type="checkbox" name="looking for" id="lookingfor1" value="Internship">
                            <label for="lookingfor1">Internship</label>
                            <br/>
                            <input type="checkbox" name="looking for" id="lookingfor2" value="Study Trip">
                            <label for="lookingfor2">Study Trip</label>                                                                          
                        </div>

                        <div class="12u">
                            <textarea name="message" placeholder="You can write a short description about yourself here!" rows="6"></textarea>
                        </div>

                        <div class="4u 12u(small)">
                            <h3>Interested in:</h3>                                         
                            <input type="checkbox" name="interest" id="interest1" value="Banks / Funds">
                            <label for="interest1">Banks / Funds</label>
                            <br/>
                            <input type="checkbox" name="interest" id="interest2" value="Engineering">
                            <label for="interest2">Engineering</label>                                                                         
                        </div>

                        <div>
                            <h3>Upload Resume and Profile Pic:</h3>

                            <input type="file" name="uploadedfile" id="file-1" class="inputfile inputfile-1"/>
                            <label for="file-1"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg> <span>Upload Resume</span></label> 

                            <br/>

                            <input type="file" name="file-1[]" id="file-2" class="inputfile inputfile-1"/>
                            <label for="file-2"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg> <span>Upload profile pic</span></label>                                                                     
                        </div>

                        <div class="12u">
                            <br/>
                            <ul class="actions">
                                <li><input type="submit" value="Submit" class="special" /></li>
                                <li><input type="reset" value="Reset" /></li>
                            </ul>
                        </div>
                    </div>
                </form>
            </div>
        </section>

        <!-- Footer -->
        <jsp:include page="footer.jsp" />
        
        <script src="js/custom-file-input.js"></script>
    </body>
</html> 