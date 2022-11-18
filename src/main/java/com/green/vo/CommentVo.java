package com.green.vo;

import com.fasterxml.jackson.annotation.JsonInclude;


public class CommentVo {
    private int _id;
    private int content_id;
    private String content;
    private String time;
    private String username;
    private int menu_id;
    private int commentcount;
    private String profiledata;

    private String usernickname;

    public CommentVo(int _id, int content_id, String content, String time, String username, int menu_id, int commentcount, String profiledata, String usernickname) {
        this._id = _id;
        this.content_id = content_id;
        this.content = content;
        this.time = time;
        this.username = username;
        this.menu_id = menu_id;
        this.commentcount = commentcount;
        this.profiledata = profiledata;
        this.usernickname = usernickname;
    }

    public CommentVo() {
    }

    public String getUsernickname() {
        return usernickname;
    }

    public void setUsernickname(String usernickname) {
        this.usernickname = usernickname;
    }

    public String getProfiledata() {
        return profiledata;
    }

    public void setProfiledata(String profiledata) {
        this.profiledata = profiledata;
    }

    public int getCommentcount() {
        return commentcount;
    }

    public void setCommentcount(int commentcount) {
        this.commentcount = commentcount;
    }

    public int getMenu_id() {
        return menu_id;
    }

    public void setMenu_id(int menu_id) {
        this.menu_id = menu_id;
    }

    public int get_id() { return _id;  }

    public void set_id(int _id) {
        this._id = _id;
    }

    public int getContent_id() {
        return content_id;
    }

    public void setContent_id(int content_id) {
        this.content_id = content_id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public String toString() {
        return "CommentVo{" +
                "_id=" + _id +
                ", content_id=" + content_id +
                ", content='" + content + '\'' +
                ", time='" + time + '\'' +
                ", username='" + username + '\'' +
                ", menu_id=" + menu_id +
                ", commentcount=" + commentcount +
                ", profiledata='" + profiledata + '\'' +
                ", usernickname='" + usernickname + '\'' +
                '}';
    }
}