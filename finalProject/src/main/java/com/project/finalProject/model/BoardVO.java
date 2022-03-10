package com.project.finalProject.model;

import java.sql.Date;

public class BoardVO {

	private int comNo;
	private String comTitle;
	private String comContent; 
	private Date comDate;
	private Date comUpdateDate;
	private int comHit;
	private int comFavorite; 
	private String comImg;
	private int comDecl; 
	private int memNo;
	private String memId;
	private String comTag;
	
	
	
	public String getComTag() {
		return comTag;
	}
	public void setComTag(String comTag) {
		this.comTag = comTag;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public Date getComUpdateDate() {
		return comUpdateDate;
	}
	public void setComUpdateDate(Date comUpdateDate) {
		this.comUpdateDate = comUpdateDate;
	}
	public int getComNo() {
		return comNo;
	}
	public void setComNo(int comNo) {
		this.comNo = comNo;
	}
	public String getComTitle() {
		return comTitle;
	}
	public void setComTitle(String comTitle) {
		this.comTitle = comTitle;
	}
	public String getComContent() {
		return comContent;
	}
	public void setComContent(String comContent) {
		this.comContent = comContent;
	}
	public Date getComDate() {
		return comDate;
	}
	public void setComDate(Date comDate) {
		this.comDate = comDate;
	}
	public int getComHit() {
		return comHit;
	}
	public void setComHit(int comHit) {
		this.comHit = comHit;
	}
	public int getComFavorite() {
		return comFavorite;
	}
	public void setComFavorite(int comFavorite) {
		this.comFavorite = comFavorite;
	}
	public String getComImg() {
		return comImg;
	}
	public void setComImg(String comImg) {
		this.comImg = comImg;
	}
	public int getComDecl() {
		return comDecl;
	}
	public void setComDecl(int comDecl) {
		this.comDecl = comDecl;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	
	
	
	
}
