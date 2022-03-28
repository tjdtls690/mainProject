package project.spring.web.admin_review.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.spring.web.admin_review.AdminReviewService;
import project.spring.web.admin_review.AdminReviewVO;
import project.spring.web.admin_review.ReviewReplyVO;

@Service("AdminReviewService")
public class AdminReviewServiceImpl implements AdminReviewService {
	
	@Autowired
	AdminReviewDAO adminReviewDAO;
	
	@Override
	public List<AdminReviewVO> getAdminItemList(AdminReviewVO vo) {
		return adminReviewDAO.getAdminItemList(vo);
	}

	@Override
	public void reviewDelete(AdminReviewVO vo) {
		adminReviewDAO.reviewDelete(vo);
	}

	@Override
	public List<AdminReviewVO> getAdminSubList(AdminReviewVO vo) {
		return adminReviewDAO.getAdminSubList(vo);
	}

	@Override
	public void reviewReplyInsert(ReviewReplyVO vo) {
		adminReviewDAO.reviewReplyInsert(vo);
	}

	@Override
	public void reviewUpdate(AdminReviewVO vo) {
		adminReviewDAO.reviewUpdate(vo);
	}
}
