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
    private String programme;
    private String price;
    private int ratings;
    private String country;
    private String tripStart;
    private String tripEnd;
    private int tripDuration;
    private boolean activated;
    private ArrayList<String> signedUpEmails;

    public Trip(String tripID, String programme, String price, int ratings, String country, String tripStart, String tripEnd, int tripDuration, ArrayList<String> signedUpEmails) {
        this.tripID = tripID;
        this.programme = programme;
        this.price = price;
        this.ratings = ratings;
        this.country = country;
        this.tripStart = tripStart;
        this.tripEnd = tripEnd;
        this.tripDuration = tripDuration;
        this.signedUpEmails = signedUpEmails;
        if(signedUpEmails.size()<=5){
            this.activated = false;
        } else {
            this.activated = true;
        }
        
    }

    public String getTripID() {
        return tripID;
    }

    public void setTripID(String tripID) {
        this.tripID = tripID;
    }

    public String getProgramme() {
        return programme;
    }

    public void setProgramme(String programme) {
        this.programme = programme;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public int getRatings() {
        return ratings;
    }

    public void setRatings(int ratings) {
        this.ratings = ratings;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
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
}
