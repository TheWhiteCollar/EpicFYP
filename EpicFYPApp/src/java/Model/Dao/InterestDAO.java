/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Dao;

import Controller.ConnectionManager;
import Model.Entity.Trip;
import Model.Entity.User;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class InterestDAO {

    public static ArrayList<String> getInterests() {

        ArrayList<String> interestNames = new ArrayList<>();
        String sql = "SELECT * FROM interest";

        try (Connection conn = ConnectionManager.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                interestNames.add(rs.getString(1));
            }
        } catch (SQLException ex) {
            Logger.getLogger(InterestDAO.class.getName()).log(Level.WARNING, "Unable to retrieve interests", ex);
        }

        return interestNames;
    }

    public static boolean addInterest(String interestName) {

        String sql = "INSERT INTO interest (interestName) VALUES (?)";

        try (Connection conn = ConnectionManager.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            stmt.setString(1, interestName);
            int result = stmt.executeUpdate();
            if (result == 0) {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(InterestDAO.class.getName()).log(Level.WARNING, "interest already exist!", ex);
        }
        return true;
    }

    //*not complete, need to delete from user and trip tables
    public static boolean deleteInterest(String interestName) {
        String sql = "DELETE FROM interest WHERE interestName=?";

        try (
                Connection conn = ConnectionManager.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            stmt.setString(1, interestName);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(InterestDAO.class.getName()).log(Level.WARNING, "Unable to delete interest, interestName = '" + interestName, ex);
            return false;
        }

        //update interests in user table   
        ArrayList<User> allUsers = UserDAO.getAllUsers();
        for (int i = 0; i < allUsers.size(); i++) {
            User u = allUsers.get(i);
            String userEmail = u.getUserEmail();
            String userInterests = u.getUserInterest();
            if (userInterests.toLowerCase().contains(interestName.toLowerCase())) {
                //replace the two possibilities that interest may be formatted 
                String currentInterest1 = interestName + ", ";
                String currentInterest2 = ", " + interestName;
                userInterests = userInterests.replace(currentInterest1, "");
                userInterests = userInterests.replace(currentInterest2, "");

                String sql1 = "UPDATE user SET userInterest=? WHERE userEmail=?";

                try (Connection conn = ConnectionManager.getConnection();
                        PreparedStatement stmt = conn.prepareStatement(sql1);) {
                    stmt.setString(1, userInterests);
                    stmt.setString(2, userEmail);

                    int result = stmt.executeUpdate();
                    if (result == 0) {
                        return false;
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(InterestDAO.class.getName()).log(Level.WARNING, "Failed to update new Interest information", ex);
                }
            }
        }

        //update interests in trip table (this works - uncomment when the tripDAO is fixed)
        ArrayList<Trip> allTrips = TripsDAO.getTrips();
        for (int i = 0; i < allTrips.size(); i++) {
            Trip t = allTrips.get(i);
            int tripID = t.getTripID();
            String tripInterests = t.getTripInterest();
            if (tripInterests.toLowerCase().contains(interestName.toLowerCase())) {

                String currentInterest1 = interestName + ", ";
                String currentInterest2 = ", " + interestName;
                tripInterests = tripInterests.replace(currentInterest1, "");
                tripInterests = tripInterests.replace(currentInterest2, "");

                String sql1 = "UPDATE user SET tripInterest=? WHERE tripID=?";
                try (Connection conn = ConnectionManager.getConnection();
                        PreparedStatement stmt = conn.prepareStatement(sql1);) {
                    stmt.setString(1, tripInterests);
                    stmt.setInt(2, tripID);

                    int result = stmt.executeUpdate();
                    if (result == 0) {
                        return false;
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(InterestDAO.class.getName()).log(Level.WARNING, "Failed to update new Interest information", ex);
                }
            }
        }
        return true;
    }

    //update Interest in interest, user, trip tables
    public static boolean updateInterest(String newInterestName, String currentInterestName) {

        //update interest table
        String sql = "UPDATE interest SET interestName=? WHERE interestName=?";

        try (Connection conn = ConnectionManager.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql);) {

            stmt.setString(1, newInterestName);
            stmt.setString(2, currentInterestName);

            int result = stmt.executeUpdate();
            if (result == 0) {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(InterestDAO.class.getName()).log(Level.WARNING, "Failed to update new Interest information", ex);
        }

        //update interests in user table   
        ArrayList<User> allUsers = UserDAO.getAllUsers();
        for (int i = 0; i < allUsers.size(); i++) {
            User u = allUsers.get(i);
            String userEmail = u.getUserEmail();
            String userInterests = u.getUserInterest();
            if (userInterests.toLowerCase().contains(currentInterestName.toLowerCase())) {
                //replace
                userInterests = userInterests.replace(currentInterestName, newInterestName);

                String sql1 = "UPDATE user SET userInterest=? WHERE userEmail=?";

                try (Connection conn = ConnectionManager.getConnection();
                        PreparedStatement stmt = conn.prepareStatement(sql1);) {
                    stmt.setString(1, userInterests);
                    stmt.setString(2, userEmail);

                    int result = stmt.executeUpdate();
                    if (result == 0) {
                        return false;
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(InterestDAO.class.getName()).log(Level.WARNING, "Failed to update new Interest information", ex);
                }
            }
        }

        //update interests in trip table (this works - uncomment when the tripDAO is fixed)
//        ArrayList<Trip> allTrips = TripsDAO.getTrips();
//        for (int i = 0; i < allTrips.size(); i++) {
//            Trip t = allTrips.get(i);
//            int tripID = t.getTripID();
//            String tripInterests = t.getTripInterest();
//            if (tripInterests.toLowerCase().contains(currentInterestName.toLowerCase())) {
//                //replace
//                tripInterests = tripInterests.replace(currentInterestName, newInterestName);
//
//                String sql1 = "UPDATE user SET tripInterest=? WHERE tripID=?";
//
//                try (Connection conn = ConnectionManager.getConnection();
//                        PreparedStatement stmt = conn.prepareStatement(sql1);) {
//                    stmt.setString(1, tripInterests);
//                    stmt.setInt(2, tripID);
//
//                    int result = stmt.executeUpdate();
//                    if (result == 0) {
//                        return false;
//                    }
//                } catch (SQLException ex) {
//                    Logger.getLogger(InterestDAO.class.getName()).log(Level.WARNING, "Failed to update new Interest information", ex);
//                } 
//            }
//        }
        return true;
    }
}
