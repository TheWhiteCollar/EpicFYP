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
public class Trip {

    private String tripID;
    private String tripTitle;
    private String tripPrice;
    private int ratings;
    private String tripCountry;
    private String tripStart;
    private String tripEnd;
    private int tripDuration;
    private boolean activated;
    private int studentNeededToActivate;
    private ArrayList<String> signedUpEmails;

    public Trip(String tripID, String title, String price, int ratings, String country, String tripStart, String tripEnd, int tripDuration, ArrayList<String> signedUpEmails, int studentActivation) {
        this.tripID = tripID;
        this.tripTitle = title;
        this.tripPrice = price;
        this.ratings = ratings;
        this.tripCountry = country;
        this.tripStart = tripStart;
        this.tripEnd = tripEnd;
        this.tripDuration = tripDuration;
        this.signedUpEmails = signedUpEmails;
        this.studentNeededToActivate = studentActivation;
        if(signedUpEmails.size()<studentActivation ){
            this.activated = false;
        } else {
            this.activated = true;
        }
        
    }
    
    // have 1 more trip constructor cause database dont have the column with Emails of signees
    public Trip(String tripID, String title, String price, int ratings, String country, String tripStart, String tripEnd, int tripDuration) {
        this.tripID = tripID;
        this.tripTitle = title;
        this.tripPrice = price;
        this.ratings = ratings;
        this.tripCountry = country;
        this.tripStart = tripStart;
        this.tripEnd = tripEnd;
        this.tripDuration = tripDuration;        
    }

    public String getTripID() {
        return tripID;
    }

    public void setTripID(String tripID) {
        this.tripID = tripID;
    }

    public String getTitle() {
        return tripTitle;
    }

    public void setTitle(String title) {
        this.tripTitle = title;
    }

    public String getPrice() {
        return tripPrice;
    }

    public void setPrice(String price) {
        this.tripPrice = price;
    }

    public int getRatings() {
        return ratings;
    }

    public void setRatings(int ratings) {
        this.ratings = ratings;
    }

    public String getCountry() {
        return tripCountry;
    }

    public void setCountry(String country) {
        this.tripCountry = country;
    }

    public String getTripStart() {
        return tripStart;
    }

    public void setTripStart(String tripStart) {
        this.tripStart = tripStart;
    }

    public String getTripEnd() {
        return tripEnd;
    }

    public void setTripEnd(String tripEnd) {
        this.tripEnd = tripEnd;
    }

    public int getTripDuration() {
        return tripDuration;
    }

    public void setTripDuration(int tripDuration) {
        this.tripDuration = tripDuration;
    }
    
    public int getNumberOfStudents() {
        return signedUpEmails.size();
    }
    
    public boolean getActivated() {
        return activated;
    }
    
    public void setActivated(boolean activated) {
        this.activated = activated;
    }
    
    
    public int getStudentNeededToActivate() {
        return studentNeededToActivate;
    }
    
    public void setStudentNeededToActivate(int studentNeededToActivate) {
        this.studentNeededToActivate = studentNeededToActivate;
    }
}
