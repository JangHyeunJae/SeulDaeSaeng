<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
    <link href="/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="/vendor/aos/aos.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="/css/main.css" rel="stylesheet">
    
    
   
    <% if(request.getRequestURI().contains("index")){ %>
      <link href="/css/index.css" rel="stylesheet">
   <% }else if(request.getRequestURI().contains("timetable")){ %>
         <link href="/css/timetable.css" rel="stylesheet">
    <% }else if(request.getRequestURI().contains("write")){ %>
       <link href="/css/write.css" rel="stylesheet">
    <% }else if(request.getRequestURI().contains("restaurantUpDate")){%>
       <link href="/css/restaurantUpDate.css" rel="stylesheet">
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
                  <a class="dropdown-item" href="join.jsp">회원가입</a>
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
