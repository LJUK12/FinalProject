package com.project.finalProject.model;

import java.util.Date;

public class ChatMemberVO2 {

	// 댓글의 아이디를 불러오기 위해 만듬
	
	private int chatNo;
	private int postNo;
	private int memNo;
	private String chatContent;
	private Date chatDate;
	private String memId;
	
	public int getChatNo() {
		return chatNo;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public String getChatContent() {
		return chatContent;
	}
	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}
	public Date getChatDate() {
		return chatDate;
	}
	public void setChatDate(Date chatDate) {
		this.chatDate = chatDate;
	}	
}
