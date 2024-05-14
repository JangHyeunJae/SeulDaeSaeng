<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
    <footer id="footer" class="footer">
      <div>
        <ul class="credits">
          <li>
            <a href="privacy.jsp">개인정보 처리방침</a>
          </li>
          <li>
            <a href="siteMap.jsp">사이트맵</a>
          </li>
          <li>
            <a href="contact.jsp">오류제보</a>
          </li>
        </ul>
        <div class="copyright"> &copy; Copyright <strong>
            <span>슬기로운 대덕 생활</span>
          </strong>. All Rights Reserved </div>
      </div>
    </footer>
    
    <!-- End Footer -->
    <a href="#" class="scroll-top d-flex align-items-center justify-content-center">
      <i class="bi bi-arrow-up-short"></i>
    </a>
    
    <!--  
    <div id="preloader">
      <div class="line"></div>
    </div>
    -->
    
    <!-- Vendor JS Files -->
    
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js"></script>
    <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/vendor/swiper/swiper-bundle.min.js"></script>
    <script src="/vendor/glightbox/js/glightbox.min.js"></script>
    <script src="/vendor/aos/aos.js"></script>
    <script src="/vendor/php-email-form/validate.js"></script>
    
    <!-- Template Main JS File -->
    <script src="/js/main.js"></script>
    <% if(uri.contains("timetable")){ %>
         <script src="/js/timetable.js"></script>
    <% }else if( uri.contains("write")){ %>
       <script src="/js/write.js"></script>
    <% } %>
  </body>
</html>