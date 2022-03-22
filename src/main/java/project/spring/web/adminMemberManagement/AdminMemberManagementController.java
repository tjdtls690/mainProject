package project.spring.web.adminMemberManagement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminMemberManagementController {
	
	@Autowired
	AdminMemberManagementService adminMemberManagementService;
	
	@RequestMapping("/memberManagement.mdo")
	public ModelAndView memberManagementDo(ModelAndView mav, AdminMemberManagementVO vo) {
		List<AdminMemberManagementVO> adminMember = adminMemberManagementService.getAdminMember(vo);
		mav.addObject("adminMember", adminMember);
		mav.setViewName("memberManagement");
		return mav;
	}
}
