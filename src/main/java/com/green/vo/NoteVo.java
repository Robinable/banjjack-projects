package com.green.vo;

public class NoteVo {

    private int _id;
    private String content;
    private String recept;
    private String send;
    private String time;

    private int displaypost;

    private int postnum;

    public NoteVo(int _id, String content, String recept, String send, String time, int displaypost, int postnum) {
        this._id = _id;
        this.content = content;
        this.recept = recept;
        this.send = send;
        this.time = time;
        this.displaypost = displaypost;
        this.postnum = postnum;
    }

    public NoteVo() {
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

    public int getDisplaypost() {
        return displaypost;
    }

    public void setTime(int displaypost) {
        this.displaypost = displaypost;
    }

    public int getPostnum() {
        return postnum;
    }

    public void postnum(int postnum) {
        this.postnum = postnum;
    }





    @Override
    public String toString() {
        return "NoteVo{" +
                "_id=" + _id +
                ", content='" + content + '\'' +
                ", recept='" + recept + '\'' +
                ", send='" + send + '\'' +
                ", time='" + time + '\'' +
                ", displaypost='" + displaypost + '\'' +
                ", postnum='" + postnum + '\'' +
                '}';
    }
}
