package project.spring.web.admin_banner_management;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class AdminBannerManagementController {
	
	@Autowired
	private AdminBannerManagementService bannerService;
	
	@RequestMapping("/bannerManagement.mdo")
	public ModelAndView bannerManagementDo(ModelAndView mav) {
		AdminBannerManagementVO vo = new AdminBannerManagementVO();
		List<AdminBannerManagementVO> bannerList = bannerService.getBanner(vo);
		mav.addObject("banner", bannerList);
		mav.setViewName("bannerManagement");
		return mav;
	}
	
	@RequestMapping("/bannerSelectDelete.do")
	public ModelAndView bannerDelete(ModelAndView mav, String[] newDeleteItemId) {
		List<String> list1 = new ArrayList<>();
		
		for(int i=0; i < newDeleteItemId.length; i++) {
			System.out.println(newDeleteItemId[i]);
			AdminBannerManagementVO vo = new AdminBannerManagementVO();
			list1.add(newDeleteItemId[i]);
			String s = list1.get(i);
			vo.setId(s);
			bannerService.deleteBanner(vo);
		}
		
		AdminBannerManagementVO vo2 = new AdminBannerManagementVO();
		List<AdminBannerManagementVO> bannerList = bannerService.getBanner(vo2);
		mav.addObject("banner", bannerList);
		mav.setViewName("bannerManagement");
		
		return mav;
	}
	
	@RequestMapping("/bannerModal.mdo")
	public ModelAndView bannerModalDo(ModelAndView mav) {

		mav.setViewName("bannerModal");
		return mav;
	}
	
	@RequestMapping("/bannerInsert.mdo")
	public ModelAndView bannerInsertDo(ModelAndView mav, HttpServletRequest request) {
		
		String url = request.getParameter("url");
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String content = request.getParameter("content");
		String mobile = request.getParameter("mobile");
		
		System.out.println(url);
		System.out.println(name);
		System.out.println(id);
		System.out.println(content);
		
		AdminBannerManagementVO vo2 = new AdminBannerManagementVO();
		vo2.setName(name);
		vo2.setContent(content);
		vo2.setId(id);
		vo2.setImage(url);
		vo2.setMobile(mobile);
		bannerService.insertBanner(vo2);
		
		AdminBannerManagementVO vo = new AdminBannerManagementVO();
		List<AdminBannerManagementVO> bannerList = bannerService.getBanner(vo);
		mav.addObject("banner", bannerList);
		mav.setViewName("bannerManagement");
		
		return mav;
	}
	
	
}
