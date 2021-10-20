package com.master.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.master.dto.MemberVO;
import com.master.mapper.MemberMapper;

import lombok.Setter;

@Service
@Repository
public class MemberServiceImpl implements MemberService{
	@Setter(onMethod_=@Autowired)
	private MemberMapper mapper;

	@Override
	public void createMember(MemberVO vo) {
		mapper.createMember(vo);
		
	}

	@Override
	public List<MemberVO> getMember() {
		return mapper.getMember();
	}

	@Override
	public int emailCheck(String email) {
		return mapper.emailCheck(email);
	}

	@Override
	public int nickNameCheck(String nickName) {
		return mapper.nickNameCheck(nickName);
	}

	@Override
	public MemberVO login(MemberVO vo) {
		return mapper.login(vo);
	}


	
	

	
	
	
	



}
