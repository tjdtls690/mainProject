package project.spring.web.order_sub;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.detail.DetailService;
import project.spring.web.detail.DetailVO;
import project.spring.web.member.MemberVO;
import project.spring.web.member_zipcode.MemberZipcodeService;
import project.spring.web.member_zipcode.MemberZipcodeVO;
import project.spring.web.order.OrderService;

@Controller
public class OrderSubController {
	
	@Autowired
	OrderService orderService;
	@Autowired
	MemberZipcodeService memberZipcodeService;
	@Autowired
	DetailService detailService;
	
	@RequestMapping("/orderSub.do")
	public ModelAndView orderSubDo(ModelAndView mav, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		if(vo == null) {
			mav.setViewName("login");
		}else {
			MemberZipcodeVO tmp = new MemberZipcodeVO();
			tmp.setMember_code(vo.getMemberCode());
			tmp.setMember_delivery_type(0);
			List<MemberZipcodeVO> list = memberZipcodeService.getZipcodeAll(tmp);
			mav.addObject("list", list);
			mav.setViewName("orderSub");
		}
		return mav;
	}
	
	@RequestMapping("/orderSubShippingAddressExplainModal.do")
	public ModelAndView orderSubShippingAddressExplainModalDo(ModelAndView mav) {
		mav.setViewName("orderSubShippingAddressExplainModal");
		return mav;
	}
	
	@RequestMapping("/orderSubMorningBesongji.do")
	public ModelAndView orderSubMorningBesongjiDo(HttpServletRequest request, ModelAndView mav) {
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		MemberZipcodeVO tmp = new MemberZipcodeVO();
		tmp.setMember_code(vo.getMemberCode());
		tmp.setMember_delivery_type(0);
		List<MemberZipcodeVO> list = memberZipcodeService.getZipcodeAll(tmp);
		
		mav.addObject("list", list);
		mav.setViewName("orderSubMorningBesongji");
		return mav;
	}
	
	@RequestMapping("/orderSubParcelBesongji.do")
	public ModelAndView orderSubParcelBesongjiDo(HttpServletRequest request, ModelAndView mav) {
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		MemberZipcodeVO tmp = new MemberZipcodeVO();
		tmp.setMember_code(vo.getMemberCode());
		tmp.setMember_delivery_type(1);
		List<MemberZipcodeVO> list = memberZipcodeService.getZipcodeAll(tmp);
		
		mav.addObject("list", list);
		mav.setViewName("orderSubParcelBesongji");
		return mav;
	}
	
	@RequestMapping("/orderSubCommonBesongji.do")
	public ModelAndView orderSubCommonBesongjiDo(ModelAndView mav, MemberZipcodeVO vo) {
		MemberZipcodeVO vo1 = memberZipcodeService.getZipcodeAll2(vo);
		mav.addObject("memberZipcode", vo1);
		mav.setViewName("orderSubCommonBesongji");
		return mav;
	}
	
	@RequestMapping("/orderSubModal.do")
	public ModelAndView orderSubModalDo(ModelAndView mav, String deliveryType) {
		List<DetailVO> list = detailService.getSubAllItem();
		
		mav.addObject("list", list);
		mav.addObject("deliveryType", deliveryType);
		mav.setViewName("orderSubModal");
		return mav;
	}
	
	@RequestMapping("/orderSubModalDetail.do")
	public ModelAndView orderSubModalDetailDo(ModelAndView mav, DetailVO vo) {
		vo = detailService.getSubItem(vo);
		
		mav.addObject("vo", vo);
		mav.setViewName("orderSubModalDetail");
		return mav;
	}
	
	@RequestMapping("/orderSubModalList.do")
	public ModelAndView orderSubModalListDo(ModelAndView mav) {
		mav.setViewName("orderSubModalList");
		return mav;
	}
	
	@RequestMapping("/orderSubModalFirstDetail.do")
	public ModelAndView orderSubModalFirstDetailDo(ModelAndView mav, String deliveryType) {
		List<DetailVO> list = detailService.getSubAllItem();
		
		mav.addObject("list", list);
		mav.addObject("deliveryType", deliveryType);
		mav.setViewName("orderSubModalFirstDetail");
		return mav;
	}
	
	@RequestMapping("/orderSubModalBackInitializationCheckModal.do")
	public ModelAndView orderSubModalBackInitializationCheckModalDo(ModelAndView mav) {
		mav.setViewName("orderSubModalBackInitializationCheckModal");
		return mav;
	}
	
	@RequestMapping("/orderSubModalCalendar.do")
	public ModelAndView orderDateCalendarDo(ModelAndView mav, String year, String month, String day, String getDay) {
		System.out.println(Integer.parseInt(month));
		String[] dateNum;
		if(Integer.parseInt(month) == 1 || Integer.parseInt(month) == 3 || Integer.parseInt(month) == 5 || Integer.parseInt(month) == 7
				 || Integer.parseInt(month) == 8 || Integer.parseInt(month) == 10 || Integer.parseInt(month) == 12) {
			dateNum = new String[38];
		}else if(Integer.parseInt(month) == 2) {
			if(Integer.parseInt(year) % 4 == 0){
	            if(Integer.parseInt(year) % 400 != 0 && Integer.parseInt(year) % 100 == 0) {
	            	dateNum = new String[35];
	            }else {
	            	dateNum = new String[36];
	            }
	        }else {
	        	dateNum = new String[35];
	        }
		}else {
			dateNum = new String[37];
		}
		int getDayNum = Integer.parseInt(getDay);
		String[] getD = new String[getDayNum];
		int mon = Integer.parseInt(month);
		
		mav.addObject("remainSu", getDayNum);
		mav.addObject("remainCheck", getD);
		mav.addObject("year", year);
		mav.addObject("check", day);
		mav.addObject("month", mon);
		mav.addObject("list", dateNum);
		mav.setViewName("orderSubModalCalendar");
		return mav;
	}
	
	@RequestMapping("/orderSubModalSelectResultAjax.do")
	public ModelAndView orderSubModalSelectResultAjaxDo(ModelAndView mav, String subItemName, String subItemSize, String subItemWeek
			, String subItemStartDay) {
		
		mav.addObject("subItemName", subItemName);
		mav.addObject("subItemSize", subItemSize);
		mav.addObject("subItemWeek", subItemWeek);
		mav.addObject("subItemStartDay", subItemStartDay);
		mav.setViewName("orderSubModalSelectResultAjax");
		return mav;
	}
	
	@RequestMapping("/orderSubModalDetailUL.do")
	public ModelAndView orderSubModalDetailULDo(ModelAndView mav, DetailVO vo) {
		vo = detailService.getSubItem(vo);
		
		mav.addObject("vo", vo);
		mav.setViewName("orderSubModalDetailUL");
		return mav;
	}
	
	@RequestMapping(value = "/orderSubModalPriceCal.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String orderSubModalPriceCalDo(ModelAndView mav, DetailVO vo, String subItemWeek, String subItemSize) {
		vo = detailService.getSubItem(vo);
		
		int week = Integer.parseInt(subItemWeek);
		String price = "";
		
		if(subItemSize.equals("Medium")) {
			price = String.valueOf(Integer.parseInt(vo.getItem_price_m().replace(",", "")) * week) + "/" + String.valueOf(Integer.parseInt(vo.getItem_price_m_sub().replace(",", "")) * week);
		}else {
			price = String.valueOf(Integer.parseInt(vo.getItem_price_l().replace(",", "")) * week) + "/" + String.valueOf(Integer.parseInt(vo.getItem_price_l_sub().replace(",", "")) * week);
		}
		
		return price;
	}
}
