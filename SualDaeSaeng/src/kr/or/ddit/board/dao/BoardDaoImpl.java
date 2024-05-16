package kr.or.ddit.board.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.ReplyVO;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.UsersVO;
import kr.or.ddit.util.MyBatisUtil;

public class BoardDaoImpl implements IBoardDao {

	private static IBoardDao boardDao = new BoardDaoImpl();

	private BoardDaoImpl() {
		boardDao = BoardDaoImpl.getInstance();
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

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return boardList;
	}

	@Override
	public BoardVO getBoardDetail(int boardNo) {

		SqlSession session = MyBatisUtil.getSqlSession(true);

		BoardVO boardDetail = null;

		try {
			boardDetail = session.selectOne("board.getBoardDetail", boardNo);
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
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

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return boardList;
	}

	@Override
	public MemberVO getwriterDetail(Map<String,Object> parameter) {

		SqlSession session = MyBatisUtil.getSqlSession(true);

		MemberVO writerDetail = null;

		try {
			writerDetail = session.selectOne("board.getWriterDetail", parameter);
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return writerDetail;
	}

	@Override
	public List<ReplyVO> getReplyList(int boardNo) {

		List<ReplyVO> replyList = new ArrayList<ReplyVO>();

		SqlSession session = null;

		try {

			session = MyBatisUtil.getSqlSession(true);
			replyList = session.selectList("board.getReplyList", boardNo);

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return replyList;
	}

	@Override
	public MemberVO getReplyWriterDetail(Map<String,Object> parameter) {
		SqlSession session = MyBatisUtil.getSqlSession(true);

		MemberVO ReplyWriterDetail = null;

		try {
			ReplyWriterDetail = session.selectOne("board.getReplyWriterDetail", parameter);
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return ReplyWriterDetail;
	}

	@Override
	public int deleteBoard(int boardNo) {
        SqlSession session = null;
		
		int cnt = 0;
		try {
			session = MyBatisUtil.getSqlSession();
			
			cnt = session.update("board.deleteBoard", boardNo);
			
			if(cnt > 0) {
				session.commit();
			}
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public int insertBoard(BoardVO boardVO) {
		
		SqlSession session = null;
		int status = 0;		
		
		try {
			session = MyBatisUtil.getSqlSession();
			status = session.insert("board.insertBoard", boardVO);
			
			if(status > 0) {	// 성공
				session.commit();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) {
				session.close();
			}
		}
		
		return status;
	}
  
	@Override
	public int insertReply(ReplyVO replyVO) {
		
    SqlSession session = null;
		int status = 0;
		try {
			session = MyBatisUtil.getSqlSession();
			
			status = session.insert("board.insertReply", replyVO);
			
			if(status > 0) {
				session.commit();
			}
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return status;
	}

	@Override
	public int updateHit(int boardNo) {
		
		SqlSession session = null;
		int hit = 0;
		try {
			session = MyBatisUtil.getSqlSession();
			
			hit = session.update("board.updateHit", boardNo);
			
			if(hit > 0) {
				session.commit();
			}
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return hit;
	}

	@Override
	public UsersVO getUsersDetail(int usersNo) {
		
		SqlSession session = MyBatisUtil.getSqlSession(true);

		UsersVO UsersDetail = null;

		try {
			UsersDetail = session.selectOne("board.getUsersDetail", usersNo);
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return UsersDetail;
	}

	@Override
	public MemberVO getMemberDetail(int usersNo) {
		
		SqlSession session = MyBatisUtil.getSqlSession(true);

		MemberVO MemberDetail = null;

		try {
			MemberDetail = session.selectOne("board.getMemberDetail", usersNo);
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return MemberDetail;
	}

	@Override
	public List<BoardVO> getClassNoticeList(int level) {
		List<BoardVO> boardList = new ArrayList<BoardVO>();

		SqlSession session = null;

		try {
			session = MyBatisUtil.getSqlSession(true);
			boardList = session.selectList("board.getClassNoticeList", level);

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return boardList;
  }
  
	@Override
	public int updateBoard(Map<String, Object> parameter) {
		
		SqlSession session = null;
		int status = 0;		
		
		try {
			session = MyBatisUtil.getSqlSession();
			status = session.insert("board.updateBoard", parameter);
			
			if(status > 0) {	// 성공
				session.commit();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) {
				session.close();
			}
		}
		
		return status;
	}

	@Override
	public int updateReply(Map<String, Object> parameter) {
		
		SqlSession session = null;
		int status = 0;		
		
		try {
			session = MyBatisUtil.getSqlSession();
			status = session.insert("board.updateReply", parameter);
			
			if(status > 0) {	// 성공
				session.commit();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) {
				session.close();
			}
		}
		
		return status;
	}

}
