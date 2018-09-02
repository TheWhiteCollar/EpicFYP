/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Entity;

import java.sql.Date;

/* Database sequence
    #1: internshipID (int 11)
    #2: internshipName (varchar 100)
    #3: internshipApproval (varchar 100)
    #4: internshipCategory (int 11)
    #5: internshipDescription (varchar 1000)
    #6: internshipStart (date)
    #7: internshipEnd (date)
    #8: internshipPay (decimal 13,2)
    #9: internshipSupervisor (varchar 100)
    #10: internshipSupervisorEmail (varchar 100)
 */

public class Internship {

    private int internshipID;
    private String internshipName;
    private String internshipApproval;
    private int internshipCategory;
    private String internshipDescription;
    private Date internshipStart;
    private Date internshipEnd;
    private double internshipPay;
    private String internshipSupervisor;
    private String internshipSupervisorEmail;

    public Internship(int internshipID, String internshipName, String internshipApproval, int internshipCategory, String internshipDescription, Date internshipStart, Date internshipEnd, double internshipPay, String internshipSupervisor, String internshipSupervisorEmail) {
        this.internshipID = internshipID;
        this.internshipName = internshipName;
        this.internshipApproval = internshipApproval;
        this.internshipCategory = internshipCategory;
        this.internshipDescription = internshipDescription;
        this.internshipStart = internshipStart;
        this.internshipEnd = internshipEnd;
        this.internshipPay = internshipPay;
        this.internshipSupervisor = internshipSupervisor;
        this.internshipSupervisorEmail = internshipSupervisorEmail;
    }

    public int getInternshipID() {
        return internshipID;
    }

    public void setInternshipID(int internshipID) {
        this.internshipID = internshipID;
    }

    public String getInternshipName() {
        return internshipName;
    }

    public void setInternshipName(String internshipName) {
        this.internshipName = internshipName;
    }

    public String getInternshipApproval() {
        return internshipApproval;
    }

    public void setInternshipApproval(String internshipApproval) {
        this.internshipApproval = internshipApproval;
    }

    public int getInternshipCategory() {
        return internshipCategory;
    }

    public void setInternshipCategory(int internshipCategory) {
        this.internshipCategory = internshipCategory;
    }

    public String getInternshipDescription() {
        return internshipDescription;
    }

    public void setInternshipDescription(String internshipDescription) {
        this.internshipDescription = internshipDescription;
    }

    public Date getInternshipStart() {
        return internshipStart;
    }

    public void setInternshipStart(Date internshipStart) {
        this.internshipStart = internshipStart;
    }

    public Date getInternshipEnd() {
        return internshipEnd;
    }

    public void setInternshipEnd(Date internshipEnd) {
        this.internshipEnd = internshipEnd;
    }

    public double getInternshipPay() {
        return internshipPay;
    }

    public void setInternshipPay(double internshipPay) {
        this.internshipPay = internshipPay;
    }

    public String getInternshipSupervisor() {
        return internshipSupervisor;
    }

    public void setInternshipSupervisor(String internshipSupervisor) {
        this.internshipSupervisor = internshipSupervisor;
    }

    public String getInternshipSupervisorEmail() {
        return internshipSupervisorEmail;
    }

    public void setInternshipSupervisorEmail(String internshipSupervisorEmail) {
        this.internshipSupervisorEmail = internshipSupervisorEmail;
    }

}
