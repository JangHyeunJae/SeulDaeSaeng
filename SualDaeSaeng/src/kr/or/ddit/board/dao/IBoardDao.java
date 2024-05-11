package kr.or.ddit.board.dao;

import java.util.List;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.MemberVO;

public interface IBoardDao {

	public List<BoardVO> allBoardList();

	public BoardVO getBoardDetail(String boardNo);

	public List<BoardVO> selectBoardList(int level);
	
	public MemberVO getwriterDetail(int userNo);
}
