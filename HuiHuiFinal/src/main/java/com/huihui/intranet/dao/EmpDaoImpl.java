package com.huihui.intranet.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.huihui.intranet.domain.Emp;


@Repository
public class EmpDaoImpl implements EmpDao {
	
	private SqlSessionTemplate sqlSession;
	
	private final String NAME_SPACE = "com.huihuiproject.mapper.EmpMapper";
	
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
		
	/* member 테이블에서 회원 정보를 조회해 아래와 같이 로그인을 처리하는 메서드
	* - 로그인 성공이면 : 1을 반환
	* - 비밀번호가 다르면 : 0을 반환
	* - id가 존재하지 않으면 : -1을 반환
	**/

	@Override
	public int login(String employeeId, String pass) {
		Emp e = sqlSession.selectOne(NAME_SPACE + ".login", employeeId);
		int result = -1;
		
		//id가 존재하지 않을 경우
		if(e == null) {
			return result;
		}
		
		// 로그인 성공
		if(e.getPass().equals(pass)) {
			result = 1;
		
		// 비밀번호가 다른 경우	
		} else {
			result = 0;
		}
		
		return result;
	}

	
	// member 테이블에서 id에 해당하는 회원 정보를 읽어오는 메서드
	
	@Override
	public Emp getEmp(String employeeId) {
		return sqlSession.selectOne(NAME_SPACE + ".getEmp",employeeId);
	}
	
	@Override
	public void addEmp(Emp emp) {
		sqlSession.insert(NAME_SPACE + ".addEmp", emp);
	}
}
