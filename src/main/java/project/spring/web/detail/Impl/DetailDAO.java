package project.spring.web.detail.Impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.spring.web.detail.DetailVO;

@Repository
public class DetailDAO {
	
	@Autowired 
	private SqlSessionTemplate sqlSessionTemplate;
	
	public DetailVO getItem(DetailVO vo) {
		System.out.println("-->myBatis getItem");
		return sqlSessionTemplate.selectOne("DetailDAO.getItem",vo);
	}
	
	public DetailVO getInfo(DetailVO vo) {
		System.out.println("-->myBatis getInfo");
		return sqlSessionTemplate.selectOne("DetailDAO.getInfo", vo);
	}


}
