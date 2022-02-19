package project.spring.web.detail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

public class DetailController {
	// 각각 주입받을 Service

	@Autowired
	private DetailService detailService;

	public DetailController() {
		System.out.println("detailController 실행");
	}
	
	// 현재 가져올 vo가 아직 안만들어져있어서 일단은 sandwichVO를 써서하겠지만
	// 만들어지는대로 vo 명을 바꾸면된다.
	@RequestMapping(value="menuDetail.do")
	public ModelAndView setDetail(ModelAndView mav) {
//		String str = request.getParameter("Num");
//		int menuNum = Integer.parseInt(str);
//		System.out.println("넘어온 Num의 값 :"+menuNum);
		int menuNum = 99;

		DetailVO VO2 = new DetailVO();
		VO2.setItem_code(menuNum);
		mav.addObject("detail", detailService.getDetail(VO2));
		mav.setViewName("testDetail");

		return mav;
	}
	
}
