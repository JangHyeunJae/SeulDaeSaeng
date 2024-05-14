package kr.or.ddit.board.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.board.dao.BoardDaoImpl;
import kr.or.ddit.board.dao.IBoardDao;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.ReplyVO;
import kr.or.ddit.member.vo.MemberVO;

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
	public BoardVO getBoardDetail(int boardNo) {
		return boardDao.getBoardDetail(boardNo);
	}

	@Override
	public List<BoardVO> selectBoardList(int level) {
		return boardDao.selectBoardList(level);
	}

	@Override
	public MemberVO getwriterDetail(Map<String,Object> parameter) {
		return boardDao.getwriterDetail(parameter);
	}

	@Override
	public List<ReplyVO> getReplyList(int boardNo) {
		return boardDao.getReplyList(boardNo);
	}

	@Override
	public MemberVO getReplyWriterDetail(Map<String,Object> parameter) {
		return boardDao.getReplyWriterDetail(parameter);
	}

	@Override
	public int deleteBoard(int boardNo) {
		return boardDao.deleteBoard(boardNo);
	}

	@Override
	public int insertReply(ReplyVO replyVO) {
		return boardDao.insertReply(replyVO);
	}
}
