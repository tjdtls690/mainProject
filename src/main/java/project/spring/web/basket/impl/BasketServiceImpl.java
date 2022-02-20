package project.spring.web.basket.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.spring.web.basket.BasketService;
import project.spring.web.basket.BasketVO;

@Service("BasketService")
public class BasketServiceImpl implements BasketService {
	
	@Autowired
	private BasketDAO basketDAO;
	
	@Override
	public List<BasketVO> getBasketList(BasketVO vo) {
		System.out.println("::: basketServiceImpl() :::");
		return basketDAO.getBasketList(vo);
	}
}