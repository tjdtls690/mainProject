package project.spring.web.tapPage;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.detail.DetailService;
import project.spring.web.detail.DetailVO;
import project.spring.web.member.MemberVO;
import project.spring.web.tag.TagService;
import project.spring.web.tag.TagVO;

@Controller
public class TapPageController {
	
	@Autowired
	TapPageService tapPageService;
	@Autowired
	TagService tagService;
	@Autowired
	private DetailService detailService;
	
	@RequestMapping(value = "/tapPage.do", method = RequestMethod.POST)
	public ModelAndView tapPageDo(HttpServletRequest request, TapPageVO vo, TagVO vo1, ModelAndView mav) {
		String tmp = request.getParameter("tagMain01");
		int tagMain = Integer.parseInt(tmp);

		if(tagMain != 0) {
			vo.setTagMain(tagMain);
			List<TapPageVO> itemInfo = tapPageService.getItemInfo(vo);
			vo1.setTagMain(tagMain);
			List<TagVO> tagInfo = tagService.getTagInfo(vo1);
			itemInfo.get(0).setTagMain(tagMain);
			mav.addObject("tagMain", tagMain);
			mav.addObject("itemInfo", itemInfo);
			mav.addObject("tagInfo", tagInfo);
		}else {
			List<List<TapPageVO>> itemInfo = new ArrayList<List<TapPageVO>>();
			List<List<TagVO>> tagInfo = new ArrayList<List<TagVO>>();
			for(int i = 100; i <= 800 ; i += 100) {
				vo.setTagMain(i);
				itemInfo.add(tapPageService.getItemInfo(vo));
				vo1.setTagMain(i);
				tagInfo.add(tagService.getTagInfo(vo1));
			}
			mav.addObject("tagMain", tagMain);
			mav.addObject("itemInfo", itemInfo);
			mav.addObject("tagInfo", tagInfo);
		}
		
		
		mav.setViewName("tapPage");
		return mav;
	}
	
	@RequestMapping("/dropDownAllMenu.do")
	public ModelAndView dropDownAllMenuDo(ModelAndView mav) {
		mav.setViewName("dropDownAllMenu");
		return mav;
	}
	
	@RequestMapping("/cartModal.do")
	public ModelAndView cartModal(HttpServletRequest request, ModelAndView mav) {
		String str = request.getParameter("code");
		int code = Integer.parseInt(str);
		String str2 = request.getParameter("tagMain");
		int tagMain = Integer.parseInt(str2);
		//  여기서 단품인지 세트인지 구분해서 보내자.
		DetailVO vo = new DetailVO();
		
		if(tagMain == 600) {
			vo.setItem_code(code);
			mav.addObject("item", detailService.getSubItem(vo));
			mav.addObject("tagMain",tagMain);	
		}else {
		vo.setItem_code(code);
		System.out.println("세팅된 아이템 코드 : "+ vo.getItem_code());
		mav.addObject("item", detailService.getItem(vo));
		mav.addObject("tagMain", tagMain);
		}
		mav.setViewName("cartModal");
		return mav;
	}
	
	@RequestMapping(value = "/detaillLginCheck.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String detaillLginCheckDo(ModelAndView mav, HttpServletRequest request) {
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("member"));
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		if(memberVO == null) {
			return "0";
		}else {
			return "1";
		}
	}
}
