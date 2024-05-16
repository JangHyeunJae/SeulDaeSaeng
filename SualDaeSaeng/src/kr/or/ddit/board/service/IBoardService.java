package kr.or.ddit.board.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.ReplyVO;
import kr.or.ddit.member.vo.MemberVO;

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

  public int updateBoard(Map<String, Object> parameter);

  public int updateReply(Map<String, Object> parameter);
}
