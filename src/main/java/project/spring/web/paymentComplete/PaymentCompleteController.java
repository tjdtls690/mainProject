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
import project.spring.web.member.MemberVO;

@Controller
public class PaymentCompleteController {
	
	@Autowired
	PaymentCompleteService paymentCompleteService;
	@Autowired
	BasketService basketService;
	
	
	@RequestMapping("/paymentComplete.do")
	public ModelAndView paymentCompleteDo(ModelAndView mav, HttpServletRequest request, @ModelAttribute(value="PaymentMyDetailInfoList") PaymentMyDetailInfoList list,
			PaymentMyDetailSideInfoVO vo) {
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
		
		mav.setViewName("paymentComplete");
		return mav;
	}
}
