package project.spring.web.admin_md_info;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
		System.out.println(mdList);
		List<Integer> itemCode = new ArrayList<Integer>();
		for(int i = 0; i < mdList.size(); i++) {
			itemCode.add(mdList.get(i).getItem_code());
		}
		DetailVO dvo = new DetailVO();
		DetailVO item = detailService.getItem(dvo);
		mav.addObject("mdList", mdList);
		mav.setViewName("mdManagement");
		return mav;
	}
}
