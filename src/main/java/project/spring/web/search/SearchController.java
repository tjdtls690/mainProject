package project.spring.web.search;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SearchController {
	
	@Autowired
	SearchService searchService;
	
	@RequestMapping("/search.do")
	public ModelAndView search(SearchVO vo, ModelAndView mav) {
//		String tmp = request.getParameter("searchdo");
		// 문자로 받아야하니까 넘겨온 값은 문자열로 둔다
		// 모델로 만들기 = 검색했을떄 page이동 x -> 비동기 처리  view가 필요없음 
		
		//System.out.println(search);
		mav.setViewName("search");
	return mav;
	
	}
	
	@RequestMapping("/searchDo.do")
	public ModelAndView searchDo(SearchVO vo, ModelAndView mav) {
//		String tmp = request.getParameter("searchdo");
		// 문자로 받아야하니까 넘겨온 값은 문자열로 둔다
		// 모델로 만들기 = 검색했을떄 page이동 x -> 비동기 처리  view가 필요없음 
		System.out.println(vo.getSearch());
		List<SearchVO> itemInfo = searchService.getSearchItem(vo);
		System.out.println(itemInfo == null);
	mav.addObject("itemInfo",itemInfo);
	mav.setViewName("searchdo");
	return mav;
	
	}
}
