package project.spring.web.my_member_modify_password_check;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.member.MemberService;
import project.spring.web.member.MemberVO;

@Controller
public class MyMemberModifyPasswordCheckController {
	
	@Autowired
	MemberService memberService;
	
	
	@RequestMapping("/myMemberModifyPasswordCheck.do")
	public ModelAndView myMemberModifyPasswordCheckDo(ModelAndView mav) {
		mav.setViewName("myMemberModifyPasswordCheck");
		return mav;
	}
	
	@RequestMapping(value = "/myMemberModifyPasswordCheckDetail.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String myMemberModifyPasswordCheckDetailDo(HttpServletRequest request, MemberVO vo) {
		HttpSession session = request.getSession();
		MemberVO vo1 = (MemberVO)session.getAttribute("member");
		vo.setEmail(vo1.getEmail());
		int check = memberService.passwordCheck(vo);
		if(check == 0) {
			return "0";
		}else {
			return "1";
		}
	}
}
