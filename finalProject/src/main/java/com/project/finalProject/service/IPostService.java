package com.project.finalProject.service;

import java.util.ArrayList;


import com.project.finalProject.model.PostVO;





public interface IPostService {
	ArrayList<PostVO> listAllPost(); 
	void insertPost(PostVO vo);
	void deletePost(String postNo);
	PostVO detailVeiwPost(int postNo);
	ArrayList<PostVO> searchPost(String postTag);
}
