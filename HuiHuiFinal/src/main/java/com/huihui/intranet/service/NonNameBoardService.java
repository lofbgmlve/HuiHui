package com.huihui.intranet.service;

import java.util.List;
import java.util.Map;

import com.huihui.intranet.domain.NonNameBoard;

public interface NonNameBoardService {
	public abstract Map<String, Object> nonNameBoardList(int pageNum, String type, String keyword);
	public abstract NonNameBoard getNonNameBoard(int nonNameNo, boolean isCount);
	public abstract void insertNonNameBoard(NonNameBoard nonNameBoard);
	public NonNameBoard isIdCheck(int nonNameNo);
	public abstract void updateNonNameBoard(NonNameBoard nonNameBoard);
	public abstract void deleteNonNameBoard(int nonNameNo);
	public Map<String, Object> Thank(int nonNameNo, String nonRecommend, String addAndCancle);
}
