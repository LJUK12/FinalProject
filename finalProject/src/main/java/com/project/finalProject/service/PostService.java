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
	public void deletePost(String postNo) {
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
		// TODO Auto-generated method stub
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
	public void FavoritCountPlus(int postNo) {
		dao.FavoritCountPlus(postNo);
		
	}

	@Override
	public ArrayList<PostVO> listAllPostByFavorit() {
		// TODO Auto-generated method stub
		return dao.listAllPostByFavorit();
	}

	@Override
	public void updatePostState(int postNo) {
		// TODO Auto-generated method stub
		dao.updatePostState(postNo);
		
	}

	@Override
	public void deletePost(int postNo) {
		// TODO Auto-generated method stub
		dao.deletePost(postNo);
	}

	@Override
	public PostVO listPost(int postNo) {
		
		return dao.listPost(postNo);
	}

	@Override
	public PostVO manageDetailViewPost(int postNo) {
		// TODO Auto-generated method stub
		return dao.manageDetailViewPost(postNo);
	}

	@Override
	public ArrayList<PostVO> manageAllPost() {
		// TODO Auto-generated method stub
		return dao.manageAllPost();
	}

	@Override
	public void manageEditPosting(PostVO vo) {
		dao.manageEditPosting(vo);
		
	}

	@Override
	public void posthitplus(int postNo) {
		dao.posthitplus(postNo);
		
	}

	@Override
	public ArrayList<PostVO> listAllPostByDESC() {
		// TODO Auto-generated method stub
		return dao.listAllPostByDESC();
	}

	@Override
	public void declPlus(int postNo) {
		// TODO Auto-generated method stub
		dao.declPlus(postNo);
		
	}

	@Override
	public ArrayList<PostVO> list(String memAddress1) {
		// TODO Auto-generated method stub
		return dao.list(memAddress1);
	}
	


	@Override
	public ArrayList<PostVO> postSearchManage(String postSearch){
		// 관리자 상품검색
		return dao.postSearchManage(postSearch);
	}
	


}