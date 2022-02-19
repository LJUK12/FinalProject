package com.project.finalProject.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.project.finalProject.model.FavoritVO;

public interface IFavoritService {

	void insertFavorit(HashMap<String, Object> list);			//즐겨찾기 추가
	FavoritVO selectFavorit(HashMap<String, Object> list);	//즐겨찾기 검색
	ArrayList<FavoritVO> selectFavoritList(int memNo);		//즐겨찾기 목록 검색
	void deleteFavorit(int fvrNo);				//즐겨찾기 삭제
}
