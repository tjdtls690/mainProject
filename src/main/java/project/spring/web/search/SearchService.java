package project.spring.web.search;

import java.util.List;

import project.spring.web.tapPage.TapPageVO;

public interface SearchService {
	List<SearchVO> getSearchItem(SearchVO vo);
	// 이름이 같으면 아마 메소드 실행할 떄 오류 날수도 있음  getSearchItem 
}

