<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>슬기로운 대덕 생활</title>
    <meta content="개발 공부만 하기 바쁜 대덕인재개발원 사람들을 위해 점심머먹지? 오늘 어떤걸배우지? 바로 볼수 있습니다!" name="description">
    <meta content="대덕인재개발원, 대전광역시, 개발자, 커뮤니티, 점심추천, 시간표" name="keywords">
    <!-- Favicons -->
    <link href="/favicon.ico" rel="icon">
    <!-- Fonts -->
    <link rel="stylesheet" href="/css/font.css">
    <!-- Vendor CSS Files -->
    
    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
    <link href="/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="/vendor/aos/aos.css" rel="stylesheet">
    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
    
    <!-- Template Main CSS File -->
    <link href="/css/main.css" rel="stylesheet">
    <link href="/css/index.css" rel="stylesheet">
    <!-- <link href="css/>" rel="stylesheet"> -->
    
    <script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>

    <!-- Initialize Quill editor -->

        <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Quill 초기화
            var quill = new Quill('#editor', {
                theme: 'snow',
                modules: {
                    toolbar: [
                        [{ 'header': [1, 2, 3, 4, 5, 6, false] }],
                        ['bold', 'italic', 'underline', 'strike'],
                        [{ 'color': [] }, { 'background': [] }],
                        [{ 'list': 'ordered'}, { 'list': 'bullet' }],
                        [{ 'align': [] }],
                        ['link', 'image', 'video'],
                        ['blockquote', 'code-block'],
                        [{ 'indent': '-1'}, { 'indent': '+1' }],
                        [{ 'direction': 'rtl' }],
                        [{ 'size': ['small', false, 'large', 'huge'] }],
                        [{ 'font': [] }],
                        ['clean'],
                        [{ 'file': 'file' }] 
                    ]
                },
                placeholder: '내용을 작성하세요...',
            });

            var fileInput = document.getElementById('fileInput');
            var toolbar = quill.getModule('toolbar');
            toolbar.addHandler('file', function () {
                fileInput.click();
            });

            // 파일 선택 시
            fileInput.addEventListener('change', function () {
                var file = fileInput.files[0];
                if (file) {
                    uploadFile(file);
                }
            });

            // 파일 업로드 함수
            function uploadFile(file) {
                var formData = new FormData();
                formData.append('file', file);

                // 서버로 파일 업로드
                var xhr = new XMLHttpRequest();
                xhr.open('POST', 'upload.jsp', true);
                xhr.onload = function () {
                    if (xhr.status === 200) {
                        var response = JSON.parse(xhr.responseText);
                        if (response.success) {
                            // 파일 업로드 성공 시, Quill 에디터에 링크 삽입
                            var range = quill.getSelection(true);
                            quill.insertText(range.index, response.url, { 'link': response.url });
                        } else {
                            console.error('File upload failed:', response.error);
                        }
                    } else {
                        console.error('File upload failed:', xhr.statusText);
                    }
                };
                xhr.onerror = function () {
                    console.error('File upload failed.');
                };
                xhr.send(formData);
            }
            
            // 사용자 정의 버튼을 추가합니다.
            var customButton = document.querySelector('.ql-myButton');
            customButton.addEventListener('click', function() {
                alert('Custom button clicked!');
            });

            // 에디터 내용이 변경될 때마다 이벤트 처리
            quill.on('text-change', function(delta, oldDelta, source) {
                console.log('Text changed:', delta, source);
                // 에디터 내용이 변경될 때마다 서버로 변경된 내용을 전송할 수 있습니다.
                // 이 부분은 서버와의 통신을 위한 것이므로 서버 측 코드와의 통합이 필요합니다.
            });
        });
    </script>
    
  </head>
  <body>
    <!-- ======= Header ======= -->
    <header id="header" class="header d-flex align-items-center fixed-top">
      <div class="container-fluid d-flex align-items-center justify-content-between">
        <a href="index.html" class="logo d-flex align-items-center  me-auto me-lg-0">
          <h1>슬.대.생</h1>
        </a>
        <nav id="navbar" class="navbar">
          <ul>
            <li>
              <a href="calssBoard.html">반별게시판</a>
            </li>
            <li class="dropdown">
              <a href="allBoard.html">
                <span>전체게시판</span>
                <i class="bi-caret-down-fill"></i>
              </a>
              <ul>
                <li>
                  <a href="allBoard.jsp">자유게시판</a>
                </li>
                <li>
                  <a href="allBoard.jsp">공부게시판</a>
                </li>
                <li>
                  <a href="allBoard.jsp">공지게시판</a>
                </li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="restaurantFind.html">
                <span>식당찾기</span>
                <i class="bi-caret-down-fill"></i>
              </a>
              <ul>
                <li class="dropdown">
                  <a href="restaurantFindKorean.html">
                    <span>한식</span>
                    <i class="bi-caret-down-fill"></i>
                  </a>
                  <ul>
                    <li>
                      <a href="#">Sub Menu 1</a>
                    </li>
                    <li>
                      <a href="#">Sub Menu 2</a>
                    </li>
                    <li>
                      <a href="#">Sub Menu 3</a>
                    </li>
                  </ul>
                </li>
                <li class="dropdown">
                  <a href="restaurantFindKorean.html">
                    <span>중식</span>
                    <i class="bi-caret-down-fill"></i>
                  </a>
                  <ul>
                    <li>
                      <a href="#">Sub Menu 1</a>
                    </li>
                    <li>
                      <a href="#">Sub Menu 2</a>
                    </li>
                    <li>
                      <a href="#">Sub Menu 3</a>
                    </li>
                  </ul>
                </li>
                <li class="dropdown">
                  <a href="restaurantFindKorean.html">
                    <span>일식</span>
                    <i class="bi-caret-down-fill"></i>
                  </a>
                  <ul>
                    <li>
                      <a href="#">Sub Menu 1</a>
                    </li>
                    <li>
                      <a href="#">Sub Menu 2</a>
                    </li>
                    <li>
                      <a href="#">Sub Menu 3</a>
                    </li>
                  </ul>
                </li>
                <li class="dropdown">
                  <a href="restaurantFindKorean.html">
                    <span>서양식</span>
                    <i class="bi-caret-down-fill"></i>
                  </a>
                  <ul>
                    <li>
                      <a href="#">Sub Menu 1</a>
                    </li>
                    <li>
                      <a href="#">Sub Menu 2</a>
                    </li>
                    <li>
                      <a href="#">Sub Menu 3</a>
                    </li>
                  </ul>
                </li>
              </ul>
            </li>
            <li>
              <a href="foodLikeList.html">미식인의 추천맛집</a>
            </li>
          </ul>
        </nav>
        <!-- .navbar -->
        <div class="d-flex align-items-center">
          <div class="header-social-links">
            <div class="dropdown">
              <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                <i class="bi bi-person-circle"></i>
                <!-- <img src="img/testimonials/testimonials-2.jpg" class="testimonial-img" alt=""> -->
              </button>
              <ul class="dropdown-menu">
                <li>
                  <a class="dropdown-item" href="join.html">회원가입</a>
                </li>
                <li>
                  <a class="dropdown-item" href="login.html">로그인</a>
                </li>
                <!-- <li><a class="dropdown-item" href="logout.html">로그아웃</a></li><li><a class="dropdown-item" href="myPage.html"><span>정윤지</span>페이지</a></li>-->
              </ul>
            </div>
          </div>
          <i class="mobile-nav-toggle mobile-nav-show bi bi-list"></i>
          <i class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"></i>
        </div>
      </div>
    </header>
    <!-- End Header -->

    <!--<main data-aos="fade" data-aos-delay="1500" >-->
    <main>
   
       <!-- ======= End Page Header ======= -->
       <div class="page-header sub d-flex align-items-center">
         <div class="container position-relative">
           <div class="row d-flex justify-content-center">
             <p class="mb-5 text-start">
               <a href="allBoard.jsp">
                 <i class="bi bi-chevron-left"></i> 뒤로가기
               </a>
             </p>
             <div>
               <h2>자유게시판</h2>
             </div>
           </div>
         </div>
       </div><!-- End Page Header -->
   
       <div class="contact">
         <div class="container pb-3">
           <!-- {{changeDetected}} -->
           <form action="/board/write.do" method="post" role="form" id="insertForm" class="php-email-form needs-validation" novalidate>
             <div class="form-group">
               <input type="text" class="form-control" name="title" id="title" placeholder="제목" required>
               <div class="invalid-feedback">제목을 작성해주세요.</div>
             </div>
             
             	<div id="editor"></div>
             	
             <input type="file" id="fileInput" style="display: visible;">
             <div class="text-center mt-5 mb-5">
               <button type="submit" id="submitBtn">작성하기</button>
             </div>
           </form>
        
         </div>
       </div>
   
     </main>
     
<script type="text/javascript">
$(function(){
	var submitBtn = $("#submitBtn");
	var insertForm = $("#insertForm");
	
	// 등록 버튼 클릭 시 이벤트
	submitBtn.on("click", function(){
		var title = $("#title").val();
		var content = quill.root.innerHTML;
		
		insertForm.submit(); // 서버로 전송
	});
});

</script>
     
  <!-- ======= Footer ======= -->
  <%@include file="/footer.jsp" %>