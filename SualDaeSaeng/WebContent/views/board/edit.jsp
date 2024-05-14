<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/header.jsp" %>
<%
 	int level = (int)request.getAttribute("level");
 	
 	String boardName = null;
 	String board = null;
 	
  	if(level == 1) {
  		boardName = "자유게시판";
  		board = "freeBoard";
  	}
  	else if(level == 2) {
  		boardName = "공부게시판";
  		board = "studyBoard";
  	}
  	else if(level == 3) {
  		boardName = "공지사항";
  		board = "noticeBoard";
  	}
  	else {
  		boardName = "전체게시판";
  		board = "allBoard";
  	}
 %>
<!--<main data-aos="fade" data-aos-delay="1500" >-->
<main>
  <!-- ======= End Page Header ======= -->
  <div class="page-header sub d-flex align-items-center">
    <div class="container position-relative">
      <div class="row d-flex justify-content-center">
        <p class="mb-5 text-start">
          <a href="<%=request.getContextPath() %>/<%=board %>.do">
            <i class="bi bi-chevron-left"></i> 뒤로가기
          </a>
        </p>
        <div>
          <h2>
          <%=boardName %>
          </h2>
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
<!--         <div class="form-group"> -->
          <textarea type="text" class="form-control" name="content" id="content" placeholder="내용을 입력하세요..." required></textarea>
<!--           <div class="invalid-feedback">내용을 작성해주세요.</div> -->
<!--         </div> -->
<!--           <textarea type="text" class="form-control" name="content" id="content" placeholder="내용을 작성해주세요..." required></textarea> -->
<!--           <div id="editor"></div> -->
<!--           <input type="hidden" id="content" name="content"> -->
<!--         <input type="file" id="fileInput" style="display: visible;"> -->
<!--         	<textarea class="form-control summernote" rows="5" id="content" name="content"></textarea> -->
        	<input type="hidden" id="level" name="level" value=<%=level %>>
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
		var content = $("#content").val();
		var level = $("#level").val();
// 		var content = quill.root.innerHTML;
// 		console.log(content);
// 		var content = $("#content").val();
	
// 		var htmlContent = document.querySelector('.ql-editor').innerHTML;
//    		document.getElementById('content').value = htmlContent;

        if (title.trim() && content.trim()) {
            // 제목 또는 내용이 비어있으면 폼 제출 방지
            return false;
        } else {
            // 제목과 내용이 모두 입력되었을 때 폼 제출
            insertForm.submit();
        }
	});
});


</script>
     
<!-- ======= Footer ======= -->
<%@include file="/footer.jsp" %>