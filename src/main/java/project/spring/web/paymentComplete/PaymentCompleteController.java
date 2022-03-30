package project.spring.web.paymentComplete;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.basket.BasketService;
import project.spring.web.basket.BasketVO;
import project.spring.web.event.CouponVO;
import project.spring.web.member.MemberVO;
import project.spring.web.point_history.PointHistoryService;
import project.spring.web.point_history.PointHistoryVO;

@Controller
public class PaymentCompleteController {
	
	@Autowired
	PaymentCompleteService paymentCompleteService;
	@Autowired
	BasketService basketService;
	@Autowired
	PointHistoryService pointHistoryService;
	
	
	@RequestMapping("/paymentComplete.do")
	public ModelAndView paymentCompleteDo(ModelAndView mav, HttpServletRequest request, @ModelAttribute(value="PaymentMyDetailInfoList") PaymentMyDetailInfoList list,
			PaymentMyDetailSideInfoVO vo, String coupon_check_num) {
		HttpSession session = request.getSession();
		MemberVO vo1 = (MemberVO)session.getAttribute("member");
		List<String> li = new ArrayList<String>();
		String month = "";
		String day = "";
		String dateTmp = "";
		
		StringTokenizer st = new StringTokenizer(vo.getPayment_date_impl(), "-");
		for(; st.hasMoreTokens(); ) {
			li.add(st.nextToken());
		}
		for(int i = 0; i < li.size(); i++) {
			System.out.println(li.get(i));
		}
		dateTmp = li.get(0);
				
		if(li.get(1).length() == 1) {
			month = "0" + li.get(1);
			dateTmp += "-" + month;
		}else {
			dateTmp += "-" + li.get(1);
		}
		if(li.get(2).length() == 1) {
			day = "0" + li.get(2);
			dateTmp += "-" + day;
		}else {
			dateTmp += "-" + li.get(2);
		}
		
        LocalDate date = LocalDate.parse(dateTmp, DateTimeFormatter.ISO_DATE);
		
		// 결제 테이블
		vo.setPayment_member_code(vo1.getMemberCode());
		vo.setPayment_date(date);
		paymentCompleteService.paymentInfoSave(vo); // mybatis 해당 insert태그에 설정된 keyProperty 컬럼 값이 vo에 자동 저장
		
		// 결제 한 건당 매핑 된 아이템들 저장하는 테이블 (테이블 생성은 완료)
		// 위에 vo에서 payment_code 꺼내서 리스트에 있는 vo에 전부 넣어주면서 저장하면 끝
		for(int i = 0; i < list.getPaymentMyDetailInfo().size(); i++) {
			list.getPaymentMyDetailInfo().get(i).setPayment_code(vo.getPayment_code());
			list.getPaymentMyDetailInfo().get(i).setPayment_member_code(vo1.getMemberCode());
			paymentCompleteService.paymentMappingItemInfoSave(list.getPaymentMyDetailInfo().get(i));
		}
		
		// 장바구니에서 구매한 물건들 삭제
		BasketVO vo2 = new BasketVO();
		vo2.setUserCode(vo1.getMemberCode());
		List<BasketVO> li2 = basketService.getBasketList(vo2);
		for(int i = 0; i < li2.size(); i++) {
			for(int j = 0; j < list.getPaymentMyDetailInfo().size(); j++) {
				if(li2.get(i).getTagMain() == list.getPaymentMyDetailInfo().get(j).getPayment_item_mapping_tag_main()
						&& li2.get(i).getItemCode() == list.getPaymentMyDetailInfo().get(j).getPayment_item_mapping_item_code()) {
					paymentCompleteService.deleteItem(list.getPaymentMyDetailInfo().get(j));
					break;
				}
			}
		}
		
		
		// 사용한 쿠폰 금지
		int coupon_check_num1 = Integer.parseInt(coupon_check_num);
		CouponVO vo3 = new CouponVO();
		vo3.setUser_code(vo1.getMemberCode());
		vo3.setCoupon_code(coupon_check_num1);
		paymentCompleteService.useCouponProhibition(vo3);
		
		// 사용 포인트 차감
		int usePoint = Integer.parseInt(vo.getPayment_point_price());
		int oldPoint = 0;
		PaymentCompletePointVO vo5 = new PaymentCompletePointVO();
		vo5.setPayment_member_code(vo1.getMemberCode());
		vo5 = paymentCompleteService.getMemberPoint(vo5);
		int remainPoint = vo5.getPayment_point() - usePoint;
		vo5.setPayment_point(remainPoint);
		paymentCompleteService.updateMemberPoint(vo5);
		
		
		// 포인트 계산 (5% 적입)
		int paymentFinalPrice = Integer.parseInt(vo.getPayment_final_price());
		int point = Math.round(paymentFinalPrice / 20);
		
		// point_history 테이블에도 저장
		PointHistoryVO vo6 = new PointHistoryVO();
		vo6.setPoint_history_member_code(vo1.getMemberCode());
		vo6.setPoint_history_point(point);
		vo6.setPoint_history_explain("상품 결제 포인트");
		vo6.setPoint_history_type(1);
		pointHistoryService.insertPointHistory(vo6);
		
		PaymentCompletePointVO vo4 = new PaymentCompletePointVO();
		vo4.setPayment_member_code(vo1.getMemberCode());
		vo4 = paymentCompleteService.getMemberPoint(vo4);
		vo4.setPayment_point(vo4.getPayment_point() + point);
		paymentCompleteService.updateMemberPoint(vo4);
		
		mav.addObject("list", list.getPaymentMyDetailInfo());
		mav.addObject("vo", vo);
		mav.setViewName("paymentComplete");
		return mav;
	}
}
