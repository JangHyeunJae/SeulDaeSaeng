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
                 <div class="form-group d-flex align-items-center">
                  <span>저는 </span>
                  <input type="radio" class="btn-check" name="classify" id="teacher" value="1" autocomplete="off">
                  <label class="btn btn-outline-warning" for="teacher">선생님</label>
                  <input type="radio" class="btn-check" name="classify" id="student" value="2" autocomplete="off" checked>
                  <label class="btn btn-outline-warning" for="student">학생</label>
                  <span>입니다.</span>
                </div>
                <div class="form-group mt-2 d-flex gap-2 align-items-center">
				  <label for="id" class="form-label mb-0 pe-2">아이디 </label>
                  <input type="text" class="form-control" name="id" id="id" placeholder="아이디 (4~12자의 숫자와 영문 대소문자)" required pattern="[a-zA-Z0-9]{4,12}" />
                  <button type="button" id="idCheck" name="idCheck" class="btn btn-warning" > 중복확인</button>
                </div>
                 <div class="form-group mt-2 d-flex gap-2 align-items-center">
  				  <label for="pw" class="form-label mb-0 pe-2">비밀번호 </label>
                  <input type="password" class="form-control" name="pw" id="pw" placeholder="비밀번호 (8~16자 영문 대소문자,숫자,특수문자조합)" required pattern="(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[~!@#$%^&*]).{8,16}" />
                  <input type="password" class="form-control" name="pwChk" id="pwChk" placeholder="비밀번호 체크" required />
                </div>
                <div class="form-group mt-2 d-flex gap-2 align-items-center">
  				  <label for="name" class="form-label mb-0 pe-2">이름 </label>
                  <input type="text" class="form-control" name="name" id="name" placeholder="이름" required />
                </div>
                <div class="form-group mt-2 d-flex gap-2 align-items-center">
  				  <label for="nickname" class="form-label mb-0 pe-2">닉네임 </label>
                  <input type="text" class="form-control" name="nickname" id="nickname" placeholder="닉네임" required />
                </div>
			    <div class="form-group mt-2 d-flex gap-2">
  				  	  <label for="addrBtn" class="form-label mb-0 pe-2 pt-2">주소 </label>
  				  	  <div class="w-100">
		  				  <div class="w-100 d-flex gap-2 align-items-center">
					          <input type="text" class="form-control" id="postAddr" name="postAddr" placeholder="우편번호" readonly required>
					          <button type="button" id="addrBtn" name="addrBtn" class="btn btn-warning">주소검색</button>
		  				  </div>
					      <input type="text" class="form-control mt-2" id="addr1" name="addr1" placeholder="주소" readonly required>
					      <input type="text" class="form-control mt-2" id="addr2" name="addr2" placeholder="상세주소" required>
  				  	  </div>
			    </div>
                <div class="form-group mt-2 d-flex gap-2 align-items-center">
  				  <label for="tel" class="form-label mb-0 pe-2">전화번호 </label>
                  <input type="tel" class="form-control" name="tel" id="tel" placeholder="전화번호 (-없이 입력)" required pattern="(01[016789]{1})[0-9]{3,4}[0-9]{4}" />
                  <div class="valid-feedback"></div>
                </div>
                <div class="form-group mt-2 d-flex gap-2 align-items-center">
  				  <label for="email" class="form-label mb-0 pe-2">이메일 </label>
                  <input type="email" class="form-control" name="email" id="email" placeholder="이메일" required pattern="[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}" />
                  <div class="valid-feedback"></div>
                </div>
                <div class="form-group mt-2 d-flex gap-2 align-items-center">
  				  <label for="birthday" class="form-label mb-0 pe-2">생녕월일 </label>
                  <input type="date" class="form-control" name="birthday" id="birthday" placeholder="생년월일" required />
                </div>
                <div class="form-group mt-2 d-flex gap-2 align-items-center">
  				  <label for="validationCustom04" class="form-label mb-0 pe-2">반호수 </label>
                  <select class="form-select " name="validationCustom04" id="validationCustom04" required >
                    <option selected disabled value="">반 선택</option>
                    <option value="304">301호</option>
                    <option value="304">302호</option>
                    <option value="304">303호</option>
                    <option value="304">304호</option>
                    <option value="304">305호</option>
                    <option value="304">교무실</option>
                  </select>
                  <div class="invalid-feedback"> 선택해주세요. </div>
                </div>
