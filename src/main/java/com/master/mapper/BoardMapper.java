package com.master.mapper;

import java.util.List;

import com.master.dto.BoardVO;

import com.master.dto.Criteria;

public interface BoardMapper {
	public List<BoardVO> getBoard(); 		//게시판 가져오기
	public BoardVO readBoard(Long bno);		//번호로 게시판 가져오기
	public void insertBoard(BoardVO vo);	//게시글 작성
	public void plussHit(Long bno);			//조회수 증가
	public int updateBoard(BoardVO vo);		//게시글 업데이트
	public void deleteBoard(Long bno);  	//번호에 해당되는 게시글 삭제


	public List<BoardVO> getListPaging(Criteria cri); 	// 게시판 리스트 페이징
	public int getTotal(Criteria cri); 					// 게시판 총 갯수

}
