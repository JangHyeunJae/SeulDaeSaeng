<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/header.jsp" %>

    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>		
<!-- 	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script> -->
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
        	<textarea class="form-control summernote" rows="5" id="content" name="content"></textarea>
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

        if (title.trim() || content.trim()) {
            // 제목 또는 내용이 비어있으면 폼 제출 방지
            return false;
        } else {
            // 제목과 내용이 모두 입력되었을 때 폼 제출
            insertForm.submit();
        }
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