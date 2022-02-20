package project.spring.web.review;

import java.util.List;

public interface WriteReviewService {
	void insertReview(WriteReviewVO vo);

	void updateReview(WriteReviewVO vo);

	void deleteReview(WriteReviewVO vo);

	WriteReviewVO getReview(WriteReviewVO vo);

	List<WriteReviewVO> getReviewList(WriteReviewVO vo);

}
