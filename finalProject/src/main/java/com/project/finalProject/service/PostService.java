package com.project.finalProject.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.project.finalProject.dao.IPostDAO;
import com.project.finalProject.model.PostVO;

@Service
public class PostService implements IPostService{

	
	@Autowired
	@Qualifier("IPostDAO")
	IPostDAO dao;

	@Override
	public ArrayList<PostVO> listAllPost() {
		return dao.listAllPost();
	}

	@Override
	public void insertPost(PostVO vo) {
		dao.insertPost(vo);
		
	}

	@Override
	public void deletePost(int postNo) {
		dao.deletePost(postNo);
		
	}

	@Override
	public PostVO detailVeiwPost(int postNo) {
		return dao.detailVeiwPost(postNo);
	}
	
	@Override
	public ArrayList<PostVO> searchPost(String postTag){
		return dao.searchPost(postTag);
	}

	@Override
	public ArrayList<PostVO> titleContentSearchPost(String postKeyword) {
		return dao.titleContentSearchPost(postKeyword);
	}

	@Override
	public ArrayList<PostVO> myPost(HashMap<String, Object> myOpt) {
		return dao.myPost(myOpt);
	}

	@Override
	public int postListCount(int memNo) {
		return dao.postListCount(memNo);
	}

	
	@Override
	public PostVO manageDetailViewPost(int postNo) {
		//관리자용 디테일 뷰
		return dao.manageDetailViewPost(postNo);
	}

	@Override
	public void FavoritCountPlus(int postNo) {
		dao.FavoritCountPlus(postNo);
		
	}

	@Override
	public ArrayList<PostVO> listAllPostByFavorit() {
		return dao.listAllPostByFavorit();
	}

	@Override
	public void updatePostState(int postNo) {
		dao.updatePostState(postNo);
		
	}



}