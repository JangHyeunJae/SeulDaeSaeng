<%@page import="kr.or.ddit.restaurant.vo.RestaurantVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.xml.parsers.*" %>
<%@ page import="java.io.ByteArrayInputStream" %>
<%@ page import="org.w3c.dom.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.net.URL" %>

<%@include file="/header.jsp" %>
<%
	RestaurantVO restDetails = (RestaurantVO) request.getAttribute("restDetails");
	String responseBlog = (String) request.getAttribute("responseBlog");
	String responseImg = (String) request.getAttribute("responseImg");
	
	String menuName1 = request.getAttribute("menuName1")!=null ? (String) request.getAttribute("menuName1") : "";
	String menuName2 = request.getAttribute("menuName2")!=null ? (String) request.getAttribute("menuName2") : "";
	String menuName3 = request.getAttribute("menuName3")!=null ? (String) request.getAttribute("menuName3") : "";
	String menuName4 = request.getAttribute("menuName4")!=null ? (String) request.getAttribute("menuName4") : "";
	
	String menuPrice1 = request.getAttribute("menuPrice1")!=null ? (String) request.getAttribute("menuPrice1") : "";
	String menuPrice2 = request.getAttribute("menuPrice2")!=null ? (String) request.getAttribute("menuPrice2") : "";
	String menuPrice3 = request.getAttribute("menuPrice3")!=null ? (String) request.getAttribute("menuPrice3") : "";
	String menuPrice4 = request.getAttribute("menuPrice4")!=null ? (String) request.getAttribute("menuPrice4") : "";

	String restAddr = request.getAttribute("restAddr")!=null ? (String) request.getAttribute("restAddr") : "";
	
	String restNaverMap = request.getAttribute("restNaverMap")!=null ? (String) request.getAttribute("restNaverMap"): "";
	String restNowSales = request.getAttribute("restNowSales")!=null ? (String) request.getAttribute("restNowSales") : "";
	String restSalesTime = request.getAttribute("restSalesTime")!=null ? (String) request.getAttribute("restSalesTime") : "";
	String restPhoneNum = request.getAttribute("restPhoneNum")!=null ? (String) request.getAttribute("restPhoneNum") : "";
	String restAddInfo = request.getAttribute("restAddInfo")!=null ? (String) request.getAttribute("restAddInfo") : "";	
	
	// DocumentBuilderFactory 객체 생성
	DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
	
	// builder 변수 선언
	DocumentBuilder builder = factory.newDocumentBuilder();
	
	//XML 파싱
	Document blogDocument = builder.parse(new ByteArrayInputStream(responseBlog.getBytes()));
	Element blogRootElement = blogDocument.getDocumentElement();
	
	Document imageDocument = builder.parse(new ByteArrayInputStream(responseImg.getBytes()));
	Element imageRootElement = imageDocument.getDocumentElement();

