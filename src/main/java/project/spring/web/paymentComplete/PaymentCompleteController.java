package project.spring.web.paymentComplete;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.member.MemberVO;

@Controller
public class PaymentCompleteController {
	
	
	@RequestMapping("/paymentComplete.do")
	public ModelAndView paymentCompleteDo(ModelAndView mav, HttpServletRequest request, @ModelAttribute(value="PaymentMyDetailInfoList") PaymentMyDetailInfoList list,
			PaymentMyDetailSideInfoVO vo) {
		HttpSession session = request.getSession();
		MemberVO vo1 = (MemberVO)session.getAttribute("member");
		// 결제 테이블
		// 결제 한 건당 매핑 된 아이템들 저장하는 테이블
		mav.setViewName("paymentComplete");
		return mav;
	}
}
