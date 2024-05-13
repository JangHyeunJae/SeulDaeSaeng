package kr.or.ddit.board.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.MemberVO;
import kr.or.ddit.util.MyBatisUtil;

public class BoardDaoImpl implements IBoardDao{

    private static IBoardDao boardDao = new BoardDaoImpl();
	
	private BoardDaoImpl() {
		boardDao =BoardDaoImpl.getInstance();
	}
	
	public static IBoardDao getInstance() {
		return boardDao;
	}
	
	@Override
	public List<BoardVO> allBoardList() {
		
		List<BoardVO> boardList = new ArrayList<BoardVO>();
		
		SqlSession session = null;
		
		try {
			session = MyBatisUtil.getSqlSession(true);
			
			boardList = session.selectList("board.allBoardList");
			
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return boardList;
	}

	@Override
	public BoardVO getBoardDetail(String boardNo) {
		
		SqlSession session = MyBatisUtil.getSqlSession(true);
		
		BoardVO boardDetail = null;
		
		try {
			boardDetail = session.selectOne("board.getBoardDetail", boardNo);
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return boardDetail;
	}

	@Override
	public List<BoardVO> selectBoardList(int level) {
       List<BoardVO> boardList = new ArrayList<BoardVO>();
		
		SqlSession session = null;
		
		try {
			session = MyBatisUtil.getSqlSession(true);
			boardList = session.selectList("board.selectBoardList", level);	
			
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return boardList;
	}

	@Override
	public MemberVO getwriterDetail(int userNo) {

		SqlSession session = MyBatisUtil.getSqlSession(true);
		
		MemberVO writerDetail = null;
		
		try {
			writerDetail = session.selectOne("board.getBoardDetail", userNo);
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return writerDetail;
	}

}
