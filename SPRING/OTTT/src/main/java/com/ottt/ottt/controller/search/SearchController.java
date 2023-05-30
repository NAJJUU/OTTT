package com.ottt.ottt.controller.search;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ottt.ottt.domain.PageResolver;
import com.ottt.ottt.domain.SearchItem;
import com.ottt.ottt.dto.ContentDTO;
import com.ottt.ottt.dto.ContentOTTDTO;
import com.ottt.ottt.dto.WishlistDTO;
import com.ottt.ottt.service.home.ContentService;
import com.ottt.ottt.service.home.WishlistService;

@Controller
public class SearchController {
	
	@Autowired
	ContentService contentService;
	@Autowired
	WishlistService wishlistService;

	@GetMapping("/search")
	public String search() {
		return "/search/search";
	}
	
	@GetMapping("/searchList")
	public String searthList(Model m, HttpSession session, SearchItem sc) {
		
		sc.setPageSize(24);

		try {
			int totalCount = contentService.getMovieTotalCount(sc);
			PageResolver pageResolver = new PageResolver(totalCount, sc);
			List<ContentDTO> movieList = contentService.getMovieList(sc);
			m.addAttribute("movieList", movieList);
			m.addAttribute("pr", pageResolver);
			
			Map<Integer, List<ContentOTTDTO>> map = new HashMap<Integer, List<ContentOTTDTO>>();
			for(ContentDTO contentDTO : movieList) {				
				List<ContentOTTDTO> ottList = contentService.getOttImg(contentDTO.getContent_no());
				map.put(contentDTO.getContent_no(), ottList);
			}
			m.addAttribute("ottList", map);
			
			if(session.getAttribute("no") != null) {
				Integer user_no = (Integer) session.getAttribute("no");
				List<WishlistDTO> wishList = wishlistService.getWishlist(user_no);
				m.addAttribute("wishList", wishList);
			}
	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/genre/index";
	}
}
