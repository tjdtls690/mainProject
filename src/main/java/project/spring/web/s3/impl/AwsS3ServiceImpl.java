package project.spring.web.s3.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.spring.web.s3.AwsS3Service;
import project.spring.web.s3.AwsS3VO;

@Service
public class AwsS3ServiceImpl implements AwsS3Service{
	@Autowired
	AwsS3DAO awsS3DAO;

	@Override
	public AwsS3VO getKey() {
		return awsS3DAO.getKey();
	}
	
}
