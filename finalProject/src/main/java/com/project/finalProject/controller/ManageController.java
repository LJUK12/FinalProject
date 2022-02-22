package com.project.finalProject.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.finalProject.model.ChatVO;
import com.project.finalProject.model.MemberVO;
import com.project.finalProject.model.PostVO;
import com.project.finalProject.service.ChatService;
import com.project.finalProject.service.MemberService;
import com.project.finalProject.service.PostService;

@Controller
public class ManageController {
	@Autowired MemberService memService;
	@Autowired PostService postService;
	@Autowired ChatService chatService;
	
	// 관리자 페이지 이동
	@RequestMapping("/rootManager")
	public String rootManager() {
		return "manage/management";
	}
	
	// 각 카테고리별 관리 페이지 이동
	@RequestMapping("/memberManager")
	public String memberManager(Model model) {
		ArrayList<MemberVO> memberVO = memService.listAllProfile();
		model.addAttribute("memberVO", memberVO);
		return "manage/memberManagement";
	}
	@RequestMapping("/postManager")
	public String postManager(Model model) {
		ArrayList<PostVO> postVO = postService.listAllPost();
		model.addAttribute("postVO", postVO);
		return "manage/postManagement";
	}
	@RequestMapping("/chatManager")
	public String chatManager(Model model) {
		ArrayList<ChatVO> chatVO = chatService.listAllChatManager();
		model.addAttribute("chatVO", chatVO);
		return "manage/chatManagement";
	}
	@RequestMapping("/tradeManager")
	public String tradeManager() {
		return "manage/tradeManagement";
	}
	
	// 관리자페이지 수정 삭제
	@RequestMapping("/memberManager/memEdit/{memId}")
	public String ManagerMemEdit(@PathVariable String memId, Model model) {
		MemberVO memVO = memService.profileInfo(memId);
		model.addAttribute("memVO", memVO);
		return "manage/memEditManagement";
	}
	// 관리자 회원수정
	@RequestMapping("/memberManager/memEdit2")
	public String memEdit2(MemberVO vo,@RequestParam("memHP1") String memHP1,
						 @RequestParam("memHP2") String memHP2,
						 @RequestParam("memHP3") String memHP3) {
		
		vo.setMemPhone(memHP1+memHP2+memHP3);
		memService.updateProfile(vo);
		
		return "redirect:/memberManager";
	}
	@RequestMapping("/memberManager/memDelete/{memNo}")
	public String ManagerMemDelete(@PathVariable int memNo) {
		memService.managerDeleteProfile(memNo);
		return "redirect:../";
	}
	@RequestMapping("/postManager/postEdit/{postNo}")
	public String ManagerpostEdit(@PathVariable int postNo, Model model) {
		PostVO postVO = postService.manageDetailViewPost(postNo);
		model.addAttribute("postVO", postVO);
		return "manage/postEditManagement";
	}
	@RequestMapping("/postManager/postDelete/{postNo}")
	public String ManagerpostDelete(@PathVariable int postNo) {
		postService.deletePost(postNo);
		return "redirect:../";
	}
	@RequestMapping("/chatManager/chatEdit/{chatNo}")
	public String ManagerChatEdit() {
		return "redirect:../";
	}
	@RequestMapping("/chatManager/chatDelete/{chatNo}")
	public String ManagerChatDelete(@PathVariable int chatNo) {
		chatService.deleteChat(chatNo);
		return "redirect:../";
	}
}
