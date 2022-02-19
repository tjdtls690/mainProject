package project.spring.web.detail.Impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.spring.web.detail.DetailVO;

@Repository
public class DetailDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public DetailVO getDetail(DetailVO vo) {
		System.out.println("-->myBatis getDetail");
		return sqlSessionTemplate.selectOne("DetailDAO.getDetail",vo);
		
	}
}
