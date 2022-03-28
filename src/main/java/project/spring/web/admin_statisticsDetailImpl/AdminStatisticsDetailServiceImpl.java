package project.spring.web.admin_statisticsDetailImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.spring.web.admin_statisticsDetail.AdminStatisticsDetailService;
import project.spring.web.admin_statisticsDetail.AdminStatisticsDetailVO;

@Service
public class AdminStatisticsDetailServiceImpl implements AdminStatisticsDetailService {

	@Autowired
	AdminStatisticsDetailDAO adminStatisticsDetailDAO;
	
	@Override
	public List<AdminStatisticsDetailVO> getItemReportDetail(AdminStatisticsDetailVO vo) {
		// TODO Auto-generated method stub
		return adminStatisticsDetailDAO.getItemReportDetail(vo);
	}

	@Override
	public List<AdminStatisticsDetailVO> getSetReportDetail(AdminStatisticsDetailVO vo) {
		// TODO Auto-generated method stub
		return adminStatisticsDetailDAO.getSetReportDetail(vo);
	}

	@Override
	public List<AdminStatisticsDetailVO> getHowManyDetault(AdminStatisticsDetailVO vo) {
		// TODO Auto-generated method stub
		return adminStatisticsDetailDAO.getHowManyDetault(vo);
	}

	@Override
	public List<AdminStatisticsDetailVO> getTagMainRank(AdminStatisticsDetailVO vo) {
		// TODO Auto-generated method stub
		return adminStatisticsDetailDAO.getTagMainRank(vo);
	}
	
	@Override
	public List<AdminStatisticsDetailVO> getTagMainRank2(AdminStatisticsDetailVO vo) {
		// TODO Auto-generated method stub
		return adminStatisticsDetailDAO.getTagMainRank2(vo);
	}

	@Override
	public List<AdminStatisticsDetailVO> getSummary(AdminStatisticsDetailVO vo) {
		// TODO Auto-generated method stub
		return adminStatisticsDetailDAO.getSummary(vo);
	}
}
