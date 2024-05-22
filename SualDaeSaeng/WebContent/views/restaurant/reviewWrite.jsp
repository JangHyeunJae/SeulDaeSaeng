<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/header.jsp" %>
<%
//	int usersRole = (int)session.getAttribute("usersRole");
  //  int levelChk = (int)request.getAttribute("levelChk");
    //int idx = 0;
    //if(levelChk < 300){
      //  idx = (int)request.getAttribute("idx");
    //}
%>

<main>
    <div class="page-header sub d-flex align-items-center">
        <div class="container position-relative">
            <div class="row d-flex justify-content-center">
                <p class="mb-5 text-start">
                	<a href="<%=request.getContextPath() %>.do">
                        <i class="bi bi-chevron-left"></i> 뒤로가기
                    </a>
                </p>
                <div>
                    <h2>리뷰작성</h2>
                    <form action="<%=request.getContextPath()%>/board/write.do" method="post" enctype="multipart/form-data" role="form" id="insertForm" class="php-email-form needs-validation" novalidate>
                        <div class="contact container px-0">
                        	<div class="d-flex align-items-center mb-3 starBox gap-3">
							  <input class="form-check-input d-none" type="radio" name="reviewStar" id="star5" value="10" checked="checked">
							  <label class="form-check-label fs-4 text-warning" for="star5">
							  	<i class="bi bi-star"></i>
							  	<i class="bi bi-star-fill"></i>
							  </label>
							  
							  <input class="form-check-input d-none" type="radio" name="reviewStar" id="star4" value="8">
							  <label class="form-check-label fs-4 text-warning" for="star4">
							  	<i class="bi bi-star"></i>
							  	<i class="bi bi-star-fill"></i>
							  </label>
							  
							  <input class="form-check-input d-none" type="radio" name="reviewStar" id="star3" value="6">
							  <label class="form-check-label fs-4 text-warning" for="star3">
							  	<i class="bi bi-star"></i>
							  	<i class="bi bi-star-fill"></i>
							  </label>
							  
							  <input class="form-check-input d-none" type="radio" name="reviewStar" id="star2" value="4">
							  <label class="form-check-label fs-4 text-warning" for="star2">
							  	<i class="bi bi-star"></i>
							  	<i class="bi bi-star-fill"></i>
							  </label>
							  
							  <input class="form-check-input d-none" type="radio" name="reviewStar" id="star1" value="2">
							  <label class="form-check-label  fs-4 text-warning" for="star1">
							  	<i class="bi bi-star"></i>
							  	<i class="bi bi-star-fill"></i>
							  </label>
							  
							  <p class="mb-0 pt-2">점수 </p>
                        	</div>
	                        
	                        <div class="form-group">
	                            <textarea class="form-control" name="title" id="title" placeholder="제목" required></textarea>
	                            <div class="invalid-feedback">제목을 작성해주세요.</div>
	                        </div>
			                <div class="form-group mt-2 d-flex gap-2 align-items-center">
			                  <input class="form-control form-control-lg " type="file" name="file" id="file" />
			                </div>
	                        
	                         <div class="text-center mt-5 mb-5">
	                            <button type="submit" id="submitBtn" name="submitBtn" style="background-color:orange;">작성하기</button>
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

        if(title == null || title == ""){
            alert("제목을 입력해주세요!");
            return false;
        }
        insertForm.submit();
    });
});

</script>

<%@include file="/footer.jsp" %>
