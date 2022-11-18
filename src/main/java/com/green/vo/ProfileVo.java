package com.green.vo;


import java.util.Arrays;

public class ProfileVo {

    private int _id;

    private String profiledata;

    private int user_id;

    public ProfileVo(int _id, String profiledata, int user_id) {
        this._id = _id;
        this.profiledata = profiledata;
        this.user_id = user_id;
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

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    @Override
    public String toString() {
        return "ProfileVo{" +
                "_id=" + _id +
                ", profiledata='" + profiledata + '\'' +
                ", user_id=" + user_id +
                '}';
    }
}