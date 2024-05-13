package kr.or.ddit.board.service;

import java.util.List;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.member.vo.MemberVO;

public interface IBoardService {
	
  public List<BoardVO> allBoardList();

  public BoardVO getBoardDetail(String boardNo);
  
  public List<BoardVO> selectBoardList(int level);

  public MemberVO getwriterDetail(int userNo);
}
