/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Dao;

import Controller.ConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Lenovo
 */
public class InterestDAO {
    public static ArrayList<String> getInterests() {

        ArrayList<String> interestNames = new ArrayList<>();
        String sql = "SELECT * FROM interest";

        try (Connection conn = ConnectionManager.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                interestNames.add(rs.getString(2));
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
            stmt.setString(2, interestName);
            int result = stmt.executeUpdate();
            if (result == 0) {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(InterestDAO.class.getName()).log(Level.WARNING, "interest already exist!", ex);
        }
        return true;
    }
    
    public static boolean deleteInterest(String interestName) {
        String sql = "DELETE FROM interest WHERE interestName=?";

        try (
                Connection conn = ConnectionManager.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            stmt.setString(1, interestName);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(TripsDAO.class.getName()).log(Level.WARNING, "Unable to delete interest, interestName = '" + interestName, ex);
            return false;
        }

        return true;
    }
}
