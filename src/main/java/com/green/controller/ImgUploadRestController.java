package com.doni.blog.restcontroller;


import lombok.extern.java.Log;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;


import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

@RestController
@Log
public class ImgUploadRestController {

    //프론트 단에서 직접 서버로 주고싶었지만 브라우저vs브라우저 통신일때 CROS에러[프로토콜,도메인,헤더중 하나라도 다를때 발생] 때문에 여기에 post요청하는 rest페이지 하나를 만듦
    @PostMapping("imageupload")
    public String imageuploadurl(@RequestBody String jsondata) throws IOException {
        log.info("이미지업로드 진입");
        URL url = new URL("http://donipop.com/single/upload");
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("POST");
        connection.setRequestProperty("Content-Type","application/json");
        connection.setDoOutput(true);

        DataOutputStream outputStream = new DataOutputStream(connection.getOutputStream());
        outputStream.writeBytes(jsondata);
        outputStream.flush();
        outputStream.close();

        //var responseCode = connection.getResponseCode();

        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
        StringBuilder stringBuffer = new StringBuilder();
        String inputLine;

        while ((inputLine = bufferedReader.readLine()) != null){
            stringBuffer.append(inputLine);
        }
        bufferedReader.close();

        String response = stringBuffer.toString();
        log.info(response);
        return response;
    }
}