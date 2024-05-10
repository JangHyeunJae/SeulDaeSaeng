package kr.or.ddit.board.service;

import java.util.List;

import kr.or.ddit.board.vo.BoardVO;

public interface IBoardService {
	
  public List<BoardVO> allBoardList();
  
}
