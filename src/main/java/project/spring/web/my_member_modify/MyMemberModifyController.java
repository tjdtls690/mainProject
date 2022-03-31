package project.spring.web.my_member_modify;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.event.CouponVO;
import project.spring.web.event.EventService;
import project.spring.web.member.MemberService;
import project.spring.web.member.MemberVO;
import project.spring.web.my_pay_info.MyPayInfoService;
import project.spring.web.paymentComplete.PaymentCompletePointVO;
import project.spring.web.paymentComplete.PaymentCompleteService;
import project.spring.web.paymentComplete.PaymentMyDetailSideInfoVO;

@Controller
public class MyMemberModifyController {
	
	@Autowired
	MemberService memberService;
	@Autowired
	PaymentCompleteService paymentCompleteService;
	@Autowired
	EventService eventService;
	@Autowired
	MyPayInfoService myPayInfoService;
	
	
	@RequestMapping("/myMemberModify.do")
	public ModelAndView myMemberModifyDo(ModelAndView mav, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		
		LocalDate localDate = vo.getBirthday();//For reference
		if(localDate != null) {
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			String formattedString = localDate.format(formatter);
			mav.addObject("birthday", formattedString);
		}
		
		if(vo.getMemberType().equals("e")) {
			// 포인트 데이터
			PaymentCompletePointVO vo5 = new PaymentCompletePointVO();
			vo5.setPayment_member_code(vo.getMemberCode());
			vo5 = paymentCompleteService.getMemberPoint(vo5);
			mav.addObject("point", vo5.getPayment_point());
			
			// 쿠폰 데이터
			CouponVO cvo = new CouponVO();
			cvo.setUser_code(vo.getMemberCode());
			List<CouponVO> userCoupon = eventService.getCoupon(cvo);
			int check1 = 0;
			for(int i = 0; i < userCoupon.size(); i++) {
				if(userCoupon.get(i).getCoupon_check().equals("n")) {
					check1++;
				}
			}
			mav.addObject("couponNum", check1);
			
			// 배송 예정 데이터
			PaymentMyDetailSideInfoVO vo6 = new PaymentMyDetailSideInfoVO();
			vo6.setPayment_member_code(vo.getMemberCode());
			int check2 = 0;
			List<PaymentMyDetailSideInfoVO> list = myPayInfoService.getMemberAllPaymentInfo(vo6);
			for(int i = 0; i < list.size(); i++) {
				if(list.get(i).getPayment_delivery_condition() == null || !list.get(i).getPayment_delivery_condition().equals("배송완료")) {
					check2++;
				}
			}
			mav.addObject("deliveryNum", check2);
			
			mav.setViewName("myMemberModifyPasswordCheck");
		}else {
			// 포인트 데이터
			PaymentCompletePointVO vo5 = new PaymentCompletePointVO();
			vo5.setPayment_member_code(vo.getMemberCode());
			vo5 = paymentCompleteService.getMemberPoint(vo5);
			mav.addObject("point", vo5.getPayment_point());
			
			// 쿠폰 데이터
			CouponVO cvo = new CouponVO();
			cvo.setUser_code(vo.getMemberCode());
			List<CouponVO> userCoupon = eventService.getCoupon(cvo);
			int check1 = 0;
			for(int i = 0; i < userCoupon.size(); i++) {
				if(userCoupon.get(i).getCoupon_check().equals("n")) {
					check1++;
				}
			}
			mav.addObject("couponNum", check1);
			
			// 배송 예정 데이터
			PaymentMyDetailSideInfoVO vo6 = new PaymentMyDetailSideInfoVO();
			vo6.setPayment_member_code(vo.getMemberCode());
			int check2 = 0;
			List<PaymentMyDetailSideInfoVO> list = myPayInfoService.getMemberAllPaymentInfo(vo6);
			for(int i = 0; i < list.size(); i++) {
				if(list.get(i).getPayment_delivery_condition() == null || !list.get(i).getPayment_delivery_condition().equals("배송완료")) {
					check2++;
				}
			}
			mav.addObject("deliveryNum", check2);
			
			mav.setViewName("myMemberModify");
		}
		
		return mav;
	}
	
	@RequestMapping("/myMemberModifyReal.do")
	public ModelAndView myMemberModifyRealDo(ModelAndView mav, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		
		LocalDate localDate = vo.getBirthday();//For reference
		if(localDate != null) {
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			String formattedString = localDate.format(formatter);
			mav.addObject("birthday", formattedString);
		}
		
		mav.setViewName("myMemberModify");
		return mav;
	}
	
