/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Entity;

/* Database sequence
    #1: interestID (int 11)
    #2: interestName (varchar 200)
 */

public class Interest {

    private int interestID;
    private String interestName;

    public Interest(int interestID, String interestName) {
        this.interestID = interestID;
        this.interestName = interestName;
    }

    public int getInterestID() {
        return interestID;
    }

    public void setInterestID(int interestID) {
        this.interestID = interestID;
    }

    public String getInterestName() {
        return interestName;
    }

    public void setInterestName(String interestName) {
        this.interestName = interestName;
    }

}
