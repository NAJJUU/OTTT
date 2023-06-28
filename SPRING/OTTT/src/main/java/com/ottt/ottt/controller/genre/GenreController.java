package com.ottt.ottt.controller.genre;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ottt.ottt.domain.PageResolver;
import com.ottt.ottt.domain.SearchItem;
import com.ottt.ottt.dto.ContentDTO;
import com.ottt.ottt.dto.ContentOTTDTO;
import com.ottt.ottt.dto.WishlistDTO;
import com.ottt.ottt.service.content.ContentService;
import com.ottt.ottt.service.mypage.WishlistService;

@Controller
@RequestMapping("/genre")
public class GenreController {
	
	@Autowired
	ContentService contentService;
	@Autowired
	WishlistService wishlistService;

	@GetMapping("/animation")
	public String animation() {
		return "/genre/animation";
	}
	
	@GetMapping("/drama")
	public String drama() {
		return "/genre/drama";
	}
	
	@GetMapping("/interest")
	public String interest() {
		return "/genre/interest";
	}
	
	@GetMapping("/movie")
	public String movie(@RequestParam(value="ott_no", required = false) List<Integer> ott_no, 
			@RequestParam(value = "genre_no", required = false) List<Integer> genre_no, 
			@RequestParam(value="option", required = false) String option,
			Model m, HttpSession session, SearchItem sc) {
		
		sc.setPageSize(24);
		
		Map<String, Object> categoryMap = new HashMap<String, Object>();
		categoryMap.put("ott_no", ott_no);
		categoryMap.put("genre_no", genre_no);
		categoryMap.put("SearchItem", sc);
		categoryMap.put("option", option);

		try {
			int contentCnt = contentService.getCategoryCnt(categoryMap);
			PageResolver pageResolver = new PageResolver(contentCnt, sc);
			List<ContentDTO> categoryList = contentService.getSelectCategoryList(categoryMap);
			m.addAttribute("movieList", categoryList);
			m.addAttribute("pr", pageResolver);
			
			Map<Integer, List<ContentOTTDTO>> map = new HashMap<Integer, List<ContentOTTDTO>>();
			for(ContentDTO contentDTO : categoryList) {				
				List<ContentOTTDTO> ottList = contentService.getOttImg(contentDTO.getContent_no());
				map.put(contentDTO.getContent_no(), ottList);
			}
			m.addAttribute("ottList", map);
			
			if(session.getAttribute("usesr_no") != null) {
				Integer user_no = (Integer) session.getAttribute("usesr_no");
				List<WishlistDTO> wishList = wishlistService.getWishlist(user_no);
				m.addAttribute("wishList", wishList);
			}
	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/genre/movie";
	}
	
	@PostMapping("/movie")
	@ResponseBody
	public Map<String, Object> moviePost(@RequestParam("ott_no") List<Integer> ott_no, 
							@RequestParam("genre_no") List<Integer> genre_no,
							Model m, SearchItem sc) {
		sc.setPageSize(24);
		Map<String, Object> categoryMap = new HashMap<String, Object>();
		categoryMap.put("ott_no", ott_no);
		categoryMap.put("genre_no", genre_no);
		categoryMap.put("SearchItem", sc);
		System.out.println("==================================ott_no"+ott_no);
		System.out.println("==================================genre_no"+genre_no);
		System.out.println("==================================option"+sc.getOption());
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		try {
			List<ContentDTO> categoryList = contentService.getSelectCategoryList(categoryMap);
			
			int contentCnt = contentService.getCategoryCnt(categoryMap);
			PageResolver pageResolver = new PageResolver(contentCnt, sc);
			
			result.put("categoryList", categoryList);
			result.put("contentCnt", contentCnt);
			result.put("pr", pageResolver);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	@PatchMapping("/genrejjim")
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
	
	@DeleteMapping("/genrejjim")
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
