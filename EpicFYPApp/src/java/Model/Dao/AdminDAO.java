/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Dao;

import Controller.ConnectionManager;
import Model.Entity.Admin;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AdminDAO {

    // Get admin and their details with adminName and adminPassword
    public static Admin getAdminByLogin(String adminName, String adminPassword) {

        Admin admin = null;
        String sql = "SELECT * FROM admin WHERE adminName LIKE ? AND adminPassword LIKE ?";

        try (Connection conn = ConnectionManager.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            stmt.setString(1, adminName);
            stmt.setString(2, adminPassword);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                if (admin == null) {
                    admin = new Admin(rs.getString(1), rs.getString(2));
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.WARNING, "Unable to retrieve" + adminName + ".", ex);
        }

        return admin;
    }

    // Update a particular admin row
    public static boolean updateAdmin(String adminName, String adminPassword) {

        String sql = "UPDATE admin SET adminPassword = ? WHERE adminName = ?";

        try (Connection conn = ConnectionManager.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            stmt.setString(1, adminPassword);
            stmt.setString(2, adminName);
            int result = stmt.executeUpdate();
            if (result == 0) {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.WARNING, "Failed to update: " + adminName + ".", ex);
        }
        return true;
    }

    // Add a new admin row
    public static boolean addAdmin(String adminName, String adminPassword) {

        String sql = "INSERT INTO admin (adminName, adminPassword) VALUES (?,?)";

        try (Connection conn = ConnectionManager.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            stmt.setString(1, adminName);
            stmt.setString(2, adminPassword);
            int result = stmt.executeUpdate();
            if (result == 0) {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.WARNING, "Admin username is already taken!", ex);
        }
        return true;
    }

    public static boolean deleteUser(String adminName) {

        String sql1 = "DELETE FROM admin WHERE adminName=?";

        try (
                Connection conn = ConnectionManager.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql1);) {
            stmt.setString(1, adminName);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.WARNING, "Unable to delete" + adminName, ex);
            return false;
        }
        return true;
    }

    //get all admin names
    public static ArrayList<Admin> getAllUsers() {
        ArrayList<Admin> result = new ArrayList<>();
        try {
            Connection conn = ConnectionManager.getConnection();
            PreparedStatement stmt = conn.prepareStatement("select * from admin");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                result.add(new Admin(rs.getString(1), rs.getString(2)));
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

}
