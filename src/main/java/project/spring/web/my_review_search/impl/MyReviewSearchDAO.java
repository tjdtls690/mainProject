package project.spring.web.my_review_search.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.spring.web.my_review_write.MyReviewWriteVO;

@Repository
public class MyReviewSearchDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public MyReviewWriteVO getPaymentItemMappingCodeReview(MyReviewWriteVO vo){
		return sqlSessionTemplate.selectOne("WriteReviewDAO.getPaymentItemMappingCodeReview", vo);
	}
}
