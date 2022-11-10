package com.green.vo;

public class WriteVo {
    int _id;
    String username;
    String title;
    String content;
    int category;
    String time;
    int readcount;
    int bnum;
    int lvl;
    int step;

    public WriteVo() {
    }

    public WriteVo(int _id, String username, String title, String content, int category, String time, int readcount, int bnum, int lvl, int step) {
        this._id = _id;
        this.username = username;
        this.title = title;
        this.content = content;
        this.category = category;
        this.time = time;
        this.readcount = readcount;
        this.bnum = bnum;
        this.lvl = lvl;
        this.step = step;
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

    public int getBnum() {
        return bnum;
    }

    public void setBnum(int bnum) {
        this.bnum = bnum;
    }

    public int getLvl() {
        return lvl;
    }

    public void setLvl(int lvl) {
        this.lvl = lvl;
    }

    public int getStep() {
        return step;
    }

    public void setStep(int step) {
        this.step = step;
    }

    @Override
    public String toString() {
        return "WriteVo{" +
                "_id=" + _id +
                ", username='" + username + '\'' +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", category=" + category +
                ", time='" + time + '\'' +
                ", readcount=" + readcount +
                ", bnum=" + bnum +
                ", lvl=" + lvl +
                ", step=" + step +
                '}';
    }
}
