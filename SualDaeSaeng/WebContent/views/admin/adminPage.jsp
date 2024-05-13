<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.admin.vo.memberReqVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- 
// 	memberReqVO memberreqVO = (memberReqVO) request.getAttribute("memberreqVO");
--%>

<%@include file="/header.jsp" %>

<main data-aos="fade" data-aos-delay="1500">
  <section id="calssBoard" class="gallery-single ">
    <div class="container-xl">
      <div class="col-lg-12">
        <div class="portfolio-description homework">
          <div class="section-header">
            <h2>Request</h2>
            <p class="d-flex justify-content-between align-items-center"> 
              회원가입 요청내용
              <button type="button" class="btn btn-outline-warning btn-sm">완료된 요청보기</button>
            </p>
          </div>
          <div class="list-group d-flex justify-content-start align-items-center flex-row p-3 gap-3">
          	<% for(memberReqVO member : (List<memberReqVO>)request.getAttribute("memberRequests"))  { %>
            <a href="#" class="card">
              <div class="card-body">
                <div class="d-flex justify-content-between align-items-center">
                  <h5 class="card-title text-truncate"><%=member.getMemName() %>이름(닉네임)</h5>
                  <small><%=member.getMemClass() %>304호</small>
                </div>
                <p class="card-text ">2024-02-01 (입학일자)</p>
              </div>
            </a>
            <% } %>
          </div>
        </div>
          <div class="portfolio-description d-flex justify-content-between gap-5">
            <div class="col">
              <div class="section-header">
                <h2>Request</h2>
                <p class="d-flex justify-content-between align-items-center"> 신고된 게시글 
                  <button type="button" class="btn btn-outline-warning btn-sm">더보기</button>
                </p>
              </div>
              <div class="list-group">
                <a href="#" class="list-group-item d-flex w-100 justify-content-between align-items-center py-3">
                  <h6 class="mb-2 text-truncate">
                    <small class="badge bg-light">자유</small>
                    <small class="attach">
                      <i class="bi bi-paperclip"></i>
                    </small> List group item heading
                  </h6>
                  <small class="days">2024-05-03</small>
                </a>
                <a href="#" class="list-group-item d-flex w-100 justify-content-between align-items-center py-3">
                  <h6 class="mb-2 text-truncate">
                    <small class="badge bg-light">자유</small>
                    <small class="attach">
                      <i class="bi bi-paperclip"></i>
                    </small> List group item heading
                  </h6>
                  <small class="days">2024-05-03</small>
                </a>
                <a href="#" class="list-group-item d-flex w-100 justify-content-between align-items-center py-3">
                  <h6 class="mb-2 text-truncate">
                    <small class="badge bg-light">자유</small>
                    <small class="attach">
                      <i class="bi bi-paperclip"></i>
                    </small> List group item heading
                  </h6>
                  <small class="days">2024-05-03</small>
                </a>
                <a href="#" class="list-group-item d-flex w-100 justify-content-between align-items-center py-3">
                  <h6 class="mb-2 text-truncate">
                    <small class="badge bg-light">자유</small>
                    <small class="attach">
                      <i class="bi bi-paperclip"></i>
                    </small> List group item heading
                  </h6>
                  <small class="days">2024-05-03</small>
                </a>
              </div>
            </div>
            <div class="col">
              <div class="section-header">
                <h2>board</h2>
                <p class="d-flex justify-content-between align-items-center"> 오류제보 <button type="button" class="btn btn-outline-warning btn-sm">더보기</button>
                </p>
              </div>
              <div class="list-group">
                <a href="#" class="list-group-item d-flex w-100 justify-content-between align-items-center py-3">
                  <h6 class="mb-2 text-truncate">
                    <small class="badge bg-light">주제내용</small>
                    오류제보 제목
                  </h6>
                  <small class="days">2024-05-03</small>
                </a>
                <a href="#" class="list-group-item d-flex w-100 justify-content-between align-items-center py-3">
                  <h6 class="mb-2 text-truncate">
                    <small class="badge bg-light">주제내용</small>
                    오류제보 제목
                  </h6>
                  <small class="days">2024-05-03</small>
                </a>
                <a href="#" class="list-group-item d-flex w-100 justify-content-between align-items-center py-3">
                  <h6 class="mb-2 text-truncate">
                    <small class="badge bg-light">주제내용</small>
                    오류제보 제목
                  </h6>
                  <small class="days">2024-05-03</small>
                </a>
                <a href="#" class="list-group-item d-flex w-100 justify-content-between align-items-center py-3">
                  <h6 class="mb-2 text-truncate">
                    <small class="badge bg-light">주제내용</small>
                    오류제보 제목
                  </h6>
                  <small class="days">2024-05-03</small>
                </a>
              </div>
            </div>
          </div>
          <div class="portfolio-description">
            <div class="section-header">
              <h2>Request</h2>
              <p class="d-flex justify-content-between align-items-center"> 신고 많은 회원 
                <button type="button" class="btn btn-outline-warning btn-sm">전체보기</button>
              </p>
            </div>
            <div class="portfolio-description d-flex gap-5 ">
              <div class="list-group col">
                <a href="#" class="list-group-item py-2 d-flex justify-content-between align-items-center">
                  <span>
                    <i class="bi bi-person-fill px-2"></i> 
                    <b>닉네임(ID)</b>
                    <small>2024-02-01 (304호)</small>
                  </span>
                  <span class="text-danger"><small>신고횟수</small> <b>10</b></span>
                </a>
                <a href="#" class="list-group-item py-2 d-flex justify-content-between align-items-center">
                  <span>
                    <i class="bi bi-person-fill px-2"></i> 
                    <b>닉네임(ID)</b>
                    <small>2024-02-01 (304호)</small>
                  </span>
                  <span class="text-danger"><small>신고횟수</small> <b>10</b></span>
                </a>
                <a href="#" class="list-group-item py-2 d-flex justify-content-between align-items-center">
                  <span>
                    <i class="bi bi-person-fill px-2"></i> 
                    <b>닉네임(ID)</b>
                    <small>2024-02-01 (304호)</small>
                  </span>
                  <span class="text-danger"><small>신고횟수</small> <b>10</b></span>
                </a>
                <a href="#" class="list-group-item py-2 d-flex justify-content-between align-items-center">
                  <span>
                    <i class="bi bi-person-fill px-2"></i> 
                    <b>닉네임(ID)</b>
                    <small>2024-02-01 (304호)</small>
                  </span>
                  <span class="text-danger"><small>신고횟수</small> <b>10</b></span>
                </a>
                <a href="#" class="list-group-item py-2 d-flex justify-content-between align-items-center">
                  <span>
                    <i class="bi bi-person-fill px-2"></i> 
                    <b>닉네임(ID)</b>
                    <small>2024-02-01 (304호)</small>
                  </span>
                  <span class="text-danger"><small>신고횟수</small> <b>10</b></span>
                </a>
              </div>
              <div class="list-group col">
                <a href="#" class="list-group-item py-2 d-flex justify-content-between align-items-center">
                  <span>
                    <i class="bi bi-person-fill px-2"></i> 
                    <b>닉네임(ID)</b>
                    <small>2024-02-01 (304호)</small>
                  </span>
                  <span class="text-danger"><small>신고횟수</small> <b>10</b></span>
                </a>
                <a href="#" class="list-group-item py-2 d-flex justify-content-between align-items-center">
                  <span>
                    <i class="bi bi-person-fill px-2"></i> 
                    <b>닉네임(ID)</b>
                    <small>2024-02-01 (304호)</small>
                  </span>
                  <span class="text-danger"><small>신고횟수</small> <b>10</b></span>
                </a>
                <a href="#" class="list-group-item py-2 d-flex justify-content-between align-items-center">
                  <span>
                    <i class="bi bi-person-fill px-2"></i> 
                    <b>닉네임(ID)</b>
                    <small>2024-02-01 (304호)</small>
                  </span>
                  <span class="text-danger"><small>신고횟수</small> <b>10</b></span>
                </a>
                <a href="#" class="list-group-item py-2 d-flex justify-content-between align-items-center">
                  <span>
                    <i class="bi bi-person-fill px-2"></i> 
                    <b>닉네임(ID)</b>
                    <small>2024-02-01 (304호)</small>
                  </span>
                  <span class="text-danger"><small>신고횟수</small> <b>10</b></span>
                </a>
                <a href="#" class="list-group-item py-2 d-flex justify-content-between align-items-center">
                  <span>
                    <i class="bi bi-person-fill px-2"></i> 
                    <b>닉네임(ID)</b>
                    <small>2024-02-01 (304호)</small>
                  </span>
                  <span class="text-danger"><small>신고횟수</small> <b>10</b></span>
                </a>
              </div>
            </div>
          </div>
      </div>
    </div>
  </section>
</main>
<!-- End #main -->

<%@include file="/footer.jsp" %>