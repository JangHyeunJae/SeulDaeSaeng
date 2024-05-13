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

@WebServlet("/board/edit.do")
public class EditBoardController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 
		 String boardNo = req.getParameter("boardNo");
		 IBoardService boardService = BoardServiceImpl.getInstance();
		 
		 BoardVO boardDetail = boardService.getBoardDetail(boardNo);
		 
		 req.setAttribute("boardDetail", boardDetail);
		 
		 req.getRequestDispatcher("/views/board/write.jsp").forward(req, resp);
		 //merge후에 write 수정
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 doGet(req, resp);
	}
}
