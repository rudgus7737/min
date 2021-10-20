package com.master.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.master.dto.MemberVO;
import com.master.service.BoardService;
import com.master.service.MemberService;

import lombok.Setter;


@Controller

@RequestMapping("/login/*")
public class LoginController {
	@Setter(onMethod_=@Autowired)
	private MemberService service;
	
	@Setter(onMethod_=@Autowired)
	private BoardService Bservice;
	
	@GetMapping("/create")
	public String CreateMember() {
		System.out.println("여기가 들어오나@@@@@@@@@@@@@@@@@@");
		return "/login/createMember";
	}
	
	@PostMapping("/create")
	public String CreateMember1(MemberVO vo) {
		service.createMember(vo);
		System.out.println(vo);
		return "redirect:/homepage/homepage";
	}
	@RequestMapping(value="/emailCheck", method=RequestMethod.POST)
	@ResponseBody
	public String Check1(String email) {
		int result = service.emailCheck(email);
		if(result==1) {return "fail";}
		else {return "success";}
	}
	@RequestMapping(value="/nickNameCheck", method=RequestMethod.POST)
	@ResponseBody
	public String Check2(String nickName) {
		int result = service.nickNameCheck(nickName);
		if(result==1) {return "fail";}
		else {return "success";}
	} 
	
	@GetMapping("/login")
	public void Login() {
		System.out.println("여기 로그인 컨트롤러가 작동되나");
		}
	@GetMapping("/logout")
	public String Logout(Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.removeAttribute("USER");
		model.addAttribute("boardList", Bservice.getBoard());
		return "redirect:/homepage/homepage";
	}
	
	@PostMapping("/login")
	public String Login1(Model model, MemberVO vo, HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		MemberVO mem = service.login(vo);
		session.setAttribute("USER", mem);
		model.addAttribute("boardList", Bservice.getBoard());
		return "redirect:/homepage/homepage";
	}
	
	
	
}












