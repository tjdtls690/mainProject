package project.spring.web.my_member_secession_check_page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyMemberSecessionCheckPageController {
	
	
	@RequestMapping("/myMemberSecessionCheckPage.do")
	public ModelAndView myMemberSecessionCheckPageDo(ModelAndView mav) {
		mav.setViewName("myMemberSecessionCheckPage");
		return mav;
	}
	
	@RequestMapping("/myMemberSecessionCheckPageFinalCheckModal.do")
	public ModelAndView myMemberSecessionCheckPageFinalCheckModalDo(ModelAndView mav) {
		mav.setViewName("myMemberSecessionCheckPageFinalCheckModal");
		return mav;
	}
}
