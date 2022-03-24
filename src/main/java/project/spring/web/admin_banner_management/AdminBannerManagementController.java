package project.spring.web.admin_banner_management;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.s3.AwsS3;

@Controller
public class AdminBannerManagementController {
	private String url = "https://saladits3.s3.ap-northeast-2.amazonaws.com/";
//	//DB
	@Autowired
	private AwsS3 awsS3;

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

		for (int i = 0; i < newDeleteItemId.length; i++) {
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

//	@RequestMapping("/bannerInsert.mdo")
//	public ModelAndView bannerInsertDo(ModelAndView mav, HttpServletRequest request) {
//		
//		String url = request.getParameter("url");
//		String name = request.getParameter("name");
//		String id = request.getParameter("id");
//		String content = request.getParameter("content");
//		String mobile = request.getParameter("mobile");
//		
//		System.out.println(url);
//		System.out.println(name);
//		System.out.println(id);
//		System.out.println(content);
//		
//		
//		awsS3.upload(null, mobile);
//		
//		AdminBannerManagementVO vo2 = new AdminBannerManagementVO();
//		vo2.setName(name);
//		vo2.setContent(content);
//		vo2.setId(id);
//		vo2.setImage(url);
//		vo2.setMobile(mobile);
//		bannerService.insertBanner(vo2);
//		
//		AdminBannerManagementVO vo = new AdminBannerManagementVO();
//		List<AdminBannerManagementVO> bannerList = bannerService.getBanner(vo);
//		mav.addObject("banner", bannerList);
//		mav.setViewName("bannerManagement");
//		
//		return mav;
//	}
	@RequestMapping("/admin_bannerInsert.mdo")
	public ModelAndView bannerInsertDo(ModelAndView mav, HttpServletRequest request, MultipartFile uploadFile, AdminBannerManagementVO banner, MultipartHttpServletRequest mtrequest) {
		System.out.println("admin_bannerInser.mdo 왔다");

		String name = request.getParameter("banner_name");
		String id = request.getParameter("banner_id");
		String content = request.getParameter("banner_content");
		
		banner.setName(name);
		banner.setId(id);
		banner.setContent(content);
		
		List<MultipartFile> fileList = mtrequest.getFiles("uploadFile");
		int i = 0;
		for (MultipartFile mf : fileList) {
			if(i == 0) {
				try {
					String key = "banner/" + mf.getOriginalFilename();
					InputStream is = mf.getInputStream();
					String contentType = mf.getContentType();
					long contentLength = mf.getSize();
					awsS3.upload(is, key, contentType, contentLength);
					banner.setImage("https://saladits3.s3.ap-northeast-2.amazonaws.com/" + key);
					System.out.println("첫번쨰");
				}catch(IOException e) {
					System.out.println("실패");
					e.printStackTrace();
				}
			}else {
				try {
					String key = "banner/" + mf.getOriginalFilename();
					InputStream is = mf.getInputStream();
					String contentType = mf.getContentType();
					long contentLength = mf.getSize();
					awsS3.upload(is, key, contentType, contentLength);
					banner.setMobile("https://saladits3.s3.ap-northeast-2.amazonaws.com/" + key);
					System.out.println("두번쨰");
				}catch(IOException e) {
					System.out.println("실패");
					e.printStackTrace();
				}
			}
			i++;

		}
		
		bannerService.insertBanner(banner);


		AdminBannerManagementVO vo = new AdminBannerManagementVO();
		List<AdminBannerManagementVO> bannerList = bannerService.getBanner(vo);
		mav.addObject("banner", bannerList);
		mav.setViewName("bannerManagement");

		return mav;
	}

}
