package project.spring.web.admin_review;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.admin_item.AdminItemService;

@Controller
public class AdminReviewController {
	
	@Autowired
	AdminReviewService adminReviewService;
	
	@Autowired
	AdminItemService adminItemService;
	
	@RequestMapping("/reviewList.mdo")
	public ModelAndView ReviewList(ModelAndView mav) {
		AdminReviewVO vo = new AdminReviewVO();
		vo.setReply("n");
		List<AdminReviewVO> itemReviewList = adminReviewService.getAdminItemList(vo);
		mav.addObject("itemReviewList",itemReviewList);
		
		AdminReviewVO vo1 = new AdminReviewVO();
		vo1.setReply("n");
		List<AdminReviewVO> subReviewList = adminReviewService.getAdminSubList(vo1);
		mav.addObject("subReviewList",subReviewList);
		
		mav.setViewName("reviewList");
		return mav;
	}
	
	@RequestMapping("/reviewManagement.mdo")
	public ModelAndView ReviewManagement(ModelAndView mav) {
		AdminReviewVO vo = new AdminReviewVO();
		vo.setReply("y");
		List<AdminReviewVO> itemReviewList = adminReviewService.getAdminItemList(vo);
		mav.addObject("itemReviewList",itemReviewList);
		
		AdminReviewVO vo1 = new AdminReviewVO();
		vo1.setReply("y");
		List<AdminReviewVO> subReviewList = adminReviewService.getAdminSubList(vo1);
		mav.addObject("subReviewList",subReviewList);
		mav.setViewName("reviewManagement");
		return mav;
	}
	
	@RequestMapping("/replyInsertSuccess.mdo")
	public ModelAndView ReplySuccess(ModelAndView mav, HttpServletRequest request) {
		String a = request.getParameter("seq");
		int seq = Integer.parseInt(a);
		String reply = request.getParameter("reply_content");
		System.out.println("seq : " + seq + "reply : " + reply);
		
		//review답글 테이블에 insert
		ReviewReplyVO rvo = new ReviewReplyVO();
		rvo.setSeq(seq);
		rvo.setReplycontents(reply);
		adminReviewService.reviewReplyInsert(rvo);
		
		//reviewboard테이블에 reply를 y로 바꾸기
		AdminReviewVO avo = new AdminReviewVO();
		avo.setSeq(seq);
		adminReviewService.reviewUpdate(avo);
		
		AdminReviewVO vo = new AdminReviewVO();
		vo.setReply("y");
		List<AdminReviewVO> itemReviewList = adminReviewService.getAdminItemList(vo);
		mav.addObject("itemReviewList",itemReviewList);
		
		AdminReviewVO vo1 = new AdminReviewVO();
		vo1.setReply("y");
		List<AdminReviewVO> subReviewList = adminReviewService.getAdminSubList(vo1);
		mav.addObject("subReviewList",subReviewList);
		
		mav.setViewName("reviewManagement");
		return mav;
	}
}
