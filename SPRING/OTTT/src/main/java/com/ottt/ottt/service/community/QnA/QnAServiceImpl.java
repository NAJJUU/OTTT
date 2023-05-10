package com.ottt.ottt.service.community.QnA;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ottt.ottt.dao.community.QnA.ArticleQnADao;
import com.ottt.ottt.domain.SearchItem;
import com.ottt.ottt.dto.ArticleDTO;
import com.ottt.ottt.service.community.notice.ArticleService;

@Service
public class QnAServiceImpl implements ArticleService {

	@Autowired
	ArticleQnADao articleQnADao;

	public List<ArticleDTO> getPage(SearchItem sc, Integer user_no) throws Exception {
		// TODO Auto-generated method stub
		return articleQnADao.selectPage(sc, user_no);
	}

	@Override
	public int write(ArticleDTO articleDTO) throws Exception {
		// TODO Auto-generated method stub
		return articleQnADao.insert(articleDTO);
	}

	public int getCount(SearchItem sc, Integer user_no) throws Exception {
		// TODO Auto-generated method stub
		return articleQnADao.count(sc, user_no);
	}

	@Override
	public ArticleDTO getArticle(Integer article_no) throws Exception {
		// TODO Auto-generated method stub
		return articleQnADao.select(article_no);
	}

	@Override
	public int modify(ArticleDTO articleDTO) throws Exception {
		// TODO Auto-generated method stub
		return articleQnADao.update(articleDTO);
	}

	@Override
	public int remove(Integer article_no) throws Exception {
		// TODO Auto-generated method stub
		return articleQnADao.delete(article_no);
	}

	@Override
	public List<ArticleDTO> getPage(SearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getCount(SearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
}
