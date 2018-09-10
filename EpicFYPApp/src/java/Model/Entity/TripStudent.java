/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Entity;

/* Database sequence
    
    #1: tripUserEmail (varchar 50)
    #2: tripStudentPayment (double)
    #3: tripStudentStatus (varchar 100)
    #4: tripStudentReview (varchar 500)
    #5: tripStudentRating (int 1)
    #6: tripID (int 11)
 */

public class TripStudent {

    
    private String tripUserEmail;
    private double tripStudentPayment;
    private String tripStudentStatus;
    private String tripStudentReview;
    private int tripStudentRating;
    private int tripID;

    public TripStudent(String tripUserEmail, double tripStudentPayment, String tripStudentStatus, String tripStudentReview, int tripStudentRating, int tripID) {
        this.tripUserEmail = tripUserEmail;
        this.tripStudentPayment = tripStudentPayment;
        this.tripStudentStatus = tripStudentStatus;
        this.tripStudentReview = tripStudentReview;
        this.tripStudentRating = tripStudentRating;
        this.tripID = tripID;
    }

    public int getTripID() {
        return tripID;
    }

    public void setTripID(int tripID) {
        this.tripID = tripID;
    }

    public String getTripUserEmail() {
        return tripUserEmail;
    }

    public void setTripUserEmail(String tripUserEmail) {
        this.tripUserEmail = tripUserEmail;
    }

    public double getTripStudentPayment() {
        return tripStudentPayment;
    }

    public void setTripStudentPayment(double tripStudentPayment) {
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
