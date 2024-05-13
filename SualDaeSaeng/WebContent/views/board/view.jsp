<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.board.vo.FileDetailVO"%>
<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/header.jsp" %>
<%
    List<BoardVO> boardList = (List<BoardVO>)request.getAttribute("boardList");
	BoardVO bv = (BoardVO)request.getAttribute("boardDetail");
    FileDetailVO fdv = (FileDetailVO)request.getAttribute("fileDetail");
    MemberVO mv = (MemberVO)request.getAttribute("memDetail");
    String memNick = ""; 
    int level = bv.getBoardLevel();
    int no = bv.getBoardNo();
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
                <%if(level==1){ %> 자유게시판 <%}else if(level==2){ %> 공부게시판 <%}else if(level==3){ %> 공지 <%}else if(level==4){ %> 반별 <%} %>
                </small>
                <small><%=bv.getBoardAt() %></small>
              </p>
              <h3><%=bv.getBoardTitle() %></h3>
              <small><%=bv.getUserNo() %></small>
            </div>
          </div>
        </div>
      </div>
      <!-- End Page Header -->
      <section class="view">
        
        <div class="container d-flex p-0">
          <div class="prve col-md-6 col-12 none-post ps-2">
            <a href="#" class="d-block pt-4 pb-4">
              <span class="d-inline-block pe-3">이전글 <i class="bi bi-chevron-up"></i>
              </span>
              <b>이전글이 없습니다.</b>
            </a>
          </div>
          <div class="next col-md-6 col-12 text-end pe-2">
            <a href="#" class="d-block pt-4 pb-4">
              <b class="pe-3">게시글 제목입니다.</b>
              <span class="d-inline-block">다음글 <i class="bi bi-chevron-down"></i></span>
            </a>
          </div>
        </div>
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
        <div class="pt-5 container">
          <small class="mb-5 d-block">6 Comments</small>
          <ul class="comment-list">
            <li class="comment">
              <div class="vcard">
                <img src="../img/testimonials/testimonials-1.jpg" alt="Image placeholder">
              </div>
              <div class="comment-body">
                <h3>Jean Doe</h3>
                <div class="meta">January 9, 2018 at 2:21pm</div>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
                <p><a href="#" class="reply rounded">Reply</a></p>
              </div>
            </li>

            <li class="comment">
              <div class="vcard">
                <img src="../img/testimonials/testimonials-2.jpg" alt="Image placeholder">
              </div>
              <div class="comment-body">
                <h3>Jean Doe</h3>
                <div class="meta">January 9, 2018 at 2:21pm</div>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
                <p><a href="#" class="reply rounded">Reply</a></p>
              </div>

              <ul class="children">
                <li class="comment">
                  <div class="vcard">
                    <img src="../img/testimonials/testimonials-3.jpg" alt="Image placeholder">
                  </div>
                  <div class="comment-body">
                    <h3>Jean Doe</h3>
                    <div class="meta">January 9, 2018 at 2:21pm</div>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
                    <p><a href="#" class="reply rounded">Reply</a></p>
                  </div>


                  <ul class="children">
                    <li class="comment">
                      <div class="vcard">
                        <img src="../img/testimonials/testimonials-4.jpg" alt="Image placeholder">
                      </div>
                      <div class="comment-body">
                        <h3>Jean Doe</h3>
                        <div class="meta">January 9, 2018 at 2:21pm</div>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
                        <p><a href="#" class="reply rounded">Reply</a></p>
                      </div>

                      <ul class="children">
                        <li class="comment">
                          <div class="vcard">
                            <img src="../img/testimonials/testimonials-5.jpg" alt="Image placeholder">
                          </div>
                          <div class="comment-body">
                            <h3>Jean Doe</h3>
                            <div class="meta">January 9, 2018 at 2:21pm</div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
                            <p><a href="#" class="reply rounded">Reply</a></p>
                          </div>
                        </li>
                      </ul>
                    </li>
                  </ul>
                </li>
              </ul>
            </li>
            <li class="comment">
              <div class="vcard">
                <img src="../img/testimonials/testimonials-1.jpg" alt="Image placeholder">
              </div>
              <div class="comment-body">
                <h3>Jean Doe</h3>
                <div class="meta">January 9, 2018 at 2:21pm</div>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
                <p><a href="#" class="reply rounded">Reply</a></p>
              </div>
            </li>
          </ul>
          <!-- END comment-list -->

          <div class="contact pt-5">
            <form action="#" class="p-5">
              <div class="form-group">
                <!-- 자동입력 -->
                <input type="text" class="form-control" id="name" placeholder="닉네임" readonly> 
              </div>
              <div class="form-group">
                <textarea name="" id="message" cols="30" rows="10" class="form-control" placeholder="내용을 작성해주세요."></textarea>
              </div>
              <div class="form-group text-center">
                <button type="submit" >전송</button>
              </div>
            </form>
          </div>
        </div>
        <div class="btn-box container d-flex align-items-center justify-content-center pb-5 pt-5 gap-2">
          <a href="/allBoard.do" type="button" class="btn btn-secondary">목록으로</a>
          <a href="/board/edit.do" type="button" class="btn btn-secondary">수정하기</a>
          <a href="#" type="button" class="btn btn-secondary">삭제하기</a>
        </div>
      </section>
    </main>

<%@include file="/footer.jsp" %>