package project.spring.web.admin_main_chart.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.spring.web.admin_main_chart.AdminMainChartVO;

@Repository
public class AdminMainChartDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
//	public 	List<Map<String, Object>> dayChart(){
//		System.out.println("-->mybatis. dayChart");
//		return sqlSessionTemplate.selectList("adminMainChartDAO.dayChart");
//	}
	
	public 	List<AdminMainChartVO> dayChart(){
		System.out.println("-->mybatis. dayChart");
		return sqlSessionTemplate.selectList("adminMainChartDAO.dayChart");
	}


}
