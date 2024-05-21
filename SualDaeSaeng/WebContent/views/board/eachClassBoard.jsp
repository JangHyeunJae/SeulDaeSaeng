<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="kr.or.ddit.board.service.BoardServiceImpl"%>
<%@page import="kr.or.ddit.board.service.IBoardService"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/header.jsp"%>
<%
    int levelChk = (int)request.getAttribute("levelChk");
    int classBoardChk = (int)request.getAttribute("classBoardChk");
    List<BoardVO> boardList = (List<BoardVO>)request.getAttribute("boardList");
    int usersRole = (int)session.getAttribute("usersRole");
    
    String msg = (String) request.getAttribute("msg");
    if (msg != null) {
        msg = msg.replace("\\", "\\\\").replace("\'", "\\\'").replace("\"", "\\\"");
    }else{
    	msg = "";
    }
    
    String board = null;
    if(classBoardChk == 1){
    	board = "eachClassNotice";
    }else if(classBoardChk == 2){
    	board = "eachClassBoard";
    }
    
    // 페이징
    int itemsPerPage = 5;
    int currentPage = (request.getParameter("page") != null) ? Integer.parseInt(request.getParameter("page")) : 1;
    int totalItems = (boardList != null) ? boardList.size() : 0;
    int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);
    int startIndex = (currentPage - 1) * itemsPerPage;
    int endIndex = Math.min(startIndex + itemsPerPage, totalItems);
    
	// 검색
    String option = null;
    if(request.getAttribute("searchOption") != null){
    	option = (String)request.getAttribute("searchOption");
    }