	@RequestMapping("/myMemberModifyPasswordModal.do")
	public ModelAndView myMemberModifyPasswordModalDo(ModelAndView mav) {
		mav.setViewName("myMemberModifyPasswordModal");
		return mav;
	}
	
	@RequestMapping(value = "/myMemberModifyCurrentPasswordCheckModal.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String myMemberModifyCurrentPasswordCheckModalDo(HttpServletRequest request, String currentPassword, MemberVO vo) {
		vo.setPassword(currentPassword);
		
		HttpSession session = request.getSession();
		MemberVO vo1 = (MemberVO)session.getAttribute("member");
		vo.setEmail(vo1.getEmail());
		int check = memberService.passwordCheck(vo);
		if(check == 0) {
			System.out.println("0이다");
			return "0";
		}else {
			System.out.println("1이다");
			return "1";
		}
	}
	
	@RequestMapping(value = "/myMemberModifyUpdatePasswordModal.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String myMemberModifyUpdatePasswordModalDo(HttpServletRequest request, String changePassword1, MemberVO vo) {
		HttpSession session = request.getSession();
		MemberVO vo1 = (MemberVO)session.getAttribute("member");
		
		vo.setEmail(vo1.getEmail());
		vo.setPassword(changePassword1);
		vo.setPhone(vo1.getPhone());
		memberService.updatePassword(vo);
		
		vo = memberService.getMember(vo);
		
		session.removeAttribute("member");
		session.setAttribute("member", vo);
		
		return null;
	}
	
	
	@RequestMapping("/myMemberModifyPhoneCheck.do")
	public ModelAndView myMemberModifyPhoneCheckDo(ModelAndView mav, String phone) {
		mav.addObject("phone", phone);
		mav.setViewName("myMemberModifyPhoneCheck");
		return mav;
	}
	
	@RequestMapping("/myMemberModifyFinalEmailCheckModal.do")
	public ModelAndView myMemberModifyFinalEmailCheckModalDo(ModelAndView mav) {
		mav.setViewName("myMemberModifyFinalEmailCheckModal");
		return mav;
	}
	
	@RequestMapping("/myMemberModifyFinalNameEmptyCheckModal.do")
	public ModelAndView myMemberModifyFinalNameEmptyCheckModalDo(ModelAndView mav) {
		mav.setViewName("myMemberModifyFinalNameEmptyCheckModal");
		return mav;
	}
	
	@RequestMapping("/myMemberModifyFinalNameCheckModal.do")
	public ModelAndView myMemberModifyFinalNameCheckModalDo(ModelAndView mav) {
		mav.setViewName("myMemberModifyFinalNameCheckModal");
		return mav;
	}
	
	@RequestMapping("/myMemberModifyFinalPhoneEmptyCheckModal.do")
	public ModelAndView myMemberModifyFinalPhoneEmptyCheckModalDo(ModelAndView mav) {
		mav.setViewName("myMemberModifyFinalPhoneEmptyCheckModal");
		return mav;
	}
	
	@RequestMapping("/myMemberModifyFinalPhoneCheckModal.do")
	public ModelAndView myMemberModifyFinalPhoneCheckModalDo(ModelAndView mav) {
		mav.setViewName("myMemberModifyFinalPhoneCheckModal");
		return mav;
	}
	
	@RequestMapping("/myMemberModifySuccessCheckModal.do")
	public ModelAndView myMemberModifySuccessCheckModalDo(HttpServletRequest request, ModelAndView mav, MemberVO vo) {
		HttpSession session = request.getSession();
		MemberVO vo1 = (MemberVO)session.getAttribute("member");
		vo.setMemberCode(vo1.getMemberCode());
		
		// 화면에서 null 로 보내도 자바에선 null 이 아닌 "" 로 받는다
		if(vo.getBirthdayTmp().equals("")) {
			vo.setBirthday(null);
		}else {
			String string = vo.getBirthdayTmp();
	        vo.setBirthday(LocalDate.parse(string, DateTimeFormatter.ISO_DATE));
		}
		
		memberService.updateMemberInfo(vo);
		vo = memberService.getMember(vo);
		
		session.removeAttribute("member");
		session.setAttribute("member", vo);
		
		mav.setViewName("myMemberModifySuccessCheckModal");
		return mav;
	}
}
