package Model.Dao;

import Controller.ConnectionManager;
import Model.Entity.Internship;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

public class InternshipDAO {

    //update a particular internship row
    public static boolean updateInternship(int internshipID, String internshipName, String internshipApproval, String internshipFieldOfStudy, String internshipDescription, Date internshipStart, Date internshipEnd, double internshipPay, String internshipSupervisor, String internshipSupervisorEmail, int internshipVacancy, int internshipPartnerID) {

        String sql = "UPDATE internship SET internshipName=?, internshipApproval=?, internshipFieldOfStudy=?, internshipDescription=?, internshipStart=?, internshipEnd=?, internshipPay=?, internshipSupervisor=?, internshipSupervisorEmail=?, internshipVacancy=? WHERE internshipID=? AND internshipPartnerID=?";

        try (Connection conn = ConnectionManager.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql);) {

            stmt.setString(1, internshipName);
            stmt.setString(2, internshipApproval);
            stmt.setString(3, internshipFieldOfStudy);
            stmt.setString(4, internshipDescription);
            stmt.setDate(5, internshipStart);
            stmt.setDate(6, internshipEnd);
            stmt.setDouble(7, internshipPay);
            stmt.setString(8, internshipSupervisor);
            stmt.setString(9, internshipSupervisorEmail);
            stmt.setInt(10, internshipVacancy);
            stmt.setInt(11, internshipID);
            stmt.setInt(12, internshipPartnerID);

            int result = stmt.executeUpdate();
            if (result == 0) {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(InternshipDAO.class.getName()).log(Level.WARNING, "Failed to update new Internship information", ex);
        }
        return true;
    }

    // Add existing parnter/bulk new parnters
    public static boolean addInternship(int internshipID, String internshipName, String internshipApproval, String internshipFieldOfStudy, String internshipDescription, Date internshipStart, Date internshipEnd, double internshipPay, String internshipSupervisor, String internshipSupervisorEmail, int internshipVacancy, int internshipPartnerID) {

        String sql = "INSERT INTO internship (internshipID, internshipName, internshipApproval, internshipFieldOfStudy, internshipDescription, internshipStart, internshipEnd, internshipPay, internshipSupervisor, internshipSupervisorEmail, internshipVacancy, internshipPartnerID) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";

        try (Connection conn = ConnectionManager.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            stmt.setInt(1, internshipID);
            stmt.setString(2, internshipName);
            stmt.setString(3, internshipApproval);
            stmt.setString(4, internshipFieldOfStudy);
            stmt.setString(5, internshipDescription);
            stmt.setDate(6, internshipStart);
            stmt.setDate(7, internshipEnd);
            stmt.setDouble(8, internshipPay);
            stmt.setString(9, internshipSupervisor);
            stmt.setString(10, internshipSupervisorEmail);
            stmt.setInt(11, internshipVacancy);          
            stmt.setInt(12, internshipPartnerID);

            int result = stmt.executeUpdate();
            if (result == 0) {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(InternshipDAO.class.getName()).log(Level.WARNING, "Failed to add new Internship information", ex);
        }
        return true;
    }

    // get all existing partners
    public static ArrayList<Internship> getAllInternships() {
        ArrayList<Internship> result = new ArrayList<>();
        try {
            Connection conn = ConnectionManager.getConnection();
            PreparedStatement stmt = conn.prepareStatement("select * from internship");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                result.add(new Internship(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDate(6), rs.getDate(7), rs.getDouble(8),rs.getString(9),rs.getString(10),rs.getInt(11),rs.getInt(12)));
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

    //delete a particular partner row
    public static boolean deleteInternship(int internshipID) {

        String sql1 = "DELETE FROM internship WHERE internshipID=?";

        try (
                Connection conn = ConnectionManager.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql1);) {
            stmt.setInt(1, internshipID);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(InternshipDAO.class.getName()).log(Level.WARNING, "Unable to delete internship, internshipID = '" + internshipID, ex);
            return false;
        }
        return true;
    }
}
