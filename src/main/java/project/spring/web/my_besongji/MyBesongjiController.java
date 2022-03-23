package project.spring.web.my_besongji;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.member.MemberVO;
import project.spring.web.member_zipcode.MemberZipcodeService;
import project.spring.web.member_zipcode.MemberZipcodeVO;

@Controller
public class MyBesongjiController {
	
	@Autowired
	MemberZipcodeService memberZipcodeService;
	
	
	@RequestMapping("/myBesongji.do")
	public ModelAndView myBesongjiDo(ModelAndView mav, HttpServletRequest request, MemberZipcodeVO vo) {
		HttpSession session = request.getSession();
		MemberVO tmp = (MemberVO)session.getAttribute("member");
		vo.setMember_code(tmp.getMemberCode());
		vo.setMember_delivery_type(0);
		
		List<MemberZipcodeVO> list = memberZipcodeService.getZipcodeAll(vo);
		System.out.println("???? : " + list.size());
		
		mav.addObject("list", list);
		mav.setViewName("myBesongji");
		return mav;
	}
	
	@RequestMapping("/myBesongjiModal.do")
	public ModelAndView myBesongjiModalDo(ModelAndView mav, HttpServletRequest request, MemberZipcodeVO vo) {
		HttpSession session = request.getSession();
		MemberVO tmp = (MemberVO)session.getAttribute("member");
		vo.setMember_code(tmp.getMemberCode());
		
		List<MemberZipcodeVO> list = memberZipcodeService.getZipcodeAll(vo);
		mav.addObject("list", list);
		mav.setViewName("myBesongjiModal");
		return mav;
	}
}
