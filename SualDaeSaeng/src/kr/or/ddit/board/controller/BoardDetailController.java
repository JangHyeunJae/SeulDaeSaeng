package kr.or.ddit.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.MemberVO;

@WebServlet("/board/detail.do")
public class BoardDetailController extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 
		 IBoardService boardService = BoardServiceImpl.getInstance();
		
		 String boardNo = req.getParameter("boardNo");
		 
		 BoardVO boardDetail = boardService.getBoardDetail(boardNo);
		
		 int userNo = boardDetail.getUserNo();
		 
		 MemberVO memDetail = boardService.getwriterDetail(userNo);
		 
		 req.setAttribute("boardDetail", boardDetail);
		 
		 req.getRequestDispatcher("/views/board/view.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 doGet(req, resp);
	}
}