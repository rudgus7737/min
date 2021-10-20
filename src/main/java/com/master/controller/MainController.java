package com.master.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.master.dto.BoardVO;
import com.master.dto.CommentVO;
import com.master.dto.Criteria;
import com.master.dto.MemberVO;
import com.master.dto.PageMakerDTO;
import com.master.service.BoardService;
import com.master.service.CommentService;

import lombok.Setter;

@Controller
@RequestMapping("/homepage/*")
public class MainController {
	@Setter(onMethod_=@Autowired)
	private BoardService service;
	
	@Setter(onMethod_=@Autowired)
	private CommentService cservice; 
	
	
	 
	@GetMapping("/homepage")
	public void MainHomePage(Model model,Criteria cri) {
		model.addAttribute("boardList", service.getListPaging(cri));
        int total = service.getTotal(cri);
        PageMakerDTO pageMaker = new PageMakerDTO(cri, total);
        model.addAttribute("pageMaker", pageMaker);
	}
	
	
	@GetMapping("/getBoard")
	public void getBoard(@RequestParam("bno") Long bno, Model model, HttpServletRequest req,Criteria cri) {
		HttpSession session = req.getSession();
		MemberVO user = (MemberVO)session.getAttribute("USER");
		service.plussHit(bno);
		model.addAttribute("board", service.readBoard(bno));
		model.addAttribute("comment", cservice.readCm(bno));
			if(user!=null) {		
				model.addAttribute("ID", service.readBoard(bno).getId());
				model.addAttribute("NickName", user.getNickName());
			}
	}
	@GetMapping("/write")
	public String write(Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		MemberVO user = (MemberVO)session.getAttribute("USER");
		if(user==null) {
			return "redirect:/homepage/homepage";
		}
		else {
			model.addAttribute("userName", user.getNickName());
			return "/homepage/write";
		}	
	}
	@PostMapping("/write")
	public String write1(BoardVO vo) {
		service.insertBoard(vo);
		return "redirect:/homepage/homepage";
	}
	@GetMapping("/modify")
	public String modify(@RequestParam("bno") Long bno, Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		MemberVO user = (MemberVO)session.getAttribute("USER");
		model.addAttribute("board", service.readBoard(bno));
		return "/homepage/modify";
	}
	@PostMapping("/modify")
	public String modify(Model model, BoardVO vo) {
		int result = service.updateBoard(vo);
		model.addAttribute("Ucheck", result);
		return "redirect:/homepage/homepage";
	}
	@GetMapping("delete")
	public String delete(@RequestParam("bno") Long bno) {
		service.deleteBoard(bno);
		return "redirect:/homepage/homepage";
	}
	
	@PostMapping("/deleteComment")
	@ResponseBody
	public String deleteComment(@RequestParam("cno") Long cno,@RequestParam("writer") String writer,@RequestParam("user") String user) {   
			cservice.deleteComment(cno); 
			return "success";
	} 
	
	@PostMapping("/addComment")
	@ResponseBody
	public String addComment(@RequestParam("comment") String comment,@RequestParam("writer") String writer, @RequestParam("bno") Long bno) {
		CommentVO vo = CommentVO .builder()
				.bnum(bno)
				.comment(comment)
				.writer(writer)
				.build();
		cservice.insertComment(vo);
		return "d";
	}
	@GetMapping("/getComment")  
	public String getComment() {
		return "";
	}
}












