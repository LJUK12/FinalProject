package com.project.finalProject.service;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Date;

import org.springframework.stereotype.Service;

@Service
public class TTSService {
	
	//  챗봇에서 받은 답변을 음성으로 변환
	public String chatbotTextToSpeech(String message) {
		String clientId = "575290nbji";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "rWNPF6CDyPqhPuxsDAbxTeJt8Ah6bOrqEMsj3FFQ";//애플리케이션 클라이언트 시크릿값";
        String resultPathName = null;
        try {
        	
            String text = URLEncoder.encode(message, "UTF-8"); // 13자
            String apiURL = "https://naveropenapi.apigw.ntruss.com/tts-premium/v1/tts";
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
            con.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);
            // post request
            String postParams = "speaker=nara&volume=0&speed=0&pitch=0&format=mp3&text=" + text;
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            wr.writeBytes(postParams);
            wr.flush();
            wr.close();
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                InputStream is = con.getInputStream();
                int read = 0;
                byte[] bytes = new byte[1024];
                // 랜덤한 이름으로 mp3 파일 생성
                String tempname = Long.valueOf(new Date().getTime()).toString();
                //File f = new File(tempname + ".mp3");
                File f = new File("D:/ai/"+tempname + ".mp3");
                resultPathName = tempname + ".mp3";
                f.createNewFile();
                OutputStream outputStream = new FileOutputStream(f);
                while ((read =is.read(bytes)) != -1) {
                    outputStream.write(bytes, 0, read);
                }
                is.close();
            } else {  // 오류 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
                String inputLine;
                StringBuffer response = new StringBuffer();
                while ((inputLine = br.readLine()) != null) {
                    response.append(inputLine);
                }
                br.close();
                System.out.println(response.toString());
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return resultPathName;
	}
	
	// 파일 경로를 전달받아서 파일 내 텍스트 추출해서 변환 함수
	public String fileRead(String filePathName) {
		String result ="";
		
		try {
			File file = new File(filePathName);
			FileReader fr = new FileReader(file);
			
			BufferedReader br = new BufferedReader(fr);
			String line="";
			while((line = br.readLine()) != null) {
				result += line;
			}
			br.close();
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(result);
		return result;
	}
}

/*
 * "Hello, nice to meet you"
clara : 클라라 : 영어, 여성 음색  
matt : 매트 : 영어, 남성 음색

shinji : 신지: 일본어, 남성 음색
お会いできて うれしいです。
만나 뵙게 돼서 반갑습니다!

carmen : 카르멘 : 스페인어, 여성 음색
Encantado de conocerle
만나서 반갑습니다

meimei : 메이메이 : 중국어, 여성 음색
만나서 반갑습니다
很高兴见到你。
*/
