package kr.or.ddit.admin.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.ddit.admin.service.AdminServiceImpl;
import kr.or.ddit.admin.service.IAdminService;
import kr.or.ddit.admin.vo.MemberReqVO;

@WebServlet("/views/adminPage.do")
public class Admin extends HttpServlet {
    
	private static final long serialVersionUID = 1L;
// 회원정보 목록 가져오기 
   private IAdminService adminservice = AdminServiceImpl.getInstance();
   
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      
	   // 회원정보 목록 가져오기 
	   List<MemberReqVO> memberList = adminservice.selectmemList();
	   req.setAttribute("memberList", memberList);
	   req.getRequestDispatcher("/views/admin/adminPage.jsp").forward(req, resp);
   }
   
   
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	   
	   MemberReqVO memberReqVO = new MemberReqVO();
	   memberReqVO = adminservice.selectmember(req.getParameter("usersNo" ));
	    
	   Gson gson = new Gson();
	   String json = gson.toJson(memberReqVO);
	   
	   PrintWriter wrt = resp.getWriter();
	   wrt.print(json);
	   
		/*
		
		 * 
		 * 
		 * 
		 * // 요청받은 위치( ajax)로 응답보내주기 
		 * Gson gson = new Gson(); 
		 * String json = gson.toJson(memberList); 
		 * resp.getWriter().print(json);
		 */
    
   }
}
