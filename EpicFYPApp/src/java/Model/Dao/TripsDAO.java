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

/**
 *
 * @author Lenovo
 */
public class TripsDAO {
    // Get user and their details with userid and password
    public static boolean insertStudent(String studentEmail, String tripID) {

        String sql = "INSERT INTO `tripstudent` (`tripID`, `studentEmail`) VALUES (?, ?)";

        try (
                Connection conn = ConnectionManager.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql);
            ) {
            stmt.setString(1, tripID);
            stmt.setString(2, studentEmail);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(TripsDAO.class.getName()).log(Level.WARNING, "Unable to insert trip, tripID = '" + tripID + "' studentEmail = '" + studentEmail + "'.", ex);
            return false;
        }

        return true;
    }

    // Update user table
    public static ArrayList<Trip> getTrips() {
        ArrayList<Trip> allTrips = new ArrayList<>();
        String sql1 = "SELECT * FROM tripstudent";
        HashMap<String, String> tripstudent = new HashMap<>();
        try (Connection conn = ConnectionManager.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql1);) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String tripID = rs.getString(1);
                String studentEmail = rs.getString(2);
                if(!tripstudent.containsKey(tripID)){
                    tripstudent.put(tripID,studentEmail);
                } else {
                    String result = tripstudent.get(tripID);
                    result+=","+studentEmail;
                    tripstudent.put(tripID, result);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(TripsDAO.class.getName()).log(Level.WARNING, "Cannot get tripstudent from db" , ex);
        }
        
        String sql2 = "SELECT * FROM trip";
        try (Connection conn = ConnectionManager.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql2);) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String tripID = rs.getString(1);
                String emailString = "";
                if(tripstudent.containsKey(tripID)){
                    emailString = tripstudent.get(tripID);
                }
                ArrayList<String> emails = convertEmailString(emailString);
                Trip trip = new Trip(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8), emails);
                allTrips.add(trip);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TripsDAO.class.getName()).log(Level.WARNING, "Cannot get all trips from database" , ex);
        }
        return allTrips;
    }
    
    public static Trip getTrip(String tripID) {
        Trip trip = null;
        String sql1 = "SELECT * FROM tripstudent WHERE tripID = ?";
        String emailString = "";
        try (Connection conn = ConnectionManager.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql1);) {
            stmt.setString(1, tripID);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String studentEmail = rs.getString(2);
                if(emailString==""){
                    emailString +=studentEmail;
                } else {
                    emailString +="," + studentEmail;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(TripsDAO.class.getName()).log(Level.WARNING, "Cannot get trip with tripID: " + tripID , ex);
        }
        
        String sql2 = "SELECT * FROM trip WHERE tripID = ?";
        try (Connection conn = ConnectionManager.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql2);) {
            stmt.setString(1, tripID);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                ArrayList<String> emails = convertEmailString(emailString);
                trip = new Trip(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8), emails);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TripsDAO.class.getName()).log(Level.WARNING, "Cannot get trip with tripID: " + tripID , ex);
        }
        return trip;
    }
    
    public static boolean deleteTrip(String tripID) {
        
        //delete the students
        String sql1 = "DELETE FROM tripstudent WHERE tripID=?";

        try (
                Connection conn = ConnectionManager.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql1);
            ) {
            stmt.setString(1, tripID);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(TripsDAO.class.getName()).log(Level.WARNING, "Unable to delete trip, tripID = '" + tripID, ex);
            return false;
        }

        //delete the trip
        String sql2 = "DELETE FROM trip WHERE tripID=?";

        try (
                Connection conn = ConnectionManager.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql2);
            ) {
            stmt.setString(1, tripID);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(TripsDAO.class.getName()).log(Level.WARNING, "Unable to delete trip, tripID = '" + tripID, ex);
            return false;
        }
        
        return true;
    }
    
    public static boolean insertTrip(String country, String programme, String price, int rating, String duration, Date startDate, Date endDate) {
        
        //get max tripID
        String sql1 = "SELECT MAX(tripID) FROM trip";

        int tripID = 0;
        try (
                Connection conn = ConnectionManager.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql1);
            ) {
            ResultSet rs = stmt.executeQuery();
            rs.next();
            tripID = Integer.parseInt(rs.getString(1));
        } catch (SQLException ex) {
            Logger.getLogger(TripsDAO.class.getName()).log(Level.WARNING, "Unable to insert trip", ex);
            return false;
        }

        //insert the trip
        String sql2 = "INSERT INTO `trip` (`tripID`, `programme`, `price`, `ratings`, `country`, `tripStart`, `tripEnd`, `tripDuration`) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
        tripID++;
        String tripIDString = "" + tripID;
        try (
                Connection conn = ConnectionManager.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql2);
            ) {
            stmt.setString(1, tripIDString);
            stmt.setString(2, programme);
            stmt.setString(3, price);
            stmt.setInt(4, rating);
            stmt.setString(5, country);
            stmt.setDate(6, startDate);
            stmt.setDate(7, endDate);
            stmt.setString(8, duration);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(TripsDAO.class.getName()).log(Level.WARNING, "Unable to insert trip", ex);
            return false;
        }
        
        return true;
    }
    
    public static ArrayList<String> convertEmailString(String emails) {
        if(emails.length()==0){
            return new ArrayList<>();
        }
        ArrayList<String> emailsAL = new ArrayList<>(Arrays.asList(emails.split(",")));
        System.out.println(emailsAL.size());
        System.out.println(emailsAL.get(0));
        return emailsAL;
    }
}