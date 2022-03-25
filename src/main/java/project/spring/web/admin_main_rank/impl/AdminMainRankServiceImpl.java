package project.spring.web.admin_main_rank.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.spring.web.admin_main_rank.AdminMainRankService;
import project.spring.web.admin_main_rank.AdminMainRankVO;

@Service
public class AdminMainRankServiceImpl implements AdminMainRankService {
	
	@Autowired
	AdminMainRankDAO adminMainRankDAO;
	@Override
	public List<AdminMainRankVO> saleRank10() {
		// TODO Auto-generated method stub
		return adminMainRankDAO.saleRank10();
	}

	@Override
	public List<AdminMainRankVO> countRank10() {
		// TODO Auto-generated method stub
		return adminMainRankDAO.countRank10();
	}

}
