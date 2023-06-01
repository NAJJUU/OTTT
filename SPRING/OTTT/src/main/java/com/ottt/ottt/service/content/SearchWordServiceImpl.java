package com.ottt.ottt.service.content;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ottt.ottt.dao.content.SearchWordDao;
import com.ottt.ottt.dto.SearchWordDTO;

@Service
public class SearchWordServiceImpl implements SearchWordService {
	
	@Autowired
	SearchWordDao searchWordDao;
	

	@Override
	public List<SearchWordDTO> getSearchWordList(Integer user_no) throws Exception {
		// TODO Auto-generated method stub
		return searchWordDao.searchWorldSelect(user_no);
	}

	@Override
	public int putSearchWord(Integer user_no, String content_nm) throws Exception {
		// TODO Auto-generated method stub
		return searchWordDao.searchWordInsert(user_no, content_nm);
	}

}
