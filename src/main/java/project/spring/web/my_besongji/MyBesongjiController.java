package project.spring.web.my_besongji;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@RequestMapping(value = "/myBesongjiDefaultZipCheck.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String myBesongjiDefaultZipCheckDo(ModelAndView mav, MemberZipcodeVO vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO vo1 = (MemberVO)session.getAttribute("member");
		vo.setMember_code(vo1.getMemberCode());
		List<MemberZipcodeVO> list1 = memberZipcodeService.getZipcodeAll(vo);
		
		for(int i = 0; i < list1.size(); i++) {
			if(list1.get(i).getMember_default_address().equals("y")) {
				list1.get(i).setMember_default_address("n");
				memberZipcodeService.updateZipcodeDefaultAddress(list1.get(i));
			}
		}
		
		vo.setMember_default_address("y");
		memberZipcodeService.updateZipcodeDefaultAddress(vo);
		return null;
	}
	
	@RequestMapping("/myBesongjiModalDetail.do")
	public ModelAndView myBesongjiModalDetailDo(ModelAndView mav, HttpServletRequest request, MemberZipcodeVO vo) {
		HttpSession session = request.getSession();
		MemberVO tmp = (MemberVO)session.getAttribute("member");
		vo.setMember_code(tmp.getMemberCode());
		
		List<MemberZipcodeVO> list = memberZipcodeService.getZipcodeAll(vo);
		mav.addObject("list", list);
		mav.setViewName("myBesongjiModalDetail");
		return mav;
	}
	
	@RequestMapping("/myBesongjiKakaoAddressContainer.do")
	public ModelAndView myBesongjiKakaoAddressContainerDo(ModelAndView mav) {
		mav.setViewName("myBesongjiKakaoAddressContainer");
		return mav;
	}
}
