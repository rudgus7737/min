package com.master.service;

import java.util.List;


import com.master.dto.MemberVO;

public interface MemberService {
	public void createMember(MemberVO vo);//ȸ������
	public List<MemberVO>getMember();//ȸ����� ��������
	public int emailCheck(String email);//�̸��� �޾Ƽ� �ߺ�Ȯ��
	public int nickNameCheck(String nickName);//�̸��� �޾Ƽ� �ߺ�Ȯ��
	public MemberVO login(MemberVO vo);//�α��� ����
}
