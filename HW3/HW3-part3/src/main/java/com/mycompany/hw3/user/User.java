/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.hw3.user;

/**
 *
 * @author akshaydatir
 */
public class User {

    int id;
    String firstname;
    String lastname;
    double GPA;

    public User() {
    }

    public User(int id, String firstname, String lastname, double GPA) {
        this.id = id;
        this.firstname = firstname;
        this.lastname = lastname;
        this.GPA = GPA;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public double getGPA() {
        return GPA;
    }

    public void setGPA(double GPA) {
        this.GPA = GPA;
    }

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", firstname=" + firstname + ", lastname=" + lastname + ", GPA=" + GPA + '}';
    }
    
    
}
