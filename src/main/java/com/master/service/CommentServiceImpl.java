package com.master.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.master.dto.CommentVO;
import com.master.dto.Criteria;
import com.master.mapper.CommentMapper;

import lombok.Setter;

@Service
@Repository
public class CommentServiceImpl implements CommentService{
	@Setter(onMethod_=@Autowired)
	private CommentMapper mapper;

	@Override
	public List<CommentVO> readCm(Long bno) {
		return mapper.readCm(bno);
	}

	@Override
	public void insertComment(CommentVO vo) {
		mapper.insertComment(vo);
	}

	@Override
	public int getTotal(Long bno) {
		return mapper.getTotal(bno);
	}

	@Override
	public void deleteComment(Long cno) {
		mapper.deleteComment(cno); 		
	}

	

	



}
