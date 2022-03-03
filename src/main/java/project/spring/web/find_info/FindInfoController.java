package project.spring.web.find_info;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.member.MemberService;
import project.spring.web.member.MemberVO;

@Controller
public class FindInfoController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping("/findId.do")
	public ModelAndView findIdDo(ModelAndView mav) {
		mav.setViewName("find_id");
		return mav;
	}
	
	@RequestMapping(value = "/requestInfoBefore.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String requestInfoBeforeDo(MemberVO vo) {
		int check = memberService.findEmail(vo);
		if(check == 1) {
			MemberVO vo1 = memberService.phoneNameGetMember(vo);
			if(vo1.getMemberType().equals("k")) {
				return "1";
			}else if(vo1.getMemberType().equals("g")) {
				return "2";
			}else {
				return "3";
			}
		}else {
			return "0";
		}
	}
	
	@RequestMapping("/requestInfo.do")
	public ModelAndView requestInfoDo(ModelAndView mav) {
		mav.setViewName("findError");
		return mav;
	}
}
