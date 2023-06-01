package com.ottt.ottt.dao.content;

import java.util.List;

import com.ottt.ottt.dto.SearchWordDTO;

public interface SearchWordDao {

	int searchWordInsert(Integer user_no, String content_nm) throws Exception;
	List<SearchWordDTO> searchWorldSelect(Integer user_no) throws Exception;
}
