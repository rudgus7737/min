package com.master.mapper;

import java.util.List;

import com.master.dto.BoardVO;

import com.master.dto.Criteria;

public interface BoardMapper {
	public List<BoardVO> getBoard(); 		//�Խ��� ��������
	public BoardVO readBoard(Long bno);		//��ȣ�� �Խ��� ��������
	public void insertBoard(BoardVO vo);	//�Խñ� �ۼ�
	public void plussHit(Long bno);			//��ȸ�� ����
	public int updateBoard(BoardVO vo);		//�Խñ� ������Ʈ
	public void deleteBoard(Long bno);  	//��ȣ�� �ش�Ǵ� �Խñ� ����


	public List<BoardVO> getListPaging(Criteria cri); 	// �Խ��� ����Ʈ ����¡
	public int getTotal(Criteria cri); 					// �Խ��� �� ����

}
