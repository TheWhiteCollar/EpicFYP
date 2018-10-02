/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Entity;

/* Database sequence
    #1: internshipID (int 11)
    #2: internshipUserEmail (varchar 50)
    #3: internshipStudentStatus (varchar 300)
    #4: internshipStudentContinent (varchar 15)
    #5: internshipStudentDatetime (varchar 160)
    #6: internshipStudentAction (int 1) 0=rejected, 1=admin action, 2=user action, 3=internship confirmed, 4=cancelled
    #7: internshipStudentCycle (varchar 10) done, processing
    #8: internshipStudentLastUpdate (datetime YYYY-MM-DD HH:MM:SS)
 */

public class InternshipStudent {

    private int internshipID;
    private String internshipUserEmail;
    private String internshipStudentStatus;
    private String internshipStudentContinent;
    private String internshipStudentDatetime;
    private int internshipStudentAction;
    private String internshipStudentCycle;
    private String internshipStudentLastUpdate;

    public InternshipStudent(int internshipID, String internshipUserEmail, String internshipStudentStatus, String internshipStudentContinent, String internshipStudentDatetime, int internshipStudentAction, String internshipStudentCycle, String internshipStudentLastUpdate) {
        this.internshipID = internshipID;
        this.internshipUserEmail = internshipUserEmail;
        this.internshipStudentStatus = internshipStudentStatus;
        this.internshipStudentContinent = internshipStudentContinent;
        this.internshipStudentDatetime = internshipStudentDatetime;
        this.internshipStudentAction = internshipStudentAction;
        this.internshipStudentCycle = internshipStudentCycle;
        this.internshipStudentLastUpdate = internshipStudentLastUpdate;
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

    public int getInternshipStudentAction() {
        return internshipStudentAction;
    }

    public void setInternshipStudentAction(int internshipStudentAction) {
        this.internshipStudentAction = internshipStudentAction;
    }

    public String getInternshipStudentCycle() {
        return internshipStudentCycle;
    }

    public void setInternshipStudentCycle(String internshipStudentCycle) {
        this.internshipStudentCycle = internshipStudentCycle;
    }

    public String getInternshipStudentLastUpdate() {
        return internshipStudentLastUpdate;
    }

    public void setInternshipStudentLastUpdate(String internshipStudentLastUpdate) {
        this.internshipStudentLastUpdate = internshipStudentLastUpdate;
    }
   
    
    
}
