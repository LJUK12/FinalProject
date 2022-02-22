package com.project.finalProject.service;

import java.util.ArrayList;

import com.project.finalProject.model.ChatMemberVO2;
import com.project.finalProject.model.ChatVO;

public interface IChatService {
	ArrayList<ChatMemberVO2> listAllChat(int postNo); 
	void insertChat(ChatVO vo);

}
