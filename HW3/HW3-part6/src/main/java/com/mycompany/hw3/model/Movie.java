/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.hw3.model;

/**
 *
 * @author akshaydatir
 */
public class Movie {

    String title;
    String Actor;
    String Actress;
    String genre;
    int year;

    public Movie() {
    }

    public Movie(String title, String Actor, String Actress, String genre, int year) {
        this.title = title;
        this.Actor = Actor;
        this.Actress = Actress;
        this.genre = genre;
        this.year = year;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getActor() {
        return Actor;
    }

    public void setActor(String Actor) {
        this.Actor = Actor;
    }

    public String getActress() {
        return Actress;
    }

    public void setActress(String Actress) {
        this.Actress = Actress;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    @Override
    public String toString() {
        return "Movie{" + "title=" + title + ", Actor=" + Actor + ", Actress=" + Actress + ", genre=" + genre + ", year=" + year + '}';
    }
    

}
