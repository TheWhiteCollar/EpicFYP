/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Entity;

import java.sql.Date;

/* Database sequence
    #1: userID (int 11)
    #2: userEmail (varchar 50)
    #3: userFirstName (varchar 50)
    #4: userLastName (varchar 50)
    #5: userPhone (int 15)
    #6: userGender (varchar 1)
    #7: userCitizenship (varchar 100)
    #8: userDOB (date)
    #9: userProfilePic (varchar 100)
    #10: userInterest (varchar 1000)
    #11: userPassword (varchar 15)
    #12: userOccupation (varchar 100)
    #13: userResume (varchar 100)
    #14: userIsEmailConfirm (varchar 10)
    #15: userHighestEducation (varchar 100)
    #16: userFieldOfStudy (varchar 100)
 */

public class User {
    
    private int userID;
    private String userEmail;
    private String userFirstName;
    private String userLastName;
    private int userPhone;
    private String userGender;
    private String userCitizenship;
    private Date userDOB;
    private String userProfilePic;
    private String userInterest;
    private String userPassword;
    private String userOccupation;
    private String userResume;
    private String userIsEmailConfirm;
    private String userHighestEducation;
    private String userFieldOfStudy;

    public User(int userID, String userEmail, String userFirstName, String userLastName, int userPhone, String userGender, String userCitizenship, Date userDOB, String userProfilePic, String userInterest, String userPassword, String userOccupation, String userResume, String userIsEmailConfirm, String userHighestEducation, String userFieldOfStudy) {
        this.userID = userID;
        this.userEmail = userEmail;
        this.userFirstName = userFirstName;
        this.userLastName = userLastName;
        this.userPhone = userPhone;
        this.userGender = userGender;
        this.userCitizenship = userCitizenship;
        this.userDOB = userDOB;
        this.userProfilePic = userProfilePic;
        this.userInterest = userInterest;
        this.userPassword = userPassword;
        this.userOccupation = userOccupation;
        this.userResume = userResume;
        this.userIsEmailConfirm = userIsEmailConfirm;
        this.userHighestEducation = userHighestEducation;
        this.userFieldOfStudy = userFieldOfStudy;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
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

    public Date getUserDOB() {
        return userDOB;
    }

    public void setUserDOB(Date userDOB) {
        this.userDOB = userDOB;
    }

    public String getUserProfilePic() {
        return userProfilePic;
    }

    public void setUserProfilePic(String userProfilePic) {
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

    public String getUserOccupation() {
        return userOccupation;
    }

    public void setUserOccupation(String userOccupation) {
        this.userOccupation = userOccupation;
    }

    public String getUserResume() {
        return userResume;
    }

    public void setUserResume(String userResume) {
        this.userResume = userResume;
    }

    public String getUserIsEmailConfirm() {
        return userIsEmailConfirm;
    }

    public void setUserIsEmailConfirm(String userIsEmailConfirm) {
        this.userIsEmailConfirm = userIsEmailConfirm;
    }

    public String getUserHighestEducation() {
        return userHighestEducation;
    }

    public void setUserHighestEducation(String userHighestEducation) {
        this.userHighestEducation = userHighestEducation;
    }

    public String getUserFieldOfStudy() {
        return userFieldOfStudy;
    }

    public void setUserFieldOfStudy(String userFieldOfStudy) {
        this.userFieldOfStudy = userFieldOfStudy;
    }
   
}
