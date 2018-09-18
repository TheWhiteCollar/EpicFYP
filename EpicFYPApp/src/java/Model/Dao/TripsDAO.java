/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Dao;

import Controller.ConnectionManager;
import Model.Entity.Trip;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/* Database sequence: TripStudent
    #1: tripUserEmail (varchar 50)
    #2: tripStudentPayment (double)
    #3: tripStudentStatus (varchar100)
    #4: tripStudentReview (varchar 500)
    #5: tripStudentRating (int 1)
    #6: tripID (int 11)
 */
public class TripsDAO {
    public static boolean insertStudent(String tripUserEmail, double tripStudentPayment, String tripStudentStatus, String tripStudentReview, int tripStudentRating, int tripID) {

        String sql = "INSERT INTO `tripstudent` (`tripUserEmail`, `tripStudentPayment`, `tripStudentStatus`, `tripStudentReview`, `tripStudentRating`, `tripID`) VALUES (?, ?, ?, ?, ?, ?)";

        try (
            Connection conn = ConnectionManager.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);) {
            stmt.setString(1, tripUserEmail);
            stmt.setDouble(2, tripStudentPayment);
            stmt.setString(3, tripStudentStatus);
            stmt.setString(4, tripStudentReview);
            stmt.setInt(5, tripStudentRating);
            stmt.setInt(6, tripID);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(TripsDAO.class.getName()).log(Level.WARNING, "Unable to insert trip, tripID = '" + tripID + "' studentEmail = '" + tripUserEmail + "'.", ex);
            return false;
        }

