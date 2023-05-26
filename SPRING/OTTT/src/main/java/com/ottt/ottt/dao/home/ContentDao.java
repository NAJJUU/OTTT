package com.ottt.ottt.dao.home;

import java.util.List;

import com.ottt.ottt.domain.SearchItem;
import com.ottt.ottt.dto.ContentDTO;
import com.ottt.ottt.dto.ContentOTTDTO;

public interface ContentDao {

	List<ContentDTO> ratingSelect() throws Exception;
	List<ContentOTTDTO> ottNameSelect(Integer content_no) throws Exception;
	List<ContentDTO> movieSelect(SearchItem sc) throws Exception;
	int movieCount(SearchItem sc) throws Exception;
}
