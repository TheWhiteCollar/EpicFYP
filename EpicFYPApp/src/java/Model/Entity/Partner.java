/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Entity;

/* Database sequence
    #1: partnerID (int 11)
    #2: partnerName (varchar 100)
    #3: partnerCountry (varchar 100)
    #4: partnerState (varchar 100)
    #5: partnerDescription (varchar 1000)
    #6: partnerPassword (varchar 50)
    #7: partnerPicture (varchar 100)
 */

public class Partner {

    private int partnerID;
    private String partnerName;
    private String partnerCountry;
    private String partnerState;
    private String partnerDescription;
    private String partnerPassword;
    private String partnerPicture;

    public Partner(int partnerID, String partnerName, String partnerCountry, String partnerState, String partnerDescription, String partnerPassword, String partnerPicture) {
        this.partnerID = partnerID;
        this.partnerName = partnerName;
        this.partnerCountry = partnerCountry;
        this.partnerState = partnerState;
        this.partnerDescription = partnerDescription;
        this.partnerPassword = partnerPassword;
        this.partnerPicture = partnerPicture;
    }

    public int getPartnerID() {
        return partnerID;
    }

    public void setPartnerID(int partnerID) {
        this.partnerID = partnerID;
    }

    public String getPartnerName() {
        return partnerName;
    }

    public void setPartnerName(String partnerName) {
        this.partnerName = partnerName;
    }

    public String getPartnerCountry() {
        return partnerCountry;
    }

    public void setPartnerCountry(String partnerCountry) {
        this.partnerCountry = partnerCountry;
    }

    public String getPartnerState() {
        return partnerState;
    }

    public void setPartnerState(String partnerState) {
        this.partnerState = partnerState;
    }

    public String getPartnerDescription() {
        return partnerDescription;
    }

    public void setPartnerDescription(String partnerDescription) {
        this.partnerDescription = partnerDescription;
    }

    public String getPartnerPassword() {
        return partnerPassword;
    }

    public void setPartnerPassword(String partnerPassword) {
        this.partnerPassword = partnerPassword;
    }   

    public String getPartnerPicture() {
        return partnerPicture;
    }

    public void setPartnerPicture(String partnerPicture) {
        this.partnerPicture = partnerPicture;
    }
}
