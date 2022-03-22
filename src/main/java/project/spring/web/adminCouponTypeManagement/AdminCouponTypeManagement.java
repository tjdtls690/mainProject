package project.spring.web.adminCouponTypeManagement;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.event.CouponVO;
import project.spring.web.event.EventService;
import project.spring.web.member.MemberService;
import project.spring.web.member.MemberVO;

@Controller
public class AdminCouponTypeManagement {
	
	@Autowired
	EventService eventService;
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping("/adminCouponTypeManagement.mdo")
	public ModelAndView adminCouponTypeManagementDo(ModelAndView mav) {
		
		CouponVO cvo = new CouponVO();
		List<CouponVO> coupon = eventService.getAllCoupon(cvo);
		mav.addObject("coupon", coupon);
		mav.setViewName("couponTypeManagement");
		return mav;
	}
	
	@RequestMapping("/userCouponManage.mdo")
	public ModelAndView userCouponManageDo(ModelAndView mav) {
		
		CouponVO cvo = new CouponVO();
		List<CouponVO> userCoupon = eventService.getUserCoupon(cvo);
//		SELECT a.user_code, b.*
//		FROM user_coupon a LEFT JOIN coupon b 
//		ON a.coupon_code = b.coupon_code
//		ORDER BY a.user_code ASC

		MemberVO mvo = new MemberVO();
		List<MemberVO> allMember = memberService.getAllMember(mvo);
//		SELECT * FROM member
		
		List<String> memberEmail = new ArrayList<String>();
		
		for(int j = 0; j < allMember.size(); j++) {
			for (int i = 0; i < userCoupon.size(); i++) {
				int userCode = userCoupon.get(i).getUser_code();
				//i번째 유저의 유저쿠폰테이블에서의 유저코드
				if(userCode == allMember.get(j).getMemberCode()) {
					MemberVO mvo2 = new MemberVO();
					mvo2.setMemberCode(userCode);
					MemberVO member = memberService.getMemberEmail(mvo2);
//					SELECT * FROM member WHERE member_code = #{memberCode}
					memberEmail.add(member.getEmail());
				}
			}
		}
		mav.addObject("coupon", userCoupon);
		mav.addObject("memberEmail",memberEmail);
		mav.setViewName("userCouponManage");
		return mav;
	}
	
	@RequestMapping(value = "/userCouponDelete.mdo", method = RequestMethod.POST)
	public ModelAndView userCouponDeleteDo(ModelAndView mav, HttpServletRequest request) {
		String a = request.getParameter("couponCode");
		String email = request.getParameter("email");
		int couponCode = Integer.parseInt(a);
		System.out.println(couponCode);
		System.out.println(email);
		
		MemberVO mvo = new MemberVO();
		mvo.setEmail(email);
		MemberVO memberEmail = memberService.getMember(mvo);
		//SELECT * FROM member WHERE member_email = #{email}
		int userCode = memberEmail.getMemberCode();
		CouponVO cvo = new CouponVO();
		cvo.setCoupon_code(couponCode);
		cvo.setUser_code(userCode);
		eventService.deleteUserCoupon(cvo);
		mav.setViewName("userCouponManage");
		return mav;
	}
	
	@RequestMapping(value = "/couponDelete.mdo", method = RequestMethod.POST)
	public ModelAndView couponDeleteDo(ModelAndView mav, HttpServletRequest request) {
		String a = request.getParameter("couponCode");
		int couponCode = Integer.parseInt(a);
		System.out.println(couponCode);
		CouponVO cvo = new CouponVO();
		cvo.setCoupon_code(couponCode);
		eventService.deleteCoupon(cvo);
		mav.setViewName("couponTypeManagement");
		return mav;
	}
	
	@RequestMapping(value = "/couponInsert.mdo", method = RequestMethod.POST)
	public ModelAndView couponInsertDo(ModelAndView mav, HttpServletRequest request) {
		String b = request.getParameter("couponPack");
		String no = "---";
		if(b.equals(no)) {
			b = null;
			String couponType = request.getParameter("couponType");
			String couponEx = request.getParameter("couponEx");
			CouponVO vo = new CouponVO();
			vo.setCoupon_type(couponType);
			vo.setCoupon_explain(couponEx);
			eventService.couponInsert(vo);
			mav.setViewName("couponTypeManagement");
		} else {
			int couponPack = Integer.parseInt(b);
			String couponType = request.getParameter("couponType");
			String couponEx = request.getParameter("couponEx");
			System.out.println(b + couponType + couponEx);
			CouponVO vo = new CouponVO();
			vo.setCoupon_pack(couponPack);
			vo.setCoupon_type(couponType);
			vo.setCoupon_explain(couponEx);
			eventService.couponInsert(vo);
			mav.setViewName("couponTypeManagement");
		}
		return mav;
	}
}
