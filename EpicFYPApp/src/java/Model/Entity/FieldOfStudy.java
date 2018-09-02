/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Entity;

/* Database sequence
    #1: fieldOfStudyID (int 11)
    #2: fieldOfStudyName (varchar 200)
 */

public class FieldOfStudy {

    private int fieldOfStudyID;
    private String fieldOfStudyName;

    public FieldOfStudy(int fieldOfStudyID, String fieldOfStudyName) {
        this.fieldOfStudyID = fieldOfStudyID;
        this.fieldOfStudyName = fieldOfStudyName;
    }

    public int getFieldOfStudyID() {
        return fieldOfStudyID;
    }

    public void setFieldOfStudyID(int fieldOfStudyID) {
        this.fieldOfStudyID = fieldOfStudyID;
    }

    public String getFieldOfStudyName() {
        return fieldOfStudyName;
    }

    public void setFieldOfStudyName(String fieldOfStudyName) {
        this.fieldOfStudyName = fieldOfStudyName;
    }

}
