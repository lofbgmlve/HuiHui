package com.huihui.intranet.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huihui.intranet.dao.NonNameBoardDao;
import com.huihui.intranet.domain.NonNameBoard;

@Service
public class NonNameBoardServiceImpl implements NonNameBoardService {

	@Autowired
	private NonNameBoardDao nonNameBoardDao;
	
	public void setNonNameBoardDao(NonNameBoardDao nonNameBoardDao) {
		this.nonNameBoardDao = nonNameBoardDao;
	}
	
	private static final int PAGE_SIZE = 10;
	private static final int PAGE_GROUP = 10;
	
	@Override
	public Map<String, Object> nonNameBoardList(int pageNum, String type, String keyword) {
		int currentPage = pageNum;
		
		int startRow = (currentPage - 1) * PAGE_SIZE;
		int listCount = 0;
		
		boolean searchOption = (type.equals("null") || keyword.equals("null")) ? false : true;
		listCount = nonNameBoardDao.getNonNameCount(type, keyword);
		
		List<NonNameBoard> nonNameBoardList = 
				nonNameBoardDao.nonNameBoardList(startRow, PAGE_SIZE, type, keyword);
		
		int pageCount = listCount / PAGE_SIZE + (listCount % PAGE_SIZE == 0? 0 : 1);
		int startPage = (currentPage / PAGE_GROUP) * PAGE_GROUP + 1 - 
				(currentPage % PAGE_GROUP == 0? PAGE_GROUP : 0);
		int endPage = startPage + PAGE_GROUP - 1;
	
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		modelMap.put("nonNameBoardList", nonNameBoardList);
		modelMap.put("pageCount", pageCount);
		modelMap.put("startPage", startPage);
		modelMap.put("endPage", endPage);
		modelMap.put("currentPage", currentPage);
		modelMap.put("listCount", listCount);
		modelMap.put("pageGroup", PAGE_GROUP);
		modelMap.put("searchOption", searchOption);
		
		
		if(searchOption) {
			modelMap.put("type", type);
			modelMap.put("keyword", keyword);
		}
		return modelMap;
	}

	@Override
	public NonNameBoard getNonNameBoard(int nonNameNo, boolean isCount) {
		return nonNameBoardDao.getNonNameBoard(nonNameNo, isCount);
	}

	@Override
	public void insertNonNameBoard(NonNameBoard nonNameBoard) {
		nonNameBoardDao.insertNonNameBoard(nonNameBoard);
	}

	@Override
	public NonNameBoard isIdCheck(int nonNameNo) {
		return nonNameBoardDao.isIdCheck(nonNameNo);
	}

	@Override
	public void updateNonNameBoard(NonNameBoard nonNameBoard) {
		nonNameBoardDao.updateNonNameBoard(nonNameBoard);
	}

	@Override
	public void deleteNonNameBoard(int nonNameNo) {
		nonNameBoardDao.deleteNonNameBoard(nonNameNo);
	}
	

	public Map<String, Object> Thank(int nonNameNo,String nonRecommend, String addAndCancle) {
		
		nonNameBoardDao.updateThank(nonNameNo, nonRecommend, addAndCancle);
		NonNameBoard nonName = nonNameBoardDao.getThank(nonNameNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("nonNameThank", nonName.getNonNameThank());
		map.put("nonNameBad", nonName.getNonNameBad());
		return map;
	}


}
