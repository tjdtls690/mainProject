package project.spring.web.my_review_write;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.detail.DetailService;
import project.spring.web.detail.DetailVO;
import project.spring.web.member.MemberVO;
import project.spring.web.my_pay_detail_info.MyPayDetailInfoService;
import project.spring.web.my_pay_info.MyPayInfoService;
import project.spring.web.paymentComplete.PaymentCompletePointVO;
import project.spring.web.paymentComplete.PaymentCompleteService;
import project.spring.web.paymentComplete.PaymentMyDetailInfoVO;
import project.spring.web.paymentComplete.PaymentMyDetailSideInfoVO;
import project.spring.web.paymentSingle.PaymentSingleService;
import project.spring.web.point_history.PointHistoryService;
import project.spring.web.point_history.PointHistoryVO;
import project.spring.web.s3.AwsS3;

@Controller
public class MyReviewWriteController {
	
	private String url = "https://saladits3.s3.ap-northeast-2.amazonaws.com/";
	@Autowired
	private AwsS3 awsS3;
	@Autowired
	MyReviewWriteService myReviewWriteService;
	@Autowired
	PaymentSingleService paymentSingleService;
	@Autowired
	MyPayInfoService myPayInfoService;
	@Autowired
	DetailService detailService;
	@Autowired
	MyPayDetailInfoService myPayDetailInfoService;
	@Autowired
	PaymentCompleteService paymentCompleteService;
	@Autowired
	PointHistoryService pointHistoryService;
	
	@RequestMapping("/myReviewWrite.do")
	public ModelAndView myReviewWriteDo(ModelAndView mav, String tagMain, String itemCode, String mappingCode, String paymentCode) {
		PaymentMyDetailSideInfoVO vo = new PaymentMyDetailSideInfoVO();
		vo.setPayment_code(Integer.parseInt(paymentCode));
		vo = myPayDetailInfoService.getMemberPaymentDetailInfo(vo);
		
		PaymentMyDetailInfoVO  vo1 = new PaymentMyDetailInfoVO();
		vo1.setPayment_item_mapping_code(Integer.parseInt(mappingCode));
		vo1 = myReviewWriteService.getMemberPayMappingItemInfoOne(vo1);
		
		DetailVO vo2 = new DetailVO();
		vo2.setItem_code(Integer.parseInt(itemCode));
		if(Integer.parseInt(tagMain) == 100 || Integer.parseInt(tagMain) == 600) {
			vo2 = detailService.getSubItem(vo2);
		}else {
			vo2 = detailService.getItem(vo2);
		}
		
		
		mav.addObject("itemInfo", vo2);
		mav.addObject("paymentInfo", vo1);
		mav.addObject("paymentSideInfo", vo);
		mav.addObject("paymentCode", paymentCode);
		mav.addObject("tagMain", tagMain);
		mav.addObject("itemCode", itemCode);
		mav.addObject("mappingCode", mappingCode);
		mav.setViewName("myReviewWrite");
		return mav;
	}
	