%>

    <main data-aos="fade" data-aos-delay="1500">
      <!-- ======= End Page Header ======= -->
      <div class="page-header restaurant d-flex align-items-center">
        <div class="container position-relative">
          <div class="row d-flex justify-content-center">
            <div>
              <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item">
                    <a href="<%=request.getContextPath() %>/restaurant/find.do?mcls=all">식당찾기</a>
                  </li>
                  <li class="breadcrumb-item">
                    <a href="<%=request.getContextPath() %>/restaurant/find.do?mcls=<%=restDetails.getMcls()%>"><%=restDetails.getMclsName()%></a>
                  </li>
                  <li class="breadcrumb-item">
                    <a href="<%=request.getContextPath() %>/restaurant/find.do?mcls=<%=restDetails.getScls()%>"><%=restDetails.getSclsName()%></a>
                  </li>
                  <li class="breadcrumb-item active" aria-current="page"><%=restDetails.getName()%></li>
                </ol>
              </nav>
              <h2 class="pb-2"><%=restDetails.getName()%></h2>
              <div class="d-flex justify-content-between align-items-center">
                <p class="stars fs-4">
                <%
                String score = (int) restDetails.getAvgReviewStar()!=-1 ? ""+ (int) restDetails.getAvgReviewStar() : "리뷰없음";
                if(score.equals("10")){%>
                	<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
                <%}else if(score.equals("9")){%> 
                	<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i>
                <%}else if(score.equals("8")){%> 
                	<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i class="bi bi-star"></i>
                <%}else if(score.equals("7")){%> 
                	<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i> <i class="bi bi-star"></i>
                <%}else if(score.equals("6")){%> 
                	<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i class="bi bi-star"></i> <i class="bi bi-star"></i>
                <%}else if(score.equals("5")){%> 
                	<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i> <i class="bi bi-star"></i> <i class="bi bi-star"></i>
                <%}else if(score.equals("4")){%> 
                	<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i class="bi bi-star"></i> <i class="bi bi-star"></i> <i class="bi bi-star"></i>
                <%}else if(score.equals("3")){%> 
                	<i class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i> <i class="bi bi-star"></i> <i class="bi bi-star"></i> <i class="bi bi-star"></i>
                <%}else if(score.equals("2")){%> 
                	<i class="bi bi-star-fill"></i> <i class="bi bi-star"></i> <i class="bi bi-star"></i> <i class="bi bi-star"></i> <i class="bi bi-star"></i>
                <%}else if(score.equals("1")){%> 
                	<i class="bi bi-star-half"></i> <i class="bi bi-star"></i> <i class="bi bi-star"></i> <i class="bi bi-star"></i> <i class="bi bi-star"></i>
                <%}else if(score.equals("0")){%>
                	<i class="bi bi-star"></i> <i class="bi bi-star"></i> <i class="bi bi-star"></i> <i class="bi bi-star"></i> <i class="bi bi-star"></i>
                <%}else{%> <%} %> 
                  <b>(<%=score %>) <span>(<%=restDetails.getTotalReview()%>명의 평가)</span>
                  </b>
                </p>
                <p class="like d-flex align-items-center gap-3">
                  <span style="color: var(--bs-red)">
                    <i class="bi bi-heart-fill"></i> <%=restDetails.getLikeCount() %>명 좋아하는 중 
                  </span>
                  <% if(id!=null && !id.isEmpty()){ %>                	  
                  <input type="checkbox" class="btn-check" id="btn-check" autocomplete="off">
                  <label class="btn btn-danger d-flex align-items-center gap-2" for="btn-check">
                    <span>
                      <i class="bi bi-heart-fill"></i> 좋아요 </span>
                    <span>
                      <i class="bi bi-heart"></i> 취소 </span>
                  </label>
                  <% } %>
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
			   	<script>
				   	function initMap() {
				   	  const map = new google.maps.Map(document.getElementById("map"), {
				   	    center: { lat: <%=restDetails.getLat()%>, lng: <%=restDetails.getLon()%> },
				   	    zoom: 18,
				   	    mapId: "4504f8b37365c3d0",
				   	  });
				   	  const priceTag = document.createElement("div");
	
				   	  priceTag.className = "price-tag";
				   	  priceTag.textContent = "<%=restDetails.getName()%>";
	
				   	  const markerView = new google.maps.marker.AdvancedMarkerView({  map,
				   	    position: { lat: <%=restDetails.getLat()%>, lng: <%=restDetails.getLon()%> },
				   	    content: priceTag,
				   	  });
				   	}
	
				   	window.initMap = initMap;
			    </script>
              	<div id="map" class="w-100 h-100"></div>
            </div>
            <div class="col-lg-5">
              <ul>
              	<% if(!restAddr.equals("")){ %>
                <li>
                  <i class="bi bi-geo-alt-fill"></i>
                  <strong>주소 </strong>
                  <span>
                  	<%=restAddr %>
              		<% if(!restNaverMap.equals("")){ %>
              			<a href="<%=restNaverMap%>">네이버지도</a>
              		<% } %>
                  </span>
                </li>              	
              	<% } else { %>
                <li>
                  <i class="bi bi-geo-alt-fill"></i>
                  <strong>주소 </strong>
                  <span>
                  	<%=restDetails.getAddrBasic()%>
              		<% if(!restNaverMap.equals("")){ %>
              			<a href="<%=restNaverMap%>">네이버지도</a>
              		<% } %>
                  </span>
                </li>             		
              	<% } %>
       			<% if(!restPhoneNum.equals("")){ %>
                <li>
                  <i class="bi bi-telephone-fill"></i>
                  <strong>전화번호 </strong>
                  <a href="tel:+82<%=restPhoneNum %>"><%=restPhoneNum %></a>
                </li>       				
       			<% } %>
          		<% if(!restNowSales.equals("")){ %>
                <li>
                  <i class="bi bi-calendar2-check-fill"></i>
                  <strong><%=restNowSales %> </strong>
          		  <%if(!restSalesTime.equals("")){%>
          			  <span><%=restSalesTime%></span>
          		  <%}%>
                </li>          			
          		<% } %>
   				<%if(!restAddInfo.equals("")){%>
                <li>
                  <i class="bi bi-plus-square-fill"></i>
                  <strong>추가정보 </strong>
                  <span><%=restAddInfo %></span>
                </li>	
   				<%}%>
              </ul>
            </div>
          </div>
        </div>
        <% if(!menuName1.equals("")){ %>
        <div class="container">
          <div class="section-header">
            <p><span>네이버제공</span> 메뉴</p>
          </div>
          <div class="row gy-4 gx-lg-5">
            <div class="col-lg-6">
              <div class="pricing-item d-flex justify-content-between">
                <h3><%=menuName1 %></h3>
                <h4><%=menuPrice1 %></h4>
              </div>
            </div>
            <% if(!menuName2.equals("")){ %>
            <div class="col-lg-6">
              <div class="pricing-item d-flex justify-content-between">
                <h3><%=menuName2 %></h3>
                <h4><%=menuPrice2 %></h4>
              </div>
            </div>
            <% } %>
            <% if(!menuName3.equals("")){ %>
            <div class="col-lg-6">
              <div class="pricing-item d-flex justify-content-between">
                <h3><%=menuName3 %></h3>
                <h4><%=menuPrice3 %></h4>
              </div>
            </div>
            <% } %>
            <% if(!menuName4.equals("")){ %>            
            <div class="col-lg-6">
              <div class="pricing-item d-flex justify-content-between">
                <h3><%=menuName4 %></h3>
                <h4><%=menuPrice4 %></h4>
              </div>
            </div>
            <% } %>
          </div>
        </div>
        <% } %>
        
        <div class="container">
          <div class="section-header d-flex justify-content-between align-items-center">
            <p>
            	<span>슬대생리뷰</span> 
	            <b><%=restDetails.getTotalReview()%>건 평균 </b>
	            <span class="stars">
	              <i class="bi bi-star-fill"></i>
	              <b><%=score %></b>
	            </span>
            </p>
          </div>
          <hr class="my-0 pb-4">
          <% if(id!=null && !id.isEmpty()){ %>
          <div class="d-flex justify-content-between align-items-center py-3 mb-3 food-list new-review">
            <p class="mb-0 d-flex align-items-center gap-3">
              <img src="/img/testimonials/testimonials-2.jpg" class="testimonial-img" alt="">
              <span> 00님 아직 리뷰를 작성하지 않으셨군요! 당신의 리뷰를 기다리고 있습니다. <br> ※홍보 및 비방 등 부적절한 평가는 평점 산정에서 제외 될 수 있습니다. </span>
            </p>
            <button type="button" class="btn btn-outline-warning">리뷰쓰기</button>
          </div>
          <% } %>
          <div class="row gy-4 gx-4">
          
            <div class="col-lg-6">
              <div class="food-list ">
                <h6 class="mb-3 d-flex justify-content-between align-items-center">
                  <span>
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
                <!-- 
                <button type="button" class="btn btn-secondary btn-sm">
                  <span>00님 맛집 </span>리스트 더보기 
                </button>
                 -->
              </div>
            </div>

            <div class="col-xl-12 col-lg-12 col-md-12 text-center">
              <a class="cta-btn text-center" href="#">더보기</a>
            </div>
          </div>
        </div>
		<%
       	NodeList itemList = blogRootElement.getElementsByTagName("item");
       	if(itemList.getLength()>0){ 
       	%>
		<div class="container gallery">
          <div class="section-header">
            <p><span>네이버제공</span> 블로그</p>
          </div>
          <ul class="row gy-4 justify-content-start ps-0">
         <% for (int i = 0; i < itemList.getLength(); i++) { %>
             <li class="card col-xl-3 col-lg-4 col-md-6">
                 <% 
                     Element itemElement = (Element) itemList.item(i);
                     String title = itemElement.getElementsByTagName("title").item(0).getTextContent();
                     String link = itemElement.getElementsByTagName("link").item(0).getTextContent();
                     String description = itemElement.getElementsByTagName("description").item(0).getTextContent();
                     String postdate = itemElement.getElementsByTagName("postdate").item(0).getTextContent();
                     String bloggername = itemElement.getElementsByTagName("bloggername").item(0).getTextContent();
                 %>
                 <a href="<%=link %>">
                   <div class="card-body">
                     <small class="badge bg-body-secondary mb-1">작성일 :<%=postdate %></small>
                     <small class="badge bg-body-secondary mb-1">작성자 :<%=bloggername %></small>
                    <h5 class="card-title text-truncate pt-2"><%=title %></h5>
                     <p class="card-text "><%=description %></p>
                   </div>
                 </a>
             </li>
           <% } %>
         </ul>
        </div>
        <% } %>
        <% 
        NodeList itemNodeList = imageRootElement.getElementsByTagName("item");
        if(itemNodeList.getLength()>0){
        %>
        <div class="container gallery">
          <div class="section-header">
            <p><span>네이버제공</span> 이미지</p>
          </div>
          <div class="row gy-4 justify-content-start">
            <% for (int i = 0; i < itemNodeList.getLength(); i++) { %>
	             <div class="col-xl-3 col-lg-4 col-md-6">
	                <% 
	                   Element itemElement = (Element) itemNodeList.item(i);
	                   String title = itemElement.getElementsByTagName("title").item(0).getTextContent();
	                   String link = itemElement.getElementsByTagName("link").item(0).getTextContent();
	                   String thumbnail = itemElement.getElementsByTagName("thumbnail").item(0).getTextContent();
	               %>
	               <div class="h-m-180 overflow-hidden">
	                  <a href="<%=link%>" target="_blank" class="w-100 h-100 d-flex" >
                  		<img src="<%=link%>" class="card-img" alt="<%=title%>" onError="this.src='<%=thumbnail%>';" />
	                 </a>
	               </div>
	             </div>
            <% } %>
          </div>
        </div>
        <% } %>
    </main>
<%@include file="/footer.jsp" %>