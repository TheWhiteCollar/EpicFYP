/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Entity;

import java.sql.Date;
import java.util.ArrayList;

/* Database sequence
    #1: tripID (int 11)
    #2: tripTitle (varchar 100)
    #3: tripPrice (decimal 13,2)
    #4: tripItinerary (varchar 100)
    #5: tripDescription (varchar 1000)
    #6: tripCountry (varchar 100)
    #7: tripState (varchar 100)
    #8: tripStart (date)
    #9: tripEnd (date)
    #10: tripDuration (int 11)
    #11: tripActivation (int 3)
    #12: tripCategoryInterest (int 3)
    #13: tripCountryState (varchar 200)
    #14: tripProposedBy (varchar 100)
    #15: tripNoOfInterested (int 11)
    #16: tripTotalSignup (int 11)
    #17: tripEstimatedPrice (decimal 13,2)
    #18: tripCustomizeApproval (varchar 100)
    #19: tripPromo (varchar 100)
    #20: tripPromoPercentage (decimal 3,2)
    #21: tripAttraction (varchar 100)
 */

public class Trip {

    private int tripID;
    private String tripTitle;
    private double tripPrice;
    private String tripItinerary;
    private String tripDescription;
    private String tripCountry;
    private String tripState;
    private Date tripStart;
    private Date tripEnd;
    private int tripDuration;
    private int tripActivation;
    private int tripCategoryInterest;
    private String tripCountryState;
    private String tripProposedBy;
    private int tripNoOfInterested;
    private int tripTotalSignup;
    private double tripEstimatedPrice;
    private String tripCustomizeApproval;
    private String tripPromo;
    private double tripPromoPercentage;
    private String tripAttraction;
    
    private boolean activated;
    private int studentNeededToActivate;
    private ArrayList<String> signedUpEmails;

    public Trip(int tripID, String tripTitle, double tripPrice, String tripItinerary, String tripDescription, String tripCountry, String tripState, Date tripStart, Date tripEnd, int tripDuration, int tripActivation, int tripCategoryInterest,String tripCountryState,String tripProposedBy,int tripNoOfInterested, int tripTotalSignup, double tripEstimatedPrice, String tripCustomizeApproval, String tripPromo, double tripPromoPercentage, String tripAttraction, ArrayList<String> signedUpEmails, int studentActivation) {
        this.tripID = tripID;
        this.tripTitle = tripTitle;
        this.tripPrice = tripPrice;
        this.tripItinerary = tripItinerary;
        this.tripDescription = tripDescription;
        this.tripCountry = tripCountry;
        this.tripState = tripState;
        this.tripStart = tripStart;
        this.tripEnd = tripEnd;
        this.tripDuration = tripDuration;
        this.tripActivation = tripActivation;
        this.tripCategoryInterest = tripCategoryInterest;
        this.tripCountryState = tripCountryState;
        this.tripProposedBy = tripProposedBy;
        this.tripNoOfInterested = tripNoOfInterested;
        this.tripTotalSignup = tripTotalSignup;
        this.tripEstimatedPrice = tripEstimatedPrice;
        this.tripCustomizeApproval = tripCustomizeApproval;
        this.tripPromo = tripPromo;
        this.tripPromoPercentage = tripPromoPercentage;
        this.tripAttraction = tripAttraction;
        
        this.signedUpEmails = signedUpEmails;
        this.studentNeededToActivate = studentActivation;
        if(signedUpEmails.size()<studentActivation ){
            this.activated = false;
        } else {
            this.activated = true;
        }
        
    }
    
    // have 1 more trip constructor cause database dont have the column with Emails of signees
    public Trip(int tripID, String tripTitle, double tripPrice, String tripCountry, Date tripStart, Date tripEnd, int tripDuration) {
        this.tripID = tripID;
        this.tripTitle = tripTitle;
        this.tripPrice = tripPrice;
        this.tripCountry = tripCountry;
        this.tripStart = tripStart;
        this.tripEnd = tripEnd;
        this.tripDuration = tripDuration;        
    }

    public int getTripID() {
        return tripID;
    }

    public void setTripID(int tripID) {
        this.tripID = tripID;
    }

    public String getTripTitle() {
        return tripTitle;
    }

    public void setTripTitle(String tripTitle) {
        this.tripTitle = tripTitle;
    }

    public double getTripPrice() {
        return tripPrice;
    }

    public void setTripPrice(double tripPrice) {
        this.tripPrice = tripPrice;
    }

    public String getTripItinerary() {
        return tripItinerary;
    }

    public void setTripItinerary(String tripItinerary) {
        this.tripItinerary = tripItinerary;
    }

    public String getTripDescription() {
        return tripDescription;
    }

    public void setTripDescription(String tripDescription) {
        this.tripDescription = tripDescription;
    }

    public String getTripCountry() {
        return tripCountry;
    }

    public void setTripCountry(String tripCountry) {
        this.tripCountry = tripCountry;
    }


    public String getTripState() {
        return tripState;
    }

    public void setTripState(String tripState) {
        this.tripState = tripState;
    }

    public Date getTripStart() {
        return tripStart;
    }

    public void setTripStart(Date tripStart) {
        this.tripStart = tripStart;
    }

    public Date getTripEnd() {
        return tripEnd;
    }

    public void setTripEnd(Date tripEnd) {
        this.tripEnd = tripEnd;
    }

    public int getTripDuration() {
        return tripDuration;
    }

    public void setTripDuration(int tripDuration) {
        this.tripDuration = tripDuration;
    }
    
    public int getTripActivation() {
        return tripActivation;
    }

    public void setTripActivation(int tripActivation) {
        this.tripActivation = tripActivation;
    }

    public int getTripCategoryInterest() {
        return tripCategoryInterest;
    }

    public void setTripCategoryInterest(int tripCategoryInterest) {
        this.tripCategoryInterest = tripCategoryInterest;
    }

    public String getTripCountryState() {
        return tripCountryState;
    }

    public void setTripCountryState(String tripCountryState) {
        this.tripCountryState = tripCountryState;
    }

    public String getTripProposedBy() {
        return tripProposedBy;
    }

    public void setTripProposedBy(String tripProposedBy) {
        this.tripProposedBy = tripProposedBy;
    }

    public int getTripNoOfInterested() {
        return tripNoOfInterested;
    }

    public void setTripNoOfInterested(int tripNoOfInterested) {
        this.tripNoOfInterested = tripNoOfInterested;
    }

    public int getTripTotalSignup() {
        return tripTotalSignup;
    }

    public void setTripTotalSignup(int tripTotalSignup) {
        this.tripTotalSignup = tripTotalSignup;
    }

    public double getTripEstimatedPrice() {
        return tripEstimatedPrice;
    }

    public void setTripEstimatedPrice(double tripEstimatedPrice) {
        this.tripEstimatedPrice = tripEstimatedPrice;
    }

    public String getTripCustomizeApproval() {
        return tripCustomizeApproval;
    }

    public void setTripCustomizeApproval(String tripCustomizeApproval) {
        this.tripCustomizeApproval = tripCustomizeApproval;
    }

    public String getTripPromo() {
        return tripPromo;
    }

    public void setTripPromo(String tripPromo) {
        this.tripPromo = tripPromo;
    }

    public double getTripPromoPercentage() {
        return tripPromoPercentage;
    }

    public void setTripPromoPercentage(double tripPromoPercentage) {
        this.tripPromoPercentage = tripPromoPercentage;
    }

    public String getTripAttraction() {
        return tripAttraction;
    }

    public void setTripAttraction(String tripAttraction) {
        this.tripAttraction = tripAttraction;
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
