package com.ottt.ottt.controller.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/signin")
public class SigninController {

	//약간동의 페이지 
	@GetMapping(value = "/term")
	public String term() {
	return "/login/term";		
	}
	
	@PostMapping(value = "/term")
	public String termPost() {
	return "/login/term";		
	}
	
	//회원가입 페이지
	@GetMapping(value = "/register")
	public String register() {
	return "/login/register";		
	}
	
	@PostMapping(value = "/register")
	public String registerPost() {
	return "/login/register";		
	}
	
	//필수정보 입력
	@GetMapping(value = "/reqInfo")
	public String reqInfo() {
	return "/login/reqInfo";		
	}
	
	@PostMapping(value = "/reqInfo")
	public String reqInfoPost() {
	return "/login/reqInfo";		
	}
	
	//추가정보 입력
	@GetMapping(value = "/addInfo")
	public String addInfo() {
	return "/login/addInfo";		
	}
	
	@PostMapping(value = "/addInfo")
	public String addInfoPost() {
	return "/login/addInfo";		
	}
	
	//가입성공 페이지
	@GetMapping(value = "/complete")
	public String signinComplete() {
	return "/login/registerComple";		
	}
	
	@PostMapping(value = "/complete")
	public String signinCompletePost() {
		return "/login/registerComple";		
	}
}
