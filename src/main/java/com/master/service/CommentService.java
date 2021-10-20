package com.master.service;


import java.util.List;

import com.master.dto.CommentVO;
import com.master.dto.Criteria;

public interface CommentService {
	public List<CommentVO> readCm(Long bno);
	public void insertComment(CommentVO vo);
	public int getTotal(Long bno);
	public void deleteComment(Long cno);

}