	@RequestMapping(value = "/insertReview.do", produces = "application/text; charset=utf8")
	public ModelAndView insertReview(HttpServletRequest request, ModelAndView mav, String tagMain, String contentCheck, String imageCheck,
			String itemCode, String star, String content, String mappingCode, MultipartFile uploadFile1, MultipartFile uploadFile2) {
		System.out.println("리뷰내용 길이 : " + content.length());
		String imageURL = "";
		
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
		
		// 이미지 업로드1
		if(!uploadFile1.getOriginalFilename().equals("")) {
			try {
				String key = "review/" + uploadFile1.getOriginalFilename();
				InputStream is = uploadFile1.getInputStream();
				String contentType = uploadFile1.getContentType();
				long contentLength = uploadFile1.getSize();
				awsS3.upload(is, key, contentType, contentLength);
				imageURL += (url + key);
			} catch (IOException e) {
				System.out.println("메인이미지 업로드 실패");
			}
		}
		
		// 이미지 업로드2
		if(!uploadFile2.getOriginalFilename().equals("")) {
			try {
				String key = "review/" + uploadFile2.getOriginalFilename();
				InputStream is = uploadFile2.getInputStream();
				String contentType = uploadFile2.getContentType();
				long contentLength = uploadFile2.getSize();
				awsS3.upload(is, key, contentType, contentLength);
				if(imageURL.length() != 0) {
					imageURL += ":;:";
				}
				imageURL += (url + key);
			} catch (IOException e) {
				System.out.println("메인이미지 업로드 실패");
			}
		}
		vo.setImage(imageURL);
		
		
		// 리뷰 테이블 등록
		if(tagMain1 == 100 || tagMain1 == 600) {
			vo.setSubscribe_code(itemCode1);
			myReviewWriteService.insertSubReview(vo);
		}else {
			vo.setItem_code(itemCode1);
			myReviewWriteService.insertReview(vo);
		}
		
		// 아이템 매핑 테이블 리뷰 등록한 상품으로 수정
		PaymentMyDetailInfoVO vo5 = new PaymentMyDetailInfoVO();
		vo5.setPayment_item_mapping_code(mappingCode1);
		vo5.setPayment_item_mapping_review(1);
		paymentSingleService.updatePaymentMappingCode(vo5);
		
		// 해당 회원 포인트 적립 여부
		if(Integer.parseInt(contentCheck) == 1) {
			int point = 100;
			String pointExplain = "텍스트 후기 포인트";
			if(Integer.parseInt(imageCheck) == 1) {
				point = 300;
				pointExplain = "이미지 후기 포인트";
			}
			PaymentCompletePointVO vo6 = new PaymentCompletePointVO();
			vo6.setPayment_member_code(vo1.getMemberCode());
			vo6 = paymentCompleteService.getMemberPoint(vo6);
			vo6.setPayment_point(vo6.getPayment_point() + point);
			paymentCompleteService.updateMemberPoint(vo6);
			
			// 포인트 히스토리 저장
			PointHistoryVO vo7 = new PointHistoryVO();
			vo7.setPoint_history_member_code(vo1.getMemberCode());
			vo7.setPoint_history_point(point);
			vo7.setPoint_history_explain(pointExplain);
			pointHistoryService.insertPointHistory(vo7);
		}
		
		
		
		// 마이페이지 나의 후기 페이지로 이동하는 과정
		PaymentMyDetailSideInfoVO vo2 = new PaymentMyDetailSideInfoVO();
		vo2.setPayment_member_code(vo1.getMemberCode());
		List<PaymentMyDetailSideInfoVO> list1 = myPayInfoService.getMemberAllPaymentInfo(vo2);
		List<List<PaymentMyDetailInfoVO>> list2 = new ArrayList<List<PaymentMyDetailInfoVO>>();
		List<List<DetailVO>> list4 = new ArrayList<List<DetailVO>>();
		for(int i = 0; i < list1.size(); i++) {
			PaymentMyDetailInfoVO vo3 = new PaymentMyDetailInfoVO();
			vo3.setPayment_code(list1.get(i).getPayment_code());
			List<PaymentMyDetailInfoVO> list3 = myPayInfoService.getMemberPayMappingItemInfo(vo3);
			list2.add(list3);
		}
		
		for(int i = 0; i < list2.size(); i++) {
			List<DetailVO> list5 = new ArrayList<DetailVO>();
			for(int j = 0; j < list2.get(i).size(); j++) {
				DetailVO vo4 = new DetailVO();
				vo4.setItem_code(list2.get(i).get(j).getPayment_item_mapping_item_code());
				if(list2.get(i).get(j).getPayment_item_mapping_tag_main() != 100 && list2.get(i).get(j).getPayment_item_mapping_tag_main() != 600) {
					list5.add(detailService.getItem(vo4));
				}else {
					list5.add(detailService.getSubItem(vo4));
				}
			}
			
			list4.add(list5);
		}
		
		int check = 0;
		for(int i = 0; i < list2.size(); i++) {
			for(int j = 0; j < list2.get(i).size(); j++) {
				if(list2.get(i).get(j).getPayment_item_mapping_review() == 0) {
					check++;
				}
			}
		}
		
		
		mav.addObject("check", check);
		mav.addObject("list1", list1);
		mav.addObject("list2", list2);
		mav.addObject("list3", list4);
		mav.setViewName("myReviewSearch");
		return mav;
	}
}
