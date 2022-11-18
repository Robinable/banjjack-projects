package com.green.vo;

public class InquiryVo {
    private int _id;

    private String content;

    private String title;

    private String recept;

    private String send;

    private String time;

    private int category;

    private int bnum;

    private int lvl;

    private int step;

    public InquiryVo(){}
    public InquiryVo(int _id, String content, String title, String recept, String send, String time, int category, int bnum, int lvl, int step) {
        this._id = _id;
        this.content = content;
        this.title = title;
        this.recept = recept;
        this.send = send;
        this.time = time;
        this.category = category;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getRecept() {
        return recept;
    }

    public void setRecept(String recept) {
        this.recept = recept;
    }

    public String getSend() {
        return send;
    }

    public void setSend(String send) {
        this.send = send;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getCategory() {
        return category;
    }

    public void setCategory(int category) {
        this.category = category;
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
        return "InquiryVo{" +
                "_id=" + _id +
                ", content='" + content + '\'' +
                ", title='" + title + '\'' +
                ", recept='" + recept + '\'' +
                ", send='" + send + '\'' +
                ", time='" + time + '\'' +
                ", bnum='" + bnum + '\'' +
                ", lvl='" + lvl + '\'' +
                ", step='" + step + '\'' +
                ", category=" + category +
                '}';
    }
}