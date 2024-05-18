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
    MemberVO wd = (MemberVO)request.getAttribute("writerDetail");
    HomeworkVO hw = (HomeworkVO)request.getAttribute("hwDetail");
    int classNo = hw.getHwClass();
%>

 <main>
      <!-- ======= End Page Header ======= -->
      <div class="page-header sub d-flex align-items-center">
        <div class="container position-relative">
          <div class="row d-flex justify-content-center">
            <div class="text-center">
              <p class="mb-5 d-flex justify-content-between">
              	<a href="/allBoard.do"><i class="bi bi-chevron-left"></i> 뒤로가기 </a>
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
      <!-- End Page Header -->
      <section class="view">
      
      <%-- <!-- START 파일 -->     
        <div class="container pt-5 pb-5" data-aos="fade-up">
          <%
          	if(bv.getFileNo() != 0){
          %>
          <a href="file/01.수행계획서.odt" download class="attached-file d-flex justify-content-between align-items-center">
            <span>
              <i class="bi bi-download px-2"></i> 01.수행계획서.odt </span>
            <span>23KB</span>
          </a>
          <%  
          }
          %>
        <!-- END 파일 --> --%>
        <div class="container pt-5 pb-5" data-aos="fade-up">
         <div style="word-wrap: break-word;"><%=hw.getHwCon() %></div>
         <div>
          
          <!-- START MENU -->
          
         <div class="btn-box container d-flex align-items-center justify-content-center pb-5 pt-5 gap-2">
          <%
          //세션에서 꺼내와야함. + 위에 댓글입력창 닉네임 또한 함께 수정 + 댓글 수정 삭제 보이는 부분도users에서 역할role로 비교해야함!!!!!1
          if(wd.getUsersNo()==3){
          %>
          <a href="<%=request.getContextPath()%>/classTeacherBoard.do?classNo=<%=hw.getHwClass() %>" type="button" class="btn btn-secondary">메인으로</a>
          <a href="<%=request.getContextPath()%>/board/edit.do" type="button" class="btn btn-secondary">수정하기</a>
          <a href="<%=request.getContextPath()%>/board/delete.do" type="button" class="btn btn-secondary">삭제하기</a>
          <%
          }else{
          %>
          <a href="<%=request.getContextPath()%>/classTeacherBoard.do?classNo=<%=hw.getHwClass() %>" type="button" class="btn btn-secondary">메인으로</a>
          <a href="<%=request.getContextPath()%>/board/edit.do" type="button" class="btn btn-secondary" style="color:orange;">제출하기</a>
          <%
          }
          %>
        </div>
        
        <!-- END MENU -->
      </section>
    </main>

<%@include file="/footer.jsp" %>