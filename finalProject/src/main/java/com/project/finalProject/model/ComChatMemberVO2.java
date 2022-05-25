package com.project.finalProject.model;

public class ComChatMemberVO2 {
	private int com_chatNo;
	private int comNo;
	private int memNo;
	private String chatContent;
	private String chatDate;
	private String memId;
	
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public int getCom_chatNo() {
		return com_chatNo;
	}
	public void setCom_chatNo(int com_chatNo) {
		this.com_chatNo = com_chatNo;
	}
	public int getComNo() {
		return comNo;
	}
	public void setComNo(int comNo) {
		this.comNo = comNo;
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
	public String getChatDate() {
		return chatDate;
	}
	public void setChatDate(String chatDate) {
		this.chatDate = chatDate;
	}
	
}
