package project.spring.web.adminMemberManagement;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

	/*
	 * @RequestMapping("/memberDel") public ModelAndView memberDeliteDo(ModelAndView
	 * mav, AdminMemberManagementVO vo) { List<AdminMemberManagementVO> memberDelite
	 * = adminMemberManagementService.getMemberDel(vo);
	 * mav.addObject("memberDelite", memberDelite);
	 * mav.setViewName("memberManagement"); return mav; }
	 */

	/*@RequestMapping("/memberDel")
	public String memberDel(@RequestParam("memberCode") Integer memberCode) {
		int result = AdminMemberManagementService.memberDel(memberCode);
		if (result == 1) {
			return "redirect:memberManagement";

		}
		return null;
	}*/
	@RequestMapping(value = "/deleteMember.mdo", method = RequestMethod.POST)
	public ModelAndView deleteMemberDo(ModelAndView mav, HttpServletRequest request) {
		String a = request.getParameter("memberDelete");
		int memberDelete = Integer.parseInt(a);
		System.out.println(memberDelete);
		AdminMemberManagementVO vo = new AdminMemberManagementVO();
		vo.setMemberCode(memberDelete);
		adminMemberManagementService.deleteMember(vo);
		mav.setViewName("memberManagement");
		return mav;
	}
	
}
