package com.project.finalProject.service;

import java.util.ArrayList;

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

}
