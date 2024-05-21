package kr.or.ddit.report.service;

import java.util.List;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.report.dao.IReportDao;
import kr.or.ddit.report.dao.ReportDaoImpl;

public class ReportServiceImpl implements IReportService {

	private static ReportServiceImpl instance = null;
	private ReportServiceImpl() {}
	public static ReportServiceImpl getInstance() {
		if(instance == null) {
			instance = new ReportServiceImpl();
		}
		return instance;
	}
	
	private IReportDao dao  = ReportDaoImpl.getInstance();
	
	
	@Override
	public List<BoardVO> selectReportList() {
		return dao.selectReportList();
	}
	
	@Override
	public List<BoardVO> selectallList() {
		return dao.selectallList();
	}
	
	
}
