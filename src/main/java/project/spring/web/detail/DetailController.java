package project.spring.web.detail;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
import project.spring.web.utill.Criteria;
import project.spring.web.utill.PageMaker;

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
	

//	@RequestMapping(value = "/detail.do", method = RequestMethod.POST)
	@RequestMapping("/detail.do")
	public ModelAndView setDetail(HttpServletRequest request,ModelAndView mav, Criteria cri)throws Exception {
		String str = request.getParameter("itemCode01");
		int menuNum = Integer.parseInt(str);
		System.out.println("넘어온 Num의 값 :"+menuNum);
		
		String a = request.getParameter("tagMain01");
		int tagMain01 = Integer.parseInt(a);
		System.out.println("넘어온 tagMain01 값 : "+ tagMain01);
		DetailVO VO1 = new DetailVO();
		//단품상품일때
		if(tagMain01 != 100 && tagMain01 != 600) {
			//단품상품일때
//			아이템 상품정보			
		
			VO1.setItem_code(menuNum);
			
			mav.addObject("detail", detailService.getItem(VO1));
			mav.addObject("detailInfo", detailService.getInfo(VO1));
//			아이템 평균별점/게시글카운트
			TapPageVO VO2 = new TapPageVO();
			VO2.setItemCode(menuNum);
			mav.addObject("avgCount", tapPageService.getAvgCount(VO2));
		} else {
			//[세트 or 구독상품일때]
			// 세트 or 구독상품 화면.
        	DetailVO dvo = new DetailVO();
        	dvo.setItem_code(menuNum);
        	System.out.println("----> dvo.getItem_code(menuNum) :" + dvo.getItem_code());
        	mav.addObject("detail", detailService.getSubItem(dvo));
        	
        	// 세트 or 구독상품 상품정보 가져오기 필요한것들
			MappingVO mapVO = new MappingVO();
			mapVO.setSubscribe_code(menuNum); // Subscribe_code == item_code 가 됨.
			System.out.println("mapVO로 넘어갈 code값 :" +menuNum);
			List<MappingVO> aa = mappingService.getItemCodeList(mapVO);
			
			// 영양 정보 고시
			List<DetailVO> itemcodes = new ArrayList<DetailVO>();
			
            for(MappingVO vo : aa) { // 12 15 19
            	dvo.setItem_code(vo.getItem_code());
            	System.out.println("vo.getItem_code 실행 :"+vo.getItem_code());
            	itemcodes.add(detailService.getItem(dvo));
            	System.out.println("dvo.setItem_code 실행 :"+ dvo.getItem_code());          	
            	System.out.println("dvo getItem_price 실행 :"+vo.getSubscribe_code());
            }
            // 상품 정보 고시
            List<DetailVO> itemcodes2 = new ArrayList<DetailVO>();
            
            for(MappingVO vo2 : aa ) {
            	dvo.setItem_code(vo2.getItem_code());
            	itemcodes.add(detailService.getInfo(dvo));
            	
            }
            mav.addObject("detailInfo2", itemcodes);
            
            mav.addObject("detailnut", itemcodes);
          
            // 세트 or 구독상품 info
            
            
		}
		
//		리뷰보드
//		WriteReviewVO VO3 = new WriteReviewVO();
//		VO3.setItem_code(menuNum);
//		VO3.setTagMain(tagMain01);
//		mav.addObject("boardList", writeReviewService.getReviewList(VO3));
//		리뷰보드
	    List<Map<String,Object>> list = writeReviewService.selectBoardList(cri);
	    mav.addObject("boardList", list);
//		페이징 처리
		System.out.println("페이징 처리");
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(writeReviewService.countBoardListTotal());
	    mav.addObject("pageMaker", pageMaker);
		
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
