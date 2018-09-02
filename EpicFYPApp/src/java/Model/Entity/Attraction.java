/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Entity;

/* Database sequence
    #1: attractionID (int 11)
    #2: attractionName (varchar 100)
    #3: attractionCountry (varchar 100)
    #4: attractionState (varchar 100)
    #5: attractionDescription (varchar 1000)
    #6: attractionPicture (varchar 100)
    #7: attractionPriceCheap (decimal 13,2)
    #8: attractionPriceEx (decimal 13,2)
 */

public class Attraction {

    private int attractionID;
    private String attractionName;
    private String attractionCountry;
    private String attractionState;
    private String attractionDescription;
    private String attractionPicture;
    private double attractionPriceCheap;
    private double attractionPriceEx;

    public Attraction(int attractionID, String attractionName, String attractionCountry, String attractionState, String attractionDescription, String attractionPicture, double attractionPriceCheap, double attractionPriceEx) {
        this.attractionID = attractionID;
        this.attractionName = attractionName;
        this.attractionCountry = attractionCountry;
        this.attractionState = attractionState;
        this.attractionDescription = attractionDescription;
        this.attractionPicture = attractionPicture;
        this.attractionPriceCheap = attractionPriceCheap;
        this.attractionPriceEx = attractionPriceEx;
    }

    public int getAttractionID() {
        return attractionID;
    }

    public void setAttractionID(int attractionID) {
        this.attractionID = attractionID;
    }

    public String getAttractionName() {
        return attractionName;
    }

    public void setAttractionName(String attractionName) {
        this.attractionName = attractionName;
    }

    public String getAttractionCountry() {
        return attractionCountry;
    }

    public void setAttractionCountry(String attractionCountry) {
        this.attractionCountry = attractionCountry;
    }

    public String getAttractionState() {
        return attractionState;
    }

    public void setAttractionState(String attractionState) {
        this.attractionState = attractionState;
    }

    public String getAttractionDescription() {
        return attractionDescription;
    }

    public void setAttractionDescription(String attractionDescription) {
        this.attractionDescription = attractionDescription;
    }

    public String getAttractionPicture() {
        return attractionPicture;
    }

    public void setAttractionPicture(String attractionPicture) {
        this.attractionPicture = attractionPicture;
    }

    public double getAttractionPriceCheap() {
        return attractionPriceCheap;
    }

    public void setAttractionPriceCheap(double attractionPriceCheap) {
        this.attractionPriceCheap = attractionPriceCheap;
    }

    public double getAttractionPriceEx() {
        return attractionPriceEx;
    }

    public void setAttractionPriceEx(double attractionPriceEx) {
        this.attractionPriceEx = attractionPriceEx;
    }

}
