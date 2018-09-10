/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Dao;

import Controller.ConnectionManager;
import Model.Entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 *
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
                    user = new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16), rs.getString(17));
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.WARNING, "Unable to retrieve userid = '" + userid + "'.", ex);
        }

        return user;
    }

    // Add existing users/bulk new users
    public static boolean addUser(String userEmail, String userFirstName, String userLastName, int userPhone, String userGender, String userCitizenship, int userDOB, String userProfilePic, String userInterest, String userPassword, String userOccupation, String userResume, String userIsEmailConfirm, String userHighestEducation, String userFieldOfStudy, String userDescription, String userSchool) {

        String sql = "INSERT INTO user VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

        try (Connection conn = ConnectionManager.getConnection()) {
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, userEmail);
            stmt.setString(2, userFirstName);
            stmt.setString(3, userLastName);
            stmt.setInt(4, userPhone);
            stmt.setString(5, userGender);
            stmt.setString(6, userCitizenship);
            stmt.setInt(7, userDOB);
            stmt.setString(8, userProfilePic);
            stmt.setString(9, userInterest);
            stmt.setString(10, userPassword);
            stmt.setString(11, userOccupation);
            stmt.setString(12, userResume);
            stmt.setString(13, userIsEmailConfirm);
            stmt.setString(14, userHighestEducation);
            stmt.setString(15, userFieldOfStudy);
            stmt.setString(16, userDescription);
            stmt.setString(17, userSchool);

            int result = stmt.executeUpdate();
            if (result == 0) {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.WARNING, "Email is already registered!", ex);
        }
        return true;
    }

    // get all users
    public static ArrayList<User> getAllUsers() {
        ArrayList<User> result = new ArrayList<>();
        try {
            Connection conn = ConnectionManager.getConnection();
            PreparedStatement stmt = conn.prepareStatement("select * from user");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                result.add(new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16), rs.getString(17)));
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
    //delete user a particular user row
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

    // Update a particular user row
    public static boolean updateUser(String userEmail, String userFirstName, String userLastName, int userPhone, String userGender, String userCitizenship, int userDOB, String userProfilePic, String userInterest, String userPassword, String userOccupation, String userResume, String userIsEmailConfirm, String userHighestEducation, String userFieldOfStudy, String userDescription, String userSchool) {

        String sql = "UPDATE user SET userFirstName=?, userLastName=?, userPhone=?, userGender=?, userCitizenship=?, userDOB=?,userProfilePic=?,userInterest=?,userPassword=?,userOccupation=?,userResume=?,userIsEmailConfirm=?,userHighestEducation=?,userFieldOfStudy=?,userDescription=?,userSchool=?  WHERE userEmail = ?";

        try (Connection conn = ConnectionManager.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql);) {

            stmt.setString(1, userFirstName);
            stmt.setString(2, userLastName);
            stmt.setInt(3, userPhone);
            stmt.setString(4, userGender);
            stmt.setString(5, userCitizenship);
            stmt.setInt(6, userDOB);
            stmt.setString(7, userProfilePic);
            stmt.setString(8, userInterest);
            stmt.setString(9, userPassword);
            stmt.setString(10, userOccupation);
            stmt.setString(11, userResume);
            stmt.setString(12, userIsEmailConfirm);
            stmt.setString(13, userHighestEducation);
            stmt.setString(14, userFieldOfStudy);
            stmt.setString(15, userDescription);
            stmt.setString(16, userSchool);
            stmt.setString(17, userEmail);
            int result = stmt.executeUpdate();
            if (result == 0) {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.WARNING, "Failed to update user: " + userEmail + ".", ex);
        }
        return true;
    }
  
}
