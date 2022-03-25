package project.spring.web.my_review_write;

import java.util.List;
import java.util.Map;

import project.spring.web.utill.Criteria;
import project.spring.web.utill.PageMaker;

public interface MyReviewWriteService {
	void insertReview(MyReviewWriteVO vo);

	void updateReview(MyReviewWriteVO vo);

	void deleteReview(MyReviewWriteVO vo);

	MyReviewWriteVO getReview(MyReviewWriteVO vo);

	List<MyReviewWriteVO> getReviewList(MyReviewWriteVO vo);

// 페이징 처리
	List<Map<String, Object>> selectBoardList(Criteria cri);
	
	List<Map<String, Object>> selectBoardList2(Criteria cri);
	
	int countBoardListTotal(PageMaker pageMaker);
	
	int countBoardListTotal2(PageMaker pageMaker);
	
	public int insertSubReview(MyReviewWriteVO vo);

}
