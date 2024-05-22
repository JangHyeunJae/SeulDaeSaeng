<%@page import="kr.or.ddit.board.vo.HomeworkVO"%>
<%@page import="com.itextpdf.text.log.SysoCounter"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.ddit.board.service.BoardServiceImpl"%>
<%@page import="kr.or.ddit.board.service.IBoardService"%>
<%@page import="kr.or.ddit.board.vo.ReplyVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.board.vo.FileDetailVO"%>
<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/header.jsp" %>
<%
    IBoardService boardService = BoardServiceImpl.getInstance();
    int hwNo = (int)request.getAttribute("hwNo");
    HomeworkVO hw = (HomeworkVO)request.getAttribute("hwDetail");
    
    
    MemberVO wd = (MemberVO)request.getAttribute("writerDetail");
    MemberVO memDetail = (MemberVO)session.getAttribute("memDetail");
    int levelChk = Integer.parseInt(memDetail.getMemClass());
	int usersRole = (int)session.getAttribute("usersRole");
    
    int classNo = hw.getHwClass();
%>

 <main>
      <div class="page-header sub d-flex align-items-center">
        <div class="container position-relative">
          <div class="row d-flex justify-content-center">
            <div class="text-center">
              <p class="mb-5 d-flex justify-content-between">
              <a href="<%=request.getContextPath() %>/homework/detail.do?hwNo=<%=hw.getHwNo() %>&levelChk=<%=levelChk %>"><i class="bi bi-chevron-left"></i> 뒤로가기 </a>
              </p>
              <p class="mb-0">
                <small class="badge bg-body-secondary mb-3 me-2">
               <%=hw.getHwClass() %>호 숙제
                </small>
              </p>
              <h3><%=hw.getHwTitle() %></h3>
              <small>숙제기한 : <%=hw.getHwStart() %> ~ <%=hw.getHwStart() %></small><br>
              <small>작성자 : <%=wd.getMemNick() %></small>
            </div>
          </div>
        </div>
      </div>

      <section class="view">
         <div class="container pt-5 pb-5" data-aos="fade-up">
            <div style="word-wrap: break-word;"><%=hw.getHwCon() %></div>
         </div>
         <div class="btn-box container d-flex align-items-center justify-content-center pb-5 pt-5 gap-2">
          <a href="<%=request.getContextPath()%>/classBoard.do?levelChk=<%=levelChk %>" type="button" class="btn btn-secondary" style="background-color:orange; border-color:orange;">제출하기</a>

        </div>
        
        <!-- END MENU -->
      </section>
    </main>

<%@include file="/footer.jsp" %>