package com.project.finalProject.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.project.finalProject.model.MemberVO;

public interface IMemberDAO {
	MemberVO loginCheck(HashMap<String, Object> map); // 로그인
	String memIdCheck(String memId); // id 중복 확인
	String memEmailCheck(String email); // 이메일 중복 확인
	void memJoin(MemberVO vo); // 회원가입
	ArrayList<MemberVO> idSearch(HashMap<String, Object> map); //id찾기
	MemberVO pwdSearch(MemberVO memvo); //비밀번호찾기
	int pwdChange(MemberVO memVO); //비밀번호 변경
	
	ArrayList<MemberVO> listAllProfile();   	// 전체 정보 조회
	MemberVO profileInfo(String memId);			// 상세 상품 조회
	void updateProfile(MemberVO memVo);			// 상품 정보 수정
	void withdrawMember(String memId);	
	String searchMemId(int memNo); 				// 멤버 넘버로 아이디 찾아오기
	String searchMemId2(int memNo);
	void managerDeleteProfile(int memNo);	// 관리자 페이지 삭제 : 필요시 코드 지우기 가능	
	String searchAddress2(int memNo);
	ArrayList<MemberVO> memSearchManage(String memSearch);	// 멤버 검색 ajax
}