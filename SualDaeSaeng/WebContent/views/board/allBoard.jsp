<%@page import="kr.or.ddit.board.service.BoardServiceImpl"%>
<%@page import="kr.or.ddit.board.service.IBoardService"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/header.jsp"%>
<%
	List<BoardVO> boardList = (List<BoardVO>)request.getAttribute("boardList");
%>
<main>
	<!-- ======= End Page Header ======= -->
	<div class="page-header d-flex align-items-center">
		<div class="container position-relative">
			<div class="row d-flex justify-content-center">
				<div>
					<h2>전체게시판</h2>
					<p>
						<a class="cta-btn" href="/allBoard.do">전체게시판</a> 
						<a class="cta-btn" href="/freeBoard.do">자유게시판</a>
						<a class="cta-btn" href="/studyBoard.do">공부게시판</a> 
						<a class="cta-btn" href="/noticeBoard.do">공지사항</a>
					</p>
				</div>
			</div>
		</div>
	</div>
	<!-- End Page Header -->
	<section class="board mb-5">
		<!-- End Page Header -->
	<section class="board mb-5">
		<div class="container" data-aos="fade-up">
			<div
				class="row mb-3 d-flex justify-content-between align-items-center">
				<p class="col-3">
                               총 <b><%= (boardList != null) ? boardList.size() : 0 %></b> 개
                </p>
				<div class="input-group input-group-sm col-4">
					<button class="btn dropdown-toggle" type="button"
						data-bs-toggle="dropdown" aria-expanded="false">전체</button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#title">제목</a></li>
						<li><a class="dropdown-item" href="#content">내용</a></li>
						<li><a class="dropdown-item" href="#nickname">닉네임</a></li>
					</ul>
					<input type="text" class="form-control"
						aria-label="Text input with dropdown button">
				</div>
			</div>
			<div class="list-group">
				<%
                   if (boardList.isEmpty()) {
                %>
				<p>작성된 게시글이 없습니다</p>
				<%
                   }else{
                       for (BoardVO bv : boardList) {
                %>
				<a
					href="<%=request.getContextPath()%>/board/detail.do?boardNo=<%=bv.getBoardNo() %>"
					class="list-group-item">
					<div class="d-flex w-100 justify-content-between align-items-center">
						<h5 class="mb-2 text-truncate">
							<small class="attach"> <i class="bi bi-paperclip"></i>
							</small>
							<%=bv.getBoardTitle()%>
						</h5>
						<small class="badge bg-light"><%=bv.getBoardLevel() %></small>
					</div>
					<p class="mb-2 text-truncate"><%=bv.getBoardCon() %></p>
					<div class="d-flex w-100 justify-content-between align-items-center">
						<small class="days"><%=bv.getBoardAt() %></small> <small
							class="look"> <i class="bi bi-eye"></i> <%=bv.getBoardHit() %>
						</small>
					</div>
				</a>
				<%
                       }
                   }
                %>
			</div>
			<nav
				class="d-flex justify-content-center align-items-center pt-5 pm-5"
				aria-label="Page navigation example">
				<ul class="pagination ">
					<li class="page-item disabled"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<li class="page-item active"><a class="page-link" href="#">1</a>
					</li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">4</a></li>
					<li class="page-item"><a class="page-link" href="#">5</a></li>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
			<div
				class="container d-flex align-items-center justify-content-end pb-5 gap-2 p-0">
				<a href="write.jsp" type="button" class="btn btn-outline-warning">글쓰기</a>
			</div>
		</div>
	</section>
	</section>
</main>

<script type="text/javascript">

    var buttons = document.querySelectorAll('.cta-btn');
    var boardName = document.querySelector('h2');

    // 페이지 로드될 때 현재 URL을 확인하여 해당 버튼의 스타일을 변경
    var currentUrl = window.location.href;
    buttons.forEach(function (button) {
        if (currentUrl.includes(button.getAttribute('href'))) {
            button.classList.remove('gray');
            button.classList.add('orange');
            boardName.innerText = button.innerText;
        } else {
            button.classList.add('gray');
            button.classList.remove('orange');
        }
    });

    buttons.forEach(function (button) {
        button.addEventListener('click', function (event) {
            var clickedText = event.target.innerText;
            boardName.innerText = clickedText;

            buttons.forEach(function (btn) {
                btn.classList.add('gray');
                btn.classList.remove('orange');
            });

            event.target.classList.remove('gray');
            event.target.classList.add('orange');
        });
    });

</script>

<%@include file="/footer.jsp"%>