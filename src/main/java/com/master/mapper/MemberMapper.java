package com.master.mapper;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.master.dto.MemberVO;

public interface MemberMapper {
	public void createMember(MemberVO vo);							//ȸ������
	public List<MemberVO> getMember();								//ȸ����� ��������
	public int emailCheck(String email);							//�̸��� �޾Ƽ� �ߺ�Ȯ��
	public int nickNameCheck(String nickName);						//�г��� �޾Ƽ� �ߺ�Ȯ��
	public MemberVO login(MemberVO vo);								//�α��� ����
	public void logout(HttpSession session);						//�α׾ƿ�

	
	
	

}
