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

@WebServlet("/adminPage.do")
public class admin extends HttpServlet {
    
   // 회원정보 목록 가져오기 
   private IAdminService adminservice = AdminServiceImpl.getInstance();
   
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	   // 회원정보 목록 가져오기 
      List<memberReqVO> memberList = adminservice.selectmemList();

      req.setAttribute("memberList", memberList);
       
      req.getRequestDispatcher("/adminPage.jsp").forward(req, resp);
   }
   
   
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      
      
//         // 회원 가입 신청 처리
//        String user = req.getParameter("user");
//        String action = req.getParameter("action");
//
//        if ("approve".equals(action)) {
//            // 가입 승인
//            memberRequests.remove(user);
//            System.out.println("가입 승인: " + user);
//        } else if ("reject".equals(action)) {
//            // 가입 거부
//            memberRequests.remove(user);
//            System.out.println("가입 거부: " + user);
//        }
//
//        // 처리가 완료되면 다시 회원 가입 신청 목록 페이지로 리다이렉트
//        resp.sendRedirect(req.getContextPath() + "/admin/member_requests");
    
   }
}
