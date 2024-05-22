package kr.or.ddit.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.admin.service.AdminServiceImpl;
import kr.or.ddit.admin.service.IAdminService;
import kr.or.ddit.admin.vo.MemberReqVO;
import kr.or.ddit.util.MyBatisUtil;


@WebServlet("/views/adminaccept.do")
public class AdminAccept extends HttpServlet {
	
	IAdminService service = AdminServiceImpl.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberReqVO memreqVO = new MemberReqVO();
	
		req.setAttribute("memreqVO", memreqVO);
		req.getRequestDispatcher("/views/admin/adminPage.jsp").forward(req, resp);	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberReqVO memreqVO = new MemberReqVO();
		
		req.setAttribute("memreqVO", memreqVO);
		

		
//		 int cnt = service.AdminAccept(usersNo);
		
	
			SqlSession session = MyBatisUtil.getSqlSession();
			
			  try {
		            // 매퍼를 호출하여 쿼리 실행
		            int usersno = Integer.parseInt(req.getParameter("usersNo"));
		            session.update("adminAccept", usersno);
		            session.commit(); // 커밋
		           
		            resp.sendRedirect(req.getContextPath() + "/views/adminPage.do");
		        } finally {
		        	session.close(); // 세션 닫기
		        }
		    }
		
		 
		  
	}

