package com.ottt.ottt.service.home;

import java.util.List;

import com.ottt.ottt.dto.ContentDTO;
import com.ottt.ottt.dto.ContentOTTDTO;

public interface ContentService {
	
	List<ContentDTO> getRating() throws Exception;
	List<ContentOTTDTO> getOttImg(Integer content_no) throws Exception;
}
