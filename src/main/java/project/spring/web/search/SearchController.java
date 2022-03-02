package project.spring.web.search;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SearchController {
	
	@Autowired
	SearchService searchService;
	
	@RequestMapping("/search.do")
	public ModelAndView search(SearchVO vo, ModelAndView mav) {
		mav.setViewName("search");
		return mav;
	}
	
	@RequestMapping("/searchDo.do")
	public ModelAndView searchDo(SearchVO vo, ModelAndView mav) {
		System.out.println(vo.getSearch());
		List<SearchVO> itemInfo = searchService.getSearchItem(vo);
		int check1 = searchService.getSearchItemNum(vo);
		int check2 = searchService.getSearchSubscribeNum(vo);
		int check = check1 + check2;
		System.out.println("갯수 : " + check);
		mav.addObject("check", check);
		mav.addObject("itemInfo",itemInfo);
		mav.setViewName("searchdo");
		return mav;
	}
	
	@RequestMapping(value = "/searchDo2.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String searchDo2(SearchVO vo, ModelAndView mav) {
		System.out.println(vo.getSearch());
		int check1 = searchService.getSearchItemNum(vo);
		int check2 = searchService.getSearchSubscribeNum(vo);
		if(check1 == 0) {
			if(check2 == 0) {
				return "1";
			}else {
				return "2";
			}
		}else {
			if(check2 == 0) {
				return "3";
			}else {
				return "4";
			}
		}
	}
	
	@RequestMapping("/searchDo3.do")
	public ModelAndView searchDo3(SearchVO vo, ModelAndView mav, String check) {
		System.out.println(vo.getSearch());
		List<SearchVO> itemInfo = searchService.getSearchSubscribe(vo);
		mav.addObject("check", check);
		mav.addObject("itemInfo",itemInfo);
		mav.setViewName("searchdo3");
		return mav;
	}
}
