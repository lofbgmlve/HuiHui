package com.huihui.intranet.service;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huihui.intranet.dao.CommuteDAO;
import com.huihui.intranet.domain.Commute;
import com.huihui.intranet.domain.DateData;
import com.huihui.intranet.service.CommuteService;
import Exception.AlreadyAttend;
import Exception.FailAttendCheck;
import Exception.FailInsertCommute;
import Exception.FailUpdateCommute;
import Exception.NotFoundCommtues;

@Service("commuteService")
public class CommuteServiceImpl implements CommuteService {

	@Autowired
	private CommuteDAO commuteDAO;
	
	public void setCommuteDao(CommuteDAO commuteDao) {
		this.commuteDAO = commuteDao;
	}
	
	//조회
	@Override
	public List<Commute> attendList() {
		return commuteDAO.attendList();
	}

	// 회원번호로 출퇴근 insert
	public void commuteInsert(String employeeId) {
		// 출근 확인
		Commute commute = commuteDAO.checkattend(employeeId);
		// 목록이 존재하면 에러
		if (commute != null) {
			throw new AlreadyAttend("이미 출근처리 되었습니다.");
		}

		// 목록이 존재하지 않으면 insert
		int res = commuteDAO.insertEmpId(employeeId);

		// 결과값이 0이거나 1보다 크면 에러
		if (res == 0 || res > 1) {
			throw new FailInsertCommute("insert실패");
		}

	}

	// 출근확인후 퇴근 update
	public void checkAndUpdate(String employeeId) {
		// 출근확인
		Commute commute = commuteDAO.checkattend(employeeId);

		// 목록이 존재하지 않으면 에러
		if (commute.equals(null) || commute.equals("")) {
			throw new FailAttendCheck("출근처리가 되지않았습니다.");
		}

		// 검색한 출근 목록의 출근번호를 가져옴
		int commuteNo = commute.getCommuteNo();

		// 퇴근 update
		int res = commuteDAO.updateleaved(commuteNo);

		// 결과값이 0이거나 1보다 크면 에러
		if (res == 0 || res > 1) {
			throw new FailUpdateCommute("퇴근처리 실패");
		}

	}

	// 출근일 가져오기
	public List<Commute> Datecompare(DateData dateData) {
		// Controller에서 받은 년도과 월의 출근 날 검색
		List<Commute> commutes = commuteDAO.attendMonth(dateData);

		for (Commute comm : commutes) {
			// Commute의 출근일을 가공
			String toDay = comm.getAttend().substring(8, 10);

			// dateData에 데이터 삽입
			dateData.setToDay(toDay);

			// 해당하는 날짜에 출근했는지 검색 후 데이터 삽입
			commuteDAO.attendDay(dateData);
			comm.setAttend(toDay);
		}
		return commutes;
	}

}
