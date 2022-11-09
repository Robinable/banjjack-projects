package com.green.vo;

public class EventVo {

    private int _id;

    private String writer;

    private String title;

    private String time;

    private int readcount;

    private String content;

    private String eventimage;

    private int displaypost;

    private int postnum;


    private String start_time;

    private String end_time;

    public EventVo(){}

    public EventVo(int _id, String writer, String title, String time, int readcount, String content,
                   String eventimage, int displaypost, int postnum,  String end_time, String start_time) {
        this._id = _id;
        this.writer = writer;
        this.title = title;
        this.time = time;
        this.readcount = readcount;
        this.content = content;
        this.eventimage = eventimage;
        this.displaypost = displaypost;
        this.postnum = postnum;
        this.end_time = end_time;
        this.start_time = start_time;
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

    public String getEventimage() {
        return eventimage;
    }

    public void setEventimage(String eventimage) {
        this.eventimage = eventimage;
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

    public String getStart_time() {
        return start_time;
    }

    public void setStart_time(String start_time) {
        this.start_time = start_time;
    }

    public String getEnd_time() {
        return end_time;
    }

    public void setEnd_time(String end_time) {
        this.end_time = end_time;
    }

    @Override
    public String toString() {
        return "EventVo{" +
                "_id=" + _id +
                ", writer='" + writer + '\'' +
                ", title='" + title + '\'' +
                ", time='" + time + '\'' +
                ", readcount=" + readcount +
                ", content='" + content + '\'' +
                ", eventimage='" + eventimage + '\'' +
                ", end_time='" + end_time + '\'' +
                ", start_time='" + start_time + '\'' +
                ", displaypost=" + displaypost +
                ", postnum=" + postnum +
                '}';
    }
}
