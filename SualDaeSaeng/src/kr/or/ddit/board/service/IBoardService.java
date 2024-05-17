package kr.or.ddit.board.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.ReplyVO;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.UsersVO;

public interface IBoardService {
	
  public List<BoardVO> allBoardList();

  public BoardVO getBoardDetail(int boardNo);
  
  public List<BoardVO> selectBoardList(int level);

  public int insertBoard(BoardVO boardVO);
  
  public MemberVO getwriterDetail(Map<String,Object> parameter);

  public List<ReplyVO> getReplyList(int boardNo);
  
  public MemberVO getReplyWriterDetail(Map<String,Object> parameter);

  public int deleteBoard(int boardNo);

  public int insertReply(ReplyVO replyVO);

  public int updateHit(int boardNo);

  public UsersVO getUsersDetail(int usersNo);

  public MemberVO getMemberDetail(int usersNo);

  public List<BoardVO> getClassNoticeList(int level);

  public int updateBoard(Map<String, Object> parameter);

  public int updateReply(Map<String, Object> parameter);

  public int deleteReply(int replyNo);

  public List<BoardVO> searchAllBoardList(Map<String, Object> parameter);

  public List<BoardVO> searchSelectBoardList(Map<String, Object> parameter);

  public int reportBoard(int boardNo);
}
