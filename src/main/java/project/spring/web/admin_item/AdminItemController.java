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

		// item_info 테이블 값 추가를 위한 아이템코드 set
		AdminItemVO ivo = new AdminItemVO();
		List<AdminItemVO> itemListTemp = adminItemService.getAdminItemList(ivo);
		int lastIndex = itemListTemp.size() - 1;
		System.out.println("마지막 인덱스 : " + lastIndex);
		int lastItemCode = itemListTemp.get(lastIndex).getItem_code();
		mav.addObject("lastItemCode", lastItemCode);
		mav.setViewName("itemuploadManagement");
		return mav;
	}

	@RequestMapping(value = "/itemDelete.mdo", method = RequestMethod.POST)
	public ModelAndView itemDeleteDo(ModelAndView mav, HttpServletRequest request) {
		String a = request.getParameter("tag");

		String b = request.getParameter("code");

		int tag = Integer.parseInt(a);
		int code = Integer.parseInt(b);

		if (tag == 100) {
			AdminSubVO svo = new AdminSubVO();
			svo.setSubscribe_tag_main(tag);
			svo.setSubscribe_code(code);
			adminItemService.subDelete(svo);
		} else if (tag == 600) {
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
	public ModelAndView itemInsertDo(ModelAndView mav, MultipartFile uploadFile, MultipartHttpServletRequest mtrequest,
			HttpServletRequest request, AdminItemVO vo) {

		// 상품상세설명
		System.out.println(request.getParameter("item_explain"));
		String b = request.getParameter("item_explain");
		b = b.replace("\r\n", "<br>");
		String item_explain = "<li data-v-32a18372=\"\" class=\"menu-detail__describe\"><label data-v-32a18372=\"\" class=\"menu__label\">상품설명</label> <p data-v-32a18372=\"\" class=\"menu__admin-describe\">"
				+ b + "</p> <p data-v-32a18372=\"\" class=\"menu__additional-info\"><!----> <!----></p></li>";
		vo.setItem_explain(item_explain);
		System.out.println(item_explain);

		// 초코베리머치
		System.out.println("초코베리머치 radio버튼 : " + request.getParameter("choco"));
		String c = request.getParameter("choco");
		int choco = Integer.parseInt(c);
		vo.setItem_tag_event(choco);

		// 아이템 이름
		String item_name = request.getParameter("item_name");
		
		String ee = request.getParameter("itemPriceLSub");
		
		if(!ee.equals("")) {
			int item_price_l_sub = Integer.parseInt(ee);
			vo.setItem_price_l_sub(item_price_l_sub);
		}
		
		String ff = request.getParameter("itemPriceL");
		
		if(!ff.equals("")) {
			int item_price_l = Integer.parseInt(ff);
			vo.setItem_price_l_sub(item_price_l);
		}

		// 영양정보고시
		String[] item_nut_temp = request.getParameterValues("itme_nutrition");
		ArrayList<String> item_nut = new ArrayList<>();
		for (String temp : item_nut_temp) {
			item_nut.add(temp);
		}
		
		System.out.println("영양정보고시 string배열을 arrayList로 바꾼 값 : " + item_nut);
		String item_nut_final = "<article data-v-32a18372=\"\" class=\"nutrition-info-content-item\"><div data-v-32a18372=\"\" class=\"content-item-title\">"
				+ item_name
				+ "</div> <div data-v-32a18372=\"\" class=\"content-item-text-wrap\"><div data-v-32a18372=\"\" class=\"content-item-text\"><!----></div><div data-v-32a18372=\"\" class=\"content-item-text\"><div data-v-32a18372=\"\" class=\"content-item-text-left\">영양정보</div> <div data-v-32a18372=\"\" class=\"content-item-text-right\">"
				+ item_nut.get(0)
				+ "</div></div><div data-v-32a18372=\"\" class=\"content-item-text\"><div data-v-32a18372=\"\" class=\"content-item-text-left\">총 내용량 당</div> <div data-v-32a18372=\"\" class=\"content-item-text-right\">"
				+ item_nut.get(1)
				+ "</div></div><div data-v-32a18372=\"\" class=\"content-item-text\"><div data-v-32a18372=\"\" class=\"content-item-text-left\">나트륨</div> <div data-v-32a18372=\"\" class=\"content-item-text-right\">"
				+ item_nut.get(2)
				+ "</div></div><div data-v-32a18372=\"\" class=\"content-item-text\"><div data-v-32a18372=\"\" class=\"content-item-text-left\">탄수화물</div> <div data-v-32a18372=\"\" class=\"content-item-text-right\">"
				+ item_nut.get(3)
				+ "</div></div><div data-v-32a18372=\"\" class=\"content-item-text\"><div data-v-32a18372=\"\" class=\"content-item-text-left\">당류</div> <div data-v-32a18372=\"\" class=\"content-item-text-right\">"
				+ item_nut.get(4)
				+ "</div></div><div data-v-32a18372=\"\" class=\"content-item-text\"><div data-v-32a18372=\"\" class=\"content-item-text-left\">지방</div> <div data-v-32a18372=\"\" class=\"content-item-text-right\">"
				+ item_nut.get(5)
				+ "</div></div><div data-v-32a18372=\"\" class=\"content-item-text\"><div data-v-32a18372=\"\" class=\"content-item-text-left\">트랜스지방</div> <div data-v-32a18372=\"\" class=\"content-item-text-right\">"
				+ item_nut.get(6)
				+ "</div></div><div data-v-32a18372=\"\" class=\"content-item-text\"><div data-v-32a18372=\"\" class=\"content-item-text-left\">포화지방</div> <div data-v-32a18372=\"\" class=\"content-item-text-right\">"
				+ item_nut.get(7)
				+ "</div></div><div data-v-32a18372=\"\" class=\"content-item-text\"><div data-v-32a18372=\"\" class=\"content-item-text-left\">콜레스테롤</div> <div data-v-32a18372=\"\" class=\"content-item-text-right\">"
				+ item_nut.get(8)
				+ "</div></div><div data-v-32a18372=\"\" class=\"content-item-text\"><div data-v-32a18372=\"\" class=\"content-item-text-left\">단백질</div> <div data-v-32a18372=\"\" class=\"content-item-text-right\">"
				+ item_nut.get(9)
				+ "</div></div><div data-v-32a18372=\"\" class=\"content-item-text\"><div data-v-32a18372=\"\" class=\"content-item-etc\">\n"
				+ "1일 영양성분 기준치에 대한 비율(%)은 2,000kcal 기준이므로 개인의 필요 열량에 따라 다를 수 있습니다.\n"
				+ "</div></div></div> <div data-v-32a18372=\"\" class=\"content-item-divider\"></div></article>";
		
		System.out.println(item_nut_final);
		vo.setItem_nut(item_nut_final);

//		메인이미지 업로드
		try {
			String key = "menu/" + uploadFile.getOriginalFilename();
			InputStream is = uploadFile.getInputStream();
			String contentType = uploadFile.getContentType();
			long contentLength = uploadFile.getSize();
			awsS3.upload(is, key, contentType, contentLength);

			vo.setItem_image(url + key);
		} catch (IOException e) {
			System.out.println("메인이미지 업로드 실패");
		}

//		상세정보 이미지 멀티플 업로드 
		List<MultipartFile> fileList = mtrequest.getFiles("infoImages");
		List<String> infoImages = new ArrayList<String>();
		for (MultipartFile mf : fileList) {
			try {
				String key = "menu/" + mf.getOriginalFilename();
				InputStream is = mf.getInputStream();
				String contentType = mf.getContentType();
				long contentLength = mf.getSize();
				awsS3.upload(is, key, contentType, contentLength);

				System.out.println(url + key);

				infoImages.add(url + key);
				System.out.println("서브이미지" + mf.getOriginalFilename());

			} catch (IOException e) {
				System.out.println("파일업로드 실패!!");
			}
		}

		String result = String.join(":;:", infoImages);
		System.out.println(result);
		vo.setItem_info_image(result);

		// 드디어 디비 삽입!!!
		adminItemService.itemInsert(vo);

		// 상품정보고시 시작
		AdminItemInfoVO info = new AdminItemInfoVO();
		int info_code = vo.getItem_code();
		info.setItem_code(info_code);

		System.out.println("info 넘버 : " + info.getItem_code());
		System.out.println("item 넘버 : " + vo.getItem_code());
		// 상품정보고시 화면에서 값 가져오기
		String[] item_info_temp = request.getParameterValues("item_info");
		ArrayList<String> item_info = new ArrayList<>();
		for (String temp : item_info_temp) {
			item_info.add(temp);
		}
		System.out.println(item_info);

		String item_ingredient = request.getParameter("item_ingredient");
		System.out.println("원재료 및 함량 : " + item_ingredient);
		String item_warning = request.getParameter("item_warning");
		System.out.println("주의사항 : " + item_warning);

		String item_info_final = "<article data-v-32a18372=\"\" class=\"menu-info-content-item\"><div data-v-32a18372=\"\" class=\"content-item-title\">"
				+ item_name
				+ "</div> <div data-v-32a18372=\"\" class=\"content-item-text-wrap\"><div data-v-32a18372=\"\" class=\"content-item-text\"><!----></div><div data-v-32a18372=\"\" class=\"content-item-text\"><div data-v-32a18372=\"\" class=\"content-item-text-left\">내용량</div> <div data-v-32a18372=\"\" class=\"content-item-text-right\">"
				+ item_info.get(0)
				+ "</div></div><div data-v-32a18372=\"\" class=\"content-item-text\"><div data-v-32a18372=\"\" class=\"content-item-text-left\">식품의 유형</div> <div data-v-32a18372=\"\" class=\"content-item-text-right\">"
				+ item_info.get(1)
				+ "</div></div><div data-v-32a18372=\"\" class=\"content-item-text\"><div data-v-32a18372=\"\" class=\"content-item-text-left\">원재료 및 함량</div> <div data-v-32a18372=\"\" class=\"content-item-text-right\">"
				+ item_ingredient
				+ "</div></div><div data-v-32a18372=\"\" class=\"content-item-text\"><div data-v-32a18372=\"\" class=\"content-item-text-left\">영양정보</div> <div data-v-32a18372=\"\" class=\"content-item-text-right\">"
				+ item_info.get(2)
				+ "</div></div><div data-v-32a18372=\"\" class=\"content-item-text\"><div data-v-32a18372=\"\" class=\"content-item-text-left\">알레르기 물질 함유</div> <div data-v-32a18372=\"\" class=\"content-item-text-right\">"
				+ item_info.get(3)
				+ "</div></div><div data-v-32a18372=\"\" class=\"content-item-text\"><div data-v-32a18372=\"\" class=\"content-item-text-left\">유통기한</div> <div data-v-32a18372=\"\" class=\"content-item-text-right\">"
				+ item_info.get(4)
				+ "</div></div><div data-v-32a18372=\"\" class=\"content-item-text\"><div data-v-32a18372=\"\" class=\"content-item-text-left\">포장재질</div> <div data-v-32a18372=\"\" class=\"content-item-text-right\">"
				+ item_info.get(5)
				+ "</div></div><div data-v-32a18372=\"\" class=\"content-item-text\"><div data-v-32a18372=\"\" class=\"content-item-text-left\">업소명 및 소재지</div> <div data-v-32a18372=\"\" class=\"content-item-text-right\">"
				+ item_info.get(6)
				+ "</div></div><div data-v-32a18372=\"\" class=\"content-item-text\"><div data-v-32a18372=\"\" class=\"content-item-text-left\">보관방법</div> <div data-v-32a18372=\"\" class=\"content-item-text-right\">"
				+ item_info.get(7)
				+ "</div></div><div data-v-32a18372=\"\" class=\"content-item-text\"><div data-v-32a18372=\"\" class=\"content-item-text-left\">소비자 상담실</div> <div data-v-32a18372=\"\" class=\"content-item-text-right\">"
				+ item_info.get(8)
				+ "</div></div><div data-v-32a18372=\"\" class=\"content-item-text\"><div data-v-32a18372=\"\" class=\"content-item-text-left\">반품 및 교환장소</div> <div data-v-32a18372=\"\" class=\"content-item-text-right\">"
				+ item_info.get(9)
				+ "</div></div><div data-v-32a18372=\"\" class=\"content-item-text\"><div data-v-32a18372=\"\" class=\"content-item-text-left\">주의사항</div> <div data-v-32a18372=\"\" class=\"content-item-text-right\">"
				+ item_warning
				+ "</div></div></div> <div data-v-32a18372=\"\" class=\"content-item-divider\"></div></article>";

		info.setItem_info(item_info_final);

		// 상품정보고시 디비인서트
		adminItemService.itemInfoInsert(info);
		
		// 다시 아이템 목록 보여주기..!!
		AdminItemVO ivo = new AdminItemVO();
		List<AdminItemVO> adminItemList = adminItemService.getAdminItemList(ivo);
		System.out.println(adminItemList.get(0).getItem_name());
		mav.addObject("itemList", adminItemList);

		AdminSubVO svo = new AdminSubVO();
		List<AdminSubVO> adminSubList = adminItemService.getAdminSubList(svo);
		System.out.println(adminSubList.get(0).getSubscribe_name());
		mav.addObject("subList", adminSubList);

		mav.setViewName("redirect:adminItemList.mdo");
		return mav;
	}
}
