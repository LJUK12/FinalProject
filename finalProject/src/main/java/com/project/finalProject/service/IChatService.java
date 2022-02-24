package com.project.finalProject.service;

import java.util.ArrayList;

import com.project.finalProject.model.ChatMemberVO2;
import com.project.finalProject.model.ChatVO;
import com.project.finalProject.model.ComChatMemberVO2;
import com.project.finalProject.model.ComChatVO;

public interface IChatService {
	ArrayList<ChatMemberVO2> listAllChat(int postNo); 
	void insertChat(ChatVO vo);
	ArrayList<ComChatMemberVO2> listAllChatCommunity(int comNo);
	void insertChat2(ComChatVO vo);
	ArrayList<ChatVO> listAllChatManager();	// 관리자 채팅 목록 조회
	void deleteChat(int chatNo);	// 채팅 내역 삭제
	ChatMemberVO2 manageChatList(int chatNo); // 채팅 수정 위해 기록 가져오기
}
