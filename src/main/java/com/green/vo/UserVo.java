package com.green.vo;

public class UserVo {
    private int _id;
    private String username;
    private String userpassword;
    private String usernickname;

    private String useremail;

    private String usersido;

    private String usergugun;

    private String userpet;

    public UserVo(int _id, String username, String userpassword, String usernickname, String useremail, String usersido, String usergugun, String userpet) {
        this._id = _id;
        this.username = username;
        this.userpassword = userpassword;
        this.usernickname = usernickname;
        this.useremail = useremail;
        this.usersido = usersido;
        this.usergugun = usergugun;
        this.userpet = userpet;
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

    public String getUseremail() {
        return useremail;
    }

    public void setUseremail(String useremail) {
        this.useremail = useremail;
    }

    public String getUsersido() {
        return usersido;
    }

    public void setUsersido(String usersido) {
        this.usersido = usersido;
    }

    public String getUsergugun() {
        return usergugun;
    }

    public void setUsergugun(String usergugun) {
        this.usergugun = usergugun;
    }

    public String getUserpet() {
        return userpet;
    }

    public void setUserpet(String userpet) {
        this.userpet = userpet;
    }

    @Override
    public String toString() {
        return "UserVo{" +
                "_id=" + _id +
                ", username='" + username + '\'' +
                ", userpassword='" + userpassword + '\'' +
                ", usernickname='" + usernickname + '\'' +
                ", useremail='" + useremail + '\'' +
                ", usersido='" + usersido + '\'' +
                ", usergugun='" + usergugun + '\'' +
                ", userpet='" + userpet + '\'' +
                '}';
    }
}
