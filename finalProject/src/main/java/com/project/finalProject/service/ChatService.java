package com.project.finalProject.service;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.project.finalProject.dao.IChatDAO;
import com.project.finalProject.model.ChatVO;

@Service
public class ChatService implements IChatService {

	@Autowired
	@Qualifier("IChatDAO")
	IChatDAO dao;
	
	
	@Override
	public ArrayList<ChatVO> listAllChat(int postNo) {
		// TODO Auto-generated method stub
		return dao.listAllChat(postNo);
	}


	@Override
	public void insertChat(ChatVO vo) {
		// TODO Auto-generated method stub
		dao.insertChat(vo);
	}


	@Override
	public ArrayList<ChatVO> listAllChatManager(){
		// 관리자 채팅 목록 조회
		return dao.listAllChatManager();
	}

	@Override
	public void deleteChat(int chatNo) {
		// 채팅 내역 삭제
		dao.deleteChat(chatNo);
	}

	

	
}
