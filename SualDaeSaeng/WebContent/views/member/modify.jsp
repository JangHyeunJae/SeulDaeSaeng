<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/header.jsp" %>

<%
	UsersVO usersVo = (UsersVO)request.getAttribute("usersVo");
	MemberVO memberVo = (MemberVO)request.getAttribute("memberVo");
	AddressVO addrVo = (AddressVO)request.getAttribute("addrVo");
%>

    <main class="pb-5 mb-5" data-aos="fade" data-aos-delay="1500">
      <!-- ======= End Page Header ======= -->
      <div class="page-header d-flex align-items-center">
        <div class="container position-relative">
          <div class="row d-flex justify-content-center">
            <div class="col-lg-6 text-center">
              <h2>정보수정</h2>
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
                  <%
                  	if(<%= %> == 1){
											
					}	                  	
                  %>
                  <input type="radio" class="btn-check" name="classify" id="teacher" value="1" autocomplete="off">
                  <label class="btn btn-outline-warning" for="teacher">선생님</label>
                  <input type="radio" class="btn-check" name="classify" id="student" value="2" autocomplete="off" checked>
                  <label class="btn btn-outline-warning" for="student">학생</label>
                  <span>입니다.</span>
                </div>
                <div class="form-group mt-2">
                  <input type="text" class="form-control" name="id" id="id" placeholder="아이디 (4~12자의 숫자와 영문 대소문자)" required pattern="[a-zA-Z0-9]{4,12}" />
                  <div class="invalid-feedback" >4~12자의 숫자와 영문 대소문자으로 생성해주세요.</div>
                  <!-- <div class="valid-feedback">형식에 맞는 아이디입니다.</div> -->
                  <input type="button" id="idCheck" name="idCheck" value="아이디 중복확인">
                </div>
                 <div class="form-group mt-2">
                  <input type="password" class="form-control" name="pw" id="pw" placeholder="비밀번호 (8~16자 영문 대소문자,숫자,특수문자조합)" required pattern="(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[~!@#$%^&*]).{8,16}" />
                  <div class="valid-feedback"></div>
                  <div class="invalid-feedback">8~16자 영문 대소문자,숫자,특수문자조합으로 생성해주세요.</div>
                </div>
                <div class="form-group mt-2">
                  <input type="password" class="form-control" name="pwChk" id="pwChk" placeholder="비밀번호 체크" required />
                  <div class="valid-feedback"></div>
                  <div class="invalid-feedback"></div>
                </div>
                <div class="form-group mt-2">
                  <input type="text" class="form-control" name="name" id="name" placeholder="이름" required />
                  <div class="invalid-feedback">올바른 이름을 입력해주세요.</div>
                </div>
                <div class="form-group mt-2">
                  <input type="text" class="form-control" name="nickname" id="nickname" placeholder="닉네임" required />
                  <!-- <div class="valid-feedback">사용 가능한 닉네임입니다.</div> -->
                  <div class="invalid-feedback">올바른 닉네임을 입력해주세요.</div>
                </div>
			    <div class="form-group">
			      <!-- <label for="add1" class="control-label col-sm-2">우편번호<span class="rq"> *</span></label> -->
			      <div class="col-sm-4">
			        <input type="text" class="form-control" id="postAddr" name="postAddr" placeholder="우편번호" required>
			        <input type="button" id="addrBtn" name="addrBtn" value="주소검색">
			        <!-- <button type="button" id="addrBtn" class="btn btn-info btn-sm" >주소검색</button> -->
			      </div>
			    </div>
			    
			    <div class="form-group">
			      <!-- <label for="addr1" class="control-label col-sm-2">주소<span class="rq"> *</span></label> -->
			      <div class="col-sm-6">
			        <input type="text" class="form-control" id="addr1" name="addr1" placeholder="주소" readonly required>
			      </div>
			    </div>
			    
			    <div class="form-group mt-2">
			      <!-- <label for="addr2" class="control-label col-sm-2">상세주소<span class="rq"> *</span></label> -->
			      <input type="text" class="form-control" id="addr2" name="addr2" placeholder="상세주소" required>
			    </div>
<!--                 <div class="form-group mt-2">
                  <input type="text" class="form-control" name="adrr" id="adrr" placeholder="주소" required />
                  <input type="button" id="idCheck" name="idCheck" value="주소찾기">
                  <div class="valid-feedback"></div>
                  <div class="invalid-feedback">알맞은 주소를 입력해주세요.</div>
                </div> -->
                <div class="form-group mt-2">
                  <input type="tel" class="form-control" name="tel" id="tel" placeholder="전화번호 (-없이 입력)" required pattern="(01[016789]{1})[0-9]{3,4}[0-9]{4}" />
                  <div class="valid-feedback"></div>
                  <div class="invalid-feedback">전화번호 형식에 맞게 작성해주세요.</div>
                </div>
                <div class="form-group mt-2">
                  <input type="email" class="form-control" name="email" id="email" placeholder="이메일" required pattern="[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}" />
                  <div class="valid-feedback"></div>
                  <div class="invalid-feedback">이메일 형식에 맞게 작성해주세요.</div>
                </div>
                <div class="form-group mt-2">
                	<label class="control-label col-sm-2" for="birthday">생년월일</label>
                  <input type="date" class="form-control" name="birthday" id="birthday" placeholder="생년월일" required />
                  <div class="valid-feedback"></div>
                  <div class="invalid-feedback"></div>
                </div>
                <div class="form-group mt-2">
                  <!-- <label class="control-label col-sm-2" for="validationCustom04">반 호수</label> -->
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
                <div class="form-group mt-2">
                  <!-- <label class="control-label col-sm-2" for="checkImg">파일등록</label> -->
                  <input class="form-control form-control-lg " type="file" name="checkImg" id="checkImg" />
                  <div class="valid-feedback"></div>
                  <div class="invalid-feedback">파일을 등록해주세요.</div>
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
	
	$('#addrBtn').on('click',function () {
        new daum.Postcode({
            oncomplete: function(data) {
                document.getElementById('postAddr').value = data.zonecode;
                document.querySelector("#addr1").value = data.roadAddress;
            }
        }).open();
    });
	
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

