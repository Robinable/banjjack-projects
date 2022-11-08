package com.green.vo;

public class WriteVo {
    int _id;
    String username;
    String title;
    String content;
    int category;
    String time;
    int readcount;

    public WriteVo() {
    }

    public WriteVo(int _id, String username, String title, String content, int category, String time, int readcount) {
        this._id = _id;
        this.username = username;
        this.title = title;
        this.content = content;
        this.category = category;
        this.time = time;
        this.readcount = readcount;
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getCategory() {
        return category;
    }

    public void setCategory(int category) {
        this.category = category;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getReadcount() {
        return readcount;
    }

    public void setReadcount(int readcount) {
        this.readcount = readcount;
    }

    @Override
    public String toString() {
        return "WriteVo{" +
                "_id='" + _id + '\'' +
                ", username='" + username + '\'' +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", category=" + category +
                ", time='" + time + '\'' +
                ", readcount=" + readcount +
                '}';
    }
}
