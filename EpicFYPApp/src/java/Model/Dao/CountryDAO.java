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

public class CountryDAO {
    
    // get all countries
    public static ArrayList<String> getCountries() {

        ArrayList<String> countryNames = new ArrayList<>();
        String sql = "SELECT * FROM country";

        try (Connection conn = ConnectionManager.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                countryNames.add(rs.getString(1));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CountryDAO.class.getName()).log(Level.WARNING, "Unable to retrieve countries", ex);
        }

        return countryNames;
    }
    
    //insert new country
    public static boolean addCountry(String countryName) {

        String sql = "INSERT INTO country (countryName) VALUES (?)";

        try (Connection conn = ConnectionManager.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            stmt.setString(1, countryName);
            int result = stmt.executeUpdate();
            if (result == 0) {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CountryDAO.class.getName()).log(Level.WARNING, "Country already exist!", ex);
        }
        return true;
    }
    
    // delete a particular country row
    public static boolean deleteCountry(String countryName) {
        String sql = "DELETE FROM country WHERE countryName=?";

        try (
                Connection conn = ConnectionManager.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            stmt.setString(1, countryName);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CountryDAO.class.getName()).log(Level.WARNING, "Unable to delete country, countryName = '" + countryName, ex);
            return false;
        }

        return true;
    }
    
//    // Update a particular country row
//    public static boolean updateCountry(String countryName) {
//
//        String sql = "UPDATE country SET adminPassword = ? WHERE adminName = ?";
//
//        try (Connection conn = ConnectionManager.getConnection();
//                PreparedStatement stmt = conn.prepareStatement(sql);) {
//            stmt.setString(1, adminPassword);
//            stmt.setString(2, adminName);
//            int result = stmt.executeUpdate();
//            if (result == 0) {
//                return false;
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(AdminDAO.class.getName()).log(Level.WARNING, "Failed to update: " + adminName + ".", ex);
//        }
//        return true;
//    }
    
}
