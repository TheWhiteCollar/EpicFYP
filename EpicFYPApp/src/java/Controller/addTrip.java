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

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

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
        String tripTitle = request.getParameter("tripTitle");
        double tripPrice = Double.parseDouble(request.getParameter("tripPrice"));
        String tripItinerary = null;
        String tripDescription = request.getParameter("tripDescription");
        String tripCountry = request.getParameter("tripCountry");
        String tripState = request.getParameter("tripState");
        Date tripStart = Date.valueOf(request.getParameter("tripStart"));
        Date tripEnd = Date.valueOf(request.getParameter("tripEnd"));
        int tripDuration = Integer.parseInt(request.getParameter("tripDuration"));
        int tripActivation = Integer.parseInt(request.getParameter("tripActivation"));
        String tripInterest = request.getParameter("tripInterest");
        int tripTotalSignUp = Integer.parseInt(request.getParameter("tripTotalSignUp"));
        String tripPromo = null;
        double tripPromoPercentage = 0;
        String text = "fail";

        // For itinerary uploading
        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                for (FileItem item : multiparts) {
                    if (!item.isFormField()) {
                        String name = new File(item.getName()).getName();
                        tripItinerary = name;
                        //item.write(new File("../../../web/documents/itinerary" + File.separator + name));
                        item.write(new File("c:/temp" + File.separator + name));
                    }
                }
                //File uploaded successfully
                request.setAttribute("gurumessage", "File Uploaded Successfully");
            } catch (Exception ex) {
                request.setAttribute("gurumessage", "File Upload Failed due to " + ex);
            }
        } else {
            request.setAttribute("gurumessage", "No File found");
        }

        if (tripEnd.after(tripStart) && TripsDAO.insertTrip(tripTitle, tripPrice, tripItinerary, tripDescription, tripCountry, tripState, tripStart, tripEnd, tripDuration, tripActivation, tripInterest, tripTotalSignUp, tripPromo, tripPromoPercentage)) {
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
