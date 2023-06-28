package com.ottt.ottt.service.content;

import java.util.List;
import java.util.Map;

import com.ottt.ottt.domain.SearchItem;
import com.ottt.ottt.dto.ContentDTO;
import com.ottt.ottt.dto.ContentOTTDTO;
import com.ottt.ottt.dto.GenreDTO;

public interface ContentService {
	
	List<ContentDTO> getRating() throws Exception;
	List<ContentOTTDTO> getOttImg(Integer content_no) throws Exception;
	List<ContentDTO> getMovieList(SearchItem sc) throws Exception;
	int getMovieTotalCount(SearchItem sc) throws Exception;
	List<ContentDTO> getSearchSelect(Map<String, Object> map) throws Exception;
	int getSearchTotalCount(Map<String, Object> map) throws Exception;
	List<ContentDTO> getSelectWord(String content_nm) throws Exception;
	ContentDTO getContent(Integer content_no) throws Exception;
	List<GenreDTO> getGenrenm(Integer content_no) throws Exception;
	List<ContentOTTDTO> getOTT(Integer content_no) throws Exception;
	List<ContentDTO> getJjim() throws Exception;
	List<ContentDTO> getWatchedSelect() throws Exception;
	List<ContentDTO> getrecomSelect(Integer user_no) throws Exception;
	
<<<<<<< HEAD
	//카테고리 영화 선택 검색
	List<ContentDTO> getSelectCategoryList(Map<String, Object> map) throws Exception;
	int getCategoryCnt(Map<String, Object> map) throws Exception;
=======
	//카테고리 영화 선택
	List<ContentDTO> getSelectMovieList(Map<String, Object> map) throws Exception;
>>>>>>> 6250e47587657bb6ff2809cee89cad5828f91dbc
}
