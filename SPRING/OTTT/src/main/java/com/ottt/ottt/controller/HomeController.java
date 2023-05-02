package com.ottt.ottt.controller;


import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@GetMapping(value = "/")
	public String home() {		
	return "/home";
	}
	
	@PostMapping(value = "/")
	public String home(String id, String pwd, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		//1. id와 pw를 확인
				if(!loginCheck(id, pwd)) {
				//2-1. 일치하지 않으면, loginForm으로 이동
				String msg = URLEncoder.encode("id 또는 pwd가 일치하지 않습니다", "utf-8");
				return "redirect:/signin/complete?msg="+msg;
				}
				
				//2-2. 일치하면 로그인 후 home으로 이동
				//2-2-1. 쿠키를 생성
				//2-2-2. 응답헤더에 저장
				Cookie cookie = new Cookie("id", id);
				response.addCookie(cookie);
						
				//3. 세션
				//   객체 얻어오기
				HttpSession session = request.getSession();
				//   세션 객체에 id를 저장
				session.setAttribute("id", id);

	return "/home";
	}
	
	//DB꺼 가져와서 CHECK해야함
		private boolean loginCheck(String id, String pwd) {
			return "test".equals(id) && "1234".equals(pwd);
		}
	
}
