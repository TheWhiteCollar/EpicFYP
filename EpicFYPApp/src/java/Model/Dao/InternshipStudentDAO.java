/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Dao;

import Controller.ConnectionManager;
import Model.Entity.InternshipStudent;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class InternshipStudentDAO {
     //update a particular InternshipStudent row
    public static boolean updateInternshipStudent(int internshipID, String internshipUserEmail, String internshipStudentStatus, String internshipStudentContinent) {

        String sql = "UPDATE internshipstudent SET internshipStudentStatus=?, internshipStudentContinent=? WHERE internshipID=? AND internshipUserEmail=?";

        try (Connection conn = ConnectionManager.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            
            stmt.setString(1, internshipStudentStatus);
            stmt.setString(2, internshipStudentContinent);
            stmt.setInt(3, internshipID);
            stmt.setString(4, internshipUserEmail);

            int result = stmt.executeUpdate();
            if (result == 0) {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(InternshipStudentDAO.class.getName()).log(Level.WARNING, "Failed to update new internshipStudent information", ex);
        }
        return true;
    }

    // Add existing InternshipStudent/bulk new InternshipStudent
    public static boolean addInternshipStudent(int internshipID, String internshipUserEmail, String internshipStudentStatus, String internshipStudentContinent) {

        String sql = "INSERT INTO internshipstudent (internshipID, internshipUserEmail, internshipStudentStatus, internshipStudentContinent) VALUES (?,?,?,?)";

        try (Connection conn = ConnectionManager.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            stmt.setInt(1, internshipID);
            stmt.setString(2, internshipUserEmail);
            stmt.setString(3, internshipStudentStatus);
            stmt.setString(4, internshipStudentContinent);
            

            int result = stmt.executeUpdate();
            if (result == 0) {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(InternshipStudentDAO.class.getName()).log(Level.WARNING, "Failed to add new internshipStudent information", ex);
        }
        return true;
    }
    
    // get all existing InternshipStudent
    public static ArrayList<InternshipStudent> getAllInternshipStudents() {
        ArrayList<InternshipStudent> result = new ArrayList<>();
        try {
                Connection conn = ConnectionManager.getConnection();
            PreparedStatement stmt = conn.prepareStatement("select * from internshipstudent");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                result.add(new InternshipStudent(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4)));
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

    //delete a particular InternshipStudent row
    public static boolean deleteInternshipStudent(int internshipID, String internshipUserEmail) {

        String sql1 = "DELETE FROM internshipstudent WHERE internshipID=? AND internshipUserEmail=?";

        try (
                Connection conn = ConnectionManager.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql1);) {
            stmt.setInt(1, internshipID);
            stmt.setString(2, internshipUserEmail);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(InternshipStudentDAO.class.getName()).log(Level.WARNING, "Unable to delete internshipStudent, internshipID = '" + internshipID +", userEmail:  "+ internshipUserEmail, ex);
            return false;
        }
        return true;
    }
}
