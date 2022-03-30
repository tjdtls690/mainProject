package project.spring.web.my_besongji;

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
import project.spring.web.member.MemberVO;
import project.spring.web.member_zipcode.MemberZipcodeService;
import project.spring.web.member_zipcode.MemberZipcodeVO;
import project.spring.web.my_pay_info.MyPayInfoService;
import project.spring.web.paymentComplete.PaymentCompletePointVO;
import project.spring.web.paymentComplete.PaymentCompleteService;
import project.spring.web.paymentComplete.PaymentMyDetailSideInfoVO;

@Controller
public class MyBesongjiController {
	
	@Autowired
	MemberZipcodeService memberZipcodeService;
	@Autowired
	PaymentCompleteService paymentCompleteService;
	@Autowired
	EventService eventService;
	@Autowired
	MyPayInfoService myPayInfoService;
	
	
	@RequestMapping("/myBesongji.do")
	public ModelAndView myBesongjiDo(ModelAndView mav, HttpServletRequest request, MemberZipcodeVO vo) {
		HttpSession session = request.getSession();
		MemberVO tmp = (MemberVO)session.getAttribute("member");
		vo.setMember_code(tmp.getMemberCode());
		vo.setMember_delivery_type(0);
		
		List<MemberZipcodeVO> list = memberZipcodeService.getZipcodeAll(vo);
		// 포인트 데이터
		PaymentCompletePointVO vo5 = new PaymentCompletePointVO();
		vo5.setPayment_member_code(tmp.getMemberCode());
		vo5 = paymentCompleteService.getMemberPoint(vo5);
		mav.addObject("point", vo5.getPayment_point());
		
		// 쿠폰 데이터
		CouponVO cvo = new CouponVO();
		cvo.setUser_code(tmp.getMemberCode());
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
		vo6.setPayment_member_code(tmp.getMemberCode());
		int check2 = 0;
		List<PaymentMyDetailSideInfoVO> list1 = myPayInfoService.getMemberAllPaymentInfo(vo6);
		for(int i = 0; i < list1.size(); i++) {
			if(list1.get(i).getPayment_delivery_condition() == null || !list1.get(i).getPayment_delivery_condition().equals("배송완료")) {
				check2++;
			}
		}
		mav.addObject("deliveryNum", check2);
		
		mav.addObject("list", list);
		mav.setViewName("myBesongji");
		return mav;
	}
	
	@RequestMapping("/myBesongjiModal.do")
	public ModelAndView myBesongjiModalDo(ModelAndView mav, HttpServletRequest request, MemberZipcodeVO vo) {
		HttpSession session = request.getSession();
		MemberVO tmp = (MemberVO)session.getAttribute("member");
		vo.setMember_code(tmp.getMemberCode());
		
		List<MemberZipcodeVO> list = memberZipcodeService.getZipcodeAll(vo);
		mav.addObject("list", list);
		mav.setViewName("myBesongjiModal");
		return mav;
	}
	
	@RequestMapping(value = "/myBesongjiDefaultZipCheck.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String myBesongjiDefaultZipCheckDo(ModelAndView mav, MemberZipcodeVO vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO vo1 = (MemberVO)session.getAttribute("member");
		vo.setMember_code(vo1.getMemberCode());
		List<MemberZipcodeVO> list1 = memberZipcodeService.getZipcodeAll(vo);
		
		for(int i = 0; i < list1.size(); i++) {
			if(list1.get(i).getMember_default_address().equals("y")) {
				list1.get(i).setMember_default_address("n");
				memberZipcodeService.updateZipcodeDefaultAddress(list1.get(i));
				break;
			}
		}
		
		vo.setMember_default_address("y");
		memberZipcodeService.updateZipcodeDefaultAddress(vo);
		return null;
	}
	
	@RequestMapping("/myBesongjiModalDetail.do")
	public ModelAndView myBesongjiModalDetailDo(ModelAndView mav, HttpServletRequest request, MemberZipcodeVO vo) {
		HttpSession session = request.getSession();
		MemberVO tmp = (MemberVO)session.getAttribute("member");
		vo.setMember_code(tmp.getMemberCode());
		
		List<MemberZipcodeVO> list = memberZipcodeService.getZipcodeAll(vo);
		mav.addObject("list", list);
		mav.setViewName("myBesongjiModalDetail");
		return mav;
	}
	
	@RequestMapping("/myBesongjiKakaoAddressContainer.do")
	public ModelAndView myBesongjiKakaoAddressContainerDo(ModelAndView mav) {
		mav.setViewName("myBesongjiKakaoAddressContainer");
		return mav;
	}
	
	@RequestMapping("/myBesongjiModalDetail2.do")
	public ModelAndView myBesongjiModalDetail2Do(ModelAndView mav, HttpServletRequest request, MemberZipcodeVO vo) {
		
		HttpSession session = request.getSession();
		MemberVO tmp = (MemberVO)session.getAttribute("member");
		vo.setMember_code(tmp.getMemberCode());
		
		List<MemberZipcodeVO> list = memberZipcodeService.getZipcodeAll(vo);
		mav.addObject("list", list);
		mav.setViewName("myBesongjiModalDetail2");
		return mav;
	}
	
	@RequestMapping("/myBesongjiCommonDetail.do")
	public ModelAndView myBesongjiCommonDetailDo(ModelAndView mav, HttpServletRequest request, MemberZipcodeVO vo) {
		HttpSession session = request.getSession();
		MemberVO vo1 = (MemberVO)session.getAttribute("member");
		vo.setMember_code(vo1.getMemberCode());
		List<MemberZipcodeVO> list = memberZipcodeService.getZipcodeAll(vo);
		
		mav.addObject("list", list);
		mav.setViewName("myBesongjiCommonDetail");
		return mav;
	}
	
	@RequestMapping(value = "/myBesongjiDeleteZipcode.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String myBesongjiDeleteZipcodeDo(MemberZipcodeVO vo) {
		memberZipcodeService.deleteZipcode(vo);
		return null;
	}
	
	@RequestMapping(value = "/myBesongjiUpdateZipcode.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String myBesongjiUpdateZipcodeDo(HttpServletRequest request, MemberZipcodeVO vo) {
		HttpSession session = request.getSession();
		MemberVO vo1 = (MemberVO)session.getAttribute("member");
		vo.setMember_code(vo1.getMemberCode());
		int zipAmount = memberZipcodeService.getZipcodeAmount(vo);
		
		if(zipAmount > 0) {
			// 제일 처음 주소 기본 배송지로 설정
			List<MemberZipcodeVO> list = memberZipcodeService.getZipcodeAll(vo);
			int check = 0;
			for(int i = 0; i< list.size(); i++) {
				if(list.get(i).getMember_default_address().equals("y")) {
					check++;
				}
			}
			if(check == 0) {
				list.get(0).setMember_default_address("y");
				memberZipcodeService.updateZipcodeDefaultAddress(list.get(0));
			}
		}
		return null;
	}
}
