<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
//String currentJSP = request.getServletPath();
//String fileName = currentJSP.substring(currentJSP.lastIndexOf("/") + 1, currentJSP.lastIndexOf("."));
//String fileExtension = currentJSP.substring(currentJSP.lastIndexOf(".") + 1);

String uri = request.getRequestURI();
%>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>슬기로운 대덕 생활 - GallerySingle</title>
    <meta content="개발 공부만 하기 바쁜 대덕인재개발원 사람들을 위해 점심머먹지? 오늘 어떤걸배우지? 바로 볼수 있습니다!" name="description">
    <meta content="대덕인재개발원, 대전광역시, 개발자, 커뮤니티, 점심추천, 시간표" name="keywords">
    <!-- Favicons -->
    <link href="/favicon.ico" rel="icon">
    <!-- Fonts -->
    <link rel="stylesheet" href="/css/font.css">
    <!-- Vendor CSS Files -->
<!--     footer34line에서 복사 -->
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<!--     footer34line에서 복사 -->
    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
    <link href="/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="/vendor/aos/aos.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="/css/main.css" rel="stylesheet">
    
    <% if(uri.contains("index")){ %>
      <link href="/css/index.css" rel="stylesheet">
      
   <% }else if(uri.contains("timetable")){ %>
      
         <link href="/css/timetable.css" rel="stylesheet">
         
    <% }else if(uri.contains("write")){ %>
       
    <link rel="stylesheet" href="/css/bootform2.css">  <!-- editer css 추가 -->
       
    <!-- <script>
	//             var fileInput = document.getElementById('fileInput');
	//             var toolbar = quill.getModule('toolbar');
	//             toolbar.addHandler('file', function () {
	//                 fileInput.click();
	//             });
	
	//             // 파일 선택 시
	//             fileInput.addEventListener('change', function () {
	//                 var file = fileInput.files[0];
	//                 if (file) {
	//                     uploadFile(file);
	//                 }
	//             });
	
	//             // 파일 업로드 함수
	//             function uploadFile(file) {
	//                 var formData = new FormData();
	//                 formData.append('file', file);
	
	//                 // 서버로 파일 업로드
	//                 var xhr = new XMLHttpRequest();
	//                 xhr.open('POST', 'upload.jsp', true);
	//                 xhr.onload = function () {
	//                     if (xhr.status === 200) {
	//                         var response = JSON.parse(xhr.responseText);
	//                         if (response.success) {
	//                             // 파일 업로드 성공 시, Quill 에디터에 링크 삽입
	//                             var range = quill.getSelection(true);
	//                             quill.insertText(range.index, response.url, { 'link': response.url });
	//                         } else {
	//                             console.error('File upload failed:', response.error);
	//                         }
	//                     } else {
	//                         console.error('File upload failed:', xhr.statusText);
	//                     }
	//                 };
	//                 xhr.onerror = function () {
	//                     console.error('File upload failed.');
	//                 };
	//                 xhr.send(formData);
	//             }
	            
	            // 사용자 정의 버튼을 추가합니다.
	//             var customButton = document.querySelector('.ql-myButton'); //editor요소존재시
	//             customButton.addEventListener('click', function() {
	//                 alert('Custom button clicked!');
	//             });
	
	           
	    </script> -->
    <% } %>
    
    
    
  </head>
  <body>
    <!-- ======= Header ======= -->
    <header id="header" class="header d-flex align-items-center fixed-top">
      <div class="container-fluid d-flex align-items-center justify-content-between">
        <a href="/views/index.jsp" class="logo d-flex align-items-center  me-auto me-lg-0">
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
                  <a href="freeBoard.jsp">자유게시판</a>
                </li>
                <li>
                  <a href="studyBoard.jsp">공부게시판</a>
                </li>
                <li>
                  <a href="newsBoard.jsp">공지게시판</a>
                </li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="restaurantFind.jsp">
                <span>식당찾기</span>
                <i class="bi-caret-down-fill"></i>
              </a>
              <ul>
                <li class="dropdown">
                  <a href="restaurantFindKorean.jsp">한식</a>
                </li>
                <li class="dropdown">
                  <a href="restaurantFindKorean.jsp">중식</a>
                </li>
                <li class="dropdown">
                  <a href="restaurantFindKorean.jsp">일식</a>
                </li>
                <li class="dropdown">
                  <a href="restaurantFindKorean.jsp">서양식</a>
                </li>
              </ul>
            </li>
            <li>
              <a href="foodLikeList.jsp">미식인의 추천맛집</a>
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
                  <a class="dropdown-item" href="<%=request.getContextPath() %>/member/join.do">회원가입</a>
                </li>
                <li>
                  <a class="dropdown-item" href="login.jsp">로그인</a>
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
