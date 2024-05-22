package kr.or.ddit.board.service;

import java.time.LocalTime;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Part;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.FileDetailVO;
import kr.or.ddit.board.vo.FileShareVO;
import kr.or.ddit.board.vo.HomeworkVO;
import kr.or.ddit.board.vo.HwSubmitVO;
import kr.or.ddit.board.vo.ReplyVO;
import kr.or.ddit.board.vo.StoryVO;
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

  public int insertHomework(Map<String,Object> parameter);

  public List<HomeworkVO> getHwList(int levelChk);

  public HomeworkVO getHwDetail(int hwNo);

  public MemberVO getHwWriterDetail(Map<String, Object> parameter);

  public List<FileDetailVO> getFileList(int classNo);

  public FileDetailVO getFileDetail(int fileNo);

  public int deleteReply(int replyNo);

  public List<BoardVO> searchAllBoardList(Map<String, Object> parameter);

  public List<BoardVO> searchSelectBoardList(Map<String, Object> parameter);

  public int reportBoard(int boardNo);

  public List<BoardVO> searchClassBoardList(Map<String, Object> parameter);

  public int insertFileShare(FileShareVO fileShare);
  
  public int saveFileDetail(FileDetailVO fileDetail);

  public int insertBoardFile(Part filePart, int levelChk);

  public FileDetailVO getFile(int boardNo);
  
  public MemberVO getHwTeacher(int hwNo);

  public int studentSubmitHw(HwSubmitVO hwSubmit);

  public List<FileDetailVO> mySubmit(Map<String, Object> parameter2);

  public int insertStory(StoryVO storyVO);

  public List<StoryVO> getStoryList(int usersNo);
  
  public String getStoryTime(int storyNo);
  
  public StoryVO getStoryOne(int storyNo);

 public MemberVO writerDetail(int boardNo);

}
