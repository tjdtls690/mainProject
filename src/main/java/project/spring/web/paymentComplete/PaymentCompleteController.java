package project.spring.web.paymentComplete;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.member.MemberVO;

@Controller
public class PaymentCompleteController {
	
	@Autowired
	PaymentCompleteService paymentCompleteService;
	
	
	@RequestMapping("/paymentComplete.do")
	public ModelAndView paymentCompleteDo(ModelAndView mav, HttpServletRequest request, @ModelAttribute(value="PaymentMyDetailInfoList") PaymentMyDetailInfoList list,
			PaymentMyDetailSideInfoVO vo) {
		HttpSession session = request.getSession();
		MemberVO vo1 = (MemberVO)session.getAttribute("member");
		
		// 결제 테이블
		vo.setPayment_member_code(vo1.getMemberCode());
		paymentCompleteService.paymentInfoSave(vo); // mybatis 해당 insert태그에 설정된 keyProperty 컬럼 값이 vo에 자동 저장
		
		// 결제 한 건당 매핑 된 아이템들 저장하는 테이블 (테이블 생성은 완료)
		// 위에 vo에서 payment_code 꺼내서 리스트에 있는 vo에 전부 넣어주면서 저장하면 끝
		
		mav.setViewName("paymentComplete");
		return mav;
	}
}
