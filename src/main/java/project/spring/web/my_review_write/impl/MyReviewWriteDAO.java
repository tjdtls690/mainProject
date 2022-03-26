package project.spring.web.my_review_write.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.spring.web.my_review_write.MyReviewWriteVO;
import project.spring.web.paymentComplete.PaymentMyDetailInfoVO;
import project.spring.web.utill.Criteria;
import project.spring.web.utill.PageMaker;

@Repository
public class MyReviewWriteDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void insertReview(MyReviewWriteVO vo) {
		System.out.println("---> MyBatis로 insertReview() 기능 처리");
		System.out.println(vo.getStar());
		System.out.println(vo.getUser_name());
		System.out.println(vo.getContent());
		sqlSessionTemplate.insert("WriteReviewDAO.insertReview", vo);
	}
	
	public int insertSubReview(MyReviewWriteVO vo) {
		System.out.println("---> MyBatis로 insertSubReview() 기능 처리");
		return sqlSessionTemplate.insert("WriteReviewDAO.insertSubReview", vo);
	}

	public void updateReview(MyReviewWriteVO vo) {
		System.out.println("---> MyBatis로 updateReview() 기능 처리");
		sqlSessionTemplate.update("WriteReviewDAO.updateReview", vo);
	}

	public void deleteReview(MyReviewWriteVO vo) {
		System.out.println("---> MyBatis로 deleteReview() 기능 처리");
		sqlSessionTemplate.delete("WriteReviewDAO.deleteReview", vo);
	}

	public MyReviewWriteVO getReview(MyReviewWriteVO vo) {
		System.out.println("---> MyBatis로 getReview() 기능 처리");
		return (MyReviewWriteVO) sqlSessionTemplate.selectOne("WriteReviewDAO.getReview", vo);
	}

	public List<MyReviewWriteVO> getReviewList01(MyReviewWriteVO vo) {
		System.out.println("---> DAO에서 item_code맞는 리뷰 가져오기");
		return sqlSessionTemplate.selectList("WriteReviewDAO.getReviewList01", vo);
	}
	public List<MyReviewWriteVO> getReviewList02(MyReviewWriteVO vo) {
		System.out.println("---> DAO에서 subscribe_code맞는 리뷰 가져오기");
		return sqlSessionTemplate.selectList("WriteReviewDAO.getReviewList02", vo);
	}
	
// 페이징 처리
	public List<Map<String, Object>> selectBoardList(Criteria cri) {
		System.out.println("--->MyBatis selectBoardList 실행");
	    return sqlSessionTemplate.selectList("WriteReviewDAO.selectBoardList", cri);
	}
	
	public List<Map<String, Object>> selectBoardList2(Criteria cri) {
		System.out.println("--->MyBatis selectBoardList 실행");
	    return sqlSessionTemplate.selectList("WriteReviewDAO.selectBoardList2", cri);
	}

	public int countBoardList(PageMaker pageMaker){
		System.out.println("--->MyBatis countBoardList 실행");
	    return sqlSessionTemplate.selectOne("WriteReviewDAO.countBoardList", pageMaker);
	}
	
	public int countBoardList2(PageMaker pageMaker){
		System.out.println("--->MyBatis countBoardList 실행");
	    return sqlSessionTemplate.selectOne("WriteReviewDAO.countBoardList2", pageMaker);
	}
	
	public PaymentMyDetailInfoVO getMemberPayMappingItemInfoOne(PaymentMyDetailInfoVO vo){
	    return sqlSessionTemplate.selectOne("PaymentDAO.getMemberPayMappingItemInfoOne", vo);
	}
	
	public int updateReviewModify(MyReviewWriteVO vo){
	    return sqlSessionTemplate.update("WriteReviewDAO.updateReviewModify", vo);
	}
}
