package project.spring.web.my_point_search;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.member.MemberVO;
import project.spring.web.paymentComplete.PaymentCompletePointVO;
import project.spring.web.paymentComplete.PaymentCompleteService;
import project.spring.web.point_history.PointHistoryService;
import project.spring.web.point_history.PointHistoryVO;

@Controller
public class MyPointSearchController {
	
	@Autowired
	PointHistoryService pointHistoryService;
	@Autowired
	PaymentCompleteService paymentCompleteService;
	
	@RequestMapping("myPointSearch.do")
	public ModelAndView myPointSearchDo(ModelAndView mav, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		
		// 포인트 조회 데이터
		PointHistoryVO vo1 = new PointHistoryVO();
		vo1.setPoint_history_member_code(vo.getMemberCode());
		List<PointHistoryVO> list = pointHistoryService.selectMemberPointHistory(vo1);
		
		// 포인트 전체 합산 데이터
		PaymentCompletePointVO vo2 = new PaymentCompletePointVO();
		vo2.setPayment_member_code(vo.getMemberCode());
		vo2 = paymentCompleteService.getMemberPoint(vo2);
		
		mav.addObject("vo", vo2);
		mav.addObject("list", list);
		mav.setViewName("myPointSearch");
		return mav;
	}
}
