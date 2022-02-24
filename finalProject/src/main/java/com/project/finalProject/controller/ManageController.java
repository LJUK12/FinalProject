package com.project.finalProject.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.finalProject.model.ChatMemberVO2;
import com.project.finalProject.model.ChatVO;
import com.project.finalProject.model.MemberVO;
import com.project.finalProject.model.PostVO;
import com.project.finalProject.model.TransactionVO;
import com.project.finalProject.service.ChatService;
import com.project.finalProject.service.MemberService;
import com.project.finalProject.service.PostService;
import com.project.finalProject.service.TransactionService;

@Controller
public class ManageController {
	@Autowired MemberService memService;
	@Autowired PostService postService;
	@Autowired ChatService chatService;
	@Autowired TransactionService tsService;
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
		ArrayList<PostVO> postVO = postService.manageAllPost();
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
	public String tradeManager(Model model) {
		ArrayList<TransactionVO> tsVO = tsService.listAllTran();
		model.addAttribute("tsVO", tsVO);
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
	@RequestMapping("/postManager/postEdit2")
	public String postEdit2(PostVO vo) {
		int startIdx = vo.getPostContent().indexOf("/photo_upload/");

		if (startIdx != -1) {
			System.out.println("startIdx = " + startIdx);

			// +14 start

			boolean jpg = vo.getPostContent().contains(".jpg");
			boolean png = vo.getPostContent().contains(".png");
			boolean gif = vo.getPostContent().contains(".gif");
			int endIdx = 0;
			if (jpg) {
				endIdx = vo.getPostContent().indexOf(".jpg");
			} else if (png) {
				endIdx = vo.getPostContent().indexOf(".png");
			} else if (gif) {
				endIdx = vo.getPostContent().indexOf(".gif");
			}
			System.out.println("endIdx = " + endIdx);

			// + 4 end

			String thumbFileName = vo.getPostContent().substring((startIdx + 14), (endIdx + 4));
			System.out.println("thumbFileName = " + thumbFileName);

			// 포스트 썸네일 set
			vo.setPostImg(thumbFileName);
		}
		// 포스트 내용의 \n을 <br>로 변경
		vo.setPostContent(vo.getPostContent().replace("\n", "<br>"));
		postService.manageEditPosting(vo);
		System.out.println(vo.getMemNo());
		System.out.println(vo.getPostContent());
		System.out.println(vo.getPostPrice());
		System.out.println(vo.getPostTag());
		System.out.println(vo.getPostWay());
		return "redirect:/postManager";
	}
	@RequestMapping("/postManager/postDelete/{postNo}")
	public String ManagerpostDelete(@PathVariable int postNo) {
		postService.deletePost(postNo);
		return "redirect:../";
	}
	
	
	@RequestMapping("/chatManager/chatEdit/{chatNo}")
	public String ManagerChatEdit(@PathVariable int chatNo, Model model) {
		ChatMemberVO2 chatVO = chatService.manageChatList(chatNo);
		model.addAttribute("chatVO", chatVO);
		return "manage/chatEditManagement";
	}
	@RequestMapping("/chatManager/chatDelete/{chatNo}")
	public String ManagerChatDelete(@PathVariable int chatNo) {
		chatService.deleteChat(chatNo);
		return "redirect:/chatManager";
	}
	
	@RequestMapping("/tradeManager/tranEdit/{tranNo}")
	public String tranEdit(@PathVariable int tranNo) {
		/*
		 * TransactionVO tranVO = postService.manageDetailViewPost(postNo);
		 * model.addAttribute("tranVO", tranVO);
		 */
		return "manage/chatEditManagement";
	}
	@RequestMapping("/tradeManager/tranDelete/{tranNo}")
	public String tranDelete(@PathVariable int tranNo) {
		tsService.manageDeleteTran(tranNo);
		return "redirect:/tradeManager";
	}
}
