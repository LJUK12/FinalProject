package com.project.finalProject.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.finalProject.model.PostVO;
import com.project.finalProject.service.PostService;

@Controller
public class MainController {
	
	  @Autowired PostService pstService;
	 

	// index 페이지로 이동
	@RequestMapping("/")
	public String index(Model model) {
		
		  ArrayList<PostVO> postList = pstService.listAllPost();
		  model.addAttribute("postList",postList);
		  
		  
		  ArrayList<PostVO> postFavoritList =pstService.listAllPostByFavorit();
		  model.addAttribute("postFavoritList",postFavoritList);
		return "index";
	}

	@RequestMapping("/login")
	public String login() {
		return "login";
	}

}
