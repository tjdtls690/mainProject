package project.spring.web.admin_review.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.spring.web.admin_review.AdminReviewVO;
import project.spring.web.admin_review.ReviewReplyVO;

@Repository
public class AdminReviewDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<AdminReviewVO> getAdminItemList(AdminReviewVO vo) {
		return sqlSessionTemplate.selectList("adminReviewDAO.getItemReviewList", vo);
	}
	
	public List<AdminReviewVO> getAdminSubList(AdminReviewVO vo) {
		return sqlSessionTemplate.selectList("adminReviewDAO.getSubReviewList", vo);
	}
	
	public void reviewDelete(AdminReviewVO vo) {
		sqlSessionTemplate.delete("adminReviewDAO.reviewDelete", vo);
	}
	
	public void reviewReplyInsert(ReviewReplyVO vo) {
		sqlSessionTemplate.insert("adminReviewDAO.reviewReplyInsert", vo);
	}
	
	public void reviewUpdate(AdminReviewVO vo) {
		sqlSessionTemplate.update("adminReviewDAO.reviewUpdate", vo);
	}
	
	public ReviewReplyVO getReviewReply(ReviewReplyVO vo) {
		return sqlSessionTemplate.selectOne("adminReviewDAO.getReviewReply", vo);
	}
}
