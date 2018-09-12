/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Dao.TripsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Lenovo
 */
@WebServlet(name = "addTrip", urlPatterns = {"/addTrip"})
public class addTrip extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        
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
        int tripID = Integer.parseInt(request.getParameter("tripID"));
        String tripTitle = request.getParameter("tripTitle");
        double tripPrice = Double.parseDouble(request.getParameter("tripPrice"));
        String tripItinerary = request.getParameter("tripIntinerary");
        String tripDescription = request.getParameter("tripDescription");
        String tripCountry = request.getParameter("tripCountry");
        String tripState = request.getParameter("tripState");
        Date tripStart = Date.valueOf(request.getParameter("tripStart"));
        Date tripEnd = Date.valueOf(request.getParameter("tripEnd"));
        int tripDuration = Integer.parseInt(request.getParameter("tripDuration"));        
        int tripActivation = Integer.parseInt(request.getParameter("tripActivation"));
        String tripInterest = request.getParameter("tripInterest");
        int tripTotalSignUp = Integer.parseInt(request.getParameter("tripTotalSignUp"));
        String tripPromo = request.getParameter("tripPromo");
        double tripPromoPercentage = Double.parseDouble(request.getParameter("tripPromoPercentage"));
        String text = "fail";
        if(TripsDAO.insertTrip(tripID, tripTitle, tripPrice, tripItinerary, tripDescription, tripCountry, tripState, tripStart, tripEnd, tripDuration, tripActivation, tripInterest, tripTotalSignUp, tripPromo, tripPromoPercentage)){
            text = "success";
        }
        response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
        response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
        response.getWriter().write(text);       // Write response body.
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
