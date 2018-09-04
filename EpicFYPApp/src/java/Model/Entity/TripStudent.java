/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Entity;

/* Database sequence
    #1: tripStudentID (int 11)
    #2: tripID (int 11)
    #3: tripUserEmail (varchar 50)
    #4: tripStudentPayment (int 11)
    #5: tripStudentStatus (varchar 100)
    #6: tripStudentReview (varchar 500)
    #7: tripStudentRating (int 1)
 */

public class TripStudent {

    private int tripStudentID;
    private int tripID;
    private int tripUserEmail;
    private int tripStudentPayment;
    private String tripStudentStatus;
    private String tripStudentReview;
    private int tripStudentRating;

    public TripStudent(int tripStudentID, int tripID, int tripUserEmail, int tripStudentPayment, String tripStudentStatus, String tripStudentReview, int tripStudentRating) {
        this.tripStudentID = tripStudentID;
        this.tripID = tripID;
        this.tripUserEmail = tripUserEmail;
        this.tripStudentPayment = tripStudentPayment;
        this.tripStudentStatus = tripStudentStatus;
        this.tripStudentReview = tripStudentReview;
        this.tripStudentRating = tripStudentRating;
    }

    public int getTripStudentID() {
        return tripStudentID;
    }

    public void setTripStudentID(int tripStudentID) {
        this.tripStudentID = tripStudentID;
    }

    public int getTripID() {
        return tripID;
    }

    public void setTripID(int tripID) {
        this.tripID = tripID;
    }

    public int getTripUserEmail() {
        return tripUserEmail;
    }

    public void setTripUserEmail(int tripUserEmail) {
        this.tripUserEmail = tripUserEmail;
    }

    public int getTripStudentPayment() {
        return tripStudentPayment;
    }

    public void setTripStudentPayment(int tripStudentPayment) {
        this.tripStudentPayment = tripStudentPayment;
    }

    public String getTripStudentStatus() {
        return tripStudentStatus;
    }

    public void setTripStudentStatus(String tripStudentStatus) {
        this.tripStudentStatus = tripStudentStatus;
    }

    public String getTripStudentReview() {
        return tripStudentReview;
    }

    public void setTripStudentReview(String tripStudentReview) {
        this.tripStudentReview = tripStudentReview;
    }

    public int getTripStudentRating() {
        return tripStudentRating;
    }

    public void setTripStudentRating(int tripStudentRating) {
        this.tripStudentRating = tripStudentRating;
    }
 
}
