package project.spring.web.event.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.spring.web.event.CouponVO;

@Repository
public class EventDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<CouponVO> getCoupon(CouponVO vo) {
		return sqlSessionTemplate.selectList("EventDAO.getCoupon", vo);
	}
	
	public void insertCoupon(CouponVO vo) {
		sqlSessionTemplate.insert("EventDAO.insertCoupon", vo);
	}
}
