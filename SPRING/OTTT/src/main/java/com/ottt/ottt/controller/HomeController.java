package com.ottt.ottt.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ottt.ottt.dto.ContentDTO;
import com.ottt.ottt.dto.ContentOTTDTO;
import com.ottt.ottt.dto.WishlistDTO;
import com.ottt.ottt.service.content.ContentServiceImpl;
import com.ottt.ottt.service.content.WishlistService;



@Controller
public class HomeController {

	@Autowired 
	ContentServiceImpl contentServiceImpl;
	@Autowired
	WishlistService wishlistService;

	@GetMapping(value = "/")
	public String home(Model m, HttpSession session) {	
		
		try {
			
			// 별점 높은 순 작품 불러오기
			List<ContentDTO> ratingContentList = contentServiceImpl.getRating();
			m.addAttribute("ratingContentList", ratingContentList);
			
			Map<Integer, List<ContentOTTDTO>> ottmap = new HashMap<Integer, List<ContentOTTDTO>>();
			for(ContentDTO contentDTO : ratingContentList) {				
				List<ContentOTTDTO> ottList = contentServiceImpl.getOttImg(contentDTO.getContent_no());
				ottmap.put(contentDTO.getContent_no(), ottList);
			}
			m.addAttribute("ottList", ottmap);
			
			// 찜 많은 순 작품 불러오기
			List<ContentDTO> jjimContentList = contentServiceImpl.getJjim();
			m.addAttribute("jjimContentList", jjimContentList);
			
			Map<Integer, List<ContentOTTDTO>> jjimmap = new HashMap<Integer, List<ContentOTTDTO>>();
			for(ContentDTO contentDTO : jjimContentList) {				
				List<ContentOTTDTO> jjimList = contentServiceImpl.getOttImg(contentDTO.getContent_no());
				jjimmap.put(contentDTO.getContent_no(), jjimList);
			}
			m.addAttribute("jjimList", jjimmap);
			
			if(session.getAttribute("id") != null) {
				Integer user_no = (Integer) session.getAttribute("user_no");
				List<WishlistDTO> wishList = wishlistService.getWishlist(user_no);
				m.addAttribute("wishList", wishList);
			}	
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	return "home";
	}
	
	@PatchMapping("/jjim")
	@ResponseBody
	public ResponseEntity<String> insertJjim(@RequestParam Integer content_no, @RequestParam Integer user_no) {
		
		try {
			if(wishlistService.wishCheck(user_no, content_no) != 1) {
				throw new Exception("찜 등록 실패");
			}
			return new ResponseEntity<String>("찜 등록 성공", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("찜 등록 실패 에러", HttpStatus.BAD_REQUEST);
		}		
	}
	
	@DeleteMapping("/jjim")
	public ResponseEntity<String> deleteJjim(@RequestParam Integer content_no, @RequestParam Integer user_no) {
		try {
			if(wishlistService.wishCancel(user_no, content_no) != 1) {
				throw new Exception("찜 해제 실패");
			}
			return new ResponseEntity<String>("찜 해제 성공", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("찜 헤제 실패 에러", HttpStatus.BAD_REQUEST);
		}		
	}
}