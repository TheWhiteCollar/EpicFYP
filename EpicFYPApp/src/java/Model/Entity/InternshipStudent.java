/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Entity;

/* Database sequence
    #1: internshipStudentID (int 11)
    #2: internshipID (int 11)
    #3: internshipUserEmail (varchar 50)
    #4: internshipStudentStatus (varchar 100)
 */

public class InternshipStudent {

    private int internshipStudentID;
    private int internshipID;
    private String internshipUserEmail;
    private String internshipStudentStatus;

    public InternshipStudent(int internshipStudentID, int internshipID, String internshipUserEmail, String internshipStudentStatus) {
        this.internshipStudentID = internshipStudentID;
        this.internshipID = internshipID;
        this.internshipUserEmail = internshipUserEmail;
        this.internshipStudentStatus = internshipStudentStatus;
    }

    public int getInternshipStudentID() {
        return internshipStudentID;
    }

    public void setInternshipStudentID(int internshipStudentID) {
        this.internshipStudentID = internshipStudentID;
    }

    public int getInternshipID() {
        return internshipID;
    }

    public void setInternshipID(int internshipID) {
        this.internshipID = internshipID;
    }

    public String getInternshipUserEmail() {
        return internshipUserEmail;
    }

    public void setInternshipUserEmail(String internshipUserEmail) {
        this.internshipUserEmail = internshipUserEmail;
    }

    public String getInternshipStudentStatus() {
        return internshipStudentStatus;
    }

    public void setInternshipStudentStatus(String internshipStudentStatus) {
        this.internshipStudentStatus = internshipStudentStatus;
    }

}
