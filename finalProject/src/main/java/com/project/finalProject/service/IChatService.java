package com.project.finalProject.service;

import java.util.ArrayList;
import java.util.Date;

import com.project.finalProject.model.ChatVO;

public interface IChatService {
	ArrayList<ChatVO> listAllChat(int postNo); 
	void insertChat(ChatVO vo);
	ArrayList<ChatVO> listAllChatManager();	// 관리자 채팅 목록 조회
	void deleteChat(int chatNo);	// 채팅 내역 삭제
}
