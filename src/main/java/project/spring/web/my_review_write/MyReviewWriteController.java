package project.spring.web.my_review_write;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.member.MemberVO;
import project.spring.web.paymentComplete.PaymentMyDetailInfoVO;
import project.spring.web.paymentSingle.PaymentSingleService;

@Controller
public class MyReviewWriteController {
	
	@Autowired
	MyReviewWriteService myReviewWriteService;
	@Autowired
	PaymentSingleService paymentSingleService;
	
	@RequestMapping("/myReviewWrite.do")
	public ModelAndView myReviewWriteDo(ModelAndView mav, MyReviewWriteVO vo, String tagMain, String itemCode, String mappingCode) {
		
		mav.addObject("tagMain", tagMain);
		mav.addObject("itemCode", itemCode);
		mav.addObject("mappingCode", mappingCode);
		mav.setViewName("myReviewWrite");
		return mav;
	}
	
	@RequestMapping(value = "/insertReview.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String insertReview(HttpServletRequest request, ModelAndView mav, String tagMain, 
			String itemCode, String star, String content, String mappingCode) {
		HttpSession session = request.getSession();
		MemberVO vo1 = (MemberVO)session.getAttribute("member");
		int tagMain1 = Integer.parseInt(tagMain);
		int itemCode1 = Integer.parseInt(itemCode);
		int star1 = Integer.parseInt(star);
		int mappingCode1 = Integer.parseInt(mappingCode);
		
		MyReviewWriteVO vo = new MyReviewWriteVO();
		vo.setStar(star1);
		vo.setPayment_item_mapping_code(mappingCode1);
		vo.setContent(content);
		vo.setUser_name(vo1.getName());
		if(tagMain1 == 100 || tagMain1 == 600) {
			vo.setSubscribe_code(itemCode1);
			myReviewWriteService.insertSubReview(vo);
		}else {
			vo.setItem_code(itemCode1);
			myReviewWriteService.insertReview(vo);
		}
		
		PaymentMyDetailInfoVO vo2 = new PaymentMyDetailInfoVO();
		vo2.setPayment_item_mapping_code(mappingCode1);
		vo2.setPayment_item_mapping_review(1);
		paymentSingleService.updatePaymentMappingCode(vo2);
		
		return null;
	}
}
