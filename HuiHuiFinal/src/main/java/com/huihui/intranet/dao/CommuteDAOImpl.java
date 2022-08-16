package com.huihui.intranet.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.huihui.intranet.domain.Commute;
import com.huihui.intranet.domain.DateData;

@Repository("commuteDAO")
public class CommuteDAOImpl implements CommuteDAO {

	@Autowired
	CommuteMapper commuteMapper;
	
	private final String NAME_SPACE = "com.huihui.intranet.dao.CommuteMapper";
	
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	//회원번호로 insert
	public int insertEmpId(String employeeId) {
		return commuteMapper.insertEmpId(employeeId);
	}

	//퇴근시간 update
	public int updateleaved(int commuteNo) {
		return commuteMapper.updateleaved(commuteNo);
	}

	//출근 확인
	public Commute checkattend(String employeeId) {
		return commuteMapper.checkattend(employeeId);
	}

	//출근 확인
	public List<Commute> attendMonth(DateData dateData) {
		return commuteMapper.attendMonth(dateData);
	}

	//출근일 검색
	public Commute attendDay(DateData dateData) {
		return commuteMapper.attendDay(dateData);
	}
	
	@Override
	public List<Commute> attendList() {
		return sqlSession.selectList(NAME_SPACE + ".attendList");
	}

}