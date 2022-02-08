package com.project.finalProject.dao;

import java.util.ArrayList;
import java.util.Date;

import com.project.finalProject.model.ChatVO;


public interface IChatDAO {
	ArrayList<ChatVO> listAllChat(int postNo); 
	void insertChat(ChatVO vo);
	

}
