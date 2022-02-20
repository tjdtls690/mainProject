package project.spring.web.detail;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.mapping.MappingService;
import project.spring.web.mapping.MappingVO;
import project.spring.web.review.WriteReviewService;
import project.spring.web.review.WriteReviewVO;
import project.spring.web.tapPage.TapPageService;
import project.spring.web.tapPage.TapPageVO;

@Controller
public class DetailController {
	// 각각 주입받을 Service

	@Autowired
	private DetailService detailService;
	@Autowired
	private TapPageService tapPageService;
	@Autowired
	private WriteReviewService writeReviewService;
	@Autowired
	private MappingService mappingService;
	
	
	public DetailController() {
		System.out.println("detailController 실행");
	}
	

	@RequestMapping(value = "/detail.do", method = RequestMethod.POST)
	public ModelAndView setDetail(HttpServletRequest request,ModelAndView mav) {
		String str = request.getParameter("itemCode01");
		int menuNum = Integer.parseInt(str);
		System.out.println("넘어온 Num의 값 :"+menuNum);
		
		String a = request.getParameter("tagMain01");
		int tagMain01 = Integer.parseInt(a);
		System.out.println("넘어온 tagMain01 값 : "+ tagMain01);
		//단품상품일때
		if(tagMain01 != 100 && tagMain01 != 600) {
			//단품상품일때
//			아이템 상품정보			
			DetailVO VO1 = new DetailVO();
			VO1.setItem_code(menuNum);
			mav.addObject("detail", detailService.getItem(VO1));
			mav.addObject("detailInfo", detailService.getInfo(VO1));
//			아이템 평균별점/게시글카운트
			TapPageVO VO2 = new TapPageVO();
			VO2.setItemCode(menuNum);
			mav.addObject("avgCount", tapPageService.getAvgCount(VO2));
		} else {
			//세트 or 구독상품일때
			MappingVO mapVO = new MappingVO();
			mapVO.setSubscribe_code(menuNum);			
			
			List<DetailVO> itemcodes = new ArrayList<DetailVO>();
			
			List<MappingVO> aa = mappingService.getItemCode(mapVO);
            for(MappingVO vo : aa) {
            	DetailVO dvo = new DetailVO();
            	dvo.setItem_code(vo.getItem_code());
            	itemcodes.add(detailService.getItem(dvo));
            }
		}
		
//		리뷰보드
		WriteReviewVO VO3 = new WriteReviewVO();
		VO3.setItem_code(menuNum);
		VO3.setTagMain(tagMain01);
		mav.addObject("boardList", writeReviewService.getReviewList(VO3));
		mav.setViewName("detail");
		return mav;
	}

	@RequestMapping(value = "/test.do", method = RequestMethod.POST)
	public ModelAndView testDo(HttpServletRequest request, ModelAndView mav) {
		String str = request.getParameter("itemCode");
		int num = Integer.parseInt(str);
		System.out.println("넘어온 item_code 값 : " +num);
		
		mav.setViewName("basket");
		return mav;
	}
	
}
