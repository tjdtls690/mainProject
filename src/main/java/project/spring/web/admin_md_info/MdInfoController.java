package project.spring.web.admin_md_info;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MdInfoController {
	
	
	@RequestMapping("/mdInfo.mdo")
	public ModelAndView mdInfoDo(ModelAndView mav) {
		mav.setViewName("mdManagement");
		return mav;
	}
}
