package project.spring.web.event;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EventController {
	
	@RequestMapping("event.do")
	public ModelAndView eventDo(ModelAndView mav) {
		mav.setViewName("event");
		return mav;
	}
	
	@RequestMapping("firstEvent.do")
	public ModelAndView firstEventDo(ModelAndView mav) {
		mav.setViewName("firstEvent");
		return mav;
	}
	
	@RequestMapping("secondEvent.do")
	public ModelAndView secondEventDo(ModelAndView mav) {
		mav.setViewName("secondEvent");
		return mav;
	}
}
