package com.green.vo;

public class PageVo {
    private int num;

    private int count;

    private int postnum = 10;

    private int pagenum;

    private int displaypost;

    private int pagenum_cnt = 10;

    private int endpagenum;

    private int startpagenum;

    private boolean prev;
    private boolean next;

    public void setNum(int num) {
        this.num = num;
    }

    public void setCount(int count) {
        this.count = count;
        dataCalc();
    }

    public int getPostnum() {
        return postnum;
    }

    public int getDisplaypost() {
        return displaypost;
    }

    public int getPagenum_cnt() {
        return pagenum_cnt;
    }

    public int getEndpagenum() {
        return endpagenum;
    }

    public int getStartpagenum() {
        return startpagenum;
    }

    public boolean getPrev() {
        return prev;
    }

    public boolean getNext() {
        return next;
    }

    public int getPagenum() {
        return pagenum;
    }

    private void dataCalc(){

        endpagenum = (int)(Math.ceil((double)num / (double)pagenum_cnt) * pagenum_cnt);
        startpagenum = endpagenum - (pagenum_cnt - 1);

        int endpagenum_tmp = (int)(Math.ceil((double)count / (double)postnum));

        if(endpagenum > endpagenum_tmp) {
            endpagenum = endpagenum_tmp;
        }

        prev = startpagenum == 1 ? false : true;
        // prev의 bool을 정하는데
        //startpagenum이 1이면 false 아니라면 true
        next = endpagenum * postnum >= count ? false : true;

        displaypost = (num - 1) * postnum;

    }
}