%>
<main>
	<!-- ======= End Page Header ======= -->
	<div class="page-header d-flex align-items-center">
		<div class="container position-relative">
			<div class="row d-flex justify-content-center">
			 <%
              if(usersRole==1){
              %>
              	<a href="<%=request.getContextPath() %>/classTeacherBoard.do?levelChk=<%=levelChk %>"><i class="bi bi-chevron-left"></i> 뒤로가기 </a>
              <%
              }else{
              %>
              <a href="<%=request.getContextPath() %>/classBoard.do?levelChk=<%=levelChk %>"><i class="bi bi-chevron-left"></i> 뒤로가기 </a>
              <%
              }
              %>
				<div>
					<h2><%=levelChk %>호 게시판</h2>
					<p>
						<a class="cta-btn" href="<%=request.getContextPath()%>/eachClassNotice.do?levelChk=<%=levelChk %>">공지사항</a> 
						<a class="cta-btn" href="<%=request.getContextPath()%>/eachClassBoard.do?levelChk=<%=levelChk %>">자유게시판</a>
					</p>
				</div>
			</div>
		</div>
	</div>	
	<!-- End Page Header -->
	<section class="board mb-5">
		<div class="container" data-aos="fade-up">
			<div class="row mb-3 d-flex justify-content-between align-items-center">
				<p class="col-3">
                    총 <b><%= totalItems %></b> 개
                </p>
				<div class="input-group input-group-sm col-4">
					<%
						if(option == null){
					%>
					<button class="btn dropdown-toggle" type="button"
						data-bs-toggle="dropdown" aria-expanded="false">전체</button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="<%=request.getContextPath()%>/<%=board %>.do?levelChk=<%=levelChk %>&searchOption=title">제목</a></li>
						<li><a class="dropdown-item" href="<%=request.getContextPath()%>/<%=board %>.do?levelChk=<%=levelChk %>&searchOption=content">내용</a></li>
						<li><a class="dropdown-item" href="<%=request.getContextPath()%>/<%=board %>.do?levelChk=<%=levelChk %>&searchOption=nickname">닉네임</a></li>
					</ul>
					<%
						}else if(option.equals("title")){
					%>
					<button class="btn dropdown-toggle" type="button"
						data-bs-toggle="dropdown" aria-expanded="false" value="title">제목</button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="<%=request.getContextPath()%>/<%=board %>.do?levelChk=<%=levelChk %>">전체</a></li>
						<li><a class="dropdown-item" href="<%=request.getContextPath()%>/<%=board %>.do?levelChk=<%=levelChk %>&searchOption=content">내용</a></li>
						<li><a class="dropdown-item" href="<%=request.getContextPath()%>/<%=board %>.do?levelChk=<%=levelChk %>&searchOption=nickname">닉네임</a></li>
					</ul>
					<%
						}else if(option.equals("content")){
					%>
					<button class="btn dropdown-toggle" type="button"
						data-bs-toggle="dropdown" aria-expanded="false" value="content">내용</button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="<%=request.getContextPath()%>/<%=board %>.do?levelChk=<%=levelChk %>">전체</a></li>
						<li><a class="dropdown-item" href="<%=request.getContextPath()%>/<%=board %>.do?levelChk=<%=levelChk %>&searchOption=title">제목</a></li>
						<li><a class="dropdown-item" href="<%=request.getContextPath()%>/<%=board %>.do?levelChk=<%=levelChk %>&searchOption=nickname">닉네임</a></li>
					</ul>
					<%
						}else if(option.equals("nickname")){
					%>
					<button class="btn dropdown-toggle" type="button"
						data-bs-toggle="dropdown" aria-expanded="false" value="nickname">닉네임</button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="<%=request.getContextPath()%>/<%=board %>.do?levelChk=<%=levelChk %>">전체</a></li>
						<li><a class="dropdown-item" href="<%=request.getContextPath()%>/<%=board %>.do?levelChk=<%=levelChk %>&searchOption=title">제목</a></li>
						<li><a class="dropdown-item" href="<%=request.getContextPath()%>/<%=board %>.do?levelChk=<%=levelChk %>&searchOption=content">내용</a></li>
					</ul>
					<%
						}
					%>
					<%
						if(option == null){
					%>
						<form action="<%=request.getContextPath()%>/<%=board %>.do?levelChk=<%=levelChk %>" method="post" role="form" id="searchForm">
					<%
						}else{
					%>
						<form action="<%=request.getContextPath()%>/<%=board %>.do?levelChk=<%=levelChk %>&searchOption=<%=option %>" method="post" role="form" id="searchForm">
					<%
						}
					%>
						<input type="text" id="searchText" name="searchText" class="form-control"
							aria-label="Text input with dropdown button" >
					</form>
				</div>
			</div>
			<div class="list-group">
				<%
					if (boardList == null || boardList.isEmpty()) {
				%>
					<p>작성된 게시글이 없습니다</p>
				<%
					} else {
						// Loop only through items for the current page
						int idx = ((currentPage-1)*5);
						for (int i = startIndex; i < endIndex; i++) {
							BoardVO bv = boardList.get(i);
				%>
					<a href="<%=request.getContextPath()%>/board/detail.do?boardNo=<%=bv.getBoardNo() %>
					&idx=<%=idx %>&levelChk=<%=bv.getBoardLevel() %>&editReply=<%=-1 %>" class="list-group-item">
						<div class="d-flex w-100 justify-content-between align-items-center">
							<h5 class="mb-2 text-truncate">
								<small class="attach"><i class="bi bi-paperclip"></i></small>
								<%= bv.getBoardTitle() %>
							</h5>
							<small class="badge bg-light"><%= levelChk %>호 게시판</small>
						</div>
						<p class="mb-2 text-truncate"><%= bv.getBoardCon() %></p>
						<div class="d-flex w-100 justify-content-between align-items-center">
							<small class="days"><%= bv.getBoardAt() %></small>
							<small class="look"><i class="bi bi-eye"></i> <%= bv.getBoardHit() %></small>
						</div>
					</a>
				<%
				    idx++;
						}
					}
				%>
			</div>

			<!-- Pagination links -->
            <nav aria-label="Page navigation" class="d-flex justify-content-center align-items-center pt-5 pm-5">
              <ul class="pagination">
                <% if (currentPage > 1) { %>
                <li class="page-item">
                    <!-- Include classNo in the URL -->
                    <a class="page-link" href="<%= request.getContextPath() %>/eachClassBoard.do?levelChk=<%= levelChk %>&page=<%= currentPage - 1 %>">&laquo;</a>
                </li>
                <% } %>
            
                <% for (int i = 1; i <= totalPages; i++) { %>
                <li class="page-item <%= (i == currentPage) ? "active" : "" %>">
                    <!-- Include classNo in the URL -->
                    <a class="page-link" href="<%= request.getContextPath() %>/eachClassBoard.do?levelChk=<%= levelChk %>&page=<%= i %>"><%= i %></a>
                </li>
                <% } %>

                <% if (currentPage < totalPages) { %>
                <li class="page-item">
                    <!-- Include classNo in the URL -->
                    <a class="page-link" href="<%= request.getContextPath() %>/eachClassBoard.do?levelChk=<%= levelChk %>&page=<%= currentPage + 1 %>">&raquo;</a>
                </li>
                <% } %>
              </ul>
           </nav>
			<div class="container d-flex align-items-center justify-content-end pb-5 gap-2 p-0">
			<%
			  String fullUrl = (String) request.getAttribute("originalUrl");
		      boolean isNoticePage = fullUrl.contains("eachClassNotice.do");

		      // 디버깅을 위해 변수 값을 출력합니다.
		      System.out.println("fullUrl: " + fullUrl);
		      System.out.println("isNoticePage: " + isNoticePage);
		      System.out.println("usersRole: " + usersRole);

			  if(!isNoticePage){
			  %>
				<a href="<%= request.getContextPath() %>/board/write.do?levelChk=<%=levelChk %>&idx=0" type="button" class="btn btn-outline-warning">글쓰기</a>
				<%
			  }else if( isNoticePage && usersRole==1){
				%>
				<a href="<%= request.getContextPath() %>/board/write.do?levelChk=<%=levelChk %>&idx=0" type="button" class="btn btn-outline-warning">글쓰기</a>
			    <%
			  }
				%>
			</div>
		</div>
	</section>
</main>

<script type="text/javascript">
    var buttons = document.querySelectorAll('.cta-btn');

    // 페이지 로드될 때 현재 URL을 확인하여 해당 버튼의 스타일을 변경
    var currentUrl = window.location.href;
    buttons.forEach(function (button) {
        if (currentUrl.includes(button.getAttribute('href'))) {
            button.classList.remove('gray');
            button.classList.add('orange');
        } else {
            button.classList.add('gray');
            button.classList.remove('orange');
        }
    });

    buttons.forEach(function (button) {
        button.addEventListener('click', function (event) {
            buttons.forEach(function (btn) {
                btn.classList.add('gray');
                btn.classList.remove('orange');
            });

            event.target.classList.remove('gray');
            event.target.classList.add('orange');
        });
    });
    
 	// Enter 키를 누를 때 폼 제출 이벤트 처리
    document.getElementById("searchText").addEventListener("keypress", function(event) {
        if (event.key === "Enter") {
            event.preventDefault(); // 기본 제출 동작 방지
            document.getElementById("searchForm").submit(); // 폼 제출
        }
    });
    
</script>

<%@include file="/footer.jsp"%>
