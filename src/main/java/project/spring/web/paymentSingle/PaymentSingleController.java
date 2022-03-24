package project.spring.web.paymentSingle;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.member.MemberVO;
import project.spring.web.member_zipcode.MemberZipcodeService;
import project.spring.web.member_zipcode.MemberZipcodeVO;
import project.spring.web.paymentComplete.PaymentCompletePointVO;
import project.spring.web.paymentComplete.PaymentCompleteService;

@Controller
public class PaymentSingleController {
	
	@Autowired
	MemberZipcodeService memberZipcodeService;
	@Autowired
	PaymentSingleService paymentSingleService;
	@Autowired
	PaymentCompleteService paymentCompleteService;
	
	@RequestMapping("/paymentSingle.do")
	public ModelAndView paymentSingleDo(ModelAndView mav, @ModelAttribute(value="PaymentSingleListVO") PaymentSingleListVO list
			, PaymentSingleSideInfoVO vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO vo1 = (MemberVO)session.getAttribute("member");
		PaymentSingleCouponInfoVO vo2 = new PaymentSingleCouponInfoVO();
		vo2.setUser_code(String.valueOf(vo1.getMemberCode()));
		List<PaymentSingleCouponInfoVO> list1 = paymentSingleService.getMyPaymentCoupon(vo2);
		
		PaymentCompletePointVO vo3 = new PaymentCompletePointVO();
		vo3.setPayment_member_code(vo1.getMemberCode());
		
		mav.addObject("point", paymentCompleteService.getMemberPoint(vo3));
		mav.addObject("listSize", list1.size());
		mav.addObject("vo", vo);
		mav.addObject("list", list.getPaymentSingleList());
		mav.setViewName("paymentSingle");
		return mav;
	}
	
	@RequestMapping("/paymentArrow.do")
	public ModelAndView paymentArrowDo(ModelAndView mav, String check) {
		
		mav.addObject("check", check);
		mav.setViewName("paymentArrow");
		return mav;
	}
	
	@RequestMapping(value = "/getZipcode.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String getZipcodeDo(String deliveryZipcodeCode) {
		MemberZipcodeVO vo = new MemberZipcodeVO();
		vo.setMember_zipcode_code(Integer.parseInt(deliveryZipcodeCode));
		System.out.println(deliveryZipcodeCode);
		
		return memberZipcodeService.getZipcodeAll2(vo).getMember_zipcode();
	}
	
	@RequestMapping("/paymentEnterExitType.do")
	public ModelAndView paymentEnterExitTypeDo(ModelAndView mav, String check) {
		mav.setViewName("paymentEnterExitType");
		return mav;
	}
	
