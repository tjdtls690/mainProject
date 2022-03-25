package project.spring.web.admin_item_impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.spring.web.admin_item.AdminItemInfoVO;
import project.spring.web.admin_item.AdminItemVO;
import project.spring.web.admin_item.AdminSubVO;

@Repository
public class AdminItemDAO {
	
	@Autowired
	SqlSessionTemplate sqlsessionTemplate;
	
	public List<AdminItemVO> getAdminItemList(AdminItemVO vo) {
		return sqlsessionTemplate.selectList("adminItemDAO.getAdminItem");
	}
	
	public List<AdminSubVO> getAdminSubList(AdminSubVO vo) {
		return sqlsessionTemplate.selectList("adminItemDAO.getAdminSub");
	}
	
	public void itemDelete(AdminItemVO vo) {
		sqlsessionTemplate.delete("adminItemDAO.itemDelete", vo);
	}
	
	public void subDelete(AdminSubVO vo) {
		sqlsessionTemplate.delete("adminItemDAO.subDelete", vo);
	}
	
	public void itemInsert(AdminItemVO vo) {
		sqlsessionTemplate.insert("adminItemDAO.itemInsert", vo);
	}
	
	public void itemInfoInsert(AdminItemInfoVO vo) {
		sqlsessionTemplate.insert("adminItemDAO.itemInfoInsert", vo);
	}
	
	public AdminItemVO getItemName(AdminItemVO vo) {
		return sqlsessionTemplate.selectOne("adminItemDAO.getItemName", vo);
	}
	
	public AdminSubVO getSubName(AdminSubVO vo) {
		return sqlsessionTemplate.selectOne("adminItemDAO.getSubName", vo);
	}
}
