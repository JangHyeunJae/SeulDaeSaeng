<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/header.jsp" %>

    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>		
<!-- 	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script> -->
<%
 	int levelChk = (int)request.getAttribute("levelChk");
    int idx = 0;
    if(levelChk < 300){
	   idx = (int)request.getAttribute("idx");
    }
 	String boardName = null;
 	String board = null;
 	// levelChk 0이면 버튼 선택해야함
  	if(levelChk == 1) {
  		boardName = "자유게시판";
  		board = "freeBoard";
  	}
  	else if(levelChk == 2) {
  		boardName = "공부게시판";
  		board = "studyBoard";
  	}
  	else if(levelChk == 3) {
  		boardName = "공지사항";
  		board = "noticeBoard";
  	}
  	else if(levelChk > 300){
  		boardName = "숙제 작성하기";
  		//학생일때랑 선생님일때랑 다르게 보내줘야함.
  		board = "classTeacherBoard";
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
          <%
          if(levelChk>300){
          %>
          <a href="<%=request.getContextPath() %>/classTeacherBoard.do?classNo=<%=levelChk %>">
          <%
          }else{
          %>
          <a href="<%=request.getContextPath() %>/<%=board %>.do">
          <%
          }
          %>
            <i class="bi bi-chevron-left"></i> 뒤로가기
          </a>
        </p>
   <div>
          <h2><%=boardName %></h2>
          <!-- {{changeDetected}} -->
          <form action="<%=request.getContextPath()%>/homework/write.do?levelChk=<%=levelChk %>" method="post" role="form" id="insertForm" class="php-email-form needs-validation" novalidate>
            <div class="contact">
             <div class="container pb-3">
              <input type="hidden" class="btn-check" name="level" value=<%=levelChk %>>
          <div class="form-group d-flex align-items-center pt-4">
           <p class="pe-2 pt-2">기간 설정 : <p>
           <input type="date" class="form-control" name="startDate" id="startDate" value="" max="9999-12-31" style="width:180px; display:inline" required> ~ 
           <input type="date" class="form-control" name="endDate" id="endDate" value="" max="9999-12-31" style="width:180px;  display:inline" required>
          </div> 
          <div class="form-group">
               <input type="text" class="form-control" name="title" id="title" placeholder="제목" required>
               <div class="invalid-feedback">제목을 작성해주세요.</div>
          </div>
        	<textarea class="form-control summernote" rows="5" id="content" name="content"></textarea>
        	<input type="hidden" id="levelChk" name="levelChk" value=<%=levelChk %>>

        <div class="text-center mt-5 mb-5">
          <button type="submit" id="submitBtn">작성하기</button>
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
	
	// 등록 버튼 클릭 시 이벤트
	submitBtn.on("click", function(){
		var startDate = $("#startDate").val();
		var lastDate = $("#lastDate").val();
		var title = $("#title").val();
		var content = $("#content").val();
		var level = $(".btn-check").val();
		var levelChk = $("#levelChk").val();
		var idx = $("#idx").val();
		if(title == null || title==""){
            alert("제목을 입력해주세요!");
            return false;
        }
        if(content == null || content==""){
            alert("내용을 입력해주세요!");
            return false;
        }
        insertForm.submit();
	});
});
$(".summernote").summernote({
	
    //에디터의 높이
    height:503,
    //에디터 한글 설정
    lang:"ko-KR",
    placeholder: '내용을 입력해주세요',
    //에디터의 커서 이동
    focus:true,
    toolbar:[
       //글꼴지정
       ['fontname',['fontname']],
       //글자 크기 설정
       ['fontsize',['fontsize']],
       
       //굵기, 기움임꼴, 밑줄, 취소선 서식 지우기
       ['style',['bold','italic','underline','strikethough','clear']],
       
       //글자색
       ['color',['forecolor','color']],
       //표만들기
       ['table',['table']],
       //글머리 기호,번호매기기,문단정렬
       ['pare',['ul','ol','paragraph']],
       //줄간격
       ['height',['height']],
       //그림첨부,링크만들기,동영상첨부
       ['insert',['picture','link','video']],
       //코드 보기,확대해서 보기,도움말
       ['view',['codeview','fullscreen','help']]
       
       ],
       //추가한 글꼴
       fontName:['Arial','Arial Black','Comic Sans MS','맑은 고딕','궁서','굴림체','돋음체','바탕체'],
       //추가한 폰트사이즈
       fontSizes:['8','9','10','11','12','13','14','15','20','30','40']
 });
</script>

<!-- ======= Footer ======= -->
<%@include file="/footer.jsp" %>