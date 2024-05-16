package kr.or.ddit.admin.controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.admin.service.AdminServiceImpl;
import kr.or.ddit.admin.service.IAdminService;
import kr.or.ddit.admin.vo.memberReqVO;

@WebServlet("/views/adminPage.do")
public class admin extends HttpServlet {
    
   // 회원정보 목록 가져오기 
   private IAdminService adminservice = AdminServiceImpl.getInstance();
   
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	   // 회원정보 목록 가져오기 
      List<memberReqVO> memberList = adminservice.selectmemList();

      req.setAttribute("memberList", memberList);
      
      req.getRequestDispatcher("/views/admin/adminPage.jsp").forward(req, resp);
   }
   
   
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    
   }
}
