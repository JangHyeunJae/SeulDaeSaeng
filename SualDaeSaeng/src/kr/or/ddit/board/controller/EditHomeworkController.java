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
import kr.or.ddit.board.vo.HomeworkVO;

@WebServlet("/homework/edit.do")
public class EditHomeworkController extends HttpServlet {
	
	private IBoardService boardService = BoardServiceImpl.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int hwNo = Integer.parseInt(req.getParameter("hwNo"));
		int levelChk = Integer.parseInt(req.getParameter("levelChk"));
		IBoardService boardService = BoardServiceImpl.getInstance();
		HomeworkVO hwDetail = boardService.getHwDetail(hwNo);
		
		
		req.setAttribute("hwNo", hwNo);
		req.setAttribute("levelChk", levelChk);
		req.setAttribute("hwDetail", hwDetail);
		 
		req.getRequestDispatcher("/views/board/hwEdit.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doPost(req, resp);
	}
}
