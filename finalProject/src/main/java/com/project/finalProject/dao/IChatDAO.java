package com.project.finalProject.dao;

import java.util.ArrayList;

import com.project.finalProject.model.ChatMemberVO2;
import com.project.finalProject.model.ChatVO;


public interface IChatDAO {
	ArrayList<ChatMemberVO2> listAllChat(int postNo); 
	void insertChat(ChatVO vo);
	

}
