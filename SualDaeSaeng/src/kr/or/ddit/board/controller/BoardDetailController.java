package kr.or.ddit.board.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.ReplyVO;
import kr.or.ddit.member.vo.MemberVO;

@WebServlet("/board/detail.do")
public class BoardDetailController extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	IBoardService boardService = BoardServiceImpl.getInstance();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 
		 int boardNo = Integer.parseInt(req.getParameter("boardNo"));
		 BoardVO boardDetail = boardService.getBoardDetail(boardNo);
		 int boardLevel = boardDetail.getBoardLevel();
		 
		 int usersNo = boardDetail.getUsersNo();
		 Map<String,Object> parameter = new HashMap<>();
		 parameter.put("usersNo",usersNo);
		 parameter.put("boardNo",boardNo);
		 
		 MemberVO writerDetail = boardService.getwriterDetail(parameter);
		 List<ReplyVO> replyList = boardService.getReplyList(boardNo);
		 req.setAttribute("boardDetail", boardDetail);
		 req.setAttribute("writerDetail", writerDetail);
		 req.setAttribute("replyList", replyList);
         
		 //각 게시판 중 몇번째인지 체크
		 int idx = Integer.parseInt(req.getParameter("idx"));
		 req.setAttribute("idx", idx);
		 
		 //이전 url 가져와서 allBoard.do가 있는지 체크
		 String before_address = req.getHeader("referer");
		 List<BoardVO> boardList = null;
		 if(before_address.contains("allBoard.do")) {
		 boardList = boardService.allBoardList();
		 }else {
		 boardList = boardService.selectBoardList(boardLevel);
		 }
		 req.setAttribute("boardList", boardList);
		 req.getRequestDispatcher("/views/board/view.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		  req.setCharacterEncoding("UTF-8");
		  int idx = Integer.parseInt(req.getParameter("idx"));
           		
		  String replyCon = req.getParameter("replyCon");
		  int boardNo = Integer.parseInt(req.getParameter("boardNo"));
		  int usersNo = 1;
		  
		  ReplyVO replyVO = new ReplyVO();
		  replyVO.setReplyCon(replyCon);
		  replyVO.setBoardNo(boardNo);
		  replyVO.setUsersNo(usersNo); // 세션에서 꺼내와야함
		  
		  int status = boardService.insertReply(replyVO);

		  if(status>0) {
			  resp.sendRedirect(req.getContextPath() + "/board/detail.do?boardNo=" + boardNo + "&idx=" + idx);
		  }else {
			  req.getRequestDispatcher("/views/board/view.jsp").forward(req, resp);
		  }
	}
}