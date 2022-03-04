package com.project.finalProject.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.project.finalProject.dao.IMemberDAO;
import com.project.finalProject.model.MemberVO;


@Service
public class MemberService implements IMemberService{

	@Autowired
	@Qualifier("IMemberDAO")
	IMemberDAO dao;

	@Override
	public MemberVO loginCheck(HashMap<String, Object> map) {
		return dao.loginCheck(map);
	}
	
	@Override
	public String memIdCheck(String memId) {
		return dao.memIdCheck(memId);
	}
	
	@Override
	public String memEmailCheck(String email) {
		return dao.memEmailCheck(email);
	}
	
	@Override
	public void memJoin(MemberVO vo) {
		dao.memJoin(vo);
	}
	
	@Override
	public MemberVO profileInfo(String memId) {
		return dao.profileInfo(memId);
	}
	
	@Override
	public void updateProfile(MemberVO memVo) {
		dao.updateProfile(memVo);
	}
	
	@Override
	public ArrayList<MemberVO> listAllProfile() {
		return dao.listAllProfile();
	}
	

	@Override
	public ArrayList<MemberVO> idSearch(HashMap<String, Object> map) {
		return dao.idSearch(map);
	}

	@Override
	public void withdrawMember(String memId) {
		dao.withdrawMember(memId);
		
	}

	@Override
	public String searchMemId(int memNo) {
		// TODO Auto-generated method stub
		return dao.searchMemId(memNo);
	}

	@Override
	public void managerDeleteProfile(int memNo) {
		dao.managerDeleteProfile(memNo);
		
	}

	@Override
	public String searchMemId2(int memNo) {
		// TODO Auto-generated method stub
		return dao.searchMemId2(memNo);
	}

	@Override
	public String searchAddress2(int memNo) {
		// TODO Auto-generated method stub
		return dao.searchAddress2(memNo);
	}

	@Override
	public MemberVO pwdSearch(MemberVO memvo) {
		// TODO Auto-generated method stub
		return dao.pwdSearch(memvo);
	}

	@Override
	public int pwdChange(MemberVO memVO) {
		// TODO Auto-generated method stub
		return dao.pwdChange(memVO);
	}
	@Override
	public ArrayList<MemberVO> memSearchManage(String memSearch){
		// 멤버 검색 ajax
		return dao.memSearchManage(memSearch);
	}




}
