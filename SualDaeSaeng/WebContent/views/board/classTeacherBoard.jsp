<%@page import="kr.or.ddit.board.vo.FileDetailVO"%>
<%@page import="kr.or.ddit.board.vo.HomeworkVO"%>
<%@page import="kr.or.ddit.board.service.BoardServiceImpl"%>
<%@page import="kr.or.ddit.board.service.IBoardService"%>
<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.time.Period"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/header.jsp" %>
<%
    IBoardService service = BoardServiceImpl.getInstance();

    int classNo = (int)request.getAttribute("classNo");
    MemberVO tdetail = (MemberVO)request.getAttribute("tDetail");
    int usersNo = (int)request.getAttribute("usersNo");
    List<BoardVO> noticeBoardList = (List<BoardVO>)request.getAttribute("noticeBoardList");
    List<BoardVO> classBoardList = (List<BoardVO>)request.getAttribute("classBoardList");
    List<FileDetailVO> fileList = (List<FileDetailVO>)request.getAttribute("fileList");
	List<HomeworkVO> hwList = service.getHwList();
    
    LocalDate today = LocalDate.now();
    long daysDiff = ChronoUnit.DAYS.between(today,tdetail.getMemRegdt().plusDays(190));
    
%>
<main>
  <section id="calssBoard" class="gallery-single ">
    <div class="container-xl">
      <div class="row justify-content-between gy-4">
        <div class="col-lg-3">
          <div class="portfolio-info sticky-top">
            <h3>
              <span><%=classNo %>호</span>
            </h3>
            <ul>
              <li>
                <strong>이름(닉네임) </strong>
                <span><%=tdetail.getMemName() %> (<%=tdetail.getMemNick() %>)</span>
              </li>
              <li>
                <strong><%=classNo %>호 퇴소일자</strong>
                <span><%=tdetail.getMemRegdt().plusDays(190) %> (d-<%=daysDiff %>)</span>
              </li>
              <li>
                <a href="<%=request.getContextPath()%>/timetable.do" class="btn-visit align-self-start">수업 시간표 확인</a>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-lg-9">
          <div class="portfolio-description">
            <div class="section-header">
              <h2>File</h2>
              <p class="d-flex justify-content-between align-items-center"> 수업 파일 공유 
                <button type="button" class="btn btn-outline-warning btn-sm" onclick="location.href='<%=request.getContextPath() %>/file/fileList.do?classNo=<%=classNo %>'">이전 파일 더보기</button>
              </p>
            </div>
            <!-- 파일 input -->
            
            <form class="file-drop" method="post" action="/file/upload.do?classNo=<%=classNo %>" enctype="multipart/form-data">
              <input type="file" name="upload" id="upload-file" multiple>
              <!-- 아래 label 내용 변경하지 마세요. js와 연동 -->
              <label for="upload-file">파일을 드레그하거나 클릭해서 등록</label>
              <button type="submit" ><i class="bi bi-arrow-bar-up"></i></button>
            </form>
            
            <!-- end 파일 input -->
            
            
            <div class="list-group">
            <%
            int fileSize = fileList.size();
            if(fileSize>4){
            	fileSize=4;
            }
            %>
            
             <%
              for(int i=0 ; i<fileSize ; i++){
            	  FileDetailVO fd = fileList.get(i);
            	 
             %>
              <a href="<%=request.getContextPath() %>/file/download.do?fileNo=<%=fd.getFileNo() %>" class="list-group-item py-2 d-flex justify-content-between align-items-center">
                <span>
                  <i class="bi bi-download px-2"></i> <%=fd.getFileOgname() %> </span>
                <span> <%=fd.getFileSize() %></span>
              </a>
              <%
              }
              %>
            </div>
          </div>
          <div class="portfolio-description homework">
            <div class="section-header">
              <h2>board</h2>
              <p class="d-flex justify-content-between align-items-center"> 제출한 숙제 체크
              <button type="button" class="btn btn-outline-warning btn-sm" 
              onclick="location.href='<%=request.getContextPath()%>/homework/write.do?classNo=<%=classNo %>'">숙제 작성하기</button>
              </p>
            </div>
            <div class="list-group d-flex justify-content-start align-items-center flex-row p-3 gap-3">
              <%
              for(int i=0;i<hwList.size();i++){
            	  HomeworkVO hw = hwList.get(i);
              %>
              <a href="#" class="card">
                <div class="card-body">
                  <div class="d-flex justify-content-between align-items-center">
                    <h5 class="card-title text-truncate"><%=hw.getHwTitle() %></h5>
                  </div>
                  <small>제출인원(5)</small>
                  <p class="card-text "> <%=hw.getHwEnd() %>까지</p>
                </div>
              </a>
              <%
              }
              %>
            </div>
          </div>
          <div class="portfolio-description d-flex justify-content-between gap-5">
            
            <!-- 공지사항 출력 -->
            
            <div class="col">
              <div class="section-header">
                <h2>board</h2>
                <p class="d-flex justify-content-between align-items-center"> 공지사항 
                <button type="button" class="btn btn-outline-warning btn-sm" 
                onclick="location.href='<%=request.getContextPath()%>/eachClassNotice.do?classNo=<%=classNo %>'">더보기</button>
                </p>
              </div>
              <div class="list-group">
               <%
				if (noticeBoardList == null || noticeBoardList.isEmpty()) {
			    %>
			    <p>    작성된 공지사항이 없습니다</p>
               <%
				}else{
					int length = noticeBoardList.size();
					if(noticeBoardList.size()>=4){
						length = 4;
					}
                for(int i=0 ; i<length ; i++){
                	BoardVO bv = noticeBoardList.get(i);
               %>
                <a href="#" class="list-group-item d-flex w-100 justify-content-between align-items-center py-3">
                  <h6 class="mb-2 text-truncate">
                    <small class="attach">
                      <i class="bi bi-paperclip"></i>
                    </small> <%=bv.getBoardTitle() %>
                  </h6>
                  <small class="days"><%=bv.getBoardAt() %></small>
                </a>
                 <%
                 }
				}
               %>
              </div>
            </div>
            
            <!-- 반게시글 출력 -->
            
            <div class="col">
              <div class="section-header">
                <h2>board</h2>
                <p class="d-flex justify-content-between align-items-center"> 반 게시판 
                <button type="button" class="btn btn-outline-warning btn-sm" 
                onclick="location.href='<%=request.getContextPath()%>/eachClassBoard.do?classNo=<%=classNo %>'">더보기</button>
                </p>
              </div>
              <div class="list-group">
              <%
				if (classBoardList == null || classBoardList.isEmpty()) {
			    %>
			    <p>    작성된 게시글이 없습니다</p>
               <%
				}else{
					int length = classBoardList.size();
					if(classBoardList.size()>=4){
						length = 4;
					}
                for(int i=0 ; i<length ; i++){
                	BoardVO bv = classBoardList.get(i);
               %>
                <a href="#" class="list-group-item d-flex w-100 justify-content-between align-items-center py-3">
                  <h6 class="mb-2 text-truncate">
                    <small class="attach">
                      <i class="bi bi-paperclip"></i>
                    </small> <%=bv.getBoardTitle() %>
                  </h6>
                  <small class="days"><%=bv.getBoardAt() %></small>
                </a>
                 <%
                 }
				}
               %>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</main>
<%@include file="/footer.jsp" %>