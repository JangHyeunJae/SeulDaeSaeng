package kr.or.ddit.board.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;

@WebServlet("/board/report.do")
public class ReportBoardController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		IBoardService boardService = BoardServiceImpl.getInstance();

		int boardNo = Integer.parseInt(req.getParameter("boardNo"));
		int levelChk = Integer.parseInt(req.getParameter("levelChk"));
		int idx = Integer.parseInt(req.getParameter("idx"));

		int status = boardService.reportBoard(boardNo);
		if (status > 0) { // 성공
			String msg = URLEncoder.encode("신고가 접수되었습니다.", "UTF-8");
			resp.sendRedirect(req.getContextPath() + "/board/detail.do?boardNo=" + boardNo + "&idx=" + idx
					+ "&levelChk=" + levelChk + "&msg=" + msg);
		} else { // 실패
			req.getRequestDispatcher("/views/board/write.jsp").forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
