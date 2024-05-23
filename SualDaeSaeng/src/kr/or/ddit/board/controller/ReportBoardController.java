package kr.or.ddit.board.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.util.MyBatisUtil;

@WebServlet("/board/report.do")
public class ReportBoardController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		IBoardService boardService = BoardServiceImpl.getInstance();

		int boardNo = Integer.parseInt(req.getParameter("boardNo"));
		int levelChk = Integer.parseInt(req.getParameter("levelChk"));
		int idx = Integer.parseInt(req.getParameter("idx"));
		int classBoardChk = 0;
		if(req.getParameter("classBoardChk")!=null) {
			classBoardChk = Integer.parseInt(req.getParameter("classBoardChk"));
		}
		
		int status = boardService.reportBoard(boardNo);
		if (status > 0) { // 성공
			String msg = "신고가 접수되었습니다.";
			req.getSession().setAttribute("msg", msg);
			if(classBoardChk != 0) {
				resp.sendRedirect(req.getContextPath() + "/board/detail.do?boardNo=" + boardNo + "&idx=" + idx + "&levelChk=" + levelChk
						+ "&classBoardChk=" + classBoardChk);
			}else {
				resp.sendRedirect(req.getContextPath() + "/board/detail.do?boardNo=" + boardNo + "&idx=" + idx + "&levelChk=" + levelChk);
			}
		} else { // 실패
			req.getRequestDispatcher("/views/board/write.jsp").forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
		SqlSession session = MyBatisUtil.getSqlSession();
		
		  try {
	            // 매퍼를 호출하여 쿼리 실행
	            int boardNo = Integer.parseInt(req.getParameter("boardNo"));
	            session.update("reportNo", boardNo);
	            session.commit(); // 커밋
	           
	            resp.sendRedirect(req.getContextPath() + "/views/adminPage.do");
	        } finally {
	        	session.close(); // 세션 닫기
	        }
		
	}
}
