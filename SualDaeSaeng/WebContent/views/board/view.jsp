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
    List<BoardVO> boardList = (List<BoardVO>)request.getAttribute("boardList");
    List<ReplyVO> replyList = (List<ReplyVO>)request.getAttribute("replyList");
    MemberVO wd = (MemberVO)request.getAttribute("writerDetail");
	BoardVO bv = (BoardVO)request.getAttribute("boardDetail");
    
    int idx = Integer.parseInt(request.getParameter("idx"))-1;
    
    int level = bv.getBoardLevel();
    String boardName = null;
    if(level == 1) boardName = "자유게시판";
    else if(level == 2) boardName = "공부게시판";
    else if(level == 3) boardName = "공지사항";
    else boardName = "전체게시판";
%>

 <main>
      <!-- ======= End Page Header ======= -->
      <div class="page-header sub d-flex align-items-center">
        <div class="container position-relative">
          <div class="row d-flex justify-content-center">
            <div class="text-center">
              <p class="mb-5 d-flex justify-content-between">
                <a href="/allBoard.do"><i class="bi bi-chevron-left"></i> 뒤로가기 </a>
                <small class="look"><i class="bi bi-eye"></i> <%=bv.getBoardHit() %> </small>
              </p>
              <p class="mb-0">
                <small class="badge bg-body-secondary mb-3 me-2">
               <%=boardName %>
                </small>
                <small><%=bv.getBoardAt() %></small>
              </p>
              <h3><%=bv.getBoardTitle() %></h3>
              <small>작성자 : <%=wd.getMemNick() %></small>
            </div>
          </div>
        </div>
      </div>
      <!-- End Page Header -->
      <section class="view">
        
      <!-- START 이전글/다음글 구분 출력 -->
        
        <div class="container d-flex p-0">
             
             <!-- 이전글 -->
             <%
             if(idx == 0){
              %>
          
          <div class="prve col-md-6 col-12 none-post ps-2">
            <a href="#" class="d-block pt-4 pb-4">
              <span class="d-inline-block pe-3">이전글 <i class="bi bi-chevron-up"></i></span> 
              <b>이전글이 없습니다.</b>
            </a>
          </div>
             <%
              }else{
                  BoardVO beforeBoardDetail = boardList.get(idx-1); 
              %>
           <div class="prve col-md-6 col-12 ps-2">
            <a href="#" class="d-block pt-4 pb-4">
              <span class="d-inline-block pe-3">이전글 <i class="bi bi-chevron-up"></i></span> 
              <b><%=beforeBoardDetail.getBoardTitle() %></b>
            </a>
          </div>
              <%
              }
              %>
              
              <!-- 다음글 -->
              <% 
              if(idx == boardList.size()-1){
              %>
             <div class="next col-md-6 col-12 text-end none-post pe-2">
              <a href="#" class="d-block pt-4 pb-4">
                <b class="pe-3">다음글이 없습니다.</b>
                <span class="d-inline-block">다음글 <i class="bi bi-chevron-down"></i></span>
             </a>
            </div>
             <%
              }else{
                  BoardVO nextBoardDetail =  boardList.get(idx+1); 
              %>
             <div class="next col-md-6 col-12 text-end pe-2">
              <a href="#" class="d-block pt-4 pb-4">
                <b class="pe-3"><%=nextBoardDetail.getBoardTitle() %></b>
                <span class="d-inline-block">다음글 <i class="bi bi-chevron-down"></i></span>
             </a>
            </div>
              <%
              }
              %>
         </div>
         
      <!-- END 이전글/다음글 구분 출력-->
      
      <!-- START 파일 + 컨텐츠 출력 -->     
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
          <div><%=bv.getBoardCon() %></div>
        <!-- END 파일 + 컨텐츠 출력 -->
          
         <!-- START comment-list -->
         
        <div class="pt-5 container">
         <small class="mb-5 d-block"><%=replyList.size() %>개의 댓글</small>
          <ul class="comment-list">
          <%
          for(ReplyVO rv : replyList){
        	   Map<String,Object> parameter = new HashMap<>();
     		   parameter.put("usersNo",rv.getUsersNo());
     		   parameter.put("replyNo",rv.getReplyNo());
        	   MemberVO replyWriterDetail = boardService.getReplyWriterDetail(parameter);
          %>
             <li class="comment">
              <div class="vcard">
                <img src="../img/testimonials/testimonials-1.jpg" alt="Image placeholder">
              </div>
              <div class="comment-body">
              <h3><%=replyWriterDetail.getMemNick() %></h3>
                <div class="meta"><%=rv.getReplyDt() %></div>
                <p><%=rv.getReplyCon() %></p>
                <p><a href="#" class="reply rounded">Reply</a></p>
              </div>
             </li>
          <%
          }
          %>
          </ul>
          
          <!-- END comment-list -->


          <!-- START reply-insert -->
          
          <div class="contact pt-5">
            <form action="<%=request.getContextPath()%>/board/detail.do?boardNo=<%=bv.getBoardNo() %>&idx=<%=idx+1 %>" method="post" role="form" id="insertForm" class="p-5">
              <div class="form-group">
                <!-- 자동입력 -->
                 <input type="text" class="form-control" id="replyNick" placeholder="<%=wd.getMemNick() %>" readonly> 
              </div>
              <div class="form-group">
                <textarea name="replyCon" id="replyCon" cols="30" rows="10" class="form-control" placeholder="내용을 작성해주세요."></textarea>
              </div>
              <div class="form-group text-center">
                <button type="submit" id="submitBtn">댓글 작성하기</button>
              </div>
            </form>
          </div>
        </div>
        
          <!-- END reply-insert -->
          
          <!-- START MENU -->
          
        <div class="btn-box container d-flex align-items-center justify-content-center pb-5 pt-5 gap-2">
          <a href="/allBoard.do" type="button" class="btn btn-secondary">목록으로</a>
          <%
          //세션에서 꺼내와야함. + 위에 댓글입력창 닉네임 또한 함께 수정
          if(bv.getUsersNo()==1){
          %>
          <a href="/board/edit.do" type="button" class="btn btn-secondary">수정하기</a>
          <a href="/board/delete.do?boardNo=<%=bv.getBoardNo() %>" type="button" class="btn btn-secondary">삭제하기</a>
          <%
          }
          %>
        </div>
        
        <!-- END MENU -->
      </section>
    </main>
    <script>
	   var submitBtn = $("#submitBtn");
	   var insertForm = $("#insertForm");

	   $("#submitBtn").on("click", function() {
           var replyCon = $("#replyCon").val();
           insertForm.submit();
	   });
    </script>

<%@include file="/footer.jsp" %>