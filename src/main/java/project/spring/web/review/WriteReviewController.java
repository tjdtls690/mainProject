package project.spring.web.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WriteReviewController {
	
	@Autowired
	private WriteReviewService writeReviewService;
	
	@RequestMapping("/insertReview.do")
	public ModelAndView insertReview(ModelAndView mav, WriteReviewVO vo) {
		writeReviewService.insertReview(vo);
		mav.setViewName("myReview");
		return mav;
	}
}
