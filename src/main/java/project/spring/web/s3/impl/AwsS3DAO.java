package project.spring.web.s3.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.spring.web.s3.AwsS3VO;

@Repository
public class AwsS3DAO {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public AwsS3VO getKey() {
		return sqlSessionTemplate.selectOne("AwsDAO.getKey");
	}
}
