/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Dao.TripsDAO;
import Model.Dao.UserDAO;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.Scanner;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author User
 */
@MultipartConfig
public class AdminBootstrapServlet extends HttpServlet {

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

        final PrintWriter writer = response.getWriter();

        try {

            // Create path components to save the file -- Users
            final Part filePartUser = request.getPart("updateUsers");
            InputStream fileContentUser = filePartUser.getInputStream();
            if (fileContentUser != null) {
                Scanner sc = new Scanner(fileContentUser);
                writer.println("You are on the way woohoo -- Users");
                String line = sc.nextLine();
                while (sc.hasNextLine()) {
                    line = sc.nextLine();
                    String[] user = line.split(",");
                    String userEmail = user[0];
                    String userFirstName = user[1];
                    String userLastName = user[2];
                    int userPhone = Integer.parseInt(user[3]);
                    String userGender = user[4];
                    String userCitizenship = user[5];
                    Date date = Date.valueOf("1995-08-26");
                    String userProfilePic = user[7];
                    String userInterest = user[8];
                    String userPassword = user[9];
                    String userOccupation = user[10];
                    String userResume = user[11];
                    String userIsEmailConfirm = user[12]; // by right should be boolean
                    String userHighestEducation = user[13];
                    String userFieldOfStudy = user[14];

                    int count = 0;
                    count = UserDAO.getCurrentRows();

                    // Insert into database
                    Boolean inserted = UserDAO.addUser(count, userEmail, userFirstName, userLastName, userPhone, userGender, userCitizenship, date, userProfilePic, userInterest, userPassword, userOccupation, userResume, userIsEmailConfirm, userHighestEducation, userFieldOfStudy);

                    if (inserted == true) {
                        count++;
                    } 
                }
            } else {
                writer.println("Haiz");
            }

            /*
            // Create path components to save the file -- Trips
            final Part filePartTrip = request.getPart("updateTrips");
            InputStream fileContentTrip = filePartTrip.getInputStream();
            if (fileContentTrip != null) {
                Scanner sc = new Scanner(fileContentTrip);
                writer.println("You are on the way woohoo -- Trips");
                String line = sc.nextLine();
                while (sc.hasNextLine()) {
                    line = sc.nextLine();
                    String[] trip = line.split(",");
                    String tripID = trip[0];
                    String programme = trip[1];
                    String price = trip[2];
                    String ratings = trip[3];
                    String country = trip[4];
                    // to include dates
                    String tripDuration = trip[7];
                    if (TripsDAO.addTrip(tripID, programme, price, ratings, country, tripDuration)) {
                        writer.println("Trip Successfully updated");
                    } else {
                        writer.println("Not inserted into database");
                    }
                }
            } else {
                writer.println("Haiz");
            }

            // Create path components to save the file -- tripstudent
            final Part filePartTripStudent = request.getPart("updateTripsUsersSignedUpFor");
            InputStream fileContentTripStudent = filePartTripStudent.getInputStream();
            if (fileContentTripStudent != null) {
                Scanner sc = new Scanner(fileContentTripStudent);
                writer.println("You are on the way woohoo -- TripStudent");
                String line = sc.nextLine();
                while (sc.hasNextLine()) {
                    line = sc.nextLine();
                    String[] tripStudent = line.split(",");
                    String tripID = tripStudent[0];
                    String studentEmail = tripStudent[1];
                    if (TripsDAO.addTripStudent(tripID, studentEmail)) {
                        writer.println("TripStudent Successfully updated");
                    } else {
                        writer.println("Not inserted into database");
                    }
                }
            } else {
                writer.println("Haiz");
            }
            */

            request.setAttribute("Success_Msg", "Database successfully updated");
            request.getRequestDispatcher("AdminPortal_bootstrap.jsp").forward(request, response);

        } catch (FileNotFoundException fne) {
            writer.println("Updates fails");
        }

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
