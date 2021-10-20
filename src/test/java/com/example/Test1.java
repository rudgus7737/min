package com.example;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.master.dto.BoardVO;
import com.master.dto.MemberVO;
import com.master.mapper.BoardMapper;
import com.master.mapper.CommentMapper;
import com.master.mapper.MemberMapper;
import com.master.service.BoardService;
import com.master.service.CommentService;
import com.master.service.MemberService;

import lombok.Setter;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class Test1 {

	@Setter(onMethod_=@Autowired)
	private BoardMapper mapper;
	
	@Setter(onMethod_=@Autowired)
	private BoardService service;
	
	@Setter(onMethod_=@Autowired)
	private MemberMapper mapper1;
	
	@Setter(onMethod_=@Autowired)
	private MemberService service1;

	@Setter(onMethod_=@Autowired)
	private CommentService cservice;
	
	@Setter(onMethod_=@Autowired)
	private CommentMapper cmapper;
	
	
	
	//@Test
	public void test1() {
		mapper.getBoard();
	}
	//@Test
	public void test2() {
		service.getBoard();
	}
	
	//@Test
	public void test3() {
		MemberVO vo = new MemberVO();
		vo.setEmail("7rudgus@naver.com");
		vo.setBirth("981206");
		vo.setName("¹Î°æÇö");
		vo.setPassword("123456");
		vo.setPhone("01041391656");
		mapper1.createMember(vo);
	}
	//@Test
	public void test4() {
		mapper1.getMember();
	}
	
}
