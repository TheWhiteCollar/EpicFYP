/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Entity;

/* Database sequence
    #1: paymentID (int 11)
    #2: paymentMode (varchar 100)
    #3: paymentType (varchar 100)
    #4: paymentRefund (double)
 */

public class Payment {

   private int paymentID;
   private String paymentMode;
   private String paymentType;
   private double paymentRefund;

    public Payment(int paymentID, String paymentMode, String paymentType, double paymentRefund) {
        this.paymentID = paymentID;
        this.paymentMode = paymentMode;
        this.paymentType = paymentType;
        this.paymentRefund = paymentRefund;
    }

    public int getPaymentID() {
        return paymentID;
    }

    public void setPaymentID(int paymentID) {
        this.paymentID = paymentID;
    }

    public String getPaymentMode() {
        return paymentMode;
    }

    public void setPaymentMode(String paymentMode) {
        this.paymentMode = paymentMode;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    public double getPaymentRefund() {
        return paymentRefund;
    }

    public void setPaymentRefund(double paymentRefund) {
        this.paymentRefund = paymentRefund;
    }

}
