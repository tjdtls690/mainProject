package project.spring.web.basket;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BasketController {
	
	@Autowired
	private BasketService basketService;
	
	@RequestMapping("/basket.do")
	public ModelAndView basketDo(ModelAndView mav) {
		BasketVO vo = new BasketVO();
		List<BasketVO> BasketList = basketService.getBasketList(vo);
		mav.addObject("Basket", BasketList);
		mav.setViewName("basket");
		return mav;
	}	
	
	@RequestMapping("/deskMinus.do")
	@ResponseBody
	public ModelAndView deskMinus(HttpServletRequest request, ModelAndView mav) {
		String temp = request.getParameter("amt");
		int amt = Integer.parseInt(temp)- 1;
		System.out.println("amt의 값 :" + amt);
		
		String str = request.getParameter("price");
		int price = Integer.parseInt(str);
		int subtotal = amt * price;
		
		String str2 = request.getParameter("itemCode");
		int itemCode = Integer.parseInt(str2);
		System.out.println("itemCode : " + itemCode);
		
		// userCode 등록 후 세션에서 유저코드 뽑아오는 방법
//		HttpSession session = request.getSession();
//		String name = (String)session.getAttribute("userCode");
//		int userCode = Integer.parseInt(name);
		
		BasketVO vo = new BasketVO();
		vo.setAmount(amt);
		vo.setItemCode(itemCode);
		vo.setSubTotal(subtotal);
		basketService.getBasketChangeList(vo);
		
		List<BasketVO> basketChangeList = basketService.getBasketList(vo);
		System.out.println(basketChangeList.get(0).getItemName());
		
		mav.addObject("Basket",basketChangeList);
		mav.setViewName("basketDesk");
		return mav;
	}
	
	@RequestMapping("/deskPlus.do")
	@ResponseBody
	public ModelAndView deskPlus(HttpServletRequest request, ModelAndView mav) {
		String temp = request.getParameter("amt");
		int amt = Integer.parseInt(temp) + 1;
		System.out.println("amt의 값 :" + amt);
		
		String str = request.getParameter("price");
		int price = Integer.parseInt(str);
		int subtotal = amt * price;
		
		String str2 = request.getParameter("itemCode");
		int itemCode = Integer.parseInt(str2);
		System.out.println("itemCode : " + itemCode);
		
		// userCode 등록 후 세션에서 유저코드 뽑아오는 방법
//		HttpSession session = request.getSession();
//		String name = (String)session.getAttribute("userCode");
//		int userCode = Integer.parseInt(name);
		
		BasketVO vo = new BasketVO();
		vo.setAmount(amt);
		vo.setItemCode(itemCode);
		vo.setSubTotal(subtotal);
		basketService.getBasketChangeList(vo);
		
		List<BasketVO> basketChangeList = basketService.getBasketList(vo);
		
		mav.addObject("Basket",basketChangeList);
		mav.setViewName("basketDesk");
		return mav;
	}
	
	@RequestMapping("/mobileMinus.do")
	@ResponseBody
	public ModelAndView mobileMinus(HttpServletRequest request, ModelAndView mav) {
		String temp = request.getParameter("amt");
		int amt = Integer.parseInt(temp)- 1;
		System.out.println("amt의 값 :" + amt);
		
		String str = request.getParameter("price");
		int price = Integer.parseInt(str);
		int subtotal = amt * price;
		
		String str2 = request.getParameter("itemCode");
		int itemCode = Integer.parseInt(str2);
		System.out.println("itemCode : " + itemCode);
		
		// userCode 등록 후 세션에서 유저코드 뽑아오는 방법
//		HttpSession session = request.getSession();
//		String name = (String)session.getAttribute("userCode");
//		int userCode = Integer.parseInt(name);
		
		BasketVO vo = new BasketVO();
		vo.setAmount(amt);
		vo.setItemCode(itemCode);
		vo.setSubTotal(subtotal);
		basketService.getBasketChangeList(vo);
		
		List<BasketVO> basketChangeList = basketService.getBasketList(vo);
		System.out.println(basketChangeList.get(0).getItemName());
		
		mav.addObject("Basket",basketChangeList);
		mav.setViewName("basketMobile");
		return mav;
	}
	
	@RequestMapping("/mobilePlus.do")
	@ResponseBody
	public ModelAndView mobilePlus(HttpServletRequest request, ModelAndView mav) {
		String temp = request.getParameter("amt");
		int amt = Integer.parseInt(temp) + 1;
		System.out.println("amt의 값 :" + amt);
		
		String str = request.getParameter("price");
		int price = Integer.parseInt(str);
		int subtotal = amt * price;
		
		String str2 = request.getParameter("itemCode");
		int itemCode = Integer.parseInt(str2);
		System.out.println("itemCode : " + itemCode);
		
		// userCode 등록 후 세션에서 유저코드 뽑아오는 방법
//		HttpSession session = request.getSession();
//		String name = (String)session.getAttribute("userCode");
//		int userCode = Integer.parseInt(name);
		
		BasketVO vo = new BasketVO();
		vo.setAmount(amt);
		vo.setItemCode(itemCode);
		vo.setSubTotal(subtotal);
		basketService.getBasketChangeList(vo);
		
		List<BasketVO> basketChangeList = basketService.getBasketList(vo);
		System.out.println(basketChangeList.get(0).getItemName());
		
		mav.addObject("Basket",basketChangeList);
		mav.setViewName("basketMobile");
		return mav;
	}

	@RequestMapping("/basketSelectDelete.do")
	public ModelAndView basketSelectDelete(ModelAndView mav, String[] newDeleteItemCode) {

		// userCode 등록 후 세션에서 유저코드 뽑아오는 방법
//		HttpSession session = request.getSession();
//		String name = (String)session.getAttribute("userCode");
//		int userCode = Integer.parseInt(name);
		
		List<String> list1 = new ArrayList<>();
		
		for(int i=0; i < newDeleteItemCode.length; i++) {
			System.out.println(newDeleteItemCode[i]);
			BasketVO vo = new BasketVO();
			list1.add(newDeleteItemCode[i]);
			int f = Integer.parseInt(list1.get(i));
			vo.setItemCode(f);
			basketService.deleteBasketList(vo);
		}
		
		
		BasketVO vo2 = new BasketVO();
		List<BasketVO> BasketList = basketService.getBasketList(vo2);
		mav.addObject("Basket", BasketList);
		mav.setViewName("basket");
		return mav;
	}
	


}
