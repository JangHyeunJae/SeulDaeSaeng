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
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.UsersVO;

@WebServlet("/classBoard.do")
public class ClassBoardListController extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 
		IBoardService boardService = BoardServiceImpl.getInstance();
		 //세션에서 현재 로그인 정보 가져오기
         //1-선생님, 2-학생 일때 구분해서 jsp다르게 보내기
		 int usersNo = 3; 
		 UsersVO uv = boardService.getUsersDetail(usersNo);
         if(uv.getUsersRole()==1) {
		     req.getRequestDispatcher("/views/board/classTeacherBoardIntro.jsp").forward(req, resp);
         }else if(uv.getUsersRole()==2) {
        	 req.getRequestDispatcher("/views/board/classBoard.jsp").forward(req, resp);
         }
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 doGet(req, resp);
	}
}