	@RequestMapping("/paymentCouponModal.do")
	public ModelAndView paymentCouponModalDo(ModelAndView mav, HttpServletRequest request, PaymentSingleCouponInfoVO vo, String productsFinalPrice
			, String paymentDeliveryTypeCheck, String[] itemTagMain, String[] itemCode) {
		HttpSession session = request.getSession();
		MemberVO vo1 = (MemberVO)session.getAttribute("member");
		vo.setUser_code(String.valueOf(vo1.getMemberCode()));
		List<PaymentSingleCouponInfoVO> list = paymentSingleService.getMyPaymentCoupon(vo);
		List<Integer> listCheck = new ArrayList<Integer>(); // 사용 가능한 쿠폰 고유 번호 리스트
		List<Integer> listFail = new ArrayList<Integer>(); // 사용 불가능한 쿠폰 고유 번호 리스트
		for(int i = 0; i < itemTagMain.length; i++) {
			System.out.println("태그메인 : " + itemTagMain[i]);
			System.out.println("아이템 코드 : " + itemCode[i]);
			
		}
		System.out.println("총 금액 : " + productsFinalPrice);
		System.out.println("배송 타입 : " + paymentDeliveryTypeCheck);
		
		
		// 쿠폰 사용조건 구분
		int check = 0;
		for(int i = 0; i < list.size(); i++) {
			System.out.println("쿠폰 타입 : " + list.get(i).getCoupon_type());
			if(Integer.parseInt(list.get(i).getCoupon_code()) == 1 && Integer.parseInt(productsFinalPrice) >= 15000) {
				for(int j = 0; j < itemTagMain.length; j++) {
					if(Integer.parseInt(itemTagMain[j]) == 200 && Integer.parseInt(itemCode[j]) == 54) {
						check++;
						listCheck.add(1);
						break;
					}
				}
			}
			
			if(Integer.parseInt(list.get(i).getCoupon_code()) == 2 && Integer.parseInt(productsFinalPrice) >= 30000 && Integer.parseInt(paymentDeliveryTypeCheck) == 2) {
				check++;
				listCheck.add(2);
			}
			
			for(int j = 0; j < itemTagMain.length; j++) {
				if(Integer.parseInt(list.get(i).getCoupon_code()) == 3 && Integer.parseInt(productsFinalPrice) >= 25000 && Integer.parseInt(itemTagMain[j]) == 600) {
					check++;
					listCheck.add(3);
					break;
				}
			}
			
			for(int j = 0; j < itemTagMain.length; j++) {
				if(Integer.parseInt(list.get(i).getCoupon_code()) == 6 && Integer.parseInt(productsFinalPrice) >= 30000 && 
						(Integer.parseInt(itemTagMain[j]) == 100) && (Integer.parseInt(itemCode[j]) == 14 || Integer.parseInt(itemCode[j]) == 15 || Integer.parseInt(itemCode[j]) == 20
						|| Integer.parseInt(itemCode[j]) == 21 || Integer.parseInt(itemCode[j]) == 22 || Integer.parseInt(itemCode[j]) == 23 || Integer.parseInt(itemCode[j]) == 28 || Integer.parseInt(itemCode[j]) == 29)) {
					check++;
					listCheck.add(6);
					break;
				}
			}
			
			if(Integer.parseInt(list.get(i).getCoupon_code()) == 7 && Integer.parseInt(productsFinalPrice) >= 10000) {
				check++;
				listCheck.add(7);
			}
			
			if(Integer.parseInt(list.get(i).getCoupon_code()) == 8 && Integer.parseInt(productsFinalPrice) >= 20000) {
				check++;
				listCheck.add(8);
			}
			
			if(Integer.parseInt(list.get(i).getCoupon_code()) == 9 && Integer.parseInt(productsFinalPrice) >= 30000) {
				check++;
				listCheck.add(9);
			}
			
			if(Integer.parseInt(list.get(i).getCoupon_code()) == 10 && Integer.parseInt(productsFinalPrice) >= 40000) {
				check++;
				listCheck.add(10);
			}
			
			if(Integer.parseInt(list.get(i).getCoupon_code()) == 11 && Integer.parseInt(productsFinalPrice) >= 55000 && Integer.parseInt(paymentDeliveryTypeCheck) == 0) {
				check++;
				listCheck.add(11);
			}
			
			if(Integer.parseInt(list.get(i).getCoupon_code()) == 12 && Integer.parseInt(productsFinalPrice) >= 55000 && Integer.parseInt(paymentDeliveryTypeCheck) == 1) {
				check++;
				listCheck.add(12);
			}
			
			for(int j = 0; j < itemTagMain.length; j++) {
				if(Integer.parseInt(list.get(i).getCoupon_code()) == 13 && Integer.parseInt(productsFinalPrice) >= 30000 && Integer.parseInt(itemTagMain[j]) == 100) {
					check++;
					listCheck.add(13);
					break;
				}
			}
			
			if(Integer.parseInt(list.get(i).getCoupon_code()) == 14 && Integer.parseInt(productsFinalPrice) >= 30000 && Integer.parseInt(paymentDeliveryTypeCheck) == 1) {
				check++;
				listCheck.add(14);
			}
		}
		
		for(int i = 0; i < list.size(); i++) {
			int tmpCheck = 0;
			for(int j = 0; j < listCheck.size(); j++) {
				if(Integer.parseInt(list.get(i).getCoupon_code()) != listCheck.get(j)) {
					tmpCheck++;
				}
			}
			if(tmpCheck == listCheck.size()) {
				listFail.add(Integer.parseInt(list.get(i).getCoupon_code()));
			}
		}
		
		mav.addObject("listFail", listFail);
		mav.addObject("listCheck", listCheck);
		mav.addObject("check", check);
		mav.addObject("productsFinalPrice", productsFinalPrice);
		mav.addObject("list", list);
		mav.setViewName("paymentCouponModal");
		return mav;
	}
	
	@RequestMapping("/paymentMyInfoPolicy.do")
	public ModelAndView paymentMyInfoPolicyDo(ModelAndView mav, String check) {
		mav.setViewName("paymentMyInfoPolicy");
		return mav;
	}
	
	@RequestMapping("/paymentSingleCouponState.do")
	public ModelAndView paymentSingleCouponStateDo(ModelAndView mav, String couponNum, String realSale) {
		int check = Integer.parseInt(couponNum);
		
		mav.addObject("check", check);
		mav.addObject("realSale", realSale);
		mav.setViewName("paymentSingleCouponState");
		return mav;
	}
	
	@RequestMapping(value = "/paymentSingleCouponSaleCal.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String paymentSingleCouponSaleCalDo(ModelAndView mav, String couponNum, String realSale, String productsFinalPrice) {
		int check = Integer.parseInt(couponNum);
		int productsFinalPrice1 = Integer.parseInt(productsFinalPrice);
		int realSale1 = 0;
		if(check == 14) {
			realSale1 = 3500;
		}else {
			realSale1 = Integer.parseInt(realSale);
		}
		
		if(check == 2 || check == 4 || check == 5 || check == 6) {
			productsFinalPrice1 = Math.round(productsFinalPrice1 * (realSale1 / 100));
		}else {
			productsFinalPrice1 -= realSale1;
		}
		String saleTmp = String.valueOf(Integer.parseInt(productsFinalPrice) - productsFinalPrice1);
		return String.valueOf(productsFinalPrice1) + ":" + saleTmp;
	}
	
	
	@RequestMapping("/paymentCouponEmptyCheck.do")
	public ModelAndView paymentCouponEmptyCheckDo(ModelAndView mav) {
		mav.setViewName("paymentCouponEmptyCheck");
		return mav;
	}
	
	@RequestMapping("/paymentCouponReturn.do")
	public ModelAndView paymentCouponReturnDo(ModelAndView mav, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO vo1 = (MemberVO)session.getAttribute("member");
		PaymentSingleCouponInfoVO vo2 = new PaymentSingleCouponInfoVO();
		vo2.setUser_code(String.valueOf(vo1.getMemberCode()));
		List<PaymentSingleCouponInfoVO> list1 = paymentSingleService.getMyPaymentCoupon(vo2);
		
		mav.addObject("listSize", list1.size());
		mav.setViewName("paymentCouponReturn");
		return mav;
	}
}
