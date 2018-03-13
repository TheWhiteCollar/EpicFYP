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
                    user = new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getString(8), rs.getByte(9), rs.getString(10), rs.getString(11), rs.getString(12));
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.WARNING, "Unable to retrieve userid = '" + userid + "'.", ex);
        }

        return user;
    }

}
