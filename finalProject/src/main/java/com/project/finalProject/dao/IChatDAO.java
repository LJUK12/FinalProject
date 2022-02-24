package com.project.finalProject.dao;

import java.util.ArrayList;

import com.project.finalProject.model.ChatMemberVO2;
import com.project.finalProject.model.ChatVO;
import com.project.finalProject.model.ComChatMemberVO2;
import com.project.finalProject.model.ComChatVO;


public interface IChatDAO {
	ArrayList<ChatMemberVO2> listAllChat(int postNo); 
	void insertChat(ChatVO vo);
	 void insertChat2(ComChatVO vo);
	 ArrayList<ComChatMemberVO2> listAllChatCommunity(int comNo);
}
