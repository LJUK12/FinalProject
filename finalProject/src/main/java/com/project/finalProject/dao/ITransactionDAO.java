package com.project.finalProject.dao;

import java.util.ArrayList;


import com.project.finalProject.model.TransactionVO;

public interface ITransactionDAO {

	void insertTransaction(TransactionVO vo);
	ArrayList<TransactionVO> listAllTran();
	TransactionVO selectTran(int ponstNo);
	void manageDeleteTran(int tranNo);	// 관리자 삭제
}
