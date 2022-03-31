package project.spring.web.adminMemberManagement;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.paymentComplete.PaymentCompletePointVO;
import project.spring.web.paymentComplete.PaymentCompleteService;

@Controller
public class AdminMemberManagementController {

	@Autowired
	AdminMemberManagementService adminMemberManagementService;
	@Autowired
	PaymentCompleteService paymentCompleteService;

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
		
		PaymentCompletePointVO vo1 = new PaymentCompletePointVO();
		vo1.setPayment_member_code(memberDelete);
		paymentCompleteService.deleteMemberPoint(vo1);
		
		mav.setViewName("memberManagement");
		return mav;
	}
//	@RequestMapping(value = "/selectMember.mdo", method =RequestMethod.POST)
//	public ModelAndView selectMemberDo(ModelAndView mav, HttpServletRequest request) {
//		String a = request.getParameter(null);
//		String 
//	}
//	
	@RequestMapping("/activeMember.mdo")
	public ModelAndView activeMemberDo(ModelAndView mav, HttpServletRequest request) {
		String memberActive = request.getParameter("memberActive");
		String b = request.getParameter("memberCode");
		int memberCode = Integer.parseInt(b);
		AdminMemberManagementVO vo = new AdminMemberManagementVO();
		
		vo.setMemberStop(memberActive);
		vo.setMemberCode(memberCode);
		
		adminMemberManagementService.getActiveMember(vo);
		AdminMemberManagementVO vo2 = new AdminMemberManagementVO();
		List<AdminMemberManagementVO> adminMember = adminMemberManagementService.getAdminMember(vo2);
		mav.addObject("adminMember", adminMember);
		mav.setViewName("memberManagement");
		
		return mav;
		
		// request �� Ȱ�� ��Ȱ�� �ް�
		
				// adminMemberManagementService.deleteMember(vo); --> service ����
				
				//ó���� �ҷ����� �ֵ� �ѹ��� ����
	}
}
