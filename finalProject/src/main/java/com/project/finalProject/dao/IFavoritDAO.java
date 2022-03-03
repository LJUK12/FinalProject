package com.project.finalProject.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.project.finalProject.model.FavoritVO;

public interface IFavoritDAO {

	void insertFavorit(HashMap<String, Object> list);			//즐겨찾기 추가
	FavoritVO selectFavorit(HashMap<String, Object> list);	//즐겨찾기 검색
	ArrayList<FavoritVO> selectFavoritList(int memNo);
	void deleteFavorit(int fvrNo);				//즐겨찾기 삭제
}
