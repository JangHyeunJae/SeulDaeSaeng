<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/header.jsp" %>
    <!--<main data-aos="fade" data-aos-delay="1500" >-->
    <main>
      <!-- ======= End Page Header ======= -->
      <div class="page-header d-flex align-items-center">
        <div class="container position-relative">
          <div class="row d-flex justify-content-center">
            <div>
              <h2>자유게시판</h2>
              <p>
                <a class="cta-btn gray" href="allBoard.jsp">전체게시판</a>
                <a class="cta-btn" href="freeBoard.jsp">자유게시판</a>
                <a class="cta-btn gray" href="studyBoard.jsp">공부게시판</a>
              </p>
            </div>
          </div>
        </div>
      </div>
      <!-- End Page Header -->
      <section class="board mb-5">
        <div class="container" data-aos="fade-up">
          <div class="row mb-3 d-flex justify-content-between align-items-center">
            <p class="col-3">총 <b>25</b> 개 </p>
            <div class="input-group input-group-sm col-4">
              <button class="btn filter" type="button" data-bs-toggle="dropdown" aria-expanded="false">
              <i class="bi bi-funnel-fill"></i> 검색 필터 </button>
            <ul class="dropdown-menu">
              <li>
                <a class="dropdown-item" href="#">최신순</a>
              </li>
              <li>
                <a class="dropdown-item" href="#">오래된순</a>
              </li>
              <li>
                <a class="dropdown-item" href="#">조회순</a>
              </li>
            </ul>
              <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">전체</button>
              <ul class="dropdown-menu">
                <li>
                  <a class="dropdown-item" href="#title">제목</a>
                </li>
                <li>
                  <a class="dropdown-item" href="#content">내용</a>
                </li>
                <li>
                  <a class="dropdown-item" href="#nickname">닉네임</a>
                </li>
              </ul>
              <input type="text" class="form-control" aria-label="Text input with dropdown button">
            </div>
          </div>
          <div class="list-group">
            <a href="view.html" class="list-group-item">
              <div class="d-flex w-100 justify-content-between align-items-center">
                <h5 class="mb-2 text-truncate">
                  <small class="attach">
                    <i class="bi bi-paperclip"></i>
                  </small> List group item heading
                </h5>
                <small class="badge bg-light">자유게시판</small>
              </div>
              <p class="mb-2 text-truncate">Some placeholder content in a paragraph.</p>
              <div class="d-flex w-100 justify-content-between align-items-center">
                <small class="days">2024-05-03</small>
                <small class="look">
                  <i class="bi bi-eye"></i> 24 </small>
              </div>
            </a>
            <a href="view.html" class="list-group-item">
              <div class="d-flex w-100 justify-content-between align-items-center">
                <h5 class="mb-2 text-truncate">
                  <small class="attach">
                    <i class="bi bi-paperclip"></i>
                  </small> List group item heading
                </h5>
                <small class="badge bg-light">공부게시판</small>
              </div>
              <p class="mb-2 text-truncate">Some placeholder content in a paragraph.</p>
              <div class="d-flex w-100 justify-content-between align-items-center">
                <small class="days">2024-05-03</small>
                <small class="look">
                  <i class="bi bi-eye"></i> 24 </small>
              </div>
            </a>
            <a href="view.html" class="list-group-item">
              <div class="d-flex w-100 justify-content-between align-items-center">
                <h5 class="mb-2 text-truncate">
                  <small class="attach">
                    <i class="bi bi-paperclip"></i>
                  </small> List group item heading
                </h5>
                <small class="badge bg-light">자유게시판</small>
              </div>
              <p class="mb-2 text-truncate">Some placeholder content in a paragraph.</p>
              <div class="d-flex w-100 justify-content-between align-items-center">
                <small class="days">2024-05-03</small>
                <small class="look">
                  <i class="bi bi-eye"></i> 24 </small>
              </div>
            </a>
            <a href="view.html" class="list-group-item">
              <div class="d-flex w-100 justify-content-between align-items-center">
                <h5 class="mb-2 text-truncate">
                  <small class="attach">
                    <i class="bi bi-paperclip"></i>
                  </small> List group item heading
                </h5>
                <small class="badge bg-light">자유게시판</small>
              </div>
              <p class="mb-2 text-truncate">Some placeholder content in a paragraph.</p>
              <div class="d-flex w-100 justify-content-between align-items-center">
                <small class="days">2024-05-03</small>
                <small class="look">
                  <i class="bi bi-eye"></i> 24 </small>
              </div>
            </a>
            <a href="view.html" class="list-group-item">
              <div class="d-flex w-100 justify-content-between align-items-center">
                <h5 class="mb-2 text-truncate">
                  <small class="attach">
                    <i class="bi bi-paperclip"></i>
                  </small> List group item heading
                </h5>
                <small class="badge bg-light">자유게시판</small>
              </div>
              <p class="mb-2 text-truncate">Some placeholder content in a paragraph.</p>
              <div class="d-flex w-100 justify-content-between align-items-center">
                <small class="days">2024-05-03</small>
                <small class="look">
                  <i class="bi bi-eye"></i> 24 </small>
              </div>
            </a>
          </div>
          <nav class="d-flex justify-content-center align-items-center pt-5 pm-5" aria-label="Page navigation example">
            <ul class="pagination ">
              <li class="page-item disabled">
                <a class="page-link" href="#" aria-label="Previous">
                  <span aria-hidden="true">&laquo;</span>
                </a>
              </li>
              <li class="page-item active">
                <a class="page-link" href="#">1</a>
              </li>
              <li class="page-item">
                <a class="page-link" href="#">2</a>
              </li>
              <li class="page-item">
                <a class="page-link" href="#">3</a>
              </li>
              <li class="page-item">
                <a class="page-link" href="#">4</a>
              </li>
              <li class="page-item">
                <a class="page-link" href="#">5</a>
              </li>
              <li class="page-item">
                <a class="page-link" href="#" aria-label="Next">
                  <span aria-hidden="true">&raquo;</span>
                </a>
              </li>
            </ul>
          </nav>
          <div class="container d-flex align-items-center justify-content-end pb-5 gap-2 p-0">
            <a href="write.jsp" type="button" class="btn btn-outline-warning">글쓰기</a>
          </div>
        </div>
      </section>
    </main>

<%@include file="/footer.jsp" %>