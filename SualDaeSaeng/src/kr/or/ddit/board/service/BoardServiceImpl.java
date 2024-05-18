package kr.or.ddit.board.service;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Part;

import kr.or.ddit.board.dao.BoardDaoImpl;
import kr.or.ddit.board.dao.IBoardDao;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.FileDetailVO;
import kr.or.ddit.board.vo.HomeworkVO;
import kr.or.ddit.board.vo.ReplyVO;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.UsersVO;

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

	@Override
	public int insertBoard(BoardVO boardVO) {
		return boardDao.insertBoard(boardVO);
	}

	@Override
	public int updateHit(int boardNo) {
		return boardDao.updateHit(boardNo);
	}

	@Override
	public UsersVO getUsersDetail(int usersNo) {
		return boardDao.getUsersDetail(usersNo);
	}

	@Override
	public MemberVO getMemberDetail(int usersNo) {
		return boardDao.getMemberDetail(usersNo);
	}

	@Override
	public List<BoardVO> getClassNoticeList(int level) {
		return boardDao.getClassNoticeList(level);
  }
  
  @Override
	public int updateBoard(Map<String, Object> parameter) {
		return boardDao.updateBoard(parameter);
	}

	@Override
	public int updateReply(Map<String, Object> parameter) {
		return boardDao.updateReply(parameter);
	}

	@Override
	public int insertHomework(Map<String,Object> parameter) {
		return boardDao.insertHomework(parameter);
	}

	@Override
	public List<HomeworkVO> getHwList() {
		return boardDao.getHwList();
	}

	@Override
	public HomeworkVO getHwDetail(int hwNo) {
		return boardDao.getHwDetail(hwNo);
	}

	@Override
	public MemberVO getHwWriterDetail(Map<String, Object> parameter) {
		return boardDao.getHwWriterDetail(parameter);
	}

	@Override
	public int saveFileDetail(FileDetailVO fileDetail) {
		return boardDao.saveFileDetail(fileDetail);
	}

	@Override
	public List<FileDetailVO> getFileList(int classNo) {
		return boardDao.getFileList(classNo);
	}

	@Override
	public int insertFileDetail(FileDetailVO fileDetail) {
		return boardDao.insertFileDetail(fileDetail);
	}

	@Override
	public FileDetailVO getFileDetail(int fileNo) {
		return boardDao.getFileDetail(fileNo);
	}
}
