package project.spring.web.tag.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.spring.web.tag.TagVO;

@Repository
public class TagDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<TagVO> getTagList(TagVO vo){
		return sqlSessionTemplate.selectList("TagDAO.getTagList", vo);
	}
}
