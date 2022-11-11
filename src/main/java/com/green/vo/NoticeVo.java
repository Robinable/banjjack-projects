package com.green.vo;

public class NoticeVo {
    private int _id;
    private String writer;
    private String title;
    private String time;
    private int readcount;

    private String content;

    private int displaypost;

    private int postnum;

    public NoticeVo(int _id, String writer, String title, String time, int readcount, String content, int displaypost, int postnum) {
        this._id = _id;
        this.writer = writer;
        this.title = title;
        this.time = time;
        this.readcount = readcount;
        this.content = content;
        this.displaypost = displaypost;
        this.postnum = postnum;
    }
    public NoticeVo() {
    }
    public int get_id() {
        return _id;
    }

    public void set_id(int _id) {
        this._id = _id;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getDisplaypost() {
        return displaypost;
    }

    public void setDisplaypost(int displaypost) {
        this.displaypost = displaypost;
    }

    public int getPostnum() {
        return postnum;
    }

    public void setPostnum(int postnum) {
        this.postnum = postnum;
    }

    @Override
    public String toString() {
        return "NoticeVo{" +
                "_id=" + _id +
                ", writer='" + writer + '\'' +
                ", title='" + title + '\'' +
                ", time='" + time + '\'' +
                ", content='" + content + '\'' +
                ", displaypost='" + displaypost + '\'' +
                ", postnum='" + postnum + '\'' +
                ", readcount=" + readcount +

                '}';
    }
}