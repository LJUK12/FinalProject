package com.project.finalProject.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.project.finalProject.dao.ITransactionDAO;
import com.project.finalProject.model.TransactionVO;

@Service
public class TransactionService implements ITransactionService {

	@Autowired
	@Qualifier("ITransactionDAO")
	ITransactionDAO dao;
	
	@Override
	public void insertTransaction(TransactionVO vo) {
		dao.insertTransaction(vo);

	}


	@Override
	public ArrayList<TransactionVO> listAllTran() {
		// TODO Auto-generated method stub
		return dao.listAllTran();
	}


	@Override
	public TransactionVO selectTran(int ponstNo) {
		// TODO Auto-generated method stub
		return dao.selectTran(ponstNo);
	}


	@Override
	public void manageDeleteTran(int tranNo) {
		dao.manageDeleteTran(tranNo);
		
	}

	@Override
	public TransactionVO ManageSelectTran(int tranNo) {
		// 관리자 수정조회
		return dao.ManageSelectTran(tranNo);
	}
	
	@Override
	public void manageUpdateTran(HashMap<String, Object> map) {
		// 관리자 거래내역 수정
		dao.manageUpdateTran(map);
	}
}
