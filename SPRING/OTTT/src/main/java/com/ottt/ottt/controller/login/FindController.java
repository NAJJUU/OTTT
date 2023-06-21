package com.ottt.ottt.controller.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ottt.ottt.dto.UserDTO;
import com.ottt.ottt.service.user.UserService;

@Controller
@RequestMapping("/login")
public class FindController {
	
	@Autowired
	UserService userService;

	//아이디 찾기 
	@GetMapping(value = "/findID")
	public String findID() {
	return "/login/findId";		
	}
	
	//비밀번호 찾기
	@GetMapping(value = "/findPwd")
	public String findPwd() {
	return "/login/findPwd";		
	}
	
	@PostMapping(value = "/findPwd")
	public String findPwdPost() {
	return "/login/findPwd";		
	}
	
	//아이디 확인
	@GetMapping(value = "/checkID")
	public String checkID(String user_email, Model m) {
		System.out.println("user_email : "+ user_email);
		
		try {
			UserDTO userDTO = userService.getUserEmail(user_email);
			if(userDTO == null) {
				m.addAttribute("msg", "NotFoundEmail");
				return "redirect:/login/findId";
			}
			m.addAttribute("userDTO", userDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	return "/login/idVerify";		
	}
	
	//비밀번호 재설정
	@GetMapping(value = "/checkPwd")
	public String checkPwd(String user_email, String user_id, Model m) {
		try {
			UserDTO userDTO = userService.getFindPwd(user_email, user_id);
			m.addAttribute("userDTO", userDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	return "/login/pwdReset";		
	}
	
	@PostMapping(value = "/checkPwd")
	public String checkPwdPost(String user_pwd, UserDTO userDTO) {
	return "/login";		
	}
}
