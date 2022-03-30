package project.spring.web.my_member_secession_success;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.member.MemberService;
import project.spring.web.member.MemberVO;
import project.spring.web.paymentComplete.PaymentCompletePointVO;
import project.spring.web.paymentComplete.PaymentCompleteService;

@Controller
public class MyMemberSecessionSuccessController {
	
	@Autowired
	MemberService memberService;
	@Autowired
	PaymentCompleteService paymentCompleteService;
	
	@RequestMapping("/myMemberSecessionSuccess.do")
	public ModelAndView myMemberSecessionSuccessDo(ModelAndView mav, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		session.removeAttribute("member");
		memberService.deleteMember(vo);
		
//		PaymentCompletePointVO vo1 = new PaymentCompletePointVO();
//		vo1.setPayment_member_code(vo.getMemberCode());
//		paymentCompleteService.deleteMemberPoint(vo1);
		
		mav.setViewName("myMemberSecessionSuccess");
		return mav;
	}
}
