package com.project.finalProject.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.finalProject.model.PostVO;
import com.project.finalProject.model.TransactionVO;
import com.project.finalProject.service.PostService;
import com.project.finalProject.service.TransactionService;



@Controller
public class TransactionController {
	
	@Autowired
	TransactionService tranService;
	
	@Autowired
	PostService postService;
	
	@RequestMapping("/post/insertdirectTranForm/{postNo}")
	public String insertdirectTranForm(@PathVariable int postNo,Model model) {
		System.out.println(postNo);
		PostVO vo = postService.detailVeiwPost(postNo);
		model.addAttribute("post",vo);
		return "/post/directTransaction";
	}
	
	@RequestMapping("/post/insertcourierTranForm/{postNo}")
	public String insertcourierTranForm(@PathVariable int postNo,Model model) {
		PostVO vo = postService.detailVeiwPost(postNo);
		model.addAttribute("post",vo);
		return "/post/courierTransaction";
	}
	
	
	@RequestMapping("/post/insertTran/{postNo}")
	public String insertdirectTran(@PathVariable int postNo,TransactionVO vo,Model model) {
		
		tranService.insertTransaction(vo);
		
		TransactionVO tranvo = tranService.selectTran(postNo);
		model.addAttribute("tranList",tranvo);
		
		postService.updatePostState(postNo);
		
		return"/post/transResult";
	}
	
	/*
	 * @RequestMapping("/post/transResultView") public String transResult(Model
	 * model) { return"/post/transResult"; }
	 */

	/*
	 * @RequestMapping("/post/insertcourierTran/{postNo}") public String
	 * insertcourierTran(TransactionVO vo,@PathVariable int postNo,Model model) {
	 * 
	 * tranService.insertTransaction(vo);
	 * 
	 * return"/"; }
	 */
	
	
}
