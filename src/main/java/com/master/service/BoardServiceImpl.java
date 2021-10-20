package com.master.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.master.dto.BoardVO;
import com.master.dto.Criteria;
import com.master.mapper.BoardMapper;

import lombok.Setter;

@Service
@Repository
public class BoardServiceImpl implements BoardService{
	@Setter(onMethod_=@Autowired)
	private BoardMapper mapper;
	
	@Override
	public List<BoardVO> getBoard() {
		return mapper.getBoard();
	}

	@Override
	public BoardVO readBoard(Long bno) {
		return mapper.readBoard(bno);
	}

	@Override
	public void insertBoard(BoardVO vo) {
		 mapper.insertBoard(vo);
	}

	@Override
	public void plussHit(Long bno) {
		mapper.plussHit(bno);
		
	}

	@Override
	public int updateBoard(BoardVO vo) {
		mapper.updateBoard(vo);
		return 1;
	}

	@Override
	public void deleteBoard(Long bno) {
		mapper.deleteBoard(bno);
	}

	@Override
	public List<BoardVO> getListPaging(Criteria cri) {
		return mapper.getListPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotal(cri);
	}

	

	



}
