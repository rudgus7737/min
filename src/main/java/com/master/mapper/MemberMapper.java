package com.master.mapper;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.master.dto.MemberVO;

public interface MemberMapper {
	public void createMember(MemberVO vo);							//회원가입
	public List<MemberVO> getMember();								//회원목록 가져오기
	public int emailCheck(String email);							//이메일 받아서 중복확인
	public int nickNameCheck(String nickName);						//닉네임 받아서 중복확인
	public MemberVO login(MemberVO vo);								//로그인 정보
	public void logout(HttpSession session);						//로그아웃

	
	
	

}
