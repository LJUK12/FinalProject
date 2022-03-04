package com.project.finalProject.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.finalProject.model.PostVO;
import com.project.finalProject.service.ChatbotService;
import com.project.finalProject.service.PostService;
import com.project.finalProject.service.STTService;
import com.project.finalProject.service.TTSService;

@Controller
public class MainController {
	
	@Autowired PostService pstService;
	@Autowired STTService sttService;
	@Autowired ChatbotService chbService;
	@Autowired TTSService ttsService;

	// index 페이지로 이동
	@RequestMapping("/")
	public String index(Model model) {
		
		  ArrayList<PostVO> postList = pstService.listAllPost();
		  model.addAttribute("postList",postList);
		  
		  ArrayList<PostVO> postList2 = pstService.listAllPostByDESC();
		  model.addAttribute("listAllPostByDESC",postList2);
		  
		  ArrayList<PostVO> postFavoritList =pstService.listAllPostByFavorit();
		  model.addAttribute("postFavoritList",postFavoritList);
		  
		  
		return "index";
	}

	@RequestMapping("/login")
	public String login() {
		return "login";
	}

	@ResponseBody
	@RequestMapping("/chatbotCallImgLink")
	public String chatbotCallImgLink(@RequestParam("message") String message) throws IOException{
		String result = chbService.imgLinkMainService(message);
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/chatbotTTS")
	public String chatbotTTS(@RequestParam("message") String message) throws IOException {
		String result = ttsService.chatbotTextToSpeech(message);
				
		System.out.println(result);
		return result;
	}

	@ResponseBody
	@RequestMapping("/speechToTextSTT")
	public String speechToTextSTT(@RequestParam("uploadFile") MultipartFile file) throws IOException {
		System.out.println("STT통과");
		String result = "";
		
		// 1. 파일 저장 경로 설정 : 실제 서비스되는 위치 (프로젝트 외부에 저장)
		String uploadPath = "D:/ai/";
		
		// 2. 원본 파일 이름 알아오기
		String originalFileName = file.getOriginalFilename();
		String filePathName = uploadPath + originalFileName;
		
		// 3. 파일 생성
		File file1 = new File(filePathName);
		
		// 4. 서버로 전송
		file.transferTo(file1);	
		
					
		result = sttService.clovaSttService(filePathName);
		System.out.println("STT : " + result);
		return result;
	}
	

	@RequestMapping("/termsAndCondition")
	public String termsAndCondition() {
		return "member/termsAndCondition";
	}

	@RequestMapping("/privacyPolicy")
	public String privacyPolicy() {
		return "member/privacyPolicy";
	}
}