        return true;
    }

    // Update user table
    public static ArrayList<Trip> getTrips() {
        ArrayList<Trip> allTrips = new ArrayList<>();
        String sql1 = "SELECT * FROM tripstudent";
        HashMap<Integer, String> tripstudent = new HashMap<>();
        try (Connection conn = ConnectionManager.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql1);) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String tripUserEmail = rs.getString(1);
                int tripID = rs.getInt(6);
                if (!tripstudent.containsKey(tripID)) {
                    tripstudent.put(tripID, tripUserEmail);
                } else {
                    String result = tripstudent.get(tripID);
                    result += "," + tripUserEmail;
                    tripstudent.put(tripID, result);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(TripsDAO.class.getName()).log(Level.WARNING, "Cannot get tripstudent from db", ex);
        }

        String sql2 = "SELECT * FROM trip";
        try (Connection conn = ConnectionManager.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql2);) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                int tripID = rs.getInt(1);
                String tripUserEmail = "";
                if (tripstudent.containsKey(tripID)) {
                    tripUserEmail = tripstudent.get(tripID);
                }

                ArrayList<String> emails = convertEmailString(tripUserEmail);
                Trip trip = new Trip(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getDate(8), rs.getDate(9), rs.getInt(10), rs.getInt(11), rs.getString(12), rs.getInt(13), rs.getString(14), rs.getDouble(15), emails);
                allTrips.add(trip);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TripsDAO.class.getName()).log(Level.WARNING, "Cannot get all trips from database", ex);
        }
        return allTrips;
    }

    public static Trip getTrip(int tripID) {
        Trip trip = null;
        String sql1 = "SELECT * FROM tripstudent WHERE tripID = ?";
        String emailString = "";
        try (Connection conn = ConnectionManager.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql1);) {
            stmt.setInt(6, tripID);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String tripUserEmail = rs.getString(1);
                if (emailString.equals("")) {
                    emailString += tripUserEmail;
                } else {
                    emailString += "," + tripUserEmail;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(TripsDAO.class.getName()).log(Level.WARNING, "Cannot get trip with tripID: " + tripID, ex);
        }

        String sql2 = "SELECT * FROM trip WHERE tripID = ?";
        try (Connection conn = ConnectionManager.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql2);) {
            stmt.setInt(1, tripID);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                ArrayList<String> emails = convertEmailString(emailString);
                trip = new Trip(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getDate(8), rs.getDate(9), rs.getInt(10), rs.getInt(11), rs.getString(12), rs.getInt(13), rs.getString(14), rs.getDouble(15), emails);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TripsDAO.class.getName()).log(Level.WARNING, "Cannot get trip with tripID: " + tripID, ex);
        }
        return trip;
    }

    public static boolean deleteTrip(int tripID) {
        //delete the students
        String sql1 = "DELETE FROM tripstudent WHERE tripID=?";

        try (
            Connection conn = ConnectionManager.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql1);) {
            stmt.setInt(6, tripID);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(TripsDAO.class.getName()).log(Level.WARNING, "Unable to delete trip, tripID = '" + tripID, ex);
            return false;
        }

        //delete the trip
        String sql2 = "DELETE FROM trip WHERE tripID=?";

        try (
            Connection conn = ConnectionManager.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql2);) {
            stmt.setInt(1, tripID);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(TripsDAO.class.getName()).log(Level.WARNING, "Unable to delete trip, tripID = '" + tripID, ex);
            return false;
        }
        return true;
    }

    public static boolean insertTrip(String tripTitle, double tripPrice, String tripItinerary, String tripDescription, String tripCountry, String tripState, Date tripStart, Date tripEnd, int tripDuration, int tripActivation, String tripInterest, int tripTotalSignUp, String tripPromo, double tripPromoPercentage) {
        //get max tripID
        String sql1 = "SELECT CONVERT(MAX(CONVERT(tripID,UNSIGNED INTEGER)),CHAR(200)) FROM trip ";

        int maxTripID = 0;
        try (
            Connection conn = ConnectionManager.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql1);) {
            ResultSet rs = stmt.executeQuery();
            rs.next();
            maxTripID = rs.getInt(1);
            System.out.println("maxTrip " + maxTripID);

        } catch (SQLException ex) {
            Logger.getLogger(TripsDAO.class.getName()).log(Level.WARNING, "Unable to insert trip", ex);
            return false;
        }
        //insert the trip
        String sql2 = "INSERT INTO `trip` (`tripID`, `tripTitle`, `tripPrice`, `tripItinerary`, `tripDescription`,`tripCountry`, `tripState`, `tripStart`, `tripEnd`, `tripDuration`,`tripActivation`, `tripInterest`, `tripTotalSignUp`, `tripPromo`, `tripPromoPercentage`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
        maxTripID++;
        try (
            Connection conn = ConnectionManager.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql2);) {
            stmt.setInt(1, maxTripID);
            stmt.setString(2, tripTitle);
            stmt.setDouble(3, tripPrice);
            stmt.setString(4, tripItinerary);
            stmt.setString(5, tripDescription);
            stmt.setString(6, tripCountry);
            stmt.setString(7, tripState);
            stmt.setDate(8, tripStart);
            stmt.setDate(9, tripEnd);
            stmt.setInt(10, tripDuration);
            stmt.setInt(11, tripActivation);
            stmt.setString(12, tripInterest);
            stmt.setInt(13, tripTotalSignUp);
            stmt.setString(14, tripPromo);
            stmt.setDouble(15, tripPromoPercentage);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(TripsDAO.class.getName()).log(Level.WARNING, "Unable to insert trip", ex);
            return false;
        }
        return true;
    }

    public static ArrayList<String> convertEmailString(String emails) {
        if (emails.length() == 0) {
            return new ArrayList<>();
        }
        ArrayList<String> emailsAL = new ArrayList<>(Arrays.asList(emails.split(",")));
        System.out.println(emailsAL.size());
        System.out.println(emailsAL.get(0));
        return emailsAL;
    }

    /*
    public static ArrayList<Trip> filterTrips(String country, String rating, String price, String programme) {
        ArrayList<Trip> filteredTrips = new ArrayList<Trip>();
        int ratingNum = 0;
        if (rating.equals("Bad")) {
            ratingNum = 3;
        } else if (rating.equals("Good")) {
            ratingNum = 7;
        } else {
            ratingNum = 10;
        }
        String sql1 = "SELECT * FROM trip WHERE country=" + country + " OR programme=" + programme + "OR price=" + price + "OR rating>=" + ratingNum;
        try (Connection conn = ConnectionManager.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql1);) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Trip trip = new Trip(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getDate(8), rs.getDate(9),rs.getInt(10), rs.getInt(11), rs.getString(12), rs.getInt(13), rs.getString(14), rs.getDouble(15));
                filteredTrips.add(trip);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TripsDAO.class.getName()).log(Level.WARNING, "Cannot get trips with filters", ex);
        }
        return filteredTrips;
    } */

    // Add existing trips/bulk new trips
    //public static boolean addTrip(String tripTitle, double tripPrice, String tripItinerary, String tripDescription, String tripCountry, String tripState, Date tripStart, Date tripEnd, int tripDuration, int tripActivation, String tripInterest, int tripTotalSignUp, String tripPromo, double tripPromoPercentage) {
    public static boolean addTrip(String tripTitle, double tripPrice, String tripItinerary, String tripDescription, String tripCountry, String tripState, int tripDuration, int tripActivation, String tripInterest, int tripTotalSignUp, String tripPromo, double tripPromoPercentage) {

        String sql = "INSERT INTO trip (tripTitle, tripPrice, tripItinerary, tripDescription, tripCountry, tripState, tripStart, tripEnd, tripDuration, tripActivation, tripInterest, tripTotalSignUp, tripPromo, tripPromoPercentage) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

        try (Connection conn = ConnectionManager.getConnection()) {
            ;
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, tripTitle);
            stmt.setDouble(2, tripPrice);
            stmt.setString(3, tripItinerary);
            stmt.setString(4, tripDescription);
            stmt.setString(5, tripCountry);
            stmt.setString(6, tripState);
            stmt.setDate(7, Date.valueOf("2018-08-26"));
            stmt.setDate(8, Date.valueOf("2018-08-26"));
            stmt.setInt(9, tripDuration);
            stmt.setInt(10, tripActivation);
            stmt.setString(11, tripInterest);
            stmt.setInt(12, tripTotalSignUp);
            stmt.setString(13, tripPromo);
            stmt.setDouble(14, tripPromoPercentage);
            int result = stmt.executeUpdate();
            if (result == 0) {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.WARNING, "Trip is already registered!", ex);
        }
        return true;
    }

    // Add existing trips that students went/bulk new trips that students is going
    public static boolean addTripStudent(String tripUserEmail, int tripStudentPayment, String tripStudentStatus, String tripStudentReview, int tripStudentRating, int tripID) {

        String sql = "INSERT INTO tripstudent VALUES (?,?,?,?,?,?)";

        try (Connection conn = ConnectionManager.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            stmt.setString(1, tripUserEmail);
            stmt.setInt(2, tripStudentPayment);
            stmt.setString(3, tripStudentStatus);
            stmt.setString(4, tripStudentReview);
            stmt.setInt(5, tripStudentRating);
            stmt.setInt(6, tripID);
            int result = stmt.executeUpdate();
            if (result == 0) {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.WARNING, "Student who is going for this trip is already registered!", ex);
        }
        return true;
    }

    public static int getTripbyUser(String useremail) {
        int count = 0;
        String sql1 = "SELECT * FROM tripstudent WHERE studentEmail = ?";
        try (Connection conn = ConnectionManager.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql1);) {
            stmt.setString(1, useremail);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                count++;
            }
        } catch (SQLException ex) {
            Logger.getLogger(TripsDAO.class.getName()).log(Level.WARNING, "Cannot get trip with useremail: " + useremail, ex);
        }

        return count;
    }

}
