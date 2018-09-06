/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Dao;

import Controller.ConnectionManager;
import Model.Entity.User;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author User
 */
public class UserDAO {

    /* Database sequence
    #1: userEmail (varchar)
    #2: userFirstName (varchar)
    #3: userLastName (varchar)
    #4: userPhone (int)
    #5: userGender (varchar)
    #6: userCitizenship (varchar)
    #7: userAge (int)
    #8: userDescription (varchar)
    #9: userProfilePic (blob)
    #10: userInterest (varchar)
    #11: userPassword (varchar)
    #12: userRole (varchar)
     */
    // Get user and their details with userid and password
    public static User getUserByLogin(String userid, String password) {

        User user = null;
        String sql = "SELECT * FROM user WHERE userEmail LIKE ? AND userPassword LIKE ?";

        try (Connection conn = ConnectionManager.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            stmt.setString(1, userid);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                if (user == null) {
                    user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getDate(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16));
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.WARNING, "Unable to retrieve userid = '" + userid + "'.", ex);
        }

        return user;
    }

    public static int getCurrentRows() {

        int count = 0;
        String sql = "SELECT COUNT(*) FROM user";

        try (Connection conn = ConnectionManager.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
               count++;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.WARNING, "Unable to retrieve user", ex);
        }

        return count;
    }

    // Add existing users/bulk new users
    public static boolean addUser(int count, String userEmail, String userFirstName, String userLastName, int userPhone, String userGender, String userCitizenship, Date userDOB, String userProfilePic, String userInterest, String userPassword, String userOccupation, String userResume, String userIsEmailConfirm, String userHighestEducation, String userFieldOfStudy) {

        String sql = "INSERT INTO user VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

        try (Connection conn = ConnectionManager.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            stmt.setInt(1, count);
            stmt.setString(2, userEmail);
            stmt.setString(3, userFirstName);
            stmt.setString(4, userLastName);
            stmt.setInt(5, userPhone);
            stmt.setString(6, userGender);
            stmt.setString(7, userCitizenship);
            stmt.setDate(8, Date.valueOf("1995-08-26"));
            stmt.setString(9, userProfilePic);
            stmt.setString(10, userInterest);
            stmt.setString(11, userPassword);
            stmt.setString(12, userOccupation);
            stmt.setString(13, userResume);
            stmt.setString(14, userIsEmailConfirm);
            stmt.setString(15, userHighestEducation);
            stmt.setString(16, userFieldOfStudy);
            int result = stmt.executeUpdate();
            if (result == 0) {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.WARNING, "Email is already registered!", ex);
        }
        return true;
    }

    public static ArrayList<User> getAllUsers() {
        ArrayList<User> result = new ArrayList<>();
        try {
            Connection conn = ConnectionManager.getConnection();
            PreparedStatement stmt = conn.prepareStatement("select * from user");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                result.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getDate(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16)));
            }
            rs.close();
            stmt.close();
            conn.close();
            return result;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /*public void deleteUser(User user){
        String sql = "DELETE * FROM user WHERE userEmail='"+ user.getUserEmail()+"'";
         try (Connection conn = ConnectionManager.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);) {
        }catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.WARNING, "Unable to delete user!", ex);
        }
    }*/
    public static boolean deleteUser(String userEmail) {

        String sql1 = "DELETE FROM user WHERE userEmail=?";

        try (
                Connection conn = ConnectionManager.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql1);) {
            stmt.setString(1, userEmail);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.WARNING, "Unable to delete user, userEmail = '" + userEmail, ex);
            return false;
        }
        return true;
    }
}
