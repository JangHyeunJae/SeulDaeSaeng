<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>
<main class="pb-5 mb-5" data-aos="fade" data-aos-delay="700">
    <div class="page-header d-flex align-items-center">
        <div class="container position-relative">
            <div class="row d-flex justify-content-center">
                <div class="col-lg-6 text-center">
                    <h2>회원 아이디 찾기</h2>
                </div>
            </div>
        </div>
    </div>
    <section id="findId" class="contact">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <form onsubmit="return findId()" action="${pageContext.request.contextPath}/findId.do" method="post" role="form">
                        <div class="form-group">
                            <input type="text" class="form-control" name="memName" id="memName" placeholder="이름" required>
                        </div>
                        <div class="form-group mt-3">
                            <input type="text" class="form-control" name="memTel" id="memTel" placeholder="핸드폰 번호" required>
                        </div>
                        <div class="text-center mt-5">
                            <button type="submit">아이디 찾기</button>
                        </div>
                    </form>
                    <div id="result" class="mt-3"></div>
                </div>
            </div>
        </div>
    </section>
</main>
<%@ include file="/footer.jsp" %>

<script>

function findId(){
	
	let isSuccess = false;
	
	$.ajax({
		async: false,
        type: 'POST',
        url: '/findId.do',
        data: {
            memName: $('#memName').val(),
            memTel: $('#memTel').val()
        },
        success: function(rst){
        	
        	// 성공시
        	if(rst.status === "success"){
        		alert(rst.message);
        		isSuccess = true;
        	// 실패시
        	} else {
        		alert(rst.message);
        	}
        },
        error: function(xhr, status, error){
            console.error(xhr.responseText);
        }
    });

	if(isSuccess){
		location.href = "/login.do"
	}
	
	return false;
}

$(function(){
	

})
</script>