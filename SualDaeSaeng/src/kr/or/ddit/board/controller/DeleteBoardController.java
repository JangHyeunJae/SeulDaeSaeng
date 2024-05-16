package kr.or.ddit.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;

@WebServlet("/board/delete.do")
public class DeleteBoardController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 
		 IBoardService boardService = BoardServiceImpl.getInstance();
		 
		 int boardNo = Integer.parseInt(req.getParameter("boardNo"));
		 int levelChk = Integer.parseInt(req.getParameter("levelChk"));
		 
		 int cnt = boardService.deleteBoard(boardNo);
	    
		 // levelChk값에 따라 삭제 후 목록 이동
		 if(cnt>0) {
			 if(levelChk == 0) resp.sendRedirect(req.getContextPath() + "/allBoard.do");
			 else if(levelChk == 1) resp.sendRedirect(req.getContextPath() + "/freeBoard.do");
			 else if(levelChk == 2) resp.sendRedirect(req.getContextPath() + "/studyBoard.do");
			 else if(levelChk == 3) resp.sendRedirect(req.getContextPath() + "/noticeBoard.do");
		 }
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 doGet(req, resp);
	}
}
