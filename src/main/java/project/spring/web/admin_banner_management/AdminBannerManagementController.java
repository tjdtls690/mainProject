package project.spring.web.admin_banner_management;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.s3.AwsS3;
import project.spring.web.s3.AwsS3Service;
import project.spring.web.s3.AwsS3VO;

@Controller
public class AdminBannerManagementController {
	private String url = "https://saladits3.s3.ap-northeast-2.amazonaws.com/";
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	@Autowired
	AwsS3Service awsS3Service;
//	//DB

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
	public ModelAndView bannerDelete(ModelAndView mav, HttpServletRequest request) {
		
		String id = request.getParameter("deleteID");
		AdminBannerManagementVO vo = new AdminBannerManagementVO();
		vo.setId(id);
		bannerService.deleteBanner(vo);

		AdminBannerManagementVO vo2 = new AdminBannerManagementVO();
		List<AdminBannerManagementVO> bannerList = bannerService.getBanner(vo2);
		mav.addObject("banner", bannerList);
		mav.setViewName("bannerManagement");

		return mav;
	}
	
	@RequestMapping("/admin_bannerInsert.mdo")
	public ModelAndView bannerInsertDo(ModelAndView mav, HttpServletRequest request, MultipartFile uploadFile, AdminBannerManagementVO banner, MultipartHttpServletRequest mtrequest) {
		System.out.println("admin_bannerInser.mdo 왔다");
		
		AwsS3 awsS3 = new AwsS3();
		AwsS3VO avo = awsS3Service.getKey();
		awsS3.setAccessKey(avo.getA_key());
		awsS3.setSecretKey(avo.getS_key());
		awsS3.createS3Client();
		
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
		mav.setViewName("redirect:bannerManagement.mdo");

		return mav;
	}

}
