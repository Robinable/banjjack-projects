package com.green.vo;


import java.util.Arrays;

public class ProfileVo {

    private int _id;

    private String profiledata;

    public ProfileVo(int _id, String profiledata) {
        this._id = _id;
        this.profiledata = profiledata;
    }

    public ProfileVo() {
    }

    public int get_id() {
        return _id;
    }

    public void set_id(int _id) {
        this._id = _id;
    }

    public String getProfiledata() {
        return profiledata;
    }

    public void setProfiledata(String profiledata) {
        this.profiledata = profiledata;
    }

    @Override
    public String toString() {
        return "ProfileVo{" +
                "_id=" + _id +
                ", profiledata='" + profiledata + '\'' +
                '}';
    }

}