<!--                 <div class="form-group mt-2">
                  <input type="date" class="form-control" name="register" id="register" placeholder="등록일" required />
                  <div class="valid-feedback"></div>
                  <div class="invalid-feedback"></div>
                </div> -->
                <div class="form-group mt-2 d-flex gap-2 align-items-center">
  				  <label for="checkImg" class="form-label mb-0 pe-2">HRD 캡쳐</label>
                  <input class="form-control form-control-lg " type="file" name="checkImg" id="checkImg" />
                </div>
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

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

$(function() {
	
	var id = $("#id");
	var pw = $("#pw");
	var pwChk = $("#pwChk");
	var name = $("#name");
	var nickname = $("#nickname");
	var postAddr = $("#postAddr");
	var addr1 = $("#addr1");
	var addr2 = $("#addr2");
	var tel = $("#tel");
	var email = $("#email");
	var birthday = $("#birthday");
	var validationCustom04 = $("#validationCustom04");
	var checkImg = $("#checkImg");
	var postAddr = $("#postAddr");
	
	var idOk = false;
	
	$('#idCheck').click(function(){
		var usersId = $("#id").val();
		$.ajax({
			type: "POST",
			url: "/member/idCheck.do",
			data: { usersId : usersId },
 			contentType:"application/x-www-form-urlencoded;charset=UTF-8",
			dataType: "text", 
			success:function(cnt){
				if(cnt == 0){
					idOk = true;
					alert("사용가능.");
				}
				else{
					idOk = false;
					alert("중복된 아이디 입니다. 다시 입력해주세요.");
				}
			},
			error: function(){
				alert("에러입니다.");
			}
		})
	});
	/*	
	$('#addrBtn').on('click',function () {
        new daum.Postcode({
            oncomplete: function(data) {
                document.getElementById('postAddr').value = data.zonecode;
                document.querySelector("#addr1").value = data.roadAddress;
            }
        }).open();
    });
    */
	function searchAddress() {
		new daum.Postcode({
            oncomplete: function(data) {
                document.getElementById('postAddr').value = data.zonecode;
                document.querySelector("#addr1").value = data.roadAddress;
            }
        }).open();
	}
    document.getElementById('postAddr').addEventListener('click', searchAddress);
    document.getElementById('addr1').addEventListener('click', searchAddress);
	document.getElementById('addrBtn').addEventListener('click', searchAddress);
 	$('form button').click(function(){
   		const classify = $('input[name=classify]:checked').val();
		
		var idreg = /^[a-zA-Z0-9]{4,12}$/;
		var pwreg = /^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[~!@#$%^&*]).{8,16}$/;
		var telreg = /^(01[016789]{1})[0-9]{3,4}[0-9]{4}$/;
		var emailreg = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/; 
		
		console.log("회원가입 버튼 누름");
		
 		if(!idreg.test(id.val())){
			id.next().css("display", "block");
 			return false;
 		} 
		if(!pwreg.test(pw.val())) return false;
		if(pw.val() != pwChk.val()) {
			alert("비밀번호 중복확인 실패");			
			return false;
		}
		if(name.val() == "") return false;
		if(nickname.val() == "") return false;
		if(postAddr.val() == "") return false;
		if(addr2.val() == "") return false;
		if(!telreg.test(tel.val())) return false;
		if(!emailreg.test(email.val())) return false;
		if(birthday.val() == "") return false;
		if(validationCustom04.val() == "") return false;
		if(idOk == false) {
			alert("아이디 중복확인을 해주세요.")
			return false;
		}else $('form').submit();   
		
	}); 

});

</script>

