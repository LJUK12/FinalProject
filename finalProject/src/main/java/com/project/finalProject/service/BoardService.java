package com.project.finalProject.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.project.finalProject.dao.IBoardDAO;
import com.project.finalProject.model.BoardVO;
import com.project.finalProject.model.Criteria;

@Service
public class BoardService implements IBoardService{

	@Autowired 
	@Qualifier("IBoardDAO")
	IBoardDAO boardDAO;
	
	@Override //게시글 등록
	public void enroll(BoardVO board) {
		boardDAO.enroll(board);
	}

	@Override //게시글 목록 조회
	public List<BoardVO> getList() {
		return boardDAO.getList();
	}

	@Override //게시글 상세 조회
	public BoardVO getPage(int comNo) {
		return boardDAO.getPage(comNo);
	}

	@Override //게시글 수정
	public int modify(BoardVO board) {
		return boardDAO.modify(board);
	}

	@Override //게시글 삭제
	public int delete(int comNo) {
		return boardDAO.delete(comNo);
	}

	@Override //페이징 기능
	public List<BoardVO> getListPaging(Criteria cri) {
		return boardDAO.getListPaging(cri);
	}
	
    @Override//게시물 총 개수
    public int getTotal(Criteria cri) {
        return boardDAO.getTotal(cri);
    }

	@Override//게시글 업로드
	public void insertPost(BoardVO vo) {
		boardDAO.insertPost(vo);
	}

	@Override//게시글 상세조회2
	public BoardVO detailViewBoard(int comNo) {
		return boardDAO.detailViewBoard(comNo);
	}

	@Override
	public ArrayList<BoardVO> listAllBoard() {
		return boardDAO.listAllBoard();
	}

	@Override
	public void hitCount(int comNo) {
		boardDAO.hitCount(comNo);
	}

	@Override//나의 게시글 조회
    public ArrayList<BoardVO> getMyList(int memNo){
		return boardDAO.getMyList(memNo);
	}

}
