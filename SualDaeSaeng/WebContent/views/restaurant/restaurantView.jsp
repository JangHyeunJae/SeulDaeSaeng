<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/header.jsp" %>

    <main data-aos="fade" data-aos-delay="1500">
      <!-- ======= End Page Header ======= -->
      <div class="page-header restaurant d-flex align-items-center">
        <div class="container position-relative">
          <div class="row d-flex justify-content-center">
            <div>
              <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item">
                    <a href="restaurantFind.htmll">식당찾기</a>
                  </li>
                  <li class="breadcrumb-item">
                    <a href="restaurantFindKorean.html">한식</a>
                  </li>
                  <li class="breadcrumb-item">
                    <a href="restaurantFindKorean.html">찜/탕</a>
                  </li>
                  <li class="breadcrumb-item active" aria-current="page">찜찜당한식당</li>
                </ol>
              </nav>
              <h2 class="pb-2">찜찜당한식당</h2>
              <div class="d-flex justify-content-between align-items-center">
                <p class="stars fs-4">
                  <i class="bi bi-star-fill"></i>
                  <i class="bi bi-star-fill"></i>
                  <i class="bi bi-star-fill"></i>
                  <i class="bi bi-star-fill"></i>
                  <i class="bi bi-star-half"></i>
                  <b>4.5 <span>(45명의 평가)</span>
                  </b>
                </p>
                <p class="like d-flex align-items-center gap-3">
                  <span style="color: var(--bs-red)">
                    <i class="bi bi-heart-fill"></i> 25명 좋아하는 중 </span>
                  <input type="checkbox" class="btn-check" id="btn-check" autocomplete="off">
                  <label class="btn btn-danger d-flex align-items-center gap-2" for="btn-check">
                    <span>
                      <i class="bi bi-heart-fill"></i> 좋아요 </span>
                    <span>
                      <i class="bi bi-heart"></i> 취소 </span>
                  </label>
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- End Page Header -->
      <section id="restaurantView" class="pricing about d-flex flex-column gap-4">
        <div class="container content">
          <div class="row gap-3">
            <div class="col-lg-6">
              <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3214.6030983949745!2d127.40309803488768!3d36.321930600000016!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x35654f17d22005ab%3A0x49403681e2c5253f!2z65Ox6rCI67mE7Jes6rSA!5e0!3m2!1sko!2skr!4v1715040725307!5m2!1sko!2skr" width="100%" height="100%" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
            <div class="col-lg-5">
              <ul>
                <li>
                  <i class="bi bi-geo-alt-fill"></i>
                  <strong>주소 :</strong>
                  <span>1 May 1995</span>
                </li>
                <li>
                  <i class="bi bi-telephone-fill"></i>
                  <strong>전화번호 :</strong>
                  <span>www.example.com</span>
                </li>
                <li>
                  <i class="bi bi-calendar2-check-fill"></i>
                  <strong>휴무일 :</strong>
                  <span>+123 456 7890</span>
                </li>
                <li>
                  <i class="bi bi-clock-fill"></i>
                  <strong>영업시간:</strong>
                  <span>New York, USA</span>
                </li>
              </ul>
            </div>
          </div>
        </div>
        <div class="container">
          <div class="section-header d-flex justify-content-between align-items-center">
            <p>
              <b>45건의 평균</b>
              <span class="stars">
                <i class="bi bi-star-fill"></i>
                <b>4.5</b>
              </span>
            </p>
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
                <a class="dropdown-item" href="#">별점높은순</a>
              </li>
              <li>
                <a class="dropdown-item" href="#">별점낮은순</a>
              </li>
            </ul>
          </div>
          <hr class="my-0 pb-4">
          <div class="d-flex justify-content-between align-items-center py-3 mb-3 food-list new-review">
            <p class="mb-0 d-flex align-items-center gap-3">
              <img src="/img/testimonials/testimonials-2.jpg" class="testimonial-img" alt="">
              <span> 00님 아직 리뷰를 작성하지 않으셨군요! 당신의 리뷰를 기다리고 있습니다. <br> ※홍보 및 비방 등 부적절한 평가는 평점 산정에서 제외 될 수 있습니다. </span>
            </p>
            <button type="button" class="btn btn-outline-warning">리뷰쓰기</button>
          </div>
          <div class="row gy-4 gx-4">
            <div class="col-lg-6">
              <div class="food-list ">
                <h6 class="mb-3 d-flex justify-content-between align-items-center">
                  <span>
                    <!-- <i class="bi bi-person-circle"></i> -->
                    <img src="/img/testimonials/testimonials-2.jpg" class="testimonial-img" alt="">
                    <div class="d-flex flex-column ps-2 gap-2">
                      <small>닉네임</small>
                      <small class="stars mb-0 d-flex gap-2">
                        <span class="gap-0">
                          <i class="bi bi-star-fill"></i>
                          <i class="bi bi-star-fill"></i>
                          <i class="bi bi-star-fill"></i>
                          <i class="bi bi-star-fill"></i>
                          <i class="bi bi-star-half"></i>
                        </span>
                        <span class="font-200">4.5</span>
                      </small>
                    </div>
                  </span>
                  <small class="day">2024-05-03</small>
                </h6>
                <p> Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisl tincidunt eget nullam non. Quis hendrerit dolor magna eget est lorem ipsum dolor sit. Volutpat odio facilisis mauris sit amet massa. Commodo odio aenean sed adipiscing diam donec adipiscing tristique. Mi eget mauris pharetra et. Non tellus orci ac auctor augue. Elit at imperdiet dui accumsan sit. Ornare arcu dui vivamus arcu felis. Egestas integer eget aliquet nibh praesent. In hac habitasse platea dictumst quisque sagittis purus. Pulvinar elementum integer enim neque volutpat ac. </p>
                <div class="d-flex justify-content-between overflow-x-scroll">
                  <div class="col-lg-4 col-md-6 col-12 p-1">
                    <img src="/img/gallery/gallery-1.jpg" class="img-fluid" alt="">
                  </div>
                  <div class="col-lg-4 col-md-6 col-12 p-1">
                    <img src="/img/gallery/gallery-1.jpg" class="img-fluid" alt="">
                  </div>
                  <div class="col-lg-4 col-md-6 col-12 p-1">
                    <img src="/img/gallery/gallery-1.jpg" class="img-fluid" alt="">
                  </div>
                </div>
                <hr>
                <button type="button" class="btn btn-secondary btn-sm">
                  <span>00님 맛집 </span>리스트 더보기 </button>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="food-list ">
                <h6 class="mb-3 d-flex justify-content-between align-items-center">
                  <span>
                    <!-- <i class="bi bi-person-circle"></i> -->
                    <img src="/img/testimonials/testimonials-2.jpg" class="testimonial-img" alt="">
                    <div class="d-flex flex-column ps-2 gap-2">
                      <small>닉네임</small>
                      <small class="stars mb-0 d-flex gap-2">
                        <span class="gap-0">
                          <i class="bi bi-star-fill"></i>
                          <i class="bi bi-star-fill"></i>
                          <i class="bi bi-star-fill"></i>
                          <i class="bi bi-star-fill"></i>
                          <i class="bi bi-star-half"></i>
                        </span>
                        <span class="font-200">4.5</span>
                      </small>
                    </div>
                  </span>
                  <small class="day">2024-05-03</small>
                </h6>
                <p> Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisl tincidunt eget nullam non. Quis hendrerit dolor magna eget est lorem ipsum dolor sit. Volutpat odio facilisis mauris sit amet massa. Commodo odio aenean sed adipiscing diam donec adipiscing tristique. Mi eget mauris pharetra et. Non tellus orci ac auctor augue. Elit at imperdiet dui accumsan sit. Ornare arcu dui vivamus arcu felis. Egestas integer eget aliquet nibh praesent. In hac habitasse platea dictumst quisque sagittis purus. Pulvinar elementum integer enim neque volutpat ac. </p>
                <div class="d-flex justify-content-between overflow-x-scroll">
                  <div class="col-lg-4 col-md-6 col-12 p-1">
                    <img src="/img/gallery/gallery-1.jpg" class="img-fluid" alt="">
                  </div>
                  <div class="col-lg-4 col-md-6 col-12 p-1">
                    <img src="/img/gallery/gallery-1.jpg" class="img-fluid" alt="">
                  </div>
                  <div class="col-lg-4 col-md-6 col-12 p-1">
                    <img src="/img/gallery/gallery-1.jpg" class="img-fluid" alt="">
                  </div>
                </div>
                <hr>
                <button type="button" class="btn btn-secondary btn-sm">
                  <span>00님 맛집 </span>리스트 더보기 </button>
              </div>
            </div>
            <div class="col-xl-12 col-lg-12 col-md-12 text-center">
              <a class="cta-btn text-center" href="#">더보기</a>
            </div>
          </div>
        </div>
        <div class="container">
          <div class="section-header">
            <p>메뉴정보</p>
          </div>
          <div class="row gy-4 gx-lg-5">
            <div class="col-lg-6">
              <div class="pricing-item d-flex justify-content-between">
                <h3>Portrait Photography</h3>
                <h4>$160.00</h4>
              </div>
            </div>
            <!-- End Pricing Item -->
            <div class="col-lg-6">
              <div class="pricing-item d-flex justify-content-between">
                <h3>Fashion Photography</h3>
                <h4>$300.00</h4>
              </div>
            </div>
            <!-- End Pricing Item -->
            <div class="col-lg-6">
              <div class="pricing-item d-flex justify-content-between">
                <h3>Sports Photography</h3>
                <h4>$200.00</h4>
              </div>
            </div>
            <!-- End Pricing Item -->
            <div class="col-lg-6">
              <div class="pricing-item d-flex justify-content-between">
                <h3>Still Life Photography</h3>
                <h4>$120.00</h4>
              </div>
            </div>
            <!-- End Pricing Item -->
            <div class="col-lg-6">
              <div class="pricing-item d-flex justify-content-between">
                <h3>Wedding Photography</h3>
                <h4>$500.00</h4>
              </div>
            </div>
            <!-- End Pricing Item -->
            <div class="col-lg-6">
              <div class="pricing-item d-flex justify-content-between">
                <h3>Photojournalism</h3>
                <h4>$200.00</h4>
              </div>
            </div>
            <!-- End Pricing Item -->
            <div class="col-xl-12 col-lg-12 col-md-12 text-center">
              <a class="cta-btn text-center" href="#">더보기</a>
            </div>
          </div>
        </div>
        <div class="container gallery">
          <div class="section-header">
            <p>찜찜당한식당 이미지</p>
          </div>
          <div class="row gy-4 justify-content-start">
            <div class="col-xl-3 col-lg-4 col-md-6">
              <div class="gallery-item h-100">
                <img src="/img/gallery/gallery-1.jpg" class="img-fluid" alt="">
                <div class="gallery-links d-flex align-items-center justify-content-center">
                  <a href="img/gallery/gallery-1.jpg" title="Gallery 1" class="glightbox preview-link">
                    <i class="bi bi-arrows-angle-expand"></i>
                  </a>
                </div>
              </div>
            </div>
            <!-- End Gallery Item -->
            <div class="col-xl-3 col-lg-4 col-md-6">
              <div class="gallery-item h-100">
                <img src="/img/gallery/gallery-2.jpg" class="img-fluid" alt="">
                <div class="gallery-links d-flex align-items-center justify-content-center">
                  <a href="img/gallery/gallery-2.jpg" title="Gallery 2" class="glightbox preview-link">
                    <i class="bi bi-arrows-angle-expand"></i>
                  </a>
                </div>
              </div>
            </div>
            <!-- End Gallery Item -->
            <div class="col-xl-3 col-lg-4 col-md-6">
              <div class="gallery-item h-100">
                <img src="/img/gallery/gallery-3.jpg" class="img-fluid" alt="">
                <div class="gallery-links d-flex align-items-center justify-content-center">
                  <a href="img/gallery/gallery-3.jpg" title="Gallery 3" class="glightbox preview-link">
                    <i class="bi bi-arrows-angle-expand"></i>
                  </a>
                </div>
              </div>
            </div>
            <!-- End Gallery Item -->
            <div class="col-xl-3 col-lg-4 col-md-6">
              <div class="gallery-item h-100">
                <img src="/img/gallery/gallery-4.jpg" class="img-fluid" alt="">
                <div class="gallery-links d-flex align-items-center justify-content-center">
                  <a href="img/gallery/gallery-4.jpg" title="Gallery 4" class="glightbox preview-link">
                    <i class="bi bi-arrows-angle-expand"></i>
                  </a>
                </div>
              </div>
            </div>
            <!-- End Gallery Item -->
            <div class="col-xl-3 col-lg-4 col-md-6">
              <div class="gallery-item h-100">
                <img src="/img/gallery/gallery-5.jpg" class="img-fluid" alt="">
                <div class="gallery-links d-flex align-items-center justify-content-center">
                  <a href="img/gallery/gallery-5.jpg" title="Gallery 5" class="glightbox preview-link">
                    <i class="bi bi-arrows-angle-expand"></i>
                  </a>
                </div>
              </div>
            </div>
            <!-- End Gallery Item -->
            <div class="col-xl-3 col-lg-4 col-md-6">
              <div class="gallery-item h-100">
                <img src="/img/gallery/gallery-6.jpg" class="img-fluid" alt="">
                <div class="gallery-links d-flex align-items-center justify-content-center">
                  <a href="img/gallery/gallery-6.jpg" title="Gallery 6" class="glightbox preview-link">
                    <i class="bi bi-arrows-angle-expand"></i>
                  </a>
                </div>
              </div>
            </div>
            <!-- End Gallery Item -->
            <div class="col-xl-3 col-lg-4 col-md-6">
              <div class="gallery-item h-100">
                <img src="/img/gallery/gallery-7.jpg" class="img-fluid" alt="">
                <div class="gallery-links d-flex align-items-center justify-content-center">
                  <a href="img/gallery/gallery-7.jpg" title="Gallery 7" class="glightbox preview-link">
                    <i class="bi bi-arrows-angle-expand"></i>
                  </a>
                </div>
              </div>
            </div>
            <!-- End Gallery Item -->
            <div class="col-xl-3 col-lg-4 col-md-6">
              <div class="gallery-item h-100">
                <img src="/img/gallery/gallery-8.jpg" class="img-fluid" alt="">
                <div class="gallery-links d-flex align-items-center justify-content-center">
                  <a href="img/gallery/gallery-8.jpg" title="Gallery 8" class="glightbox preview-link">
                    <i class="bi bi-arrows-angle-expand"></i>
                  </a>
                </div>
              </div>
            </div>
            <!-- End Gallery Item -->
            <div class="col-xl-3 col-lg-4 col-md-6">
              <div class="gallery-item h-100">
                <img src="/img/gallery/gallery-5.jpg" class="img-fluid" alt="">
                <div class="gallery-links d-flex align-items-center justify-content-center">
                  <a href="img/gallery/gallery-5.jpg" title="Gallery 5" class="glightbox preview-link">
                    <i class="bi bi-arrows-angle-expand"></i>
                  </a>
                </div>
              </div>
            </div>
            <!-- End Gallery Item -->
            <div class="col-xl-3 col-lg-4 col-md-6">
              <div class="gallery-item h-100">
                <img src="/img/gallery/gallery-6.jpg" class="img-fluid" alt="">
                <div class="gallery-links d-flex align-items-center justify-content-center">
                  <a href="img/gallery/gallery-6.jpg" title="Gallery 6" class="glightbox preview-link">
                    <i class="bi bi-arrows-angle-expand"></i>
                  </a>
                </div>
              </div>
            </div>
            <!-- End Gallery Item -->
            <div class="col-xl-3 col-lg-4 col-md-6">
              <div class="gallery-item h-100">
                <img src="/img/gallery/gallery-7.jpg" class="img-fluid" alt="">
                <div class="gallery-links d-flex align-items-center justify-content-center">
                  <a href="img/gallery/gallery-7.jpg" title="Gallery 7" class="glightbox preview-link">
                    <i class="bi bi-arrows-angle-expand"></i>
                  </a>
                </div>
              </div>
            </div>
            <!-- End Gallery Item -->
            <div class="col-xl-3 col-lg-4 col-md-6">
              <div class="gallery-item h-100">
                <img src="/img/gallery/gallery-8.jpg" class="img-fluid" alt="">
                <div class="gallery-links d-flex align-items-center justify-content-center">
                  <a href="img/gallery/gallery-8.jpg" title="Gallery 8" class="glightbox preview-link">
                    <i class="bi bi-arrows-angle-expand"></i>
                  </a>
                </div>
              </div>
            </div>
            <!-- End Gallery Item -->
            <div class="col-xl-12 col-lg-12 col-md-12 text-center">
              <a class="cta-btn text-center" href="contact.html">더보기</a>
            </div>
          </div>
        </div>
      </section>
    </main>


<%@include file="/footer.jsp" %>