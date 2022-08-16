package com.huihui.intranet.dao;

import java.util.List;

import com.huihui.intranet.domain.NonNameBoard;

public interface NonNameBoardDao {
	public abstract List<NonNameBoard> nonNameBoardList(int startRow, int num, String type, String keyword);
	public abstract NonNameBoard getNonNameBoard(int nonNameNo, boolean isCount);
	public abstract void insertNonNameBoard(NonNameBoard nonNameBoard);
	public abstract NonNameBoard isIdCheck(int nonNameNo);
	public abstract void updateNonNameBoard(NonNameBoard nonNameBoard);
	public abstract void deleteNonNameBoard(int nonNameNo);
	public abstract int getNonNameCount(String type, String keyword);
	public abstract void  updateThank(int nonNameNo,String nonRecommend, String addAndCancle);
	public abstract NonNameBoard getThank(int nonNameNo);
}
