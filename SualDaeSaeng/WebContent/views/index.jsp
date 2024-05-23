<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.Image"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="kr.or.ddit.board.vo.FileDetailVO"%>
<%@page import="kr.or.ddit.board.service.BoardServiceImpl"%>
<%@page import="kr.or.ddit.board.service.IBoardService"%>
<%@page import="kr.or.ddit.board.vo.StoryVO"%>
<%@page import="kr.or.ddit.board.service.BoardServiceImpl"%>
<%@page import="kr.or.ddit.board.service.IBoardService"%>
<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page import="java.net.URLEncoder" %>
<%@page import="kr.or.ddit.restaurant.vo.RestaurantVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/header.jsp" %>

<% 
	IBoardService boardService = BoardServiceImpl.getInstance();

	List<RestaurantVO> restLikeList = (List<RestaurantVO>) request.getAttribute("restLikeList"); 
	List<BoardVO> boardList = (List<BoardVO>)boardService.allBoardList();
	List<BoardVO> noticeList = (List<BoardVO>)boardService.selectBoardList(3);
  List<StoryVO> storyList = (List<StoryVO>)request.getAttribute("storyList"); 
%>

    <main data-aos="fade" data-aos-delay="700">
      <!-- ======= food Recommendation ======= -->
      <section id="food">
        <div id="textAmin"> 오늘은 <div id=flip>
            <div>
              <a href="<%=request.getContextPath() %>/restaurant/find.do?mcls=I201">한식</a>
            </div>
            <div>
              <a href="<%=request.getContextPath() %>/restaurant/find.do?mcls=I202">중식</a>
            </div>
            <div>
              <a href="<%=request.getContextPath() %>/restaurant/find.do?mcls=I203">일식</a>
            </div>
            <div>
              <a href="<%=request.getContextPath() %>/restaurant/find.do?mcls=I204">서양식</a>
            </div>
            <div>
              <a href="<%=request.getContextPath() %>/restaurant/find.do?mcls=I205">동남아식</a>
            </div>
            <div>
              <a href="<%=request.getContextPath() %>/restaurant/find.do?mcls=I210">간이식</a>
            </div>
          </div> 어떠세요? </div>
        <div class="container">
          <div class="position-relative h-100">
            <div class="slides-icon portfolio-details-slider swiper">
              <div class="swiper-wrapper align-items-center">
              <%
              	List<RestaurantVO> menuList = (List<RestaurantVO>) request.getAttribute("sclsList");
                 for (int i = 0; i < menuList.size(); i++) {
				  		RestaurantVO restVo = menuList.get(i);
               %>
                <a href="<%=request.getContextPath() %>/restaurant/find.do?mcls=<%=restVo.getMcls() %>&scls=<%=restVo.getScls()%>" class="swiper-slide">
                  <img src="/img/icon/<%=restVo.getScls()%>.png" alt="<%=restVo.getSclsName()%> 이미지" onError="this.src='https://i.imgur.com/BFfnYMT.jpeg';" >
                  <p><%=restVo.getSclsName()%></p>
                </a>
                <% } %>
              </div>
              <div class="swiper-pagination"></div>
            </div>
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
          </div>
        </div>
      </section>
      <!-- End #food -->
       <% if(id!=null && !id.isEmpty()){ %>
      <!-- ======= story Recommendation ======= -->
      <section id="story">
        <div class="container-fluid">
          <div class="section-header">
            <h2>story</h2>
            <p>
              <span>슬대생,</span> 오늘의 이야기
            </p>
          </div>
          <div class="position-relative ">
            <div class="slides-story portfolio-details-slider swiper">
              <div class="swiper-wrapper align-items-center gallery">
              <%
              for(StoryVO story : storyList){
            	  if(story.getStoryYn().equals("Y")){
            	  FileDetailVO img = boardService.getFileDetail(story.getFileNo());
              %>
                <div class="swiper-slide">
                  <img src="<%= request.getContextPath() %>/file/download.do?fileNo=<%=img.getFileNo() %>" class="img-fluid" alt="" onError="this.src='https://i.imgur.com/BFfnYMT.jpeg';" >
                  <p><%=story.getStoryCon() %></p>
                </div>
              <%
            	  }
               }
              %>
              </div>
              <div class="swiper-pagination"></div>
            </div>
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
          </div>
        </div>
      </section>
      <!-- end #story -->
      <!-- ======= board-type Recommendation ======= -->
      <section id="board-type" class="services">
        <div class="container">
          <div class="row gy-4">
            <div class="col-xl-3 col-md-6 d-flex">
              <div class="service-item position-relative">
                <i class="bi bi-card-list"></i>
                <h4>
                  <a href="<%=request.getContextPath()%>/freeBoard.do" class="stretched-link">자유게시판</a>
                </h4>
                <p>대덕인재개발원이면 누구나 어떤 주제로도 자유롭게 게시글을 작성할 수 있습니다. 지금 한번 작성해 보세요!</p>
              </div>
            </div>
            <!-- End Service Item -->
            <div class="col-xl-3 col-md-6 d-flex">
              <div class="service-item position-relative">
                <i class="bi bi-highlighter"></i>
                <h4>
                  <a href="<%=request.getContextPath()%>/studyBoard.do" class="stretched-link">공부게시판</a>
                </h4>
                <p>공부에 도움이되는 자료나 사이트등을 공유해보세요! 혹은 잘 안풀리는 코드나 이해가 안되는 내용을 올려 도움을 받아보세요!</p>
              </div>
            </div>
            <!-- End Service Item -->
            <div class="col-xl-3 col-md-6 d-flex">
              <div class="service-item position-relative">
                <i class="bi bi-collection"></i>
                <h4>
                  <a href="<%=request.getContextPath()%>/classBoard.do" class="stretched-link">학급별 게시판</a>
                </h4>
                <p> 학급별 시간표, 채팅방, 게시판을 통해 교류를 해보세요. 과제제출 및 관리 파일공유도 가능합니다.</p>
              </div>
            </div>
            <!-- End Service Item -->
            <div class="col-xl-3 col-md-6 d-flex">
              <div class="service-item position-relative">
                <i class="bi bi-shop"></i>
                <h4>
                  <a href="" class="stretched-link">미식인의 맛집 추천</a>
                </h4>
                <p>대덕인재개발원 근처의 식당에 좋아요를 누르고 리스트를 공유해보세요! 리스트에 가장 많은 좋아요를 받으면 미식인 칭호를 드립니다!</p>
              </div>
            </div>
            <!-- End Service Item -->
          </div>
        </div>
      </section>
      <!-- End #board-type -->
      <!-- ======= all-board Recommendation ======= -->
      <section id="all-board">
        <div class="container-lg d-flex justify-content-between">
          <div>
            <div class="section-header">
              <h2>board</h2>
              <p class="d-flex justify-content-between align-items-center"> 전체 공지글 <button type="button" class="btn btn-outline-warning btn-sm"
              		onclick="location.href='<%=request.getContextPath()%>/noticeBoard.do'">더보기</button>
              </p>
            </div>
            
            <div class="list-group">
            	<%
					if (noticeList == null || noticeList.isEmpty()) {
			    %>
			    <p>    작성된 글이 없습니다</p>
               	<%
					}else{
						int length = noticeList.size();
						if(noticeList.size()>=3){
							length = 3;
						}
						for(int i=0 ; i<length ; i++){
		               		BoardVO bv = noticeList.get(i);
		               		// html 제거
	                        String ogContent = bv.getBoardCon();
	                      	String regex = "<[^>]*>";
	                      	String pureContent = ogContent.replaceAll(regex, "");
               	%>
              		  <a href="<%=request.getContextPath()%>/board/detail.do?boardNo=<%=bv.getBoardNo() %>
							&idx=<%=i %>&levelChk=3" class="list-group-item">
		                <div class="d-flex w-100 justify-content-between align-items-center">
		                  <h5 class="mb-2 text-truncate">
		                    <small class="attach">
		                      <i class="bi bi-paperclip"></i>
		                    </small> <%=bv.getBoardTitle() %>
		                  </h5>
		                  <%
		                  	String boardName = "공지사항";
		                  %>
		                  <small class="badge bg-light"><%=boardName %></small>
		                </div>
		                <p class="mb-2 text-truncate"><%=pureContent %></p>
		                <div class="d-flex w-100 justify-content-between align-items-center">
		                  <small class="days"><%=bv.getBoardAt() %></small>
		                  <small class="look">
		                    <i class="bi bi-eye"></i> <%=bv.getBoardHit() %> </small>
		                </div>
		              </a>
              	<%
                 		}
					}
                %>
            </div>
          </div>
          <div>
            <div class="section-header">
              <h2>board</h2>
              <p class="d-flex justify-content-between align-items-center"> 전체 최신글 <button type="button" class="btn btn-outline-warning btn-sm"
              		onclick="location.href='<%=request.getContextPath()%>/allBoard.do'">더보기</button>
              </p>
            </div>
            
            <div class="list-group">
            	<%
					if (boardList == null || boardList.isEmpty()) {
			    %>
			    <p>    작성된 글이 없습니다</p>
               	<%
					}else{
						int length = boardList.size();
						int cnt = 0;
						for(int i=0 ; i<length ; i++){
							if(cnt == 3) break;
		               		BoardVO bv = boardList.get(i);
		               		if(bv.getBoardLevel() == 3){
		               			continue;
		               		}
		               		cnt++;
		               		// html 제거
	                        String ogContent = bv.getBoardCon();
	                      	String regex = "<[^>]*>";
	                      	String pureContent = ogContent.replaceAll(regex, "");
               	%>
		              <a href="<%=request.getContextPath()%>/board/detail.do?boardNo=<%=bv.getBoardNo() %>
							&idx=<%=i %>&levelChk=0" class="list-group-item">
		                <div class="d-flex w-100 justify-content-between align-items-center">
		                  <h5 class="mb-2 text-truncate">
		                    <small class="attach">
		                      <i class="bi bi-paperclip"></i>
		                    </small> <%=bv.getBoardTitle() %>
		                  </h5>
		                  <%
		                  	String boardName = null;
		                  	if(bv.getBoardLevel() == 1){
		                  		boardName = "자유게시판";
		                  	}else if(bv.getBoardLevel() == 2){
		                  		boardName = "공부게시판";
		                  	}
		                  %>
		                  <small class="badge bg-light"><%=boardName %></small>
		                </div>
		                <p class="mb-2 text-truncate"><%=pureContent %></p>
		                <div class="d-flex w-100 justify-content-between align-items-center">
		                  <small class="days"><%=bv.getBoardAt() %></small>
		                  <small class="look">
		                    <i class="bi bi-eye"></i> <%=bv.getBoardHit() %> </small>
		                </div>
		              </a>
              	<%
                 		}
					}
                 %>
            </div>
          </div>
        </div>
      </section>
      <!-- end #all-board -->
      <% } %>
      <!-- ======= restaurant Section ======= -->
      <section id="restaurant">
        <nav class="container d-flex">
          <ul class="food-list-board">
            <li class="section-header">
              <h2>restaurant</h2>
              <p class="d-flex justify-content-between align-items-center">
                <b>TOP3 <span>미식인의 추천맛집</span>
                </b>
                <button type="button" class="btn btn-outline-warning btn-sm">더보기</button>
              </p>
            </li>
            <li class="food-list">
              <h6 class="mb-3 d-flex justify-content-between align-items-center">
                <span>
                  <i class="bi bi-person-circle"></i>
                  <!-- <img src="img/testimonials/testimonials-2.jpg" class="testimonial-img" alt=""> --> 고객 아이디 </span>
                <button type="button" class="btn btn-secondary btn-sm">
                  <span>00님 맛집 </span>리스트 더보기 </button>
              </h6>
              <ul class="d-flex justify-content-between">
                <li class="card">
                  <a href="http://">
                    <p class="card-like">
                      <i class="bi bi-heart-fill"></i>
                      <span>25</span>
                    </p>
                    <div class="img-fluid">
                      <img src="/img/gallery/gallery-1.jpg" class="card-img-top" alt="맛집이미지" onError="this.src='https://i.imgur.com/BFfnYMT.jpeg';" >
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
                <li class="card dis-none-550">
                  <a href="http://">
                    <p class="card-like">
                      <i class="bi bi-heart-fill"></i>
                      <span>25</span>
                    </p>
                    <div class="img-fluid">
                      <img src="/img/gallery/gallery-1.jpg" class="card-img-top" alt="맛집이미지" onError="this.src='https://i.imgur.com/BFfnYMT.jpeg';" >
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
                <li class="card dis-none-750">
                  <a href="http://">
                    <p class="card-like">
                      <i class="bi bi-heart-fill"></i>
                      <span>25</span>
                    </p>
                    <div class="img-fluid">
                      <img src="/img/gallery/gallery-1.jpg" class="card-img-top" alt="맛집이미지" onError="this.src='https://i.imgur.com/BFfnYMT.jpeg';" >
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
            </li>
            <li class="food-list">
              <h6 class="mb-3 d-flex justify-content-between align-items-center">
                <span>
                  <i class="bi bi-person-circle"></i>
                  <!-- <img src="img/testimonials/testimonials-2.jpg" class="testimonial-img" alt=""> --> 고객 아이디 </span>
                <button type="button" class="btn btn-secondary btn-sm">
                  <span>00님 맛집 </span>리스트 더보기 </button>
              </h6>
              <ul class="d-flex justify-content-between">
                <li class="card">
                  <a href="http://">
                    <p class="card-like">
                      <i class="bi bi-heart-fill"></i>
                      <span>25</span>
                    </p>
                    <div class="img-fluid">
                      <img src="/img/gallery/gallery-1.jpg" class="card-img-top" alt="맛집이미지" onError="this.src='https://i.imgur.com/BFfnYMT.jpeg';" >
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
                <li class="card dis-none-550">
                  <a href="http://">
                    <p class="card-like">
                      <i class="bi bi-heart-fill"></i>
                      <span>25</span>
                    </p>
                    <div class="img-fluid">
                      <img src="/img/gallery/gallery-1.jpg" class="card-img-top" alt="맛집이미지" onError="this.src='https://i.imgur.com/BFfnYMT.jpeg';" >
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
                <li class="card dis-none-750">
                  <a href="http://">
                    <p class="card-like">
                      <i class="bi bi-heart-fill"></i>
                      <span>25</span>
                    </p>
                    <div class="img-fluid">
                      <img src="/img/gallery/gallery-1.jpg" class="card-img-top" alt="맛집이미지" onError="this.src='https://i.imgur.com/BFfnYMT.jpeg';" >
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
            </li>
            <li class="food-list">
              <h6 class="mb-3 d-flex justify-content-between align-items-center">
                <span>
                  <i class="bi bi-person-circle"></i>
                  <!-- <img src="img/testimonials/testimonials-2.jpg" class="testimonial-img" alt=""> --> 고객 아이디 </span>
                <button type="button" class="btn btn-secondary btn-sm">
                  <span>00님 맛집 </span>리스트 더보기 </button>
              </h6>
              <ul class="d-flex justify-content-between">
                <li class="card">
                  <a href="http://">
                    <p class="card-like">
                      <i class="bi bi-heart-fill"></i>
                      <span>25</span>
                    </p>
                    <div class="img-fluid">
                      <img src="/img/gallery/gallery-1.jpg" class="card-img-top" alt="맛집이미지" onError="this.src='https://i.imgur.com/BFfnYMT.jpeg';" >
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
                <li class="card dis-none-550">
                  <a href="http://">
                    <p class="card-like">
                      <i class="bi bi-heart-fill"></i>
                      <span>25</span>
                    </p>
                    <div class="img-fluid">
                      <img src="/img/gallery/gallery-1.jpg" class="card-img-top" alt="맛집이미지" onError="this.src='https://i.imgur.com/BFfnYMT.jpeg';" >
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
                <li class="card dis-none-750">
                  <a href="http://">
                    <p class="card-like">
                      <i class="bi bi-heart-fill"></i>
                      <span>25</span>
                    </p>
                    <div class="img-fluid">
                      <img src="/img/gallery/gallery-1.jpg" class="card-img-top" alt="맛집이미지" onError="this.src='https://i.imgur.com/BFfnYMT.jpeg';" >
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
            </li>
          </ul>
          <ul class="food-like">
            <div class="section-header">
              <h2>restaurant</h2>
              <p class="d-flex justify-content-between align-items-center">
                <b>좋아요 <span>가 많아요!</span>
                </b>
                <a href="http://localhost:8888/restaurant/find.do?mcls=all&order=likeUp" class="btn btn-outline-warning btn-sm">더보기</a>
              </p>
            </div>
            <ul>
              <% if(restLikeList==null || restLikeList.isEmpty()){ %>
            	  <li>식당이 존재하지 않습니다.</li>
              <% } else { 
              		for(int i=0; i < restLikeList.size(); i++) {
						RestaurantVO restVo = restLikeList.get(i);
						%>
		              <li class="card">
		                <a href="<%=request.getContextPath() %>/restaurant/view.do?no=<%=restVo.getRestBizno() %>">
		                  <div class="card-body">
		                    <small class="badge bg-body-secondary mb-1">
								<%=restVo.getMclsName()%>
								&raquo;
								<%=restVo.getSclsName()%>
							</small>
		                    <div class="d-flex justify-content-between align-items-center pt-2">
		                      <h5 class="card-title text-truncate"><%=restVo.getName()%></h5>
		                      <span class="text-danger">
		                        <i class="bi bi-heart-fill text-danger"></i> <%=restVo.getLikeCount() %> 
		                      </span>
		                    </div>
		                    <p class="card-text "><%=restVo.getAddrBasic() %></p>
		                  </div>
		                </a>
		              </li>
              	<% 	}
              	}%>
            </ul>
          </ul>
        </nav>
      </section>
      <!-- End restaurant Section -->
      <!-- ======= Testimonials Section ======= -->
      <section id="testimonials" class="testimonials">
        <div class="container">
          <div class="section-header">
            <h2>restaurant</h2>
            <p class="d-flex justify-content-between align-items-center"> 최신 리뷰 <a href="<%=request.getContextPath() %>/restaurant/find.do?mcls=all&order=likeUp" class="btn btn-outline-warning btn-sm">별점높은 식당보기</a>
            </p>
          </div>
          <div class="slides-3 swiper">
            <div class="swiper-wrapper">
              <div class="swiper-slide">
                <div class="testimonial-item">
                  <div class="stars">
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-half"></i>
                  </div>
                  <p> Proin iaculis purus consequat sem cure digni ssim donec porttitora entum suscipit rhoncus. Accusantium quam,</p>
                  <div class="profile mt-auto mb-3">
                    <h4>2024-05-03</h4>
                    <h3>고객아이디</h3>
                  </div>
                  <a class="cta-btn" href="contact.html">식당 자세히 보기</a>
                </div>
              </div>
              <!-- End testimonial item -->
              <div class="swiper-slide">
                <div class="testimonial-item">
                  <div class="stars">
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-half"></i>
                  </div>
                  <p> Proin iaculis purus consequat sem cure digni ssim donec porttitora entum suscipit rhoncus. Accusantium quam,</p>
                  <div class="profile mt-auto mb-3">
                    <h4>2024-05-03</h4>
                    <h3>고객아이디</h3>
                  </div>
                  <a class="cta-btn" href="contact.html">식당 자세히 보기</a>
                </div>
              </div>
              <!-- End testimonial item -->
              <div class="swiper-slide">
                <div class="testimonial-item">
                  <div class="stars">
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-half"></i>
                  </div>
                  <p> Proin iaculis purus consequat sem cure digni ssim donec porttitora entum suscipit rhoncus. Accusantium quam,</p>
                  <div class="profile mt-auto mb-3">
                    <h4>2024-05-03</h4>
                    <h3>고객아이디</h3>
                  </div>
                  <a class="cta-btn" href="contact.html">식당 자세히 보기</a>
                </div>
              </div>
              <!-- End testimonial item -->
              <div class="swiper-slide">
                <div class="testimonial-item">
                  <div class="stars">
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-half"></i>
                  </div>
                  <p> Proin iaculis purus consequat sem cure digni ssim donec porttitora entum suscipit rhoncus. Accusantium quam,</p>
                  <div class="profile mt-auto mb-3">
                    <h4>2024-05-03</h4>
                    <h3>고객아이디</h3>
                  </div>
                  <a class="cta-btn" href="contact.html">식당 자세히 보기</a>
                </div>
              </div>
              <!-- End testimonial item -->
              <div class="swiper-slide">
                <div class="testimonial-item">
                  <div class="stars">
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-half"></i>
                  </div>
                  <p> Proin iaculis purus consequat sem cure digni ssim donec porttitora entum suscipit rhoncus. Accusantium quam,</p>
                  <div class="profile mt-auto mb-3">
                    <h4>2024-05-03</h4>
                    <h3>고객아이디</h3>
                  </div>
                  <a class="cta-btn" href="contact.html">식당 자세히 보기</a>
                </div>
              </div>
              <!-- End testimonial item -->
            </div>
            <div class="swiper-pagination"></div>
          </div>
        </div>
      </section>
      <!-- End Testimonials Section -->
    </main>

<%@include file="/footer.jsp" %>