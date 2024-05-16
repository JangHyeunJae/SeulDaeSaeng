package kr.or.ddit.board.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.ReplyVO;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.UsersVO;

public interface IBoardDao {

	public List<BoardVO> allBoardList();

	public BoardVO getBoardDetail(int boardNo);

	public List<BoardVO> selectBoardList(int level);

	public int insertBoard(BoardVO boardVO);
	public MemberVO getwriterDetail(Map<String,Object> parameter);

	public List<ReplyVO> getReplyList(int boardNo);

	public MemberVO getReplyWriterDetail(Map<String,Object> parameter);

	public int deleteBoard(int boardNo);
	//댓글 insert
	public int insertReply(ReplyVO replyVO);

	public int updateHit(int boardNo);

	public UsersVO getUsersDetail(int usersNo);

	public MemberVO getMemberDetail(int usersNo);

	public List<BoardVO> getClassNoticeList(int level);
}
