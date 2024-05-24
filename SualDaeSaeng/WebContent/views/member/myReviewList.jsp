<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.restaurant.vo.RestaurantVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/header.jsp" %>
<%	
	String url = request.getAttribute("javax.servlet.forward.request_uri") + "?" + request.getQueryString();
	RestaurantVO restDetails = (RestaurantVO) request.getAttribute("restDetails");
	String order = (String) request.getAttribute("order");

	List<RestaurantVO> restReviewList = (List<RestaurantVO>) request.getAttribute("restReviewList");
	MemberVO memDetail = (MemberVO) session.getAttribute("memDetail") != null ? (MemberVO) session.getAttribute("memDetail") : new MemberVO();
	UsersVO usersDetail = (UsersVO) session.getAttribute("usersDetail") != null ? (UsersVO) session.getAttribute("usersDetail") : new UsersVO();
%>

    <main data-aos="fade" data-aos-delay="700">
      <section id="restaurantView" class="pricing about d-flex flex-column gap-4">
	      <div class="container">
	          <div class="section-header d-flex justify-content-between align-items-center">
	            <p>
	            	<span>내가 작성한 리뷰</span> 
	            </p>
	          </div>
	          <hr class="my-0 pb-4">
	           <% 
					int noReview = 0;
					for(int i = 0; i < restReviewList.size(); i++){
						RestaurantVO restVo = restReviewList.get(i);
						if( restVo.getUsersNo() == usersDetail.getUsersNo()){
							noReview = 1;
						}
					}
		          if(id!=null && !id.isEmpty() && noReview==0){ 
		          %>
		          <div class="d-flex justify-content-between align-items-center py-3 mb-3 food-list new-review">
		            <p class="mb-0 d-flex align-items-center gap-3">
		              <img src="/img/testimonials/testimonials-2.jpg" class="testimonial-img" alt="" onError="this.src='https://i.imgur.com/BFfnYMT.jpeg';" >
		              <span class="fs-6" > <%=memDetail.getMemNick() %>님 아직 리뷰를 작성하지 않으셨군요! 당신의 리뷰를 기다리고 있습니다. <br> ※홍보 및 비방 등 부적절한 평가는 평점 산정에서 제외 될 수 있습니다. </span>
		            </p>
		          </div>
		          <% } %>
	          <div class="row gy-4 gx-4">
	          
	            <%if(restReviewList == null || restReviewList.size() == 0){ %>
					<div class="col-xl-12 col-lg-12 col-md-12 col-12">
						<p class="card-text ">리뷰가 존재하지 않습니다.</p>
					</div>
				<% } else {
					for (int i = 0; i < restReviewList.size(); i++) {
					  		RestaurantVO restVo = restReviewList.get(i);
			          	%>
			            <div class="col-lg-6">
			              <div class="food-list ">
			                <h6 class="mb-3 d-flex justify-content-between align-items-center">
			                  <span>
			                    <img src="/img/testimonials/testimonials-2.jpg" class="testimonial-img" alt="">
			                    <div class="d-flex flex-column ps-2 gap-2">
			                      <small><%=restVo.getNickName() %></small>
			                      <small class="stars mb-0 d-flex gap-2">
			                        <span class="gap-0">
			                        <%if(restVo.getReviewStar() == 10 ){%>
					                	<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
					                <%}else if(restVo.getReviewStar() == 9){%> 
					                	<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i>
					                <%}else if(restVo.getReviewStar() == 8){%> 
					                	<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i class="bi bi-star"></i>
					                <%}else if(restVo.getReviewStar() == 7){%> 
					                	<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i> <i class="bi bi-star"></i>
					                <%}else if(restVo.getReviewStar() == 6){%> 
					                	<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i class="bi bi-star"></i> <i class="bi bi-star"></i>
					                <%}else if(restVo.getReviewStar() == 5){%> 
					                	<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i> <i class="bi bi-star"></i> <i class="bi bi-star"></i>
					                <%}else if(restVo.getReviewStar() == 4){%> 
					                	<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i class="bi bi-star"></i> <i class="bi bi-star"></i> <i class="bi bi-star"></i>
					                <%}else if(restVo.getReviewStar() == 3){%> 
					                	<i class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i> <i class="bi bi-star"></i> <i class="bi bi-star"></i> <i class="bi bi-star"></i>
					                <%}else if(restVo.getReviewStar() == 2){%> 
					                	<i class="bi bi-star-fill"></i> <i class="bi bi-star"></i> <i class="bi bi-star"></i> <i class="bi bi-star"></i> <i class="bi bi-star"></i>
					                <%}else if(restVo.getReviewStar() == 1){%> 
					                	<i class="bi bi-star-half"></i> <i class="bi bi-star"></i> <i class="bi bi-star"></i> <i class="bi bi-star"></i> <i class="bi bi-star"></i>
					                <%}else if(restVo.getReviewStar() == 0){%>
					                	<i class="bi bi-star"></i> <i class="bi bi-star"></i> <i class="bi bi-star"></i> <i class="bi bi-star"></i> <i class="bi bi-star"></i>
					                <%}else{%> <%} %>
			                        </span>
			                        <span class="font-200"><%=restVo.getReviewStar() / 2 %></span>
			                      </small>
			                    </div>
			                  </span>
			                  <small class="day"><%=restVo.getReviewDate() %></small>
			                </h6>
			                <p> <%=restVo.getReviewText() %> </p>
			                <div class="d-flex justify-content-between overflow-x-scroll">
			                  <div class="col-lg-4 col-md-6 col-12 p-1">
			                    <img src="/img/gallery/gallery-1.jpg" class="img-fluid" alt="" onError="this.src='https://i.imgur.com/BFfnYMT.jpeg';" >
			                  </div>
			                  <div class="col-lg-4 col-md-6 col-12 p-1">
			                    <img src="/img/gallery/gallery-1.jpg" class="img-fluid" alt="" onError="this.src='https://i.imgur.com/BFfnYMT.jpeg';" >
			                  </div>
			                  <div class="col-lg-4 col-md-6 col-12 p-1">
			                    <img src="/img/gallery/gallery-1.jpg" class="img-fluid" alt="" onError="this.src='https://i.imgur.com/BFfnYMT.jpeg';" >
			                  </div>
			                </div>
			                <hr>
			                <!-- 
			                <button type="button" class="btn btn-secondary btn-sm">
			                  <span>00님 맛집 </span>리스트 더보기 
			                </button>
			                 -->
			              </div>
			            </div>
						<% } %>
					<% } %>
	          </div>
	        </div>
    	</section>
    </main>
<%@include file="/footer.jsp" %>