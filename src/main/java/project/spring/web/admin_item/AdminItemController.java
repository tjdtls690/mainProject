package project.spring.web.admin_item;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.s3.AwsS3;

@Controller
public class AdminItemController {
	
	private String url = "https://saladits3.s3.ap-northeast-2.amazonaws.com/";
	@Autowired
	private AwsS3 awsS3;
	
	@Autowired
	AdminItemService adminItemService;
	
	@RequestMapping("/adminItemList.mdo")
	public ModelAndView adminItemListDo(ModelAndView mav) {
		AdminItemVO ivo = new AdminItemVO();
		List<AdminItemVO> adminItemList = adminItemService.getAdminItemList(ivo);
		System.out.println(adminItemList.get(0).getItem_name());
		mav.addObject("itemList", adminItemList);
		
		AdminSubVO svo = new AdminSubVO();
		List<AdminSubVO> adminSubList = adminItemService.getAdminSubList(svo);
		System.out.println(adminSubList.get(0).getSubscribe_name());
		mav.addObject("subList", adminSubList);
		mav.setViewName("itemlistManagement");
		return mav;
	}
	
	@RequestMapping("/itemInsert.mdo")
	public ModelAndView itemInsertDo(ModelAndView mav) {
		mav.setViewName("itemuploadManagement");
		return mav;
	}
	
	@RequestMapping(value="/itemDelete.mdo", method = RequestMethod.POST)
	public ModelAndView itemDeleteDo(ModelAndView mav, HttpServletRequest request) {
		String a = request.getParameter("tag");
		
		String b = request.getParameter("code");
		
		int tag = Integer.parseInt(a);
		int code = Integer.parseInt(b);
		
		if(tag == 100) {
			AdminSubVO svo = new AdminSubVO();
			svo.setSubscribe_tag_main(tag);
			svo.setSubscribe_code(code);
			adminItemService.subDelete(svo);
		} else if(tag == 600) {
			AdminSubVO svo = new AdminSubVO();
			svo.setSubscribe_tag_main(tag);
			svo.setSubscribe_code(code);
			adminItemService.subDelete(svo);
		} else {
			AdminItemVO ivo = new AdminItemVO();
			ivo.setItem_tag_main(tag);
			ivo.setItem_code(code);
			adminItemService.itemDelete(ivo);
		}
		mav.setViewName("itemlistManagement");
		return mav;
	}
	
	@RequestMapping("/itemInsertSuccess.mdo")
	public ModelAndView itemInsertDo(ModelAndView mav, MultipartFile uploadFile, MultipartHttpServletRequest mtrequest, HttpServletRequest request, AdminItemVO vo) {
		System.out.println("vo에 자동으로 저장된 값 getter : "+vo.getItem_name());
		String a = request.getParameter("item_price_m");
		System.out.println("request.getParameter : "+a);
		System.out.println(request.getParameter(""));
		try {
			String key = "menu/" + uploadFile.getOriginalFilename();
			InputStream is = uploadFile.getInputStream();
			String contentType = uploadFile.getContentType();
			long contentLength = uploadFile.getSize();
			awsS3.upload(is, key, contentType, contentLength);
			
			vo.setItem_image(url + key);
		} catch(IOException e) {
			System.out.println("메인이미지 업로드 실패");
		}
		List<MultipartFile> fileList = mtrequest.getFiles("infoImages");
		List<String> infoImages = new ArrayList<String>();
		for(MultipartFile mf : fileList) {
			try {
				String key = "menu/" + mf.getOriginalFilename();
				InputStream is = mf.getInputStream();
				String contentType = mf.getContentType();
				long contentLength = mf.getSize();
				awsS3.upload(is, key, contentType, contentLength);
					
				System.out.println(url + key);
				
				infoImages.add(url + key);
				System.out.println("서브이미지" +mf.getOriginalFilename());
					
			}catch(IOException e) {
				System.out.println("파일업로드 실패!!");
			}
		}
		
		String result = String.join(":;:", infoImages);
		System.out.println(result);
		vo.setItem_info_image(result);
		adminItemService.itemInsert(vo);
		
		mav.setViewName("itemlistManagement");
		return mav;
	}
}
