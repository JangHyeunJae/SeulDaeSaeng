<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/header.jsp" %>
<main data-aos="fade" data-aos-delay="1500">
  <section id="calssBoard" class="gallery-single ">
    <div class="container-xl">
      <div class="row justify-content-between gy-4">
        <div class="col-lg-3">
          <div class="portfolio-info sticky-top">
            <h3>
              <span>304호</span>
            </h3>
            <ul>
              <li>
                <strong>이름 (닉네임) </strong>
                <span>name (nickname)</span>
              </li>
              <li>
                <strong>304호 퇴소일자</strong>
                <span>2024-09-23 (d-day)</span>
              </li>
              <li>
                <a href="timetable.html" class="btn-visit align-self-start">수업 시간표 확인</a>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-lg-9">
          <div class="portfolio-description">
            <div class="section-header">
              <h2>File</h2>
              <p class="d-flex justify-content-between align-items-center"> 수업 파일 공유 
                <button type="button" class="btn btn-outline-warning btn-sm">이전 파일 더보기</button>
              </p>
            </div>
            <form class="file-drop" >
              <input type="file" name="upload" id="upload-file" multiple>
              <!-- 아래 label 내용 변경하지 마세요. js와 연동 -->
              <label for="upload-file">파일을 드레그하거나 클릭해서 등록</label>
              <button type="submit" ><i class="bi bi-arrow-bar-up"></i></button>
            </form>
            <div class="list-group">
              <a href="file/01.수행계획서.odt" class="list-group-item py-2 d-flex justify-content-between align-items-center" download>
                <span>
                  <i class="bi bi-download px-2"></i> 01.수행계획서.odt </span>
                <span>23KB</span>
              </a>
              <a href="file/02.요구사항정의서.ods" class="list-group-item py-2 d-flex justify-content-between align-items-center" download>
                <span>
                  <i class="bi bi-download px-2"></i> 02.요구사항정의서.odg </span>
                <span>41KB</span>
              </a>
              <a href="file/03.유즈케이스다이어그램_0506.zip" class="list-group-item py-2 d-flex justify-content-between align-items-center" download>
                <span>
                  <i class="bi bi-download px-2"></i> 03.유즈케이스다이어그램.zip </span>
                <span>161KB</span>
              </a>
              <a href="file/03.유즈케이스다이어그램_0506.zip" class="list-group-item py-2 d-flex justify-content-between align-items-center" download>
                <span>
                  <i class="bi bi-download px-2"></i> 03.유즈케이스다이어그램.zip </span>
                <span>161KB</span>
              </a>
              <a href="file/03.유즈케이스다이어그램_0506.zip" class="list-group-item py-2 d-flex justify-content-between align-items-center" download>
                <span>
                  <i class="bi bi-download px-2"></i>03.유즈케이스다이어그램.zip </span>
                <span>161KB</span>
              </a>
            </div>
          </div>
          <div class="portfolio-description homework">
            <div class="section-header">
              <h2>borad</h2>
              <p class="d-flex justify-content-between align-items-center"> 제출한 숙제 체크<button type="button" class="btn btn-outline-warning btn-sm">완료된 숙제보기</button>
              </p>
            </div>
            <div class="list-group d-flex justify-content-start align-items-center flex-row p-3 gap-3">
              <a href="#" class="card">
                <div class="card-body">
                  <div class="d-flex justify-content-between align-items-center">
                    <h5 class="card-title text-truncate">숙제이름</h5>
                    <small>제출인원(5)</small>
                  </div>
                  <p class="card-text ">2024-05-23 (제한기간)</p>
                </div>
              </a>
            </div>
          </div>
          <div class="portfolio-description d-flex justify-content-between gap-5">
            <div class="col">
              <div class="section-header">
                <h2>board</h2>
                <p class="d-flex justify-content-between align-items-center"> 공지사항 <button type="button" class="btn btn-outline-warning btn-sm">더보기</button>
                </p>
              </div>
              <div class="list-group">
                <a href="#" class="list-group-item d-flex w-100 justify-content-between align-items-center py-3">
                  <h6 class="mb-2 text-truncate">
                    <small class="attach">
                      <i class="bi bi-paperclip"></i>
                    </small> List group item heading
                  </h6>
                  <small class="days">2024-05-03</small>
                </a>
                <a href="#" class="list-group-item d-flex w-100 justify-content-between align-items-center py-3">
                  <h6 class="mb-2 text-truncate">
                    <small class="attach">
                      <i class="bi bi-paperclip"></i>
                    </small> List group item heading
                  </h6>
                  <small class="days">2024-05-03</small>
                </a>
                <a href="#" class="list-group-item d-flex w-100 justify-content-between align-items-center py-3">
                  <h6 class="mb-2 text-truncate">
                    <small class="attach">
                      <i class="bi bi-paperclip"></i>
                    </small> List group item heading
                  </h6>
                  <small class="days">2024-05-03</small>
                </a>
                <a href="#" class="list-group-item d-flex w-100 justify-content-between align-items-center py-3">
                  <h6 class="mb-2 text-truncate">
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
                <p class="d-flex justify-content-between align-items-center"> 반 게시판 <button type="button" class="btn btn-outline-warning btn-sm">더보기</button>
                </p>
              </div>
              <div class="list-group">
                <a href="#" class="list-group-item d-flex w-100 justify-content-between align-items-center py-3">
                  <h6 class="mb-2 text-truncate">
                    <small class="attach">
                      <i class="bi bi-paperclip"></i>
                    </small> List group item heading
                  </h6>
                  <small class="days">2024-05-03</small>
                </a>
                <a href="#" class="list-group-item d-flex w-100 justify-content-between align-items-center py-3">
                  <h6 class="mb-2 text-truncate">
                    <small class="attach">
                      <i class="bi bi-paperclip"></i>
                    </small> List group item heading
                  </h6>
                  <small class="days">2024-05-03</small>
                </a>
                <a href="#" class="list-group-item d-flex w-100 justify-content-between align-items-center py-3">
                  <h6 class="mb-2 text-truncate">
                    <small class="attach">
                      <i class="bi bi-paperclip"></i>
                    </small> List group item heading
                  </h6>
                  <small class="days">2024-05-03</small>
                </a>
                <a href="#" class="list-group-item d-flex w-100 justify-content-between align-items-center py-3">
                  <h6 class="mb-2 text-truncate">
                    <small class="attach">
                      <i class="bi bi-paperclip"></i>
                    </small> List group item heading
                  </h6>
                  <small class="days">2024-05-03</small>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</main>
<!-- End #main -->	

<%@include file="/footer.jsp" %>