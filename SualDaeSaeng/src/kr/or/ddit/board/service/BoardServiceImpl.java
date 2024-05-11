package kr.or.ddit.board.service;

import java.util.List;

import kr.or.ddit.board.dao.BoardDaoImpl;
import kr.or.ddit.board.dao.IBoardDao;
import kr.or.ddit.board.vo.BoardVO;

public class BoardServiceImpl implements IBoardService{
	
    private final IBoardDao boardDao;
	
	private static IBoardService boardService = new BoardServiceImpl();
	
	public BoardServiceImpl() {
		boardDao = BoardDaoImpl.getInstance();
	}
	
	public static IBoardService getInstance() {
		return boardService;
	}

	@Override
	public List<BoardVO> allBoardList() {
		return boardDao.allBoardList();
	}

	@Override
	public BoardVO getBoardDetail(String boardNo) {
		return boardDao.getBoardDetail(boardNo);
	}

	@Override
	public List<BoardVO> selectBoardList(int selectedButtonLevel) {
		return boardDao.selectBoardList(selectedButtonLevel);
	}
}
