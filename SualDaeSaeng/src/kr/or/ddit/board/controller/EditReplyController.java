package kr.or.ddit.board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;

@WebServlet("/board/editReply.do")
public class EditReplyController extends HttpServlet{
	
	private IBoardService service = BoardServiceImpl.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String replyCon = req.getParameter("replyCon");
		int levelChk = Integer.parseInt(req.getParameter("levelChk"));
		int boardNo = Integer.parseInt(req.getParameter("boardNo"));		
		int idx = Integer.parseInt(req.getParameter("idx"));
		int replyNo = Integer.parseInt(req.getParameter("replyNo"));

		Map<String,Object> parameter = new HashMap<>();
		parameter.put("replyCon", replyCon);
		parameter.put("replyNo", replyNo);
		
		int status = service.updateReply(parameter);
		if(status > 0) { 	// 성공
			resp.sendRedirect("/board/detail.do?boardNo=" + boardNo + "&idx=" + idx + "&levelChk=" + levelChk
					+ "&editReply=-1");
		}else {				// 실패
			req.getRequestDispatcher("/views/board/write.jsp").forward(req, resp);
		}
	}
}
