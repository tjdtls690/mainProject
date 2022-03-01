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
		// ���ڷ� �޾ƾ��ϴϱ� �Ѱܿ� ���� ���ڿ��� �д�
		// �𵨷� ����� = �˻������� page�̵� x -> �񵿱� ó��  view�� �ʿ���� 
		
		//System.out.println(search);
		mav.setViewName("search");
	return mav;
	
	}
	
	@RequestMapping("/searchDo.do")
	public ModelAndView searchDo(SearchVO vo, ModelAndView mav) {
//		String tmp = request.getParameter("searchdo");
		// ���ڷ� �޾ƾ��ϴϱ� �Ѱܿ� ���� ���ڿ��� �д�
		// �𵨷� ����� = �˻������� page�̵� x -> �񵿱� ó��  view�� �ʿ���� 
		System.out.println(vo.getSearch());
		List<SearchVO> itemInfo = searchService.getSearchItem(vo);
		System.out.println(itemInfo == null);
	mav.addObject("itemInfo",itemInfo);
	mav.setViewName("searchdo");
	return mav;
	
	}
}
