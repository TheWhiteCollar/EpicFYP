/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Entity;

import java.util.ArrayList;

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
    #13: userOccupation (varchar)
 */
public class User {

    private String userEmail;
    private String userFirstName;
    private String userLastName;
    private int userPhone;
    private String userGender;
    private String userCitizenship;
    private int userAge;
    private String userDescription;
    // private byte[] userProfilePic;
    private byte userProfilePic;
    private String userInterest;
    private String userPassword;
    private String userRole;
    private String userOccupation;

    public User(String userEmail, String userFirstName, String userLastName, int userPhone, String userGender, String userCitizenship, int userAge, String userDescription, byte userProfilePic, String userInterest, String userPassword, String userRole, String userOccupation) {
        this.userEmail = userEmail;
        this.userFirstName = userFirstName;
        this.userLastName = userLastName;
        this.userPhone = userPhone;
        this.userGender = userGender;
        this.userCitizenship = userCitizenship;
        this.userAge = userAge;
        this.userDescription = userDescription;
        this.userProfilePic = userProfilePic;
        this.userInterest = userInterest;
        this.userPassword = userPassword;
        this.userRole = userRole;
        this.userOccupation = userOccupation;
    }

    public User(String userEmail, String userFirstName, String userLastName, int userPhone, String userGender, String userCitizenship, int userAge, String userInterest, String userPassword, String userRole, String userOccupation) {
        this.userEmail = userEmail;
        this.userFirstName = userFirstName;
        this.userLastName = userLastName;
        this.userPhone = userPhone;
        this.userGender = userGender;
        this.userCitizenship = userCitizenship;
        this.userAge = userAge;
        this.userInterest = userInterest;
        this.userPassword = userPassword;
        this.userRole = userRole;
        this.userOccupation = userOccupation;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserFirstName() {
        return userFirstName;
    }

    public void setUserFirstName(String userFirstName) {
        this.userFirstName = userFirstName;
    }

    public String getUserLastName() {
        return userLastName;
    }

    public void setUserLastName(String userLastName) {
        this.userLastName = userLastName;
    }

    public int getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(int userPhone) {
        this.userPhone = userPhone;
    }

    public String getUserGender() {
        return userGender;
    }

    public void setUserGender(String userGender) {
        this.userGender = userGender;
    }

    public String getUserCitizenship() {
        return userCitizenship;
    }

    public void setUserCitizenship(String userCitizenship) {
        this.userCitizenship = userCitizenship;
    }

    public int getUserAge() {
        return userAge;
    }

    public void setUserAge(int userAge) {
        this.userAge = userAge;
    }

    public String getUserDescription() {
        return userDescription;
    }

    public void setUserDescription(String userDescription) {
        this.userDescription = userDescription;
    }

    public byte getUserProfilePic() {
        return userProfilePic;
    }

    public void setUserProfilePic(byte userProfilePic) {
        this.userProfilePic = userProfilePic;
    }

    public String getUserInterest() {
        return userInterest;
    }

    public void setUserInterest(String userInterest) {
        this.userInterest = userInterest;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserRole() {
        return userRole;
    }

    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }

    public String getUserOccupation() {
        return userOccupation;
    }

    public void setUserOccupation(String userOccupation) {
        this.userOccupation = userOccupation;
    }

}
