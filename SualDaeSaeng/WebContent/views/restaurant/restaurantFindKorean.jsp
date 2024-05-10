<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/header.jsp" %>

    <main data-aos="fade" data-aos-delay="1500">
      <!-- ======= End Page Header ======= -->
      <div class="page-header d-flex align-items-center">
        <div class="container position-relative">
          <div class="row d-flex justify-content-center">
            <div>
              <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item">
                    <a href="restaurantFind.htmll">식당찾기</a>
                  </li>
                  <li class="breadcrumb-item active" aria-current="page">한식</li>
                </ol>
              </nav>
              <h2>한식</h2>
              <p>
                <a class="cta-btn" href="restaurantFind.html">ALL</a>
                <a class="cta-btn gray" href="restaurantFind.htmll">찜/탕</a>
                <a class="cta-btn gray" href="restaurantFind.html">구이</a>
                <a class="cta-btn gray" href="restaurantFind.html">분식</a>
                <a class="cta-btn gray" href="restaurantFind.html">국밥</a>
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
          <ul class="row gy-4 justify-content-start ps-0">
            <li class="card col-xl-3 col-lg-4 col-md-6">
              <a href="restaurantView.html">
                <p class="card-like">
                  <i class="bi bi-heart-fill"></i>
                  <span>25</span>
                </p>
                <div class="img-fluid">
                  <img src="../img/gallery/gallery-1.jpg" class="card-img-top" alt="맛집이미지">
                </div>
                <div class="card-body">
                  <small class="badge bg-body-secondary mb-1">한식</small>
                  <div class="d-flex justify-content-between align-items-center">
                    <h5 class="card-title text-truncate">식당이름입니다~</h5>
                    <span>
                      <i class="bi bi-star-fill"></i> 4.5 </span>
                  </div>
                  <p class="card-text ">식당주소를 작성하고 있습니다. 집에 보내주세요.</p>
                </div>
              </a>
            </li>
            <li class="card col-xl-3 col-lg-4 col-md-6">
              <a href="restaurantView.html">
                <p class="card-like">
                  <i class="bi bi-heart-fill"></i>
                  <span>25</span>
                </p>
                <div class="img-fluid">
                  <img src="../img/gallery/gallery-1.jpg" class="card-img-top" alt="맛집이미지">
                </div>
                <div class="card-body">
                  <small class="badge bg-body-secondary mb-1">한식</small>
                  <div class="d-flex justify-content-between align-items-center">
                    <h5 class="card-title text-truncate">식당이름입니다~</h5>
                    <span>
                      <i class="bi bi-star-fill"></i> 4.5 </span>
                  </div>
                  <p class="card-text ">식당주소를 작성하고 있습니다. 집에 보내주세요.</p>
                </div>
              </a>
            </li>
            <li class="card col-xl-3 col-lg-4 col-md-6">
              <a href="restaurantView.html">
                <p class="card-like">
                  <i class="bi bi-heart-fill"></i>
                  <span>25</span>
                </p>
                <div class="img-fluid">
                  <img src="../img/gallery/gallery-1.jpg" class="card-img-top" alt="맛집이미지">
                </div>
                <div class="card-body">
                  <small class="badge bg-body-secondary mb-1">한식</small>
                  <div class="d-flex justify-content-between align-items-center">
                    <h5 class="card-title text-truncate">식당이름입니다~</h5>
                    <span>
                      <i class="bi bi-star-fill"></i> 4.5 </span>
                  </div>
                  <p class="card-text ">식당주소를 작성하고 있습니다. 집에 보내주세요.</p>
                </div>
              </a>
            </li>
            <li class="card col-xl-3 col-lg-4 col-md-6">
              <a href="restaurantView.html">
                <p class="card-like">
                  <i class="bi bi-heart-fill"></i>
                  <span>25</span>
                </p>
                <div class="img-fluid">
                  <img src="../img/gallery/gallery-1.jpg" class="card-img-top" alt="맛집이미지">
                </div>
                <div class="card-body">
                  <small class="badge bg-body-secondary mb-1">한식</small>
                  <div class="d-flex justify-content-between align-items-center">
                    <h5 class="card-title text-truncate">식당이름입니다~</h5>
                    <span>
                      <i class="bi bi-star-fill"></i> 4.5 </span>
                  </div>
                  <p class="card-text ">식당주소를 작성하고 있습니다. 집에 보내주세요.</p>
                </div>
              </a>
            </li>
            <li class="card col-xl-3 col-lg-4 col-md-6">
              <a href="restaurantView.html">
                <p class="card-like">
                  <i class="bi bi-heart-fill"></i>
                  <span>25</span>
                </p>
                <div class="img-fluid">
                  <img src="../img/gallery/gallery-1.jpg" class="card-img-top" alt="맛집이미지">
                </div>
                <div class="card-body">
                  <small class="badge bg-body-secondary mb-1">한식</small>
                  <div class="d-flex justify-content-between align-items-center">
                    <h5 class="card-title text-truncate">식당이름입니다~</h5>
                    <span>
                      <i class="bi bi-star-fill"></i> 4.5 </span>
                  </div>
                  <p class="card-text ">식당주소를 작성하고 있습니다. 집에 보내주세요.</p>
                </div>
              </a>
            </li>
            <li class="card col-xl-3 col-lg-4 col-md-6">
              <a href="restaurantView.html">
                <p class="card-like">
                  <i class="bi bi-heart-fill"></i>
                  <span>25</span>
                </p>
                <div class="img-fluid">
                  <img src="../img/gallery/gallery-1.jpg" class="card-img-top" alt="맛집이미지">
                </div>
                <div class="card-body">
                  <small class="badge bg-body-secondary mb-1">한식</small>
                  <div class="d-flex justify-content-between align-items-center">
                    <h5 class="card-title text-truncate">식당이름입니다~</h5>
                    <span>
                      <i class="bi bi-star-fill"></i> 4.5 </span>
                  </div>
                  <p class="card-text ">식당주소를 작성하고 있습니다. 집에 보내주세요.</p>
                </div>
              </a>
            </li>
            <li class="card col-xl-3 col-lg-4 col-md-6">
              <a href="restaurantView.html">
                <p class="card-like">
                  <i class="bi bi-heart-fill"></i>
                  <span>25</span>
                </p>
                <div class="img-fluid">
                  <img src="../img/gallery/gallery-1.jpg" class="card-img-top" alt="맛집이미지">
                </div>
                <div class="card-body">
                  <small class="badge bg-body-secondary mb-1">한식</small>
                  <div class="d-flex justify-content-between align-items-center">
                    <h5 class="card-title text-truncate">식당이름입니다~</h5>
                    <span>
                      <i class="bi bi-star-fill"></i> 4.5 </span>
                  </div>
                  <p class="card-text ">식당주소를 작성하고 있습니다. 집에 보내주세요.</p>
                </div>
              </a>
            </li>
            <li class="card col-xl-3 col-lg-4 col-md-6">
              <a href="restaurantView.html">
                <p class="card-like">
                  <i class="bi bi-heart-fill"></i>
                  <span>25</span>
                </p>
                <div class="img-fluid">
                  <img src="../img/gallery/gallery-1.jpg" class="card-img-top" alt="맛집이미지">
                </div>
                <div class="card-body">
                  <small class="badge bg-body-secondary mb-1">한식</small>
                  <div class="d-flex justify-content-between align-items-center">
                    <h5 class="card-title text-truncate">식당이름입니다~</h5>
                    <span>
                      <i class="bi bi-star-fill"></i> 4.5 </span>
                  </div>
                  <p class="card-text ">식당주소를 작성하고 있습니다. 집에 보내주세요.</p>
                </div>
              </a>
            </li>
            <li class="card col-xl-3 col-lg-4 col-md-6">
              <a href="restaurantView.html">
                <p class="card-like">
                  <i class="bi bi-heart-fill"></i>
                  <span>25</span>
                </p>
                <div class="img-fluid">
                  <img src="../img/gallery/gallery-1.jpg" class="card-img-top" alt="맛집이미지">
                </div>
                <div class="card-body">
                  <small class="badge bg-body-secondary mb-1">한식</small>
                  <div class="d-flex justify-content-between align-items-center">
                    <h5 class="card-title text-truncate">식당이름입니다~</h5>
                    <span>
                      <i class="bi bi-star-fill"></i> 4.5 </span>
                  </div>
                  <p class="card-text ">식당주소를 작성하고 있습니다. 집에 보내주세요.</p>
                </div>
              </a>
            </li>
            <li class="card col-xl-3 col-lg-4 col-md-6">
              <a href="restaurantView.html">
                <p class="card-like">
                  <i class="bi bi-heart-fill"></i>
                  <span>25</span>
                </p>
                <div class="img-fluid">
                  <img src="../img/gallery/gallery-1.jpg" class="card-img-top" alt="맛집이미지">
                </div>
                <div class="card-body">
                  <small class="badge bg-body-secondary mb-1">한식</small>
                  <div class="d-flex justify-content-between align-items-center">
                    <h5 class="card-title text-truncate">식당이름입니다~</h5>
                    <span>
                      <i class="bi bi-star-fill"></i> 4.5 </span>
                  </div>
                  <p class="card-text ">식당주소를 작성하고 있습니다. 집에 보내주세요.</p>
                </div>
              </a>
            </li>
            <li class="card col-xl-3 col-lg-4 col-md-6">
              <a href="restaurantView.html">
                <p class="card-like">
                  <i class="bi bi-heart-fill"></i>
                  <span>25</span>
                </p>
                <div class="img-fluid">
                  <img src="../img/gallery/gallery-1.jpg" class="card-img-top" alt="맛집이미지">
                </div>
                <div class="card-body">
                  <small class="badge bg-body-secondary mb-1">한식</small>
                  <div class="d-flex justify-content-between align-items-center">
                    <h5 class="card-title text-truncate">식당이름입니다~</h5>
                    <span>
                      <i class="bi bi-star-fill"></i> 4.5 </span>
                  </div>
                  <p class="card-text ">식당주소를 작성하고 있습니다. 집에 보내주세요.</p>
                </div>
              </a>
            </li>
            <li class="card col-xl-3 col-lg-4 col-md-6">
              <a href="restaurantView.html">
                <p class="card-like">
                  <i class="bi bi-heart-fill"></i>
                  <span>25</span>
                </p>
                <div class="img-fluid">
                  <img src="../img/gallery/gallery-1.jpg" class="card-img-top" alt="맛집이미지">
                </div>
                <div class="card-body">
                  <small class="badge bg-body-secondary mb-1">한식</small>
                  <div class="d-flex justify-content-between align-items-center">
                    <h5 class="card-title text-truncate">식당이름입니다~</h5>
                    <span>
                      <i class="bi bi-star-fill"></i> 4.5 </span>
                  </div>
                  <p class="card-text ">식당주소를 작성하고 있습니다. 집에 보내주세요.</p>
                </div>
              </a>
            </li>
          </ul>
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
          <!-- <div class="container d-flex align-items-center justify-content-end pb-5 gap-2 p-0"><a href="write.html" type="button" class="btn btn-outline-warning">글쓰기</a></div> -->
        </div>
      </section>
    </main>

<%@include file="/footer.jsp" %>