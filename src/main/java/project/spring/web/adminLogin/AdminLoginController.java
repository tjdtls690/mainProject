package project.spring.web.adminLogin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminLoginController {
	
	@Autowired
	AdminLoginService adminLoginService;
	
	@RequestMapping("/adminLogin.mdo")
	public ModelAndView adminLoginDo(ModelAndView mav) {
		mav.setViewName("login");
		return mav;
	}
	
	@RequestMapping(value = "/adminLoginCheck.mdo", produces = "application/text; charset=utf8")
	@ResponseBody
	public String adminLoginCheckDo(ModelAndView mav, HttpServletRequest request, AdminLoginVO vo) {
				
		List<AdminLoginVO> adminInfo = adminLoginService.getAdminInfo(vo);
		//SELECT * FROM admin_login where admin_id = #{admin_id} and admin_pwd = password(#{admin_pwd})
		System.out.println(adminInfo);
		
		if(adminInfo.size() == 1) {
			return "1";
		} else {
			return "0";
		}
	}
	
	@RequestMapping("adminLoginSuccess.mdo")
	public ModelAndView adminLoginSuccessDo(ModelAndView mav, HttpServletRequest request, AdminLoginVO vo) {
		HttpSession session = request.getSession();
		
		List<AdminLoginVO> avo = adminLoginService.getAdminInfo(vo);
		session.setAttribute("admin", avo.get(0));
		mav.setViewName("mainChart");
		return mav;
	}
}
