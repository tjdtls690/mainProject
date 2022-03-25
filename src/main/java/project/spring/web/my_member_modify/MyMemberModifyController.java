package project.spring.web.my_member_modify;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.member.MemberVO;

@Controller
public class MyMemberModifyController {
	
	
	@RequestMapping("/myMemberModify.do")
	public ModelAndView myMemberModifyDo(ModelAndView mav, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		
		LocalDate localDate = vo.getBirthday();//For reference
		if(localDate != null) {
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			String formattedString = localDate.format(formatter);
			mav.addObject("birthday", formattedString);
		}
		mav.setViewName("myMemberModify");
		return mav;
	}
}
