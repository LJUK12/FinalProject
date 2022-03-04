package com.project.finalProject.dao;

import java.util.ArrayList;
import java.util.List;

import com.project.finalProject.model.BoardVO;
import com.project.finalProject.model.Criteria;

public interface IBoardDAO {
	
    //게시글 등록
	public void enroll(BoardVO boardVO);
	
	//게시글 목록확인
	public List<BoardVO> getList();
	
	//게시글 조회하기
	public BoardVO getPage(int comNo);
	
	//게시판 수정
    public int modify(BoardVO board);
	
    //게시판 삭제
    public int delete(int comNo);
    
    //게시판 목록(페이징 적용)
    public List<BoardVO> getListPaging(Criteria cri);
	
    // 게시판 총 갯수
    public int getTotal(Criteria cri);
    
    //게시글 업로드
    void insertPost(BoardVO vo);
    
    //게시글 상세조회2
    BoardVO detailViewBoard(int comNo);
    
    //게시글 전부조회
    ArrayList<BoardVO> listAllBoard(); 
    
    //게시글 조회수 상승
    void hitCount(int comNo);
    
  //나의 게시글 확인
    ArrayList<BoardVO> getMyList(int memNo);

    

    
}
