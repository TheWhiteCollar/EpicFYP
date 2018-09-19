/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author xiuwenhime
 */
public class updateUserServlet extends HttpServlet {

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
        String userFieldOfStudy = request.getParameter("fos");
        String userDescription = request.getParameter("message");
        String userSchool = request.getParameter("school");
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
