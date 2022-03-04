package com.project.finalProject.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.project.finalProject.model.ChatMemberVO2;
import com.project.finalProject.model.ChatVO;
import com.project.finalProject.model.ComChatMemberVO2;
import com.project.finalProject.model.ComChatVO;


public interface IChatDAO {
	ArrayList<ChatMemberVO2> listAllChat(int postNo); 
	void insertChat(ChatVO vo);
	 void insertChat2(ComChatVO vo);
	 ArrayList<ComChatMemberVO2> listAllChatCommunity(int comNo);
	 ArrayList<ChatVO> listAllChatManager();	// 관리자 채팅 목록 조회
		void deleteChat(int chatNo);	// 채팅 내역 삭제
		ChatMemberVO2 manageChatList(int chatNo); // 채팅 수정 위해 기록 가져오기
		ArrayList<ChatVO> chatSearchManage(String chatSearch);	// 관리자 채팅 검색
		void manageUpdateChat(HashMap<String, Object> map);	// 관리자 채팅 수정
}
