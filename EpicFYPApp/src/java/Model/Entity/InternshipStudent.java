/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Entity;

/* Database sequence
    #1: internshipID (int 11)
    #2: internshipUserEmail (varchar 50)
    #3: internshipStudentStatus (varchar 100)
    #4: internshipStudentContinent (varchar 100)
    #5: internshipStudentDatetime (datetime YYYY-MM-DD HH:MM:SS)
 */

public class InternshipStudent {

    private int internshipID;
    private String internshipUserEmail;
    private String internshipStudentStatus;
    private String internshipStudentContinent;
    private String internshipStudentDatetime;

    public InternshipStudent(int internshipID, String internshipUserEmail, String internshipStudentStatus, String internshipStudentContinent, String internshipStudentDatetime) {
        this.internshipID = internshipID;
        this.internshipUserEmail = internshipUserEmail;
        this.internshipStudentStatus = internshipStudentStatus;
        this.internshipStudentContinent = internshipStudentContinent;
        this.internshipStudentDatetime = internshipStudentDatetime;
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

    public String getInternshipStudentContinent() {
        return internshipStudentContinent;
    }

    public void setInternshipStudentContinent(String internshipStudentContinent) {
        this.internshipStudentContinent = internshipStudentContinent;
    }

    public String getInternshipStudentDatetime() {
        return internshipStudentDatetime;
    }

    public void setInternshipStudentDatetime(String internshipStudentDatetime) {
        this.internshipStudentDatetime = internshipStudentDatetime;
    }
   
    
}
