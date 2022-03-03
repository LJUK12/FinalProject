package com.project.finalProject.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.project.finalProject.dao.IFavoritDAO;
import com.project.finalProject.model.FavoritVO;

@Service
public class FavoritService implements IFavoritService {

	@Autowired
	@Qualifier("IFavoritDAO")
	IFavoritDAO dao;
	
	@Override
	public void insertFavorit(HashMap<String, Object> list) {
		dao.insertFavorit(list);

	}

	@Override
	public FavoritVO selectFavorit(HashMap<String, Object> list) {
		
		return dao.selectFavorit(list);
	}
	
	@Override
	public ArrayList<FavoritVO> selectFavoritList(int memNo){
		return dao.selectFavoritList(memNo);
	}

	@Override
	public void deleteFavorit(int fvrNo) {
		dao.deleteFavorit(fvrNo);

	}

}
