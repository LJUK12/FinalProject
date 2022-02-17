package com.project.finalProject.dao;

import java.util.ArrayList;


import com.project.finalProject.model.PostVO;




public interface IPostDAO {

	ArrayList<PostVO> listAllPost(); 
	void insertPost(PostVO vo);
	void deletePost(int postNo);
	PostVO detailVeiwPost(int postNo);
	ArrayList<PostVO> searchPost(String postTag);
	ArrayList<PostVO> titleContentSearchPost(String postKeyword);
}
