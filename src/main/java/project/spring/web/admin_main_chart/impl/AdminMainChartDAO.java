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
	
	//처음 메인 왔을때 차트
	public 	List<AdminMainChartVO> dayChart(){
		System.out.println("-->mybatis. dayChart");
		return sqlSessionTemplate.selectList("adminMainChartDAO.dayChart");
	}
	
	// 다음 버튼 수행시 차트
	public List<AdminMainChartVO> getDayChart(AdminMainChartVO vo) {
		System.out.println("-->mybatis. getDayChart");
		return sqlSessionTemplate.selectList("adminMainChartDAO.getDayChart", vo);
	}
	
	// 이전 버튼 수행시 차트
	public List<AdminMainChartVO> getDayChart2(AdminMainChartVO vo) {
		System.out.println("-->mybatis. getDayChart2");
		return sqlSessionTemplate.selectList("adminMainChartDAO.getDayChart2", vo);
	}
	
	// 바 차트
	public List<AdminMainChartVO> getMonthChart(AdminMainChartVO vo) {
		System.out.println("-->mybatis. getMonthChart");
		return sqlSessionTemplate.selectList("adminMainChartDAO.getMonthChart", vo);
	}
	
	public List<AdminMainChartVO> getMonthChart2(AdminMainChartVO vo) {
		System.out.println("-->mybatis. getMonthChart2");
		return sqlSessionTemplate.selectList("adminMainChartDAO.getMonthChart2", vo);
	}


}
