package project.spring.web.admin_review;

import java.util.List;

public interface AdminReviewService {
	public List<AdminReviewVO> getAdminItemList(AdminReviewVO vo);
	public List<AdminReviewVO> getAdminSubList(AdminReviewVO vo);
	public void reviewDelete(AdminReviewVO vo);
	public void reviewReplyInsert(ReviewReplyVO vo);
	public void reviewUpdate(AdminReviewVO vo);
	public ReviewReplyVO getReviewReply(ReviewReplyVO vo);
}
