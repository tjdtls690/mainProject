package project.spring.web.admin_review;

import java.util.ArrayList;
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
	
	@RequestMapping("/reviewListAdmin.mdo")
	public ModelAndView ReviewList2(ModelAndView mav) {
		AdminReviewVO vo = new AdminReviewVO();
		vo.setReply("n");
		List<AdminReviewVO> itemReviewList = adminReviewService.getAdminItemList(vo);
		mav.addObject("itemReviewList",itemReviewList);
		
		AdminReviewVO vo1 = new AdminReviewVO();
		vo1.setReply("n");
		List<AdminReviewVO> subReviewList = adminReviewService.getAdminSubList(vo1);
		mav.addObject("subReviewList",subReviewList);
		
		mav.setViewName("reviewListAdmin");
		return mav;
	}
	
	@RequestMapping("/reviewManagementAdmin.mdo")
	public ModelAndView ReviewManagement(ModelAndView mav) {
		AdminReviewVO vo = new AdminReviewVO();
		vo.setReply("y");
		List<AdminReviewVO> itemReviewList = adminReviewService.getAdminItemList(vo);
		mav.addObject("itemReviewList",itemReviewList);
		
		AdminReviewVO vo1 = new AdminReviewVO();
		vo1.setReply("y");
		List<AdminReviewVO> subReviewList = adminReviewService.getAdminSubList(vo1);
		mav.addObject("subReviewList",subReviewList);
		
		ReviewReplyVO rvo2 = new ReviewReplyVO();
		List<ReviewReplyVO> itemReplyList = new ArrayList<ReviewReplyVO>();
		for(int i = 0; i < itemReviewList.size(); i++) {
			rvo2.setSeq(itemReviewList.get(i).getSeq());
			ReviewReplyVO getReply = adminReviewService.getReviewReply(rvo2);
			itemReplyList.add(getReply);
		}
		
		ReviewReplyVO rvo3 = new ReviewReplyVO();
		List<ReviewReplyVO> subReplyList = new ArrayList<ReviewReplyVO>();
		for(int i = 0; i < subReviewList.size(); i++) {
			rvo3.setSeq(subReviewList.get(i).getSeq());
			ReviewReplyVO getReply = adminReviewService.getReviewReply(rvo3);
			subReplyList.add(getReply);
		}
		
		mav.addObject("itemReplyList", itemReplyList);
		mav.addObject("subReplyList",subReplyList);
		mav.setViewName("reviewManagementAdmin");
		return mav;
	}
	
	@RequestMapping("/replyInsertSuccess.mdo")
	public ModelAndView ReplySuccess(ModelAndView mav, HttpServletRequest request) {
		String a = request.getParameter("seq");
		int seq = Integer.parseInt(a);
		String reply = request.getParameter("reply_content");
		System.out.println("seq : " + seq + "reply : " + reply);
		
		ReviewReplyVO rvo = new ReviewReplyVO();
		rvo.setSeq(seq);
		rvo.setReplycontents(reply);
		adminReviewService.reviewReplyInsert(rvo);
		
		AdminReviewVO avo = new AdminReviewVO();
		avo.setSeq(seq);
		adminReviewService.reviewUpdate(avo);
		
		mav.setViewName("reviewManagementAdmin");
		return mav;
	}
}