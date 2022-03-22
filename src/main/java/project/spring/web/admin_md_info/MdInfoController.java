package project.spring.web.admin_md_info;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.detail.DetailService;
import project.spring.web.detail.DetailVO;
import project.spring.web.md_recommand.MdRecommandService;
import project.spring.web.md_recommand.MdRecommandVO;

@Controller
public class MdInfoController {
	
	@Autowired
	MdRecommandService mdRecommandService;
	
	@Autowired
	DetailService detailService;
	
	@RequestMapping("/mdInfo.mdo")
	public ModelAndView mdInfoDo(ModelAndView mav, MdRecommandVO vo) {
		
		List<MdRecommandVO> mdList = mdRecommandService.getMd(vo);
		List<String> itemName = new ArrayList<String>();
		List<String> subName = new ArrayList<String>();
		int tag = 0;
		for(int i = 0; i < mdList.size(); i++) {
			tag = mdList.get(i).getItem_tag_main();
			System.out.println(tag);
			
			if(tag == 100 || tag == 600) {
				DetailVO dvo = new DetailVO();
				dvo.setItem_code(mdList.get(i).getItem_code());
				DetailVO item = detailService.getSubItem(dvo);
				//select * from subscribe WHERE subscribe_code = #{item_code}
				itemName.add(item.getItem_name());
			} else {
				DetailVO dvo = new DetailVO();
				dvo.setItem_code(mdList.get(i).getItem_code());
				DetailVO item = detailService.getItem(dvo);
				//SELECT * FROM item WHERE item_code = #{item_code}
				itemName.add(item.getItem_name());
			}
		}
		System.out.println(itemName);
		mav.addObject("itemName", itemName);
		mav.addObject("mdList", mdList);

		mav.setViewName("mdManagement");
		return mav;
	}
	
	@RequestMapping("/mdItemDelete.mdo")
	public ModelAndView mdItemDeleteDo(ModelAndView mav, HttpServletRequest request, MdRecommandVO vo) {
		String b = request.getParameter("itemCode");
		int itemCode = Integer.parseInt(b);
		System.out.println("삭제하려는 itemCode : " + itemCode);
		String a = request.getParameter("tag");
		int tag = Integer.parseInt(a);
		System.out.println("삭제하려는 놈의 태그넘 : " + tag);
		
		vo.setItem_code(itemCode);
		mdRecommandService.deleteMd(vo);
		mav.setViewName("mdManagement");
		return mav;
	}
	
	@RequestMapping(value="/mdInsert.mdo", method = RequestMethod.POST)
	public ModelAndView mdInsertDo(ModelAndView mav, HttpServletRequest request, MdRecommandVO vo) {
		String a = request.getParameter("tag");
		int tag = Integer.parseInt(a);
		
		String b = request.getParameter("itemCode");
		int itemCode = Integer.parseInt(b);
		System.out.println(itemCode);
		
//		String itemName = request.getParameter("itemName");

		vo.setItem_code(itemCode);
		vo.setItem_tag_main(tag);
		mdRecommandService.mdInsert(vo);

		System.out.println("태그 : " + tag + "아이템코드 : " + itemCode);
		mav.setViewName("mdManagement");
		return mav;
	}
	
	@RequestMapping(value="/tagMain.mdo", method = RequestMethod.POST)
	public ModelAndView ItemTagMain(ModelAndView mav, HttpServletRequest request) {
		String b = request.getParameter("tag");
		int tag = Integer.parseInt(b);
		System.out.println(tag);
		DetailVO dvo = new DetailVO();
		//단품상품일때!
		if(tag != 100 && tag != 600) {
			dvo.setItem_tag_main(tag);
			List<DetailVO> itemList = detailService.getTagItem(dvo);
			System.out.println(itemList.get(0).getItem_name());
			mav.addObject("itemCode", itemList);
			mav.setViewName("mdItemCodeModal");
		} else if(tag == 600) {
			DetailVO dvo2 = new DetailVO();
			dvo2.setItem_tag_main(tag);
			List<DetailVO> subList = detailService.getTagSubscribe(dvo2);
			System.out.println(subList.get(0).getItem_name());
			mav.addObject("itemCode", subList);
			mav.setViewName("mdItemCodeModal");
		} else if(tag == 100) {
			DetailVO dvo3 = new DetailVO();
			dvo3.setItem_tag_main(tag);
			List<DetailVO> subList = detailService.getTagSubscribe(dvo3);
			System.out.println(subList.get(0).getItem_name());
			mav.addObject("itemCode", subList);
			mav.setViewName("mdItemCodeModal");
		}
		return mav;
	}
}
