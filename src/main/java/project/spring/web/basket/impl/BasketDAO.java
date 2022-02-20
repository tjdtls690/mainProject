package project.spring.web.basket.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.spring.web.basket.BasketVO;

@Repository
public class BasketDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<BasketVO> getBasketList(BasketVO vo) {
		System.out.println("::: MyBatis getBasketList() 기능 :::");
		return sqlSessionTemplate.selectList("BasketDAO.getBasketList", vo);
	}
}

