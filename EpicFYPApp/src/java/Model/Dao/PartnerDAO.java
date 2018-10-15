/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Dao;

import Controller.ConnectionManager;
import Model.Entity.Partner;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.Part;

public class PartnerDAO {
    
    //update a particular partner row
    public static boolean updatePartner(int partnerID, String partnerName, String partnerCountry, String partnerState, String partnerDescription, String partnerPassword, Part partnerPicture, String partnerHRName, String partnerHREmail){

        String sql = "UPDATE partner SET partnerName=?, partnerCountry=?, partnerState=?, partnerDescription=?, partnerPassword=?, partnerPicture=?, partnerHRName=?,partnerHREmail=? WHERE partnerID=?";

        try (Connection conn = ConnectionManager.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            
            stmt.setString(1, partnerName);
            stmt.setString(2, partnerCountry);
            stmt.setString(3, partnerState);
            stmt.setString(4, partnerDescription);
            stmt.setString(5, partnerPassword);
            stmt.setString(7, partnerHRName);
            stmt.setString(8, partnerHREmail);
            stmt.setInt(9, partnerID);
            
            //picture update
            InputStream picInputStream = null;
            if (partnerPicture != null){
                System.out.println(partnerPicture.getName());
                System.out.println(partnerPicture.getSize());
                System.out.println(partnerPicture.getContentType());
                
                try{
                    picInputStream = partnerPicture.getInputStream();
                }catch(IOException e){
                    Logger.getLogger(PartnerDAO.class.getName()).log(Level.WARNING, "Failed to upload picture into database", e);
                }
                
            }
            
            if(picInputStream!= null){
                stmt.setBinaryStream(6, picInputStream, (int) partnerPicture.getSize());
            }else{
                stmt.setNull(6, java.sql.Types.BLOB);
            }

            int result = stmt.executeUpdate();
            if (result == 0) {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(PartnerDAO.class.getName()).log(Level.WARNING, "Failed to update new Partner information", ex);
        }
        return true;
    }

    // Add existing partner/bulk new partners
    public static boolean addPartner(int partnerID, String partnerName, String partnerCountry, String partnerState, String partnerDescription, String partnerPassword, Part partnerPicture, String partnerHRName, String partnerHREmail) {

        String sql = "INSERT INTO partner (partnerID, partnerName, partnerCountry, partnerState, partnerDescription, partnerPassword, partnerPicture) VALUES (?,?,?,?,?,?,?,?,?)";

        try (Connection conn = ConnectionManager.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql);) {
            stmt.setInt(1, partnerID);
            stmt.setString(2, partnerName);
            stmt.setString(3, partnerCountry);
            stmt.setString(4, partnerState);
            stmt.setString(5, partnerDescription);
            stmt.setString(6, partnerPassword);
            stmt.setString(8, partnerHRName);
            stmt.setString(9, partnerHRName);

            //picture update
            InputStream picInputStream = null;
            if (partnerPicture != null){
                System.out.println(partnerPicture.getName());
                System.out.println(partnerPicture.getSize());
                System.out.println(partnerPicture.getContentType());

                try{
                    picInputStream = partnerPicture.getInputStream();
                }catch(IOException e){
                    Logger.getLogger(PartnerDAO.class.getName()).log(Level.WARNING, "Failed to upload picture into database", e);
                }
            }
            
            if(picInputStream!= null){
                stmt.setBinaryStream(7, picInputStream, (int) partnerPicture.getSize());
            }else{
                stmt.setNull(7, java.sql.Types.BLOB);
            }
            
            int result = stmt.executeUpdate();
            if (result == 0) {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(PartnerDAO.class.getName()).log(Level.WARNING, "Failed to add new Partner information", ex);
        }
        return true;
    }
    
    // get all existing partners
    public static ArrayList<Partner> getAllPartners() {
        ArrayList<Partner> result = new ArrayList<>();
        try {
                Connection conn = ConnectionManager.getConnection();
            PreparedStatement stmt = conn.prepareStatement("select * from partner WHERE partnerID<>0 ORDER BY partnerName ASC");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                result.add(new Partner(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getBlob(7),rs.getString(8),rs.getString(9)));
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
    
    // get partner by ID
    public static Partner getPartnerByID(int partnerID) {
        Partner partner = null;
        try {
                Connection conn = ConnectionManager.getConnection();
            PreparedStatement stmt = conn.prepareStatement("select * from partner WHERE partnerID=?");
            stmt.setInt(1, partnerID);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                partner = new Partner(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getBlob(7),rs.getString(8),rs.getString(9));
            }
            rs.close();
            stmt.close();
            conn.close();
            return partner;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    

    //delete a particular partner row
    public static boolean deletePartner(int partnerID) {

        String sql1 = "DELETE FROM partner WHERE partnerID=?";

        try (
                Connection conn = ConnectionManager.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql1);) {
            stmt.setInt(1, partnerID);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PartnerDAO.class.getName()).log(Level.WARNING, "Unable to delete partner, partnerID = '" + partnerID, ex);
            return false;
        }
        return true;
    }
}
