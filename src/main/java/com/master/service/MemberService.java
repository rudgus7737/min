package com.master.service;

import java.util.List;


import com.master.dto.MemberVO;

public interface MemberService {
	public void createMember(MemberVO vo);//회원가입
	public List<MemberVO>getMember();//회원목록 가져오기
	public int emailCheck(String email);//이메일 받아서 중복확인
	public int nickNameCheck(String nickName);//이메일 받아서 중복확인
	public MemberVO login(MemberVO vo);//로그인 정보
}
