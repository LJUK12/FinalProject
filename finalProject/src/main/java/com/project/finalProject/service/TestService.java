package com.project.finalProject.service;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service	
public class TestService {
	public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) {
		String api_key = "NCS6KEMHL2PHMCGA";
		String api_secret = "TRGVDUZ1XOYCTPDWZASMMATDXUWO5PW6"; 
		
		Message coolsms = new Message(api_key, api_secret);
		
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", userPhoneNumber);
		params.put("from", "01026048421");


		params.put("type", "SMS");
		params.put("text", "[TEST] 인증번호는" + "["+randomNumber+"]" + "입니다.");
		params.put("app_version", "test app 1.2");
		
		   try {
			   JSONObject obj = (JSONObject) coolsms.send(params);
			   System.out.println(obj.toString());
		   } catch (CoolsmsException e) {
			   System.out.println(e.getMessage());
			   System.out.println(e.getCode());

			
		   }
	 }

}
