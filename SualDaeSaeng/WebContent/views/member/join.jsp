<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/header.jsp" %>

    <main class="pb-5 mb-5" data-aos="fade" data-aos-delay="1500">
      <!-- ======= End Page Header ======= -->
      <div class="page-header d-flex align-items-center">
        <div class="container position-relative">
          <div class="row d-flex justify-content-center">
            <div class="col-lg-6 text-center">
              <h2>회원가입</h2>
            </div>
          </div>
        </div>
      </div>
      <!-- End Page Header -->
      <!-- ======= Contact Section ======= -->
      <section id="join" class="contact">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-6">
              <form action="<%=request.getContextPath() %>/member/join.do" method="post" role="form" class="php-email-form needs-validation" novalidate>
<!--                 <div class="form-group d-flex align-items-center">
                  <span>저는 </span>
                  <input type="radio" class="btn-check" name="classify" id="teacher" autocomplete="off">
                  <label class="btn btn-outline-warning" for="teacher">선생님</label>
                  <input type="radio" class="btn-check" name="classify" id="student" autocomplete="off" checked>
                  <label class="btn btn-outline-warning" for="student">학생</label>
                  <span>입니다.</span>
                </div> -->
                <div class="form-group mt-2">
                  <input type="text" class="form-control" name="id" id="id" placeholder="아이디 (4~12자의 숫자와 영문 대소문자)" required pattern="[a-zA-Z0-9]{4,12}" />
                  <div class="invalid-feedback" >4~12자의 숫자와 영문 대소문자으로 생성해주세요.</div>
                  <!-- <div class="valid-feedback">형식에 맞는 아이디입니다.</div> -->
                  <input type="button" id="idCheck" name="idCheck" value="아이디 중복확인">
                </div>
<!--                 <div class="form-group mt-2">
                  <input type="password" class="form-control" name="pw" id="pw" placeholder="비밀번호 (8~16자 영문 대소문자,숫자,특수문자조합)" required pattern="(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[~!@#$%^&*]).{8,16}" />
                  <div class="valid-feedback"></div>
                  <div class="invalid-feedback">8~16자 영문 대소문자,숫자,특수문자조합으로 생성해주세요.</div>
                </div>
                <div class="form-group mt-2">
                  <input type="password" class="form-control" name="pwchk" id="pwchk" placeholder="비밀번호 체크" required />
                  <div class="valid-feedback"></div>
                  <div class="invalid-feedback">비밀번호와 동일하지 않습니다.</div>
                </div>
                <div class="form-group mt-2">
                  <input type="text" class="form-control" name="name" id="name" placeholder="이름" required />
                </div>
                <div class="form-group mt-2">
                  <input type="text" class="form-control" name="nickname" id="nickname" placeholder="닉네임" required />
                  <div class="valid-feedback">사용 가능한 닉네임입니다.</div>
                  <div class="invalid-feedback">이미 존재하는 닉네임입니다.</div>
                </div>
                <div class="form-group mt-2">
                  <input type="text" class="form-control" name="adrr" id="adrr" placeholder="주소" required />
                  <div class="valid-feedback"></div>
                  <div class="invalid-feedback"></div>
                </div>
                <div class="form-group mt-2">
                  <input type="tel" class="form-control" name="tel" id="tel" placeholder="전화번호 (-없이 입력)" required pattern="010\d{4}\d{4}$" />
                  <div class="valid-feedback"></div>
                  <div class="invalid-feedback">전화번호 형식에 맞게 작성해주세요.(010으로 시작)</div>
                </div>
                <div class="form-group mt-2">
                  <input type="email" class="form-control" name="email" id="email" placeholder="이메일" required />
                  <div class="valid-feedback"></div>
                  <div class="invalid-feedback">이메일 형식에 맞게 작성해주세요.</div>
                </div>
                <div class="form-group mt-2">
                  <input type="date" class="form-control" name="birthday" id="birthday" placeholder="생년월일" required />
                  <div class="valid-feedback"></div>
                  <div class="invalid-feedback">생일에 맞게 작성해주세요.</div>
                  성인이 아닌 일자를 거르는 계산팔요해보임
                </div>
                <div class="form-group mt-2">
                  <select class="form-select " id="validationCustom04" required >
                    <option selected disabled value="">호수선택</option>
                    <option value="304">301호</option>
                    <option value="304">302호</option>
                    <option value="304">303호</option>
                    <option value="304">304호</option>
                    <option value="304">305호</option>
                  </select>
                  <div class="invalid-feedback"> 선택해주세요. </div>
                </div>
                <div class="form-group mt-2">
                  <input type="date" class="form-control" name="register" id="register" placeholder="등록일" required />
                  <div class="valid-feedback"></div>
                  <div class="invalid-feedback"></div>
                </div>
                <div class="form-group mt-2">
                  <input class="form-control form-control-lg " type="file" name="checkImg" id="checkImg" />
                  <div class="valid-feedback"></div>
                  <div class="invalid-feedback">파일을 등록해주세요.</div>
                </div> -->
                <div class="text-center mt-5">
                  <button type="submit">회원가입</button>
                </div>
              </form>
              
            </div>
            <!-- End Contact Form -->
          </div>
        </div>
      </section>
      <!-- End Contact Section -->
    </main>
    <!-- End #main -->
    
    
<%@include file="/footer.jsp" %>

<script>

$(function() {
	
	var id = $("#id");
	$('#idCheck').click(function(){
		var idVal = $("#id").val();
		$.ajax({
			type: "POST",
			url: "/member/idCheck.do",
			data: { usersId : idVal },
 			contentType:"application/x-www-form-urlencoded;charset=UTF-8",
			dataType: "text", 
			success:function(cnt){
				if(cnt == 0){
					alert("중복된 아이디가 없습니다.");
				}
				else{
					alert("중복된 아이디 입니다. 다시 입력해주세요.");
					return false;
				}
			},
			error: function(){
				alert("에러입니다.");
			}
		})
	});
	
	$('form button').click(function(){
		$('form').submit();
	});
});

</script>

