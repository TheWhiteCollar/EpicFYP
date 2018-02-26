/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Entity;

import java.util.ArrayList;

/**
 *
 * @author User
 */
public class User {

    /* Database sequence
    #1: userid (varchar)
    #2: firstname (varchar)
    #3: lastname (varchar)
    #4: contactnumber (int)
    #5: email (varchar)
    #6: password (varchar)
    #7: role (varchar)
     */
    
    private String userid;
    private String firstname;
    private String lastname;
    private int contactnumber;
    private String email;
    private String password;
    private String role;

    public User(String userid, String firstname, String lastname, int contactnumber, String email, String password, String role) {
        this.userid = userid;
        this.firstname = firstname;
        this.lastname = lastname;
        this.contactnumber = contactnumber;
        this.email = email;
        this.password = password;
        this.role = role;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public int getContactnumber() {
        return contactnumber;
    }

    public void setContactnumber(int contactnumber) {
        this.contactnumber = contactnumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

}
