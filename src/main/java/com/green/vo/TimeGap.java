package com.green.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeGap {

    private String time;


    public String getTime() {
        return time;
    }
    public void setTime(String time) throws ParseException {
        this.time = time;
        timeGap();
    }

    public void timeGap() throws ParseException {
        //현재시간 포맷 맞춰 스트링으로
        Date now = new Date();
        SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat format2 = new SimpleDateFormat ( "MM-dd");

        //글시간 포맷맞춰 스트링으로
        String thistime = format1.format(now);

        //시간 차 구하기
        Date timeNow = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(thistime);
        Date incTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(time);
        //기본적으로 밀리초이기 때문에 1000으로 나눠줌
        int timeGapSec = (int)((Math.floor(timeNow.getTime())-Math.floor(incTime.getTime())))/1000;
        System.out.println(timeGapSec);
        // 결과값 변환 ( 60초 이내 , 60분 이내, 24시간 으로 구분)
        if (timeGapSec<= 60) {
            time = "방금전";
        } else if (timeGapSec <= 3600) {
            time = String.valueOf((timeGapSec)/60) + "분 전";
        } else if (timeGapSec <= 86400) {
            time = String.valueOf((timeGapSec)/3600) + "시간 전";
        } else {
            time = String.valueOf(format2.format(incTime));
        }


    }
}
