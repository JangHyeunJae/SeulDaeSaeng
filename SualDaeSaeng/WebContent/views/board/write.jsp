<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/header.jsp" %>

<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>		

<%
    int levelChk = (int)request.getAttribute("levelChk");
    int idx = 0;
    if(levelChk < 300){
        idx = (int)request.getAttribute("idx");
    }

    String boardName = null;
    String board = null;
    if(levelChk == 1) {
        boardName = "자유게시판";
        board = "freeBoard";
    } else if(levelChk == 2) {
        boardName = "공부게시판";
        board = "studyBoard";
    } else if(levelChk == 3) {
        boardName = "공지사항";
        board = "noticeBoard";
    } else if(levelChk > 300){
        boardName = Integer.toString(levelChk) + "호";
        board = "classTeacherBoard";
    } else {
        boardName = "전체게시판";
        board = "allBoard";
    }
%>

<main>
    <div class="page-header sub d-flex align-items-center">
        <div class="container position-relative">
            <div class="row d-flex justify-content-center">
                <p class="mb-5 text-start">
                    <% if(levelChk > 300){ %>
                        <a href="<%=request.getContextPath() %>/classTeacherBoard.do?levelChk=<%=levelChk %>">
                    <% } else { %>
                        <a href="<%=request.getContextPath() %>/<%=board %>.do">
                    <% } %>
                        <i class="bi bi-chevron-left"></i> 뒤로가기
                    </a>
                </p>
                <div>
                    <h2><%=boardName %></h2>
                    <form action="<%=request.getContextPath()%>/board/write.do" method="post" enctype="multipart/form-data" role="form" id="insertForm" class="php-email-form needs-validation" novalidate>
                        <div class="contact">
                         <div class="container pb-3">
                        <% 
                        if(levelChk == 0){	
                        %>
                        <div class="form-group d-flex align-items-center">
                            <input type="radio" class="btn-check" name="level" id="freeBoard" value="1" autocomplete="off" checked>
                            <label class="btn btn-outline-warning" for="freeBoard">자유게시판</label>
                            
                            <input type="radio" class="btn-check" name="level" id="studyBoard" value="2" autocomplete="off">
                            <label class="btn btn-outline-warning" for="studyBoard">공부게시판</label>
                            
                            <input type="radio" class="btn-check" name="level" id="noticeBoard" value="3" autocomplete="off">
                            <label class="btn btn-outline-warning" for="noticeBoard">공지사항</label>
                        </div>
                        <% 
                        } else { 
                        %>
                        <input type="hidden" class="btn-check" name="level" value="<%=levelChk %>">
                        <% 
                        } 
                        %>
                        
                        <div class="form-group">
                            <input type="text" class="form-control" name="title" id="title" placeholder="제목" required>
                            <div class="invalid-feedback">제목을 작성해주세요.</div>
                        </div>
                        <textarea class="form-control summernote" rows="5" id="content" name="content"></textarea>
                        <input type="hidden" id="levelChk" name="levelChk" value="<%=levelChk %>">
                        <input type="hidden" id="idx" name="idx" value="<%=idx %>">
                        <input type="file" name="file" id="file">
                        <div class="text-center mt-5 mb-5">
                            <button type="submit" id="submitBtn" name="submitBtn" style="background-color:orange;">작성하기</button>
                        </div>
                        </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>

<script type="text/javascript">
$(function(){
    var submitBtn = $("#submitBtn");
    var insertForm = $("#insertForm");

    submitBtn.on("click", function(){
        var title = $("#title").val();
        var content = $("#content").val();

        if(title == null || title == ""){
            alert("제목을 입력해주세요!");
            return false;
        }
        if(content == null || content == ""){
            alert("내용을 입력해주세요!");
            return false;
        }
        insertForm.submit();
    });
});

$(".summernote").summernote({
    height: 503,
    lang: "ko-KR",
    placeholder: '내용을 입력해주세요',
    focus: true,
    toolbar: [
        ['fontname', ['fontname']],
        ['fontsize', ['fontsize']],
        ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
        ['color', ['forecolor', 'color']],
        ['table', ['table']],
        ['para', ['ul', 'ol', 'paragraph']],
        ['height', ['height']],
        ['insert', ['picture', 'link', 'video']],
        ['view', ['codeview', 'fullscreen', 'help']]
    ],
    fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', '맑은 고딕', '궁서', '굴림체', '돋움체', '바탕체'],
    fontSizes: ['8', '9', '10', '11', '12', '13', '14', '15', '20', '30', '40']
});
</script>

<%@include file="/footer.jsp" %>
