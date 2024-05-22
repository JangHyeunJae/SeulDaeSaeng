package kr.or.ddit.report.service;

import java.util.List;

import kr.or.ddit.board.vo.BoardVO;

public interface IReportService {

	public List<BoardVO> selectReportList();

	public List<BoardVO> selectallList();

}
