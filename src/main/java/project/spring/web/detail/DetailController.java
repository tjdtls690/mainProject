package project.spring.web.detail;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

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
			DetailVO itemNut = detailService.getItem(VO1);
			mav.addObject("detail", itemNut);
			if(itemNut.getItem_nut() != null) {
				StringTokenizer st = new StringTokenizer(itemNut.getItem_nut().replace(":;:", "\\"), "\\");
				List<String> nut = new ArrayList<String>();
				while(st.hasMoreTokens()) {
					String str1 = st.nextToken();
					nut.add(str1);
				}
				mav.addObject("itemNut", nut);
			}
			DetailVO itemInfo = detailService.getInfo(VO1);
			if(itemInfo != null) {
				if(itemInfo.getItem_info() != null) {
					StringTokenizer st1 = new StringTokenizer(itemInfo.getItem_info().replace(":;:", "\\"), "\\");
					List<String> info = new ArrayList<String>();
					while(st1.hasMoreTokens()) {
						info.add(st1.nextToken());
					}
					mav.addObject("detailInfo", info);
				}
			}
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
            	System.out.println("itemcodes 담는중");
            	dvo.setItem_code(vo.getItem_code());
            	itemcodes.add(detailService.getItem(dvo));
            }
            
            List<String> itemNut = new ArrayList<String>();
            for(DetailVO vo : itemcodes) {
            	if(vo.getItem_nut() == null) {
            		continue;
            	}
            	
            	StringTokenizer st = new StringTokenizer(vo.getItem_nut().replace(":;:", "\\"), "\\");
            	while(st.hasMoreTokens()) {
            		String str1 = st.nextToken();
            		if(!str1.contains("영양성분")) {
            			continue;
            		}
//            		System.out.println(str1);
            		itemNut.add(str1);
            	}
            	
            }
            // 상품 정보 고시
            List<DetailVO> itemcodes2 = new ArrayList<DetailVO>();
            
            for(MappingVO vo2 : aa ) {
            	dvo.setItem_code(vo2.getItem_code());
            	itemcodes2.add(detailService.getInfo(dvo));
            }
            
            List<String> itemInfo = new ArrayList<String>();
            for(DetailVO vo : itemcodes2) {
            	if(vo.getItem_info() == null) {
            		continue;
            	}
            	StringTokenizer st = new StringTokenizer(vo.getItem_info().replace(":;:", "\\"), "\\");
            	while(st.hasMoreTokens()) {
            		String str1 = st.nextToken();
            		if(!str1.contains("내용량")) {
            			continue;
            		}
            		itemInfo.add(str1);
            	}
            }
            mav.addObject("detailInfo2", itemInfo);
            
            mav.addObject("detailNut", itemNut);
          
//			아이템 평균별점/게시글카운트
			TapPageVO VO2 = new TapPageVO();
			VO2.setItemCode(menuNum);
			mav.addObject("avgCount", tapPageService.getAvgCount(VO2));
		}
		
//		리뷰보드
//		WriteReviewVO VO3 = new WriteReviewVO();
//		VO3.setItem_code(menuNum);
//		VO3.setTagMain(tagMain01);
//		mav.addObject("boardList", writeReviewService.getReviewList(VO3));
		
//		리뷰보드( 각 품목 불러오기 )
		cri.setItem_code(menuNum);
	    List<Map<String,Object>> list = writeReviewService.selectBoardList(cri);
	    mav.addObject("boardList", list);
//		페이징 처리
		System.out.println("페이징 처리");
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setItem_code(menuNum);
	    pageMaker.setTotalCount(writeReviewService.countBoardListTotal(pageMaker));
	    mav.addObject("pageMaker", pageMaker);
	    System.out.println("cri.getItem_code : "+cri.getItem_code());
	    System.out.println("");
	    System.out.println("totalcount 값 :" + pageMaker.getTotalCount());

		mav.setViewName("detail");
		return mav;
	}

	
	@RequestMapping(value = "/test.do", method = RequestMethod.POST)
	public ModelAndView testDo(HttpServletRequest request, ModelAndView mav) {
		String str = request.getParameter("itemCode");
		int num = Integer.parseInt(str);
		System.out.println("넘어온 item_code 값 : " +num);

		String a = request.getParameter("tagMain01");
		int tagMain01 = Integer.parseInt(a);
		System.out.println("넘어온 tagMain01 값 : "+ tagMain01);
		mav.setViewName("basket");
		return mav;
	}
	
}
