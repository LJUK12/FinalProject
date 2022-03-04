package com.project.finalProject.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.project.finalProject.model.TransactionVO;

public interface ITransactionDAO {

	void insertTransaction(TransactionVO vo);
	ArrayList<TransactionVO> listAllTran();
	TransactionVO selectTran(int ponstNo);
	void manageDeleteTran(int tranNo);	// 관리자 삭제
	ArrayList<TransactionVO> tranSearchManage(String tranSearch); // 관리자 거래내역 검색
	TransactionVO ManageSelectTran(int tranNo);	// 관리자 수정조회
	void manageUpdateTran(HashMap<String, Object> map);	// 관리자 거래내역 수정
}
