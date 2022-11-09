package com.green.vo;

public class FileVo {
    int _id;
    String filename;
    String filepath;
    int content_id;

    public FileVo() {}
    public FileVo(int _id, String filename, String filepath, int content_id) {
        this._id = _id;
        this.filename = filename;
        this.filepath = filepath;
        this.content_id = content_id;
    }

    public int get_id() {
        return _id;
    }

    public void set_id(int _id) {
        this._id = _id;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getFilepath() {
        return filepath;
    }

    public void setFilepath(String filepath) {
        this.filepath = filepath;
    }

    public int getContent_id() {
        return content_id;
    }

    public void setContent_id(int content_id) {
        this.content_id = content_id;
    }

    @Override
    public String toString() {
        return "fileVo{" +
                "_id=" + _id +
                ", filename='" + filename + '\'' +
                ", filepath='" + filepath + '\'' +
                ", content_id=" + content_id +
                '}';
    }
}
