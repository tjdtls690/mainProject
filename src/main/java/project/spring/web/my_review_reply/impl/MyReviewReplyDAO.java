package project.spring.web.my_review_reply.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.spring.web.my_review_reply.MyReviewReplyVO;

@Repository
public class MyReviewReplyDAO {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<MyReviewReplyVO> getReviewReply() {
		return sqlSessionTemplate.selectList("WriteReviewDAO.getReviewReply");
	}
}
