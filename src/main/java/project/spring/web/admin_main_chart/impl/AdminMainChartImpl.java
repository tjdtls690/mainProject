package project.spring.web.admin_main_chart.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.spring.web.admin_main_chart.AdminMainChartService;
import project.spring.web.admin_main_chart.AdminMainChartVO;

@Service
public class AdminMainChartImpl implements AdminMainChartService {
	@Autowired
	AdminMainChartDAO adminChartDAO;

//	@Override
//	public List<Map<String, Object>> dayChart() {
//		return adminChartDAO.dayChart();
//	}

	//처음 메인 왔을때 차트
	@Override
	public List<AdminMainChartVO> dayChart(AdminMainChartVO vo) {
		
		return adminChartDAO.dayChart();
	}
	
	// 다음 버튼 수행시 차트
	@Override
	public List<AdminMainChartVO> getDayChart(AdminMainChartVO vo) {
		
		return adminChartDAO.getDayChart(vo);
	}
	
	// 이전 버튼 수행시 차트
	@Override
	public List<AdminMainChartVO> getDayChart2(AdminMainChartVO vo) {
		
		return adminChartDAO.getDayChart2(vo);
	}

}
