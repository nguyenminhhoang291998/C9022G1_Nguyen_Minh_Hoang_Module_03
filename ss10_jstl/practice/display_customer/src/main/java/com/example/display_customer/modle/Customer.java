package com.example.display_customer.modle;

public class Customer {
    private String name;
    private String dayOfBirth;
    private String address;
    private String picturePath;

    public Customer() {
    }

    public Customer(String name, String dayOfBirth, String address, String picturePath) {
        this.name = name;
        this.dayOfBirth = dayOfBirth;
        this.address = address;
        this.picturePath = picturePath;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDayOfBirth() {
        return dayOfBirth;
    }

    public void setDayOfBirth(String dayOfBirth) {
        this.dayOfBirth = dayOfBirth;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPicturePath() {
        return picturePath;
    }

    public void setPicturePath(String picturePath) {
        this.picturePath = picturePath;
    }
}
