package project.spring.web.admin_main_rank.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.spring.web.admin_main_rank.AdminMainRankVO;

@Repository
public class AdminMainRankDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<AdminMainRankVO> saleRank10(){
		System.out.println("--> mybatis saleRank10");
		return sqlSessionTemplate.selectList("adminMainRankDAO.saleRank10");
	}
	
	public List<AdminMainRankVO> countRank10(){
		System.out.println("--> mybatis countRank10");
		return sqlSessionTemplate.selectList("adminMainRankDAO.countRank10");
	}
}
