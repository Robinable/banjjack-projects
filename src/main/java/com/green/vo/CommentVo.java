package com.green.vo;

import com.fasterxml.jackson.annotation.JsonInclude;


public class CommentVo {
    private int _id;
    private int content_id;
    private String content;
    private String time;
    private String username;


    public CommentVo(int _id, int content_id, String content, String time, String username) {
        this._id = _id;
        this.content_id = content_id;
        this.content = content;
        this.time = time;
        this.username = username;
    }

    public CommentVo() {
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

                '}';
    }
}