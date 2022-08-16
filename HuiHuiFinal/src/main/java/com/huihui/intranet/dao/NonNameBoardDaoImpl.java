package com.huihui.intranet.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.huihui.intranet.domain.NonNameBoard;

@Repository
public class NonNameBoardDaoImpl implements NonNameBoardDao {

	private final String NAME_SPACE = "com.huihui.intranet.mapper.NonNameBoardMapper";
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<NonNameBoard> nonNameBoardList(int startRow, int num, String type, String keyword) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("startRow", startRow);
		params.put("num", num);
		params.put("type", type);
		params.put("keyword", keyword);
		
		return sqlSession.selectList(NAME_SPACE + ".nonNameBoardList", params);
	}

	@Override
	public NonNameBoard getNonNameBoard(int nonNameNo, boolean isCount) {
		if(isCount) {
			sqlSession.update(NAME_SPACE + ".incrementReadCount", nonNameNo);
		}
		
		return sqlSession.selectOne(NAME_SPACE + ".getNonName", nonNameNo);
	}

	@Override
	public void insertNonNameBoard(NonNameBoard nonNameBoard) {
		sqlSession.insert(NAME_SPACE + ".insertNonName", nonNameBoard);
	}

	@Override
	public NonNameBoard isIdCheck(int nonNameNo) {
		
		return sqlSession.selectOne(NAME_SPACE + ".getNonName", nonNameNo); 
	}

	@Override
	public void updateNonNameBoard(NonNameBoard nonNameBoard) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("nonNameTitle", nonNameBoard.getNonNameTitle());
		map.put("nonNameNo", nonNameBoard.getNonNameNo());
		map.put("nonNameContent", nonNameBoard.getNonNameContent());
		
		System.out.println("DAO - updateNonNameBoard :\n"+  nonNameBoard.getNonNameNo());
		System.out.println( nonNameBoard.getNonNameTitle());
		System.out.println( nonNameBoard.getNonNameContent());
		sqlSession.update(NAME_SPACE + ".nonNameUpdate", map);
	}

	@Override
	public void deleteNonNameBoard(int nonNameNo) {
		sqlSession.delete(NAME_SPACE + ".nonNameDelete", nonNameNo); 
	}

	@Override
	public int getNonNameCount(String type, String keyword) {
		Map<String, String> params = new HashMap<String, String>();
		params.put("type", type);
		params.put("keyword", keyword);
		
		
		return sqlSession.selectOne(NAME_SPACE + ".getNonNameCount", params);
	}
	
	@Override
	public void updateThank(int nonNameNo, String nonRecommend, String addAndCancle) {
		
		Map<String, Object> params= new HashMap<String, Object>();
		params.put("nonNameNo", nonNameNo);
		params.put("nonRecommend", nonRecommend);
		params.put("addAndCancle", addAndCancle);
		System.out.println("추천 비추천 dao 확인 : " +  nonNameNo + nonRecommend);
		sqlSession.update(NAME_SPACE + ".incrementeRecommend", params);
	}
	@Override
	public NonNameBoard getThank(int nonNameNo) {
		
		return sqlSession.selectOne(NAME_SPACE + ".getThank", nonNameNo);
	}
	
	
}
