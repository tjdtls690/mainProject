package project.spring.web.detail.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.spring.web.detail.DetailVO;

@Repository
public class DetailDAO {
	
	@Autowired 
	private SqlSessionTemplate sqlSessionTemplate;
	
	public DetailVO getItem(DetailVO vo) {
//		System.out.println("-->myBatis getItem");
		return sqlSessionTemplate.selectOne("DetailDAO.getItem",vo);
	}
	
	public DetailVO getInfo(DetailVO vo) {
//		System.out.println("-->myBatis getInfo");
		return sqlSessionTemplate.selectOne("DetailDAO.getInfo", vo);
	}
	
	public DetailVO getSubItem(DetailVO vo) {
//		System.out.println("--->myBatis getSubItem");
		return sqlSessionTemplate.selectOne("DetailDAO.getSubItem", vo);
	}
	
	public List<DetailVO> getSubAllItem() {
//		System.out.println("--->myBatis getSubItem");
		return sqlSessionTemplate.selectList("DetailDAO.getSubAllItem");
	}
	
	public List<DetailVO> getRandom(DetailVO vo){
//		System.out.println("--->MyBatis getRandom");
		return sqlSessionTemplate.selectList("DetailDAO.getRandom", vo);
	}

	public List<DetailVO> getTagItem(DetailVO vo) {
		return sqlSessionTemplate.selectList("DetailDAO.getTagItem", vo);
	}
	
	public List<DetailVO> getTagSubscribe(DetailVO vo) {
		return sqlSessionTemplate.selectList("DetailDAO.getTagSubscribe", vo);
	}
}
