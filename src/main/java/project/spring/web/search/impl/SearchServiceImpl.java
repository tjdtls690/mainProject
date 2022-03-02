package project.spring.web.search.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.spring.web.search.SearchService;
import project.spring.web.search.SearchVO;

@Service
public class SearchServiceImpl implements SearchService{

	@Autowired
	SearchDAO searchDAO;

	@Override
	public List<SearchVO> getSearchItem(SearchVO vo) {
	
		return searchDAO.getSearchItem(vo);
	}

}
