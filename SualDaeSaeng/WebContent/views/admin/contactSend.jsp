<%@page import="kr.or.ddit.contact.vo.ContactVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/header.jsp" %>

<%
	ContactVO contactVO =(ContactVO) request.getAttribute("contactVO");
%>
<main>
    <div class="page-header sub d-flex align-items-center">
        <div class="container position-relative">
            <div class="row d-flex justify-content-center">
             
                <div>
                  
                    <form action="<%= request.getContextPath() %>/views/contactList.do" method="post" enctype="multipart/form-data" role="form" id="insertForm" class="php-email-form needs-validation" novalidate>
                        <div class="contact">
                         <div class="container pb-3">
                     
                        <div class="form-group d-flex align-items-center">
                            <input type="radio" class="btn-check" name="level" id="freeBoard" value="1" autocomplete="off" checked>	
                            <label class="btn btn-outline-warning" for="freeBoard">답변하기</label>
                          
                           
                        </div>
                        
<!--                         <input type="hidden" class="btn-check" name="level" value=""> -->
                                               
                        <div class="form-group">
                            <input type="text" class="form-control" name="memEmail" id="memEmail" placeholder="이메일"  value="<%=contactVO.getqEmail() %>" readonly="readonly">
                          
                            <input type="text" class="form-control" name="title" id="title" placeholder="제목" >
                        </div>
                        <textarea class="form-control summernote" rows="5" id="body" name="body"></textarea>
                        
<!--                         <input type="hidden" id="levelChk" name="levelChk" value=""> -->                
<!--                         <input type="hidden" id="classBoardChk" name="classBoardChk" value=""> -->
                        
                         <div class="text-center mt-5 mb-5">
                            <button type="submit" id="submitBtn" name="submitBtn" style="background-color:orange;">보내기</button>
                         </div>
                        </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>
<%@include file="/footer.jsp" %>