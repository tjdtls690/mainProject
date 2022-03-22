package project.spring.web.main;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.admin_banner_management.AdminBannerManagementService;
import project.spring.web.admin_banner_management.AdminBannerManagementVO;
import project.spring.web.md_recommand.MdRecommandService;
import project.spring.web.md_recommand.MdRecommandVO;
import project.spring.web.tapPage.TapPageService;
import project.spring.web.tapPage.TapPageVO;

@Controller
public class MainController {
	
	@Autowired
	MdRecommandService mdRecommandService;
	@Autowired
	TapPageService tapPageService;
	@Autowired
	private AdminBannerManagementService bannerService;
	
	@RequestMapping("/main.do")
	public ModelAndView mainDo(ModelAndView mav) {
		List<MdRecommandVO> mdTmp = mdRecommandService.getMd(null);
		List<TapPageVO> mdInfo = new ArrayList<TapPageVO>();
		for(MdRecommandVO vo : mdTmp) {
			System.out.println("아이템 코드 : " + vo.getItem_code());
			TapPageVO tmp = new TapPageVO();
			tmp.setItemCode(vo.getItem_code());
			tmp.setTagMain(vo.getItem_tag_main());
			mdInfo.add(tapPageService.getItemInfoOne(tmp));
		}
		
		AdminBannerManagementVO vo = new AdminBannerManagementVO();
		List<AdminBannerManagementVO> bannerList = bannerService.getBanner(vo);
		mav.addObject("banner", bannerList);
		
		int size = (int)bannerList.size();
//		int size2 = size / 2 ;
		
		List<Integer> list1 = new ArrayList<>();
		for (int i =0 ; i < size; i++) {
			list1.add(i);
		}
		
		mav.addObject("sizelist", list1);
		mav.addObject("mdInfo", mdInfo);
		mav.setViewName("main");
		return mav;
	}

}
