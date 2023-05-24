package com.ottt.ottt.dao.home;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ottt.ottt.dto.ContentDTO;
import com.ottt.ottt.dto.ContentOTTDTO;

@Repository
public class ContentDaoImpl implements ContentDao {
	
	@Autowired
	private SqlSession session;
	private String namespace="com.ottt.ottt.controller.ContentMapper.";

	@Override
	public List<ContentDTO> ratingSelect() throws Exception {
		return session.selectList(namespace+"ratingSelect");
	}

	@Override
	public List<ContentOTTDTO> ottNameSelect(Integer content_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+"ottNameSelect", content_no);
	}
	
}
