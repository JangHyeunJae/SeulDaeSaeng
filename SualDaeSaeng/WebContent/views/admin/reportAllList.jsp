<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/header.jsp" %>


<%
  	List<BoardVO> repallList = (List<BoardVO>)request.getAttribute("repallList");
  %>
  
<main data-aos="fade" data-aos-delay="1500">
	<div class="portfolio-description">
		<section id="calssBoard" class="gallery-single ">
			<div class="container-xl">
				<div class="col-lg-12">
					<div class="section-header">
						<h2>Request</h2>
						<p class="d-flex justify-content-between align-items-center">
							신고된 게시글</p>
					</div>
					<div class="portfolio-description d-flex gap-5 ">
						<div class="list-group col">
 <%
 	if(repallList != null && !repallList.isEmpty()) {	
      	for(BoardVO report : repallList) {
 %>						
							<a href="#"
								class="list-group-item py-2 d-flex justify-content-between align-items-center">
								<span> <i class="bi bi-person-fill px-2"></i> <b><%=report.getBoardNo() %></b>
									<small><%=report.getBoardTitle() %></small>
									<small><%=report.getBoardAt() %></small>
								</span>
							</a> 
 <%
     	}
  	}else{
  	%> 
     	<div>게시글 내역이 없습니다.</div>
<%  
	    }
%>					
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</main>

<%@include file="/footer.jsp" %>