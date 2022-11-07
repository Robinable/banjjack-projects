package com.green.vo;

public class UserVo {
    private int _id;
    private String username;
    private String userpassword;
    private String usernickname;

    public UserVo(int _id, String username, String userpassword, String usernickname) {
        this.username = username;
        this.userpassword = userpassword;
        this.usernickname = usernickname;
        this._id = _id;
    }

    public UserVo() {
    }

    public int get_id() {
        return _id;
    }

    public void set_id(int _id) {
        this._id = _id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserpassword() {
        return userpassword;
    }

    public void setUserpassword(String userpassword) {
        this.userpassword = userpassword;
    }

    public String getUsernickname() {
        return usernickname;
    }

    public void setUsernickname(String usernickname) {
        this.usernickname = usernickname;
    }

    @Override
    public String toString() {
        return "UserVo{" +
                "_id=" + _id +
                ", username='" + username + '\'' +
                ", userpassword='" + userpassword + '\'' +
                ", usernickname='" + usernickname + '\'' +
                '}';
    }
}
