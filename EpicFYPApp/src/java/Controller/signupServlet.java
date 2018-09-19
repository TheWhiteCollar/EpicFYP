/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Dao.UserDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
@WebServlet(name = "signupServlet", urlPatterns = {"/signupServlet"})
public class signupServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // retrieve user input
        String userEmail = request.getParameter("email");
        String userFirstName = request.getParameter("firstName");
        String userLastName = request.getParameter("lastName");
        String phone = request.getParameter("phone");
        int userPhone = Integer.parseInt(phone);
        String userGender = request.getParameter("gender");
        String userCitizenship = request.getParameter("citizenship");
        String yob = request.getParameter("yob");
        int yearOfBirth = Integer.parseInt(yob);
        //Date date = Date.valueOf("1995-08-26");
        //profile pic
        String userProfilePic = "pretty.jpg";
        String userInterest = request.getParameter("interest");
        String userPassword = request.getParameter("password");
        String userOccupation = request.getParameter("occupation");
        //resume
        String userResume = "MyResume.pdf";
        String userIsEmailConfirm = "pending"; // by right should be boolean
        String userHighestEducation = request.getParameter("highest_qualification");
        
        String[] fos = request.getParameterValues("fos");
        String userFieldOfStudy ="";
        for(int i = 0; i < fos.length; i ++){
            userFieldOfStudy += ""+ fos[i];
            if(i != fos.length-1){
                userFieldOfStudy += ", ";   
            }       
        }
        
        String userDescription = request.getParameter("message");
        String userSchool = request.getParameter("school");

        // validate fields are not empty and insert into database - should do it in frontend?
        if (!userFirstName.equals("") && !userLastName.equals("") && !userEmail.equals("") && !userPassword.equals("") && !userOccupation.equals("")) {

            // Insert into database
            Boolean inserted = UserDAO.addUser(userEmail, userFirstName, userLastName, userPhone, userGender, userCitizenship, yearOfBirth, userProfilePic, userInterest, userPassword, userOccupation, userResume, userIsEmailConfirm, userHighestEducation, userFieldOfStudy, userDescription, userSchool);

            if (inserted == true) {
                response.sendRedirect("successMessage.jsp?message=signup");
                return;
            } else {
                response.sendRedirect("signuppage.jsp");
                return;
            }
        }

        request.setAttribute("ErrorMsg", "Missing fields");
        request.getRequestDispatcher("signuppage.jsp").forward(request, response);

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
