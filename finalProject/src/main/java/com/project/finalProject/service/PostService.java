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


}