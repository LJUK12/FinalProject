package com.project.finalProject.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.finalProject.service.KakaoPay;

@Controller
public class KakaoController {
    
    @Autowired
    private KakaoPay kakaopay;
    
    
    @RequestMapping("/kakaoPay")
    public void kakaoPayGet() {
        
    }
    
    @PostMapping("/kakaoPay")
    public String kakaoPay() {
        return "redirect:" + kakaopay.kakaoPayReady();
 
    }
    
    @GetMapping("/kakaoPaySuccess")
    public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model, RedirectAttributes rttr) {
        
        model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token));
        rttr.addFlashAttribute("msg", "success");

        return "redirect:/";
        
    }
    
}