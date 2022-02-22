package com.project.finalProject.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.project.finalProject.model.PostVO;




public interface IPostDAO {

	ArrayList<PostVO> listAllPost(); 
	void insertPost(PostVO vo);
	void deletePost(int postNo);
	PostVO detailVeiwPost(int postNo);
	ArrayList<PostVO> searchPost(String postTag);
	ArrayList<PostVO> titleContentSearchPost(String postKeyword);
	ArrayList<PostVO> myPost(HashMap<String, Object> myOpt);								//내가 쓴 글 찾기

	PostVO manageDetailViewPost(int postNo);	//관리자용 디테일 뷰

	int postListCount(int memNo);			
	void FavoritCountPlus(int postNo);
	ArrayList<PostVO> listAllPostByFavorit();
	void updatePostState(int postNo);

